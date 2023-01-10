//
//  HomeListCell.swift
//  CarShare
//
//  Created by chetuan on 2022/11/28.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class HomeListCell: UICollectionViewCell {
    var item : [HomeListItem]?
    
    private lazy var imageView : UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var imageTag : UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var labelTag1 : UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var labelTag2 : UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var labelTitle : UILabel = {
        let view = UILabel()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 12.0
        self.addSubview(self.imageView)
        self.addSubview(self.imageTag)
        self.addSubview(self.labelTag1)
        self.addSubview(self.labelTag2)
        self.addSubview(self.labelTitle)
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-100)
        }
        self.imageTag.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(12)
            make.size.equalTo(CGSize.init(width: 33, height: 34))
        }
        self.labelTag1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(12)
            make.size.equalTo(CGSize.init(width: 33, height: 17))
        }
        self.labelTag2.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(12)
            make.size.equalTo(CGSize.init(width: 33, height: 17))
        }
        self.labelTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(110)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-60)
        }
    }
    
    var homeListItem:HomeListItem?{
        didSet{
            guard let model = homeListItem else{
                return
            }
            self.imageView.kf.setImage(with: URL(string: model.image!))
            self.imageView.contentMode = .scaleAspectFill
            
            self.imageTag.kf.setImage(with: URL(string: model.tagImage!))
            self.labelTag1.contentMode = .scaleAspectFill
            self.labelTag1.text = model.tagRow1
            self.labelTag1.font = UIFont.systemFont(ofSize: 10)
            self.labelTag1.textColor = .white
            self.labelTag1.textAlignment = .center
            self.labelTag2.text = model.tagRow2
            self.labelTag2.font = UIFont.systemFont(ofSize: 10)
            self.labelTag2.textColor = .white
            self.labelTag2.textAlignment = .center
            self.labelTitle.text = model.catalog
            self.labelTitle.font = UIFont.boldSystemFont(ofSize: 13)
            self.labelTitle.numberOfLines = 0
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
