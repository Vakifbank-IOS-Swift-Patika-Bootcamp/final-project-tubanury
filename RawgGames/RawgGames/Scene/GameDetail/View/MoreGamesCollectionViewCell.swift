//
//  MoreGamesCollectionViewCell.swift
//  RawgGames
//
//  Created by Tuba N. Yıldız on 14.12.2022.
//

import UIKit
import AlamofireImage
class MoreGamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameIconImage: UIImageView!
    
    @IBOutlet weak var gameNameLabel: UILabel!
    
    func configureCell(game: GameModel){
        gameNameLabel.text = game.name
        
        guard let url = URL(string: game.backgroundImage ?? "") else {return}
        gameIconImage.af.setImage(withURL: url)
    }
}
