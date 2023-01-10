//
//  ShopCell.swift
//  CarShare
//
//  Created by chetuan on 2022/9/16.
//

import Foundation
import UIKit

class ShopCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    
    func initUI(){
        contentView.backgroundColor = UIColor.systemGray
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
}
