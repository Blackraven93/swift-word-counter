//
//  ContentView.swift
//  word-counter
//
//  Created by apple developer academy on 2022/05/29.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                Stepper("Current Count: \(count)", value: $count)
                NavigationLink(
                    destination: WordList(count: $count),
                    label: {
                        Text("Generate")
                    }
                )
            }
            .padding()
            .navigationTitle("Counter App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
