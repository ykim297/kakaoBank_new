//
//  FilterWordTableViewCell.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class FilterWordTableViewCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var bottomLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
