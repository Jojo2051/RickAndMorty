//
//  OriginManager.swift
//  RickAndMorty
//
//  Created by Alikhan Aghazade on 19.08.23.
//

import Foundation

struct OriginManager {
static let shared = OriginManager()

func getOrigin(urlString: String, completion: @escaping (OriginModel) -> Void) {
if let url = URL(string: urlString){
    let reguest = URLRequest(url: url)
    
    let task = URLSession.shared.dataTask(with: reguest) { data, response, error in
        guard let data else { return }
        if let originData = try? JSONDecoder().decode(OriginData.self, from: data) {
            let originType = originData.type
            let origin = OriginModel(originType: originType)
            completion(origin)
        } else { print("Error") }
    }
    
    task.resume()
    
} else {
    let origin = OriginModel(originType: "unknown")
    completion(origin)
}
}
}
