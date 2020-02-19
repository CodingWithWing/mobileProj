//
//  articleOriginal.swift
//  MobTrProject
//
//  Created by apple on 2020/2/17.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
struct ArticleOriginal{
    
    var title: String = ""
    var imageUrl: String = ""
    init(result:[String:Any]) {
        
        if let imageContent = result["contentDetail"] as? [String: Any]
        {
            if let titleValue = imageContent["headline"] as? String
            {
                self.title = titleValue
            }
            
            if let imagedetail = imageContent["smallImage"] as? [String: Any]
            {
//                let urlString = imagedetail["path"] as! String
//                self.imageUrl = urlString.replacingOccurrences(of: "~(WWW_HOST)~", with: "wwwxq1.fidelity.com")
                self.imageUrl =  "https://img-arch.pconline.com.cn/images/upload/upc/tx/photoblog/1302/19/c4/18225725_18225725_1361247552728.jpg"
            }
        }
    }
    
    
}
