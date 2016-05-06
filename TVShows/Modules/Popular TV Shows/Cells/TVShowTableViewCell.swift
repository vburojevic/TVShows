//
//  TVShowTableViewCell.swift
//  TVShows
//
//  Created by Vedran Burojevic on 06/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import UIKit

class TVShowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var aboutView: UIVisualEffectView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(frame: self.aboutView.frame)
        vibrancyEffectView.effect = vibrancyEffect
        
        self.aboutView.effect = blurEffect
        self.aboutView.alpha = 0.95
        self.aboutView.addSubview(vibrancyEffectView)
    }

    func adjust(offset: CGFloat) {
        var frame = self.backgroundImageView.frame;
        frame.origin.y = (offset / 10.0);
        self.backgroundImageView.frame = frame;
    }
    
}
