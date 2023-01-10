//
//  CarController.swift
//  CarShare
//
//  Created by chetuan on 2022/9/15.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON
import SwiftUI


class CarController : UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private let ShopCellID = "ShopCellMark"
    private var homeList : [HomeListItem]?
    private var homeVar : Dictionary<String, Any> = ["categoryId":1,"pageNum":1,"pageSize":10]
    lazy var collection : UICollectionView = {
        //设置布局
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        let itemSpac = 9.0
        layout.scrollDirection = .vertical //竖直
        layout.itemSize = CGSize.init(width: (SCREEN_WIDTH-30-9)/2, height: 207)
        layout.minimumInteritemSpacing = itemSpac //item 间距
        layout.minimumLineSpacing = 9

        let collectView = UICollectionView.init(frame:CGRect.init(x: 15, y: 0, width: SCREEN_WIDTH-30, height: SCREEN_HEIGHT), collectionViewLayout: layout)
        collectView.delegate = self
        collectView.dataSource = self
        collectView.backgroundColor = .white.withAlphaComponent(0)
        collectView.showsVerticalScrollIndicator = false
        collectView.register(HomeListCell.self, forCellWithReuseIdentifier: ShopCellID)
        return collectView
    }()
        
    override func viewDidLoad() {
        self.createUI()
        self.loadHomeList()
        self.view.backgroundColor = .systemGroupedBackground
        self.addRefreshHeader()
    }
    
    public func loadHomeList(){
        HomeApiAPIProvider.request(.homeList(homedata: self.homeVar)) { result in
            if case let .success(response) = result{
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let mappedObject = JSONDeserializer<HomeListItem>.deserializeModelArrayFrom(json:json["data"].description){
                    self.homeList = mappedObject as? [HomeListItem]
                }
                self.collection.reloadData()
                self.collection.mj_header?.endRefreshing()
            }
        }
    }
    
    // Example as MJRefreshNormalHeader
    func addRefreshHeader() {
        MJRefreshNormalHeader { [weak self] in
            self?.loadHomeList()
        }.autoChangeTransparency(true)
        .link(to: collection)
    }
    
    func createUI(){
        self.view.addSubview(self.collection)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCellID, for: indexPath) as! HomeListCell
        cell.homeListItem = self.homeList?[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
