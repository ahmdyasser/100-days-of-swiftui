//
//  ContentView.swift
//  challange1
//
//  Created by Ahmad Yasser on 07/05/2023.
//

import SwiftUI

struct ContentView: View {
  private let units: [UnitLength] = [.kilometers, .miles, .feet]
  @State private var inputUnit: UnitLength = .kilometers
  @State private var outputUnit: UnitLength = .miles
  @State private var inputValue = 0.0
  @State private var outputValue =  0.0
  private var calculatedValue: Double {
    let input = Measurement(value: inputValue, unit: inputUnit)
    let output = input.converted(to: outputUnit)
    return output.value
  }

  var body: some View {
    List {
      Section {
        TextField("Input value", value: $inputValue, format: .number)
          .keyboardType(.decimalPad)
        Picker("Choose input unit", selection: $inputUnit) {
          ForEach(units, id: \.self) {
            Text($0.symbol.uppercased())
          }
        }
        .pickerStyle(.segmented)
      }  header: {
        Text("Input value")
      }

      Section {
        Text("\(calculatedValue)")
          .font(.largeTitle)
        Picker("Choose input unit", selection: $outputUnit) {

          ForEach(units, id: \.self) {
            Text($0.symbol.uppercased())
          }
        }
        .pickerStyle(.segmented)
      } header: {
        Text("Output value")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
