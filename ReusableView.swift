//
//  ReusableView.swift
//  TocaMama
//
//  Created by Michael Dunn on 2016-10-04.
//  Copyright © 2016 Michael Dunn. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

// takes care of the ReuseIdentifier so no need to specify it as it will always use the class name.
extension ReusableView where Self: UIView{
    
    static var reuseIdentifier: String{
        return String(describing: self)
    }
}
