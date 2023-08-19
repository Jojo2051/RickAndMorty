import Foundation

struct CharacterManager {
    static let shared = CharacterManager()
    let urlString = "https://rickandmortyapi.com/api/character/"
    
    
    func getCharacter(id: Int, completion: @escaping (CharacterModel) -> Void) {
        let url = URL(string: urlString + "\(id)")!
        let reguest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: reguest) { data, response, error in
            guard let data else { return }
            if let characterData = try? JSONDecoder().decode(CharacterData.self, from: data) {
                let id = characterData.id
                let name = characterData.name
                let image = characterData.image
                let species = characterData.species
                let status = characterData.status
                let gender = characterData.gender
                let type = characterData.type
                let originName = characterData.origin.name
                let originURL = characterData.origin.url
                let episodes = characterData.episode
                let character = CharacterModel(id: id, name: name, image: image, status: status, species: species, type: type, gender: gender, originName: originName, originURL: originURL, episodes: episodes)
                completion(character)
            } else { print("Error") }
        }
        task.resume()
    }
}
