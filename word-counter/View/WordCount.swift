//
//  WordCount.swift
//  word-counter
//
//  Created by apple developer academy on 2022/05/29.
//

import SwiftUI

struct WordCount: View {
    @State private var count = 1
    @State private var words:[String] = []
    var body: some View {
        VStack {
            Text("count : \(count)")
            
            HStack{
                Button("+") {
                    count += 1
                }
            
                Button("-") {
                    count -= 1
                }
            }
            
            Button("URL 전송!") {
                print(Word().dataRequest(count: count))
                // return 값으로 어떻게 가져오지?
            }
        }
    }
}

struct WordCount_Previews: PreviewProvider {
    static var previews: some View {
        WordCount()
    }
}
