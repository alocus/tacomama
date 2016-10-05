//
//  DropShadow.swift
//  TocaMama
//
//  Created by Michael Dunn on 2016-10-04.
//  Copyright © 2016 Michael Dunn. All rights reserved.
//

import UIKit

protocol DropShadow {}

extension DropShadow where Self: UIView {
    
    func addDropShadow() {
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
}
