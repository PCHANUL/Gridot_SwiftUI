//
//  ModelData.swift
//  Gridot
//
//  Created by 박찬울 on 2022/07/28.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var assets: [Asset] = load("landmarkData.json")
    
    var features: [Asset] {
        assets.filter { $0.isFeatured }
    }
    
    var categories: [String: [Asset]] {
        Dictionary(
            grouping: assets,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
