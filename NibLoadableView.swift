//
//  NibLoadableView.swift
//  TocaMama
//
//  Created by Michael Dunn on 2016-10-04.
//  Copyright © 2016 Michael Dunn. All rights reserved.
//

import UIKit


protocol NibLoadableView: class {}


extension NibLoadableView where Self: UIView{
    static var nibName: String{
        return String(describing: self)
    }
}
