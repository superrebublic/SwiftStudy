//
//  HomeClassifyViewModel.swift
//  CarShare
//
//  Created by chetuan on 2022/11/17.
//

import Foundation
import SwiftyJSON
import HandyJSON

class HomeClassifyViewModel: NSObject {
    var Banner:[Banner]?
    var Category:[Category]?
    // - 数据源更新
    typealias HomeDataBlock = () ->Void
    var updataBlock:HomeDataBlock?
}
