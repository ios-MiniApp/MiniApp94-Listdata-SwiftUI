//
//  ContentView.swift
//  MiniApp94-Listdata-SwiftUI
//
//  Created by 前田航汰 on 2022/09/13.
//

import SwiftUI

struct ContentView: View {
    @StateObject var testViewModel = TestViewModel()

    var body: some View {
        List {
            TextField("new Value", text: $testViewModel.testModel.inputValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                self.testViewModel.addValue()
            }, label: {
                Text("追加")
            })

            ForEach(self.testViewModel.testModel.valueList) { valueModel in
                Text(valueModel.value)
            }
        }
    }
}

class TestViewModel : ObservableObject {
    @Published var testModel: TestModel = TestModel()

    func addValue() {
        let newTestModel = ValueModel(value: self.testModel.inputValue)
        self.testModel.valueList.append(newTestModel)
    }
}

struct TestModel {
    var inputValue: String = ""
    var valueList: [ValueModel] = []
}

struct ValueModel: Identifiable {
    let id = UUID()
    var value: String

    init(value: String) {
        self.value = value
    }
}

