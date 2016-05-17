//
//  TVShowTableViewCell.swift
//  TVShows
//
//  Created by Vedran Burojevic on 06/05/16.
//  Copyright © 2016 1337code. All rights reserved.
//

import UIKit
import Kingfisher

class TVShowTableViewCell: UITableViewCell {

    // MARK: - IBOutlets -

    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var aboutView: UIVisualEffectView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Lifecycle -

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    // MARK: - Private functions -

    func configureUI() {
        // Blur effect
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(frame: self.aboutView.frame)
        vibrancyEffectView.effect = vibrancyEffect

        aboutView.effect = blurEffect
        aboutView.addSubview(vibrancyEffectView)
    }

}

// MARK: - Extensions -

extension TVShowTableViewCell: TVShowConfigurable {
    func configure(tvShowCellItem tvShowCellItem: TVShowCellItem) {
        titleLabel.text = tvShowCellItem.title

        if let imageURL = tvShowCellItem.imageURL {
            backgroundImageView.kf_setImageWithURL(imageURL, placeholderImage: nil, optionsInfo: [.Transition(ImageTransition.Fade(1))], progressBlock: nil, completionHandler: nil)
        }
    }
}
