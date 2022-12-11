//
//  CellTableView.swift
//  food_recipe
//
//  Created by Liew Choon Yun on 09/12/2022.
//

import UIKit

class CellTableView: UITableViewCell {

  
    @IBOutlet weak var lablecell: UILabel!
    @IBOutlet weak var textviewcell: UITextView!
    @IBOutlet weak var imagecell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
