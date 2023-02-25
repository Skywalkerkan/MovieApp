//
//  CellView.swift
//  MovieApp
//
//  Created by Erkan on 24.02.2023.
//

import UIKit

class CellView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setup(){
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 15
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 15
       // cornerRadius = 15

    }
}


extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get {return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

