//
//  RatingView.swift
//  Beerhead
//
//  Created by Subhadeep Pal on 26/07/18.
//  Copyright © 2018 Beerhead. All rights reserved.
//

import UIKit

@IBDesignable class RatingView: UIView {
    let nibName = "RatingView"
    var contentView: UIView?
    var view:UIView!

    @IBOutlet weak var backgroundColourView: UIView!
    @IBOutlet weak var colouredView: UIView!
    var widthConstraint: NSLayoutConstraint?

    @IBInspectable var rating: Double = 0 {
        didSet {
            let ratio = CGFloat(rating) / 5.0
            if let widthConstraint = self.widthConstraint {
                backgroundColourView.removeConstraint(widthConstraint)
            }
            self.widthConstraint = NSLayoutConstraint(item: colouredView, attribute: .width, relatedBy: .equal, toItem: backgroundColourView, attribute: .width, multiplier: ratio, constant: 0)
            backgroundColourView.addConstraint(self.widthConstraint!)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        xibSetup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

        xibSetup()
    }

    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]

        addSubview(view)
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
