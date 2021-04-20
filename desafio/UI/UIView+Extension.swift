//
//  UIView+Extension.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 15/04/21.
//

import UIKit

public enum CALayerBorderPosition {
    case top
    case right
    case bottom
    case left
}

public extension UIView {
    
    //MARK: - Public
    
    func addBorderToPosition(_ position: CALayerBorderPosition, color: UIColor, width: CGFloat) -> CALayer {
        var border = CALayer()
        
        switch position {
        case .top:
            border = self.addTopBorder(color, width: width)
        case .bottom:
            border = self.addBottomBorder(color, width: width)
        case .left:
            border = self.addLeftBorder(color, width: width)
        case .right:
            border = self.addRightBorder(color, width: width)
        }
        
        return border
    }
    
    func addRoundedCorners(withColor color: UIColor = UIColor.clear, width: CGFloat, radius : CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = width
        self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
    }
    
    //MARK: - Private
    
    private func addTopBorder(_ color: UIColor, width: CGFloat) -> CALayer {
        let border = CALayer()
        
        border.backgroundColor = color.cgColor
        border.name = "top"
        border.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: width)
        
        self.layer.addSublayer(border)
        
        return border
    }
    
    private func addBottomBorder(_ color: UIColor, width: CGFloat) -> CALayer {
        let border = CALayer()
        
        border.backgroundColor = color.cgColor
        border.name = "bottom"
        border.frame = CGRect(x: 0.0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        
        self.layer.addSublayer(border)
        
        return border
    }
    
    private func addLeftBorder(_ color: UIColor, width: CGFloat) -> CALayer {
        let border = CALayer()
        
        border.backgroundColor = color.cgColor
        border.name = "left"
        border.frame = CGRect(x: 0.0, y: 0.0, width: width, height: self.frame.size.height)
        
        self.layer.addSublayer(border)
        
        return border
    }
    
    private func addRightBorder(_ color: UIColor, width: CGFloat) -> CALayer {
        let border = CALayer()
        
        border.backgroundColor = color.cgColor
        border.name = "right"
        border.frame = CGRect(x: self.frame.size.width - width, y: 0.0, width: width, height: self.frame.size.height)
        
        self.layer.addSublayer(border)
        
        return border
    }
    
}
