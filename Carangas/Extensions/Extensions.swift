//
//  Extensions.swift
//  Carangas
//
//  Created by Bruno Cortez on 3/16/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}


extension UIViewController {
    static func instantiateFromStoryboard(_ storyboard: UIStoryboard) -> Self {
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}
