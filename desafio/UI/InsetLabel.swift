//
//  InsetLabel.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 14/04/21.
//

import Foundation
import UIKit

class InsetLabel: UILabel {
    var edgeInset: UIEdgeInsets?
    
    func setEdgeInset(edgeInset: UIEdgeInsets) {
        self.edgeInset = edgeInset
        self.invalidateIntrinsicContentSize()
    }
    
    override func drawText(in rect: CGRect) {
        guard let newEdgeInset = self.edgeInset else {
            return super.drawText(in: rect)
        }
        return super.drawText(in: rect.inset(by: newEdgeInset))
    }
    
    func intrinsicContentSize() -> CGSize {
        if (self.text?.count == 0 || self.edgeInset == nil) {
            return super.intrinsicContentSize
        }
        var superSize:CGSize = super.intrinsicContentSize
        superSize.height += self.edgeInset!.top + self.edgeInset!.bottom
        superSize.width += self.edgeInset!.left + self.edgeInset!.right
        return superSize
        
    }
    
}
