//
//  WordList.swift
//  word-counter
//
//  Created by apple developer academy on 2022/05/29.
//

import SwiftUI

struct WordList: View {
    @Binding var count: Int
    @State var words:[String] = []
    
    var body: some View {
        VStack {
            Stepper("Count \(count)", value: $count)
            
            HStack {
                
                Text("text field")
                
            }
            List {
                ForEach(words, id: \.self) { word in
                    Text(word)
                }
            }
        }
    }
}

struct CreateButton: View {
    @Binding var text: String
    var observableTestList: ObservableList
    
    var body: some View {
        Button(action: {
            self.observableTestList.list.insert(self.text, at: 0)
            self.text = ""
        }, label: {
            Text("Create List")
        })
    }
}

struct WordList_Previews: PreviewProvider {
    static var previews: some View {
        WordList(count: .constant(5))
    }
}
