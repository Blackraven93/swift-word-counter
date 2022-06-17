import UIKit
import Foundation

struct ItemLoader {
    var session = URLSession.shared
    
    func loadItems(from url: URL) async throws -> [String] {
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([String].self, from: data)
    }
}



var getData: [String]? = []

Task {
    let fetchLoader = ItemLoader()
    let url = URL(string: "https://random-word-api.herokuapp.com/word?number=5")
    let data = try await fetchLoader.loadItems(from: url!)
    
}

