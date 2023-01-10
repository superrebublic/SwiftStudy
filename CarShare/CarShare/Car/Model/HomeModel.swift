//
//  HomeModel.swift
//  CarShare
//
//  Created by chetuan on 2022/11/17.
//

import Foundation
import HandyJSON
//"data" : {
//  "categories" : [
//    {
//      "createTime" : "2022-07-08T01:31:51.000+00:00",
//      "categoryName" : "包销特卖",
//      "updateTime" : "2022-07-08T01:31:51.000+00:00",
//      "id" : 1
//    },
//    {
//      "createTime" : "2022-07-08T01:31:51.000+00:00",
//      "categoryName" : "新能源专区",
//      "updateTime" : "2022-07-08T01:31:51.000+00:00",
//      "id" : 2
//    },
//    {
//      "createTime" : "2022-07-08T01:31:51.000+00:00",
//      "categoryName" : "超低首付",
//      "updateTime" : "2022-07-08T01:31:51.000+00:00",
//      "id" : 3
//    }
//  ],
//  "banners" : [
//    {
//      "url" : "",
//      "img" : "https:\/\/suncars-1251117131.cos.ap-shanghai.myqcloud.com\/Applet\/banner7.jpg"
//    },
//    {
//      "url" : "",
//      "img" : "https:\/\/suncars-1251117131.cos.ap-shanghai.myqcloud.com\/Applet\/banner8.jpg"
//    }
//  ],
//  "mainTitle" : "阳光车达人",
//  "subTitle" : [
//    "低价厂家直销车源",
//    "系统化培训提升",
//    "轻松赚佣金"
//  ]
//}
//}

struct HomeData : HandyJSON{
    var categories : [Category]?
    var banners:[Banner]?
}

struct Banner : HandyJSON{
    var  image : String?
    var  url : String?
}

struct Category : HandyJSON{
    var createTime : String?
    var categoryName :String?
    var updateTime :String?
    var id :String?
}

struct HomeListItem : HandyJSON{
    var tagImage : String?
    var secondRowItem3 : String?
    var thirdRowItem2 : String?
    var catalog : String?
    var tagRow2 : String?
    var secondRowItem1 : String?
    var firstRowItem1 : String?
    var secondRowItem4 : String?
    var carId : String?
    var image : String?
    var firstRowItem2 : String?
    var secondRowItem2 : String?
    var commission : String?
    var thirdRowItem1 : String?
    var tagRow1 : String?
}

