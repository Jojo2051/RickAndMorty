    //
    //  EpisodeManager.swift
    //  RickAndMorty
    //
    //  Created by Alikhan Aghazade on 19.08.23.
    //

    import Foundation

    struct EpisodeManager {
    static let shared = EpisodeManager()

    func getEpisode(urlString: String, completion: @escaping (EpisodeModel) -> Void) {
        if let url = URL(string: urlString){
            let reguest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: reguest) { data, response, error in
            guard let data else { return }
            if let episodeData = try? JSONDecoder().decode(EpisodeData.self, from: data) {
                let episodeName = episodeData.name
                let date = episodeData.airDate
                if let (season, episode) = extractNumbers(from: episodeData.episode) {
                    let episode = EpisodeModel(name: episodeName, episode: episode, season: season, date: date)
                    completion(episode)
                } else {
                    print("Invalid input format")
                }
                
            } else {
                print("Error")
            }
        }
        
            task.resume()
        } else {
            let episode = EpisodeModel(name: "хз", episode: 0, season: 0, date: "хз")
            completion(episode)
        }
    }

    func extractNumbers(from input: String) -> (Int, Int)? {
        let components = input.components(separatedBy: "E")
        
        guard components.count == 2 else {
            return nil
        }
        
        if let seasonNumber = Int(components[0].dropFirst()), let episodeNumber = Int(components[1]) {
            return (seasonNumber, episodeNumber)
        } else {
            return nil
        }
    }

}

