//
//  articleDetail.swift
//  MobTrProject
//
//  Created by apple on 2020/2/17.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit
class ArticleDetial
{
var title: String
   var imageUrl: UIImage?
   var category: String
   init?(title:String, imageUrl:UIImage, category:String = "Home") {
               
       guard !title.isEmpty else
       {
           return nil
       }
       
       self.title = title
       self.category = category
       self.imageUrl = imageUrl
   }
}
