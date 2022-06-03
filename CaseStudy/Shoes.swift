//
//  Shoes.swift
//  CaseStudy
//
//  Created by Mehmet Dolasan on 2.06.2022.
//

import Foundation

class Shoes {
    var shoeId:Int?
    var shoeImgName:String?
    var shoeName:String?
    var shoeInfo:String?
    var shoePrice:Int?
    
    init(){
        
    }
    
    init(shoeId:Int, shoeImgName:String, shoeName:String, shoeInfo:String, shoePrice:Int){
        self.shoeId = shoeId
        self.shoeImgName = shoeImgName
        self.shoeName = shoeName
        self.shoeInfo = shoeInfo
        self.shoePrice = shoePrice
    }
}
