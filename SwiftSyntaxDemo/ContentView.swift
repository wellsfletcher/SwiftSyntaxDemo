//
//  ContentView.swift
//  SyntaxProject
//
//  Created by Fletcher Wells on 2/8/22.
//

import SwiftUI

struct StudentStruct {
    var studentId = 0
    var age = 0
}

class StudentClass {
    var studentId = 0
    var age = 0
    
    init(studentId: Int, age: Int) {
        self.studentId = studentId
        self.age = age
    }
}

struct ContentView: View {
    @State var textA: String = ""
    @State var textB: String = ""
    @State var outputText: String = ""
    
    var textAB: String {
        get {
            return textA + textB
        }
        set {
            textA = newValue
            textB = newValue
        }
    }
    var textAB2: String {
        textA + textB
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter A...", text: $textA).padding()
                TextField("Enter B...", text: $textB).padding()
            }
            Text(outputText).padding()
            Button(action: {
                
                // outputText = testClosure(A: textA, B: textB)
                outputText = testGetSetInstanceVariable(textA, textB)
                
            }, label: {
                Text("Execute")

            })
        }
    }
    
    func testGetSetInstanceVariable(_ strA: String, _ strB: String) -> String {
        let numA: Int = Int(strA) ?? 0
        let numB: Int = Int(strB) ?? 0
        
        /*
        self.textAB = "Hello" // doesn't work because computed properties can't have the @State tag
        */
        
        return self.textAB
    }
    
    func testClosure(A strA: String, B strB: String) -> String {
        let numA: Int = Int(strA) ?? 0
        let numB: Int = Int(strB) ?? 0
        
        let greetUser = { (name: String) -> String  in
            return "Hey there, " + name + "."
        }

        return greetUser("Delilah")
    }
    
    func testCopyClass(_ strA: String, _ strB: String) -> String {
        let numA: Int = Int(strA) ?? 0
        let numB: Int = Int(strB) ?? 0
        
        var fletcher = StudentClass(studentId: 903999999, age: 22)
        var fletchersClone = fletcher
        fletchersClone.age = 0

        return String(fletcher.age) + ", " + String(fletchersClone.age)
    }
    
    func testCopyStruct(_ strA: String, _ strB: String) -> String {
        let numA: Int = Int(strA) ?? 0
        let numB: Int = Int(strB) ?? 0
        
        var fletcher = StudentStruct(studentId: 903999999, age: 22)
        var fletchersClone = fletcher
        fletchersClone.age = 0

        return String(fletcher.age) + ", " + String(fletchersClone.age)
    }
    
    
    func optionalTestGuard(_ strA: String, _ strB: String) -> String {

        guard let numA = Int(strA) else {
            print("Invalid input.")
            return "Error"
        }

        guard let numB = Int(strB) else {
            print("Invalid input.")
            return "Error"
        }

        let result: Int = numA + numB
        return String(result)
    }
    
    func optionalTestQuestion(_ strA: String, _ strB: String) -> String {

        let numA: Int = Int(strA) ?? 0
        let numB: Int = Int(strB) ?? 0
        let result: Int = numA + numB

        return String(result)
    }
    
    
    func optionalTestExclamation(_ strA: String, _ strB: String) -> String {

        let numA: Int? = Int(strA)
        let numB: Int? = Int(strB)
        let result: Int = numA! + numB!

        return String(result)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
