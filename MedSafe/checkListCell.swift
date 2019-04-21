//
//  checkListCell.swift
//  MedSafe
//
//  Created by Melody Lui on 2019-03-31.
//  Copyright © 2019 Melody Lui. All rights reserved.
//

import Foundation
import UIKit

public class checkListCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    public func setup(text: String) {
        self.contentLabel?.text = text;
//        self.contentLabel.backgroundColor = UIColor.red;
    }
}
