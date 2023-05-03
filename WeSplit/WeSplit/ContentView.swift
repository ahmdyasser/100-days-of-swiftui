//
//  ContentView.swift
//  WeSplit
//
//  Created by Ahmad Yasser on 30/04/2023.
//

import SwiftUI

struct ContentView: View {
  @FocusState private var amountIsFocused: Bool
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 20
  private var currency: FloatingPointFormatStyle<Double>.Currency {
    return .init(code: Locale.current.currencyCode ?? "USD")
  }
  private let tipPercentages = [10, 15, 20, 25, 0]
  private var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentage)
    let tipValue = checkAmount / 100 * tipSelection
    let grandTotal = checkAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount

    return amountPerPerson
  }

  private var totalWithTips: Double {
    let tipSelection = Double(tipPercentage)
    let tipValue = checkAmount / 100 * tipSelection
    let grandTotal = checkAmount + tipValue

    return grandTotal
  }

  @State private var students = ["ahmd", "harry", "ron"]
  @State private var selectedStudent = ""
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", value: $checkAmount, format: currency)
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)
          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2 ..< 100) {
              Text("\($0) people")
            }
          }
        }

        // some other kool comment

        Section {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(0..<101) {
              Text($0, format: .percent)

            }
          }
          .pickerStyle(.navigationLink)
        } header: {
          Text("How much tip do you want to leave?")
        }


        Section {
          Text(totalPerPerson, format: currency)
        } header: {
          Text("Amount per person")
        }

        Section {
          Text(totalWithTips, format: currency)
        } header: {
          Text("Total amount + tip")
        }
      }
      .navigationTitle("WeSplit")
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Spacer()
          Button("Done") {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
