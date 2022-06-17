//
//  ModelData.swift
//  word-counter
//
//  Created by apple developer academy on 2022/05/29.
//

import Foundation
import SwiftUI

struct Word {
    func dataRequest(count:Int) throws -> [String]? {
        var result:[String]?
        guard count >= 1 && count <= 15 else {
            throw fatalError("Count Error")
        }
        
        let urlString: String = "https://random-word-api.herokuapp.com/word?number=\(count)"
        let session = URLSession(configuration: .default)
        let urlComponents = URLComponents(string: urlString)
        guard let requestURL =  urlComponents?.url else {
            throw fatalError("urlComponent Error")
        }
        
        let dataTask =  session.dataTask(with: requestURL) { (data, response, error) in
            
            // error가 존재하면 종료
            guard error == nil else { return }

            // status 코드가 200번대여야 성공적인 네트워크라 판단
            let successsRange = 200..<300
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successsRange.contains(statusCode) else { return }
            

            // response 데이터 획득, utf8인코딩을 통해 string형태로 변환
            guard let resultData = data else { return }
            
            result = self.parse(resultData)
            // MARK: data까지는 확실하게 가져오는데.. 왜 값으로 가져오지 못하지 ㅠㅠ
            print(result)
        }
        dataTask.resume()
        
        return result
    }
    
    func parse(_ data: Data) -> [String] {
        do {
           let decoder = JSONDecoder()
            return try decoder.decode([String].self, from: data)
       } catch {
           fatalError("Couldn't parse")
       }
    }
}

class ObservableList: ObservableObject {
    @Published var list: [String] = []
}



