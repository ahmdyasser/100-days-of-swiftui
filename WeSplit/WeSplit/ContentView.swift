//
//  ContentView.swift
//  WeSplit
//
//  Created by Ahmad Yasser on 30/04/2023.
//

import SwiftUI

struct ContentView: View {
  @State private var students = ["ahmd", "harry", "ron"]
  @State private var selectedStudent = ""
  var body: some View {
    Form {
      Picker("Student", selection: $selectedStudent) {
        ForEach(students, id: \.self) {
          Text($0)
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
