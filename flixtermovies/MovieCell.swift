//
//  MovieCell.swift
//  flixtermovies
//
//  Created by Evelyn Hasama on 9/24/20.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!    
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        synopsisLabel.textColor = UIColor.white
        
        // Configure the view for the selected state
    }

}
