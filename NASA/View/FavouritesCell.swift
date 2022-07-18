//
//  FavouritesCell.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import UIKit

class FavouritesCell: UITableViewCell {
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var titleTextView: UITextView!
    
    // MARK: Configuration of Favvourite Cell
    func configureFavouriteCell(dailyPicture: DailyPicture) {
        self.dateLabel.text = dailyPicture.date
        self.titleTextView.text = dailyPicture.title
        
    }
    
}
