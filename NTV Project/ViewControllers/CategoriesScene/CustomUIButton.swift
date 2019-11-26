//
//  CustomUIButton.swift
//  NTV Project
//
//  Created by Oktay on 13.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import UIKit

@IBDesignable

class CustomUIButton: UIButton {
    
    @IBInspectable var result: CGFloat = 0 {
        willSet {
            self.layer.cornerRadius = newValue
        }
    }
}
