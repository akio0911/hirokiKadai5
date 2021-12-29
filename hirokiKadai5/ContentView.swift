//
//  ContentView.swift
//  hirokiKadai5
//
//  Created by 河村宇記 on 2021/12/28.
//

import SwiftUI

struct ContentView: View {
    @State private var num1: Double?
    @State private var num2: Double?
    @State private var total: Double = 0
    @State private var errorMessage: String = ""
    @State private var isError: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                NumberInputView(num: $num1)
                NumberInputView(num: $num2)
            }
            
            Button(action: {
                divide()
            }, label: { Text("計算") })
            .padding()
            .alert(isPresented: $isError) {
                Alert(title: Text("課題5"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            
            Text("\(total)")
        }
        
    }
    
    func divide() {
        guard let num1 = num1 else {
            isError = true
            errorMessage = "割られる数を入力して下さい"
            return
        }
        
        guard let num2 = num2 else {
            isError = true
            errorMessage = "割る数を入力して下さい"
            return
        }

        guard num2 != 0 else {
            isError = true
            errorMessage = "割る数には0を入力しないで下さい"
            return
        }
        
        isError = false
        total = num1 / num2
    }
    
}

struct NumberInputView: View {
    @Binding var num: Double?
    
    var body: some View {
        TextField("", value: $num, formatter: NumberFormatter())
            .padding(.horizontal)
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
