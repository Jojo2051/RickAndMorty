//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Alikhan Aghazade on 18.08.23.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var originStackView: UIStackView!    
    @IBOutlet weak var episodesTableView: UITableView!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var originName: UILabel!
    @IBOutlet weak var originType: UILabel!
    @IBOutlet weak var originImage: UIImageView!
    
    var speciesText = "", genderText = "", typeText = "", statusText = "", nameText = "", imageText = "", originNameText = "", originURL = ""
    var episodes: [String] = []
    var episodeModels: [EpisodeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoStackView.layer.cornerRadius = 20.0
        originStackView.layer.cornerRadius = 20.0
        episodesTableView.dataSource = self
        species.text = speciesText
        gender.text = genderText
        originName.text = originNameText
        
        if typeText == "" {
            type.text = "None"
        } else {
            type.text = typeText
        }
        
        status.text = statusText
       
        if statusText == "Dead" {
            status.textColor = UIColor.systemRed
        }
        
        name.text = nameText
        image.image = UIImage(named: imageText)
        
        OriginManager.shared.getOrigin(urlString: originURL) { [weak self] origin in
            DispatchQueue.main.async {
                guard let self else { return }
                self.originType.text = origin.originType
                if self.originType.text == "Planet" { self.originImage.image = UIImage(named: "planet") }
                else { self.originImage.image = UIImage(systemName: "bonjour") }
            }
        }
        
        episodeModels = Array(repeating: EpisodeModel(name: "", episode: 0, season: 0, date: ""), count: episodes.count)
        
        for item in 0..<episodes.count {
            EpisodeManager.shared.getEpisode(urlString: episodes[item]) { [weak self] episode in
                DispatchQueue.main.async {
                    guard let self else { return }
                    self.episodeModels[item].name = episode.name
                    self.episodeModels[item].date = episode.date
                    self.episodeModels[item].episode = episode.episode
                    self.episodeModels[item].season = episode.season
                    self.episodesTableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodescell", for: indexPath) as! EpisodesTableViewCell
        cell.episodeNameLabel.text = episodeModels[indexPath.row].name
        cell.episodeDateLabel.text = episodeModels[indexPath.row].date
        cell.episdoeAndSeasonLabel.text = "Episode: \(episodeModels[indexPath.row].episode), Season: \(episodeModels[indexPath.row].season)"
        return cell
    }
}
