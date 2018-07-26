//
//  RealmFactory.swift
//  Thot
//
//  Created by Marcus Costa on 24/07/18.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RealmSwift
import KeychainAccess

final class RealmFactory {

    static var realmMigrator: RealmMigrator?

    enum Instance: Equatable {
        case inMemory
        case `default`
        case custom(name: String)

        var name: String {
            switch self {
            case .inMemory:
                return String()
            case .default:
                return "\(self)"
            case .custom(let name):
                return name
            }
        }

        fileprivate var fileUrl: URL? {
            let realmPath = Realm.Configuration().fileURL?
                .deletingLastPathComponent()

            switch self {
            case .inMemory:
                return nil
            case .default:
                return realmPath?.appendingPathComponent("\(self).realm")
            case .custom(let name):
                return realmPath?.appendingPathComponent("\(name).realm")
            }
        }

        fileprivate var inMemoryIdentifier: String? {
            return self == .inMemory ? "\(self)" : nil
        }

        fileprivate var schemaVersion: UInt64 {
            switch self {
            case .inMemory:
                return 1
            default:
                let schemaKey = "DATABASE_SCHEMA_\(name.uppercased())_VERSION"
                guard let schema = Bundle.main.object(forInfoDictionaryKey: schemaKey) as? String,
                    let schemaVersion = UInt64(schema) else {
                        fatalError("Fail to load \(schemaKey)")
                }

                return schemaVersion
            }
        }

        static func ==(lhs: Instance, rhs: Instance) -> Bool {
            switch (lhs, rhs) {
            case (.inMemory, .inMemory),
                 (.default, .default):
                return true
            case (.custom(let lhsName), .custom(let rhsName)):
                return lhsName == rhsName
            default:
                return false
            }
        }
    }

    static func make(for instance: Instance) throws -> Realm {
        let config = Realm.Configuration(fileURL: instance.fileUrl,
                                         inMemoryIdentifier: instance.inMemoryIdentifier,
                                         encryptionKey: encryptionKey(for: instance),
                                         schemaVersion: instance.schemaVersion,
                                         migrationBlock: { (migration, oldVersion) in
                                            realmMigrator?.execute(migration: migration, realmInstance: instance, oldVersion: oldVersion, currentVersion: instance.schemaVersion)
        })

        return try Realm(configuration: config)
    }

}

// MARK: - Encryption
extension RealmFactory {

    private enum Constants {
        private static let bundleIdentifier = Bundle.main.bundleIdentifier ?? String()
        static let keychainDatabaseService = "\(Constants.bundleIdentifier).database"
        static let keychainDatabaseEncryptionKey = "\(Constants.bundleIdentifier).encrypt.key"
        static let encryptionKeyLength = 64
    }

    private static func encryptionKey(for instance: Instance) -> Data {
        let keychain = Keychain(service: Constants.keychainDatabaseService)
        let keychainKey = Constants.keychainDatabaseEncryptionKey.appending(".\(instance.name)")

        if let key = keychain[data: keychainKey] {
            return key
        }

        let key = generateEncryptionKey()
        keychain[data: keychainKey] = key

        return key
    }

    private static func generateEncryptionKey() -> Data {
        var key = Data(count: Constants.encryptionKeyLength)
        _ = key.withUnsafeMutableBytes { bytes in
            _ = SecRandomCopyBytes(kSecRandomDefault, key.count, bytes)
        }

        return key
    }


}
