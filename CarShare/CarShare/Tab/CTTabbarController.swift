//
//  CTTabbarController.swift
//  CarShare
//
//  Created by chetuan on 2022/9/15.
//

import Foundation
import UIKit

class CTTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
    }
    
    func createUI(){
        let carController = CarController.init()
        let shopController = ShopController.init()
        let mineController = MineController.init()
        self.configTab(vc: carController, title: "好车易赚", image: "icon_tab_car", selectImage: "icon_tab_car2")
        self.configTab(vc: shopController, title: "达人养成", image: "icon_tab_shop", selectImage: "icon_tab_shop2")
        self.configTab(vc: mineController, title: "我的", image: "icon_tab_user", selectImage: "icon_tab_user2")
        self .setViewControllers([carController,shopController,mineController], animated: true)
    }
    
    func configTab(vc:UIViewController, title: String, image: String,selectImage:String) -> Void {
        vc.tabBarItem.image = UIImage.init(named: image)
        vc.tabBarItem.title = title;
        vc.tabBarItem.selectedImage = UIImage.init(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], for: .highlighted)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
    }
    
}
