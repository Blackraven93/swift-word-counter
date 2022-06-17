//
//  WordCount.swift
//  word-counter
//
//  Created by apple developer academy on 2022/05/29.
//



import SwiftUI



struct WordCount: View {
    @State private var count:String = ""
    @State private var words:[String] = []
    
    
    var body: some View {
         
        VStack(alignment: .center) {
            Text(Constant.Title.content).font(.title)
            
            HStack(alignment: .center, spacing: 20) {
                TextField(
                    "입력값",
                    text: $count,
                    prompt: Text("개수를 입력해주세요")
                )
                .border(.clear , width: 2)
                .frame(width: 200, height: 50, alignment: .center)
                .font(.callout)
            
//
//
//                Button(action: {
//                    words = await try? Word().dataRequest(count: 5)!!!
//                }, label: {
//                    Text("저장")
//                })
//                
//                Text(words)
//            }.padding()
        }
    }
}

struct WordCount_Previews: PreviewProvider {
    static var previews: some View {
        WordCount()
    }
}
}
