//
//  CarController.swift
//  CarShare
//
//  Created by chetuan on 2022/9/15.
//

import Foundation
import UIKit

class CarController : UIViewController {
    
    init() {
        let carController = CarController.init()
        let shopController = ShopController.init()
        let mineController = MineController.init()
        self.configTab(vc: carController, title: <#T##String#>, image: String, selectImage: <#T##String#>)
    }
    
    override func viewDidLoad() {
    
    }
    func configTab(vc:UIViewController, title: String, image: String,selectImage:String) -> Void {
       
    }
}
