//
//  Contents.swift
//  PhotoApp
//
//  Created by 伴地慶介 on 2021/11/13.
//

import Foundation

class Contents {
    
    var userNameString:String = ""
    var profileImageString:String = ""
    var contentImageString:String = ""
    var commentString:String = ""
    var postDateString:String = ""
    
    init(userNameString:String,
         profileImageString:String,
         contentImageString:String,
         commentString:String,
         postDateString:String) {
        
        self.userNameString = userNameString
        self.profileImageString = profileImageString
        self.contentImageString = contentImageString
        self.commentString = commentString
        self.postDateString = postDateString
        
    }
    
}
