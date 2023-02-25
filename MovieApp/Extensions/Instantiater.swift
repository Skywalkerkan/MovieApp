//
//  Instantiater.swift
//  MovieApp
//
//  Created by Erkan on 25.02.2023.
//

import Foundation
import UIKit

extension UIViewController{
    
    static var identifier: String{
        return String(describing: self)
    }
    
    static func instantiate() -> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        return controller
    }
    
}
