
import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//: constants

let name: String = "Marcus Costa"
print(name)
// name = "João"

let age = 34
type(of: age)
let weight = 90.5
type(of: weight)
let height: Float = 90.5
type(of: height)

//: variables

var companyName = "red"
companyName = "redspark"
var slogan = "imagining better"
var company = companyName + " " + slogan
company = "\(companyName) \(slogan)"

var numberOfEmployees = 70
numberOfEmployees = 71
numberOfEmployees = numberOfEmployees + 1
//numberOfEmployees++
numberOfEmployees += 1

var employees = [name, "André", "Fabio"]
type(of: employees)
let newEmployees = ["Sabrina", "Thais", "Daniel"]
type(of: newEmployees)
employees += newEmployees

//: computed variabels

var sparks = 10
let price = 2.5
var real: Double {
    get {
        return Double(sparks) * price
    }
    set {
        sparks = Int(newValue / price)
    }
}
print(real)
sparks += 1
print(real)
real = 10
print(real)
print(sparks)

var employeeDescription: String {
    get {
        return "Nome: \(name) | age: \(age) | height: \(height) | weight: \(weight)"
    }
}
print(employeeDescription)

var employeeShortDescription: String {
    return "Nome: \(name) | age: \(age)"
}
print(employeeShortDescription)

//: bind

var labelTitle = ""
var title = String() {
    didSet {
        print("Changed title to \(title) instead \(oldValue)")
        labelTitle = title
    }
    willSet {
        print("Will change title to \(newValue) instead \(title)")
    }
}
title = "Mestre"
title = "Doutor"

//: optionals

//var currentProject = "Thot"
//currentProject = nil
var currentProject: String?
type(of: currentProject)
currentProject = nil
currentProject = "Thot"
let isEmpty = currentProject?.isEmpty
type(of: isEmpty)
currentProject = nil
//let isEmptyWrapped = currentProject!.isEmpty
let isEmptyWrapped = currentProject?.isEmpty ?? true

//: if / if let

let expression1 = true
if expression1 {
    
} else {
    
}

let expression2 = true
if expression1 && expression2 {
    
}

if expression1,
    expression2 {
    
}

let employee = employees.first
type(of: employee)
if let employee = employees.first,
    expression1 {
    type(of: employee)
} else {
    // Invalid preposition
}

//: functions

func foo() {
    print("foo")
}
foo()

//func addEmployee(employee: String) {
//    employees.append(employee)
//}
//addEmployee(employee: "Ale")

//func addEmployee(employee: String, position: Int) {
//    employees.insert(employee, at: position)
//}
//addEmployee(employee: "Renato", position: 0)

//func addEmployee(employee: String, at position: Int) {
//    employees.insert(employee, at: position)
//}
//addEmployee(employee: "Renato", at: 0)

//func addEmployee(_ employee: String, at position: Int) {
//    employee.insert(employee, at: position)
//}
//addEmployee("Marcus", at: 0)

//func addEmployee(_ employee: String, at position: Int = 0) {
//    employees.insert(employee, at: position)
//}
//addEmployee("Renato")
//addEmployee("Samantha", at: 1)

func addEmployee(_ employee: String, at position: Int? = nil) {
    if let position = position {
        employees.insert(employee, at: position)
    } else {
        employees.append(employee)
    }
}
addEmployee("Renato")
addEmployee("Samantha", at: 1)

//func firstEmployee() -> String {
//    return employees[0]
//}

//func firstEmployee() -> String {
//    return employees.first ?? String()
//}

func firstEmployee() -> String? {
    return employees.first
}

if let employee = firstEmployee() {
    print(employee)
}

//: Closures

let closure = {
    print("It's a closure")
}
type(of: closure)
closure()

func foo(closure: () -> Void) {
    closure()
}
foo(closure: closure)
foo {
    print("It's is a anonymous")
}

func foo(parameter: String, callback: (Int) -> Void) {
    let random = parameter.count
    callback(random)
}
foo(parameter: "Marcus", callback: { count in
    print("Count: \(count)")
})
foo(parameter: "André") { count in
    print("Closure count 2: \(count)")
}

func foo(parameter: String, closure1: () -> Void, closure2: (Bool) -> Void) {
    closure1()
    closure2(true)
}
foo(parameter: "teste", closure1: {
    print("Chamou a closure 1")
}) { finished in
    print("Chamou a closure 2: \(finished)")
}

foo(parameter: "Styleguide", closure1: {
    print("Chamou a closure 1")
}, closure2: { finished in
    print("Chamou a closure 2: \(finished)")
})

func fooClosureAsync(closure: @escaping () -> Void) {
    print("test dispach closure: \(Date())")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        closure()
    }
}
fooClosureAsync {
    print("test async closure: \(Date())")
}

//: access modifiers

//private var privateName: String?
//fileprivate var fileprivateName: String?
//internal var internalName: String?
//public var publicName: String?
//open var openName: String?

//: for
//for (var index = 0, index < employees.count, index++) {}

for employee in employees {
    print(employee)
}

for (index, employee) in employees.enumerated() {
    print("\(employee) at: \(index)")
}

for index in 0..<employees.count {
    print("Index: \(index), employee: \(employees[index])")
}

employees.filter{ $0.lowercased().contains("m") }
    .map{ "Employee: \($0)" }
    .forEach{ print($0) }

//: guard

func fooGuard() {
    if let employeeName = employees.first {
        print(employeeName)
    }
    //print(employeeName)
    
    guard let employeeName = employees.first else {
        return
    }
    
    print(employeeName)
}

//: defer

func openFile() -> [Data]? { return [] }
func closeFile(_ file: [Data]) { print("Arquivo fechado") }

func appendTextOnFile(_ text: String) {
    guard var file = openFile() else {
        return
    }
    
    defer {
        closeFile(file)
    }
    
    guard let stringData = text.data(using: .utf8) else {
        return
    }
    
    file.append(stringData)
}
appendTextOnFile("texto")

//: enum

enum Filial: String {
    case sp
    case rp
}

let filial1 = Filial.sp
let filial2: Filial = .rp

if filial1 == filial2 {
    print("são iguais")
}

enum DeveloperType {
    case frontend
    case backend
    case mobile
}

enum EmployeeType: Equatable {
    case marketing
    case developer(DeveloperType)
    
    static func ==(lhs: EmployeeType, rhs: EmployeeType) -> Bool {
        switch (lhs, rhs) {
        case (.marketing, .marketing):
            return true
        case (.developer(let type1), .developer(let type2)):
            return type1 == type2
        default:
            return false
        }
    }
}

let employeeType1 = EmployeeType.marketing
let employeeType2 = EmployeeType.developer(.frontend)

if employeeType1 == employeeType2 {
    print("são iguais")
}

//switch employeeType {
//case .marketing:
//    print("Profissional do marketing")
//case .developer(let type):
//    print("Desenvolvedor \(type)")
//}

//: switch

enum EmployeeSection {
    case develop
    case market
    case other
}

let section: EmployeeSection = .market
switch section {
case .develop:
    print("Developer")
    
case .market:
    print("Marketing")
    
case .other:
    break
}

let isFull = false
switch (section, isFull) {
case (.develop, true):
    print("Developer")
    
case (.market, false):
    print("Marketing")
    
case (.other, _):
    break
    
default:
    print("Default")
}

var any: Any = "String"
switch any {
case let text as String:
    print("Any é uma string: \(text)")
default:
    break
}

//: class

class EmployeeClass {
    
    let name: String
    private(set) var filial: Filial
    var section: EmployeeSection = .other
    
    var currentProjectList: [String] = []
    
    init(name: String, filial: Filial) {
        self.name = name
        self.filial = filial
    }
    
    func changeFilial(_ filial: Filial) {
        self.filial = filial
    }
    
}

var modelClass = EmployeeClass(name: "Marcus", filial: .sp)
modelClass.changeFilial(.rp)
modelClass.section = .develop

class DeveloperClass: EmployeeClass {
    
    override func changeFilial(_ filial: Filial) {
        print("Outra lógica de filial")
    }
    
}

//: struct

struct EmployeeStruct {
    
    let name: String
    private(set) var filial: Filial
    var section: EmployeeSection = .other
    
    var currentProjectList: [String] = []
    
    init(name: String, filial: Filial, section: EmployeeSection) {
        self.name = name
        self.filial = filial
        self.section = section
    }
    
    mutating func changeFilial(_ filial: Filial) {
        self.filial = filial
    }
    
}

var modelStruct = EmployeeStruct(name: "Marcus", filial: .sp, section: .other)
modelStruct.changeFilial(.rp)
modelStruct.section = .develop


//: extensions

extension EmployeeClass {
    
    func updateStartDate(_ date: Date) {
        print("update")
    }
    
}
modelClass.updateStartDate(Date())

extension EmployeeStruct {
    
    func updateStartDate(_ date: Date) {
        print("update")
    }
    
}
modelStruct.updateStartDate(Date())

//: protocols

protocol RedsparkEmployee {
    
    var currentProjectList: [String] { get set }
    
    mutating func addProject(_ project: String)
    mutating func removeProject(_ project: String)
    
}

extension EmployeeClass: RedsparkEmployee {
    
    //    func addProject(_ project: String) {
    //        currentProjectList.append(project)
    //    }
    //
    //    func removeProject(_ project: String) {
    //        if let index = currentProjectList.index(of: project) {
    //            currentProjectList.remove(at: index)
    //        }
    //    }
    
}

extension EmployeeStruct: RedsparkEmployee {
    
    mutating func addProject(_ project: String) {
        currentProjectList.append(project)
        print("override addProject")
    }
    
    //    mutating func removeProject(_ project: String) {
    //        if let index = currentProjectList.index(of: project) {
    //            currentProjectList.remove(at: index)
    //        }
    //    }
    
}

//modelClass.addProject("Thot")
//modelStruct.addProject("Thot")

//: protocols extensions

extension RedsparkEmployee {
    
    mutating func addProject(_ project: String) {
        currentProjectList.append(project)
    }
    
    mutating func removeProject(_ project: String) {
        if let index = currentProjectList.index(of: project) {
            currentProjectList.remove(at: index)
        }
    }
    
}

modelClass.addProject("Thot")
modelStruct.addProject("Thot")

//: generics

struct MobileProject { }
struct JavaProject { }
struct WebProject { }

struct ProjectCoordinator<T> {
    
    private let project: T
    
    init(project: T) {
        self.project = project
    }
    
    func downloadProject() -> T {
        return project
    }
    
}

var mobileProjectCoordinator = ProjectCoordinator(project: MobileProject())
let mobileProject = mobileProjectCoordinator.downloadProject()
type(of: mobileProject)

let javaProjectCoordinator = ProjectCoordinator(project: JavaProject())
let javaProject = javaProjectCoordinator.downloadProject()
type(of: javaProject)

let webProjectCoordinator = ProjectCoordinator(project: WebProject())
let webProject = webProjectCoordinator.downloadProject()
type(of: webProject)

//: weak / strong

class Classe {
    
    weak var weakObject: EmployeeClass?
    var strongObject: EmployeeClass?
    
}

//: try / catch

enum DataError: Error {
    case isNull
    case isEmpty
}

func saveData(data: String?) throws {
    guard let data = data else {
        throw DataError.isNull
    }
    
    guard !data.isEmpty else {
        throw DataError.isEmpty
    }
    
    print("Salvando: \(data)")
}

do {
    try saveData(data: nil)
} catch {
    print("Error: \(error)")
}

do {
    try saveData(data: "")
} catch {
    switch error {
    case DataError.isNull:
        print("Data é nullo")
    case DataError.isEmpty:
        print("Data é vazio")
    default:
        print("Error: \(error)")
    }
    
}

