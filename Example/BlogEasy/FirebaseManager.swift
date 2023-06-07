//
//  FirebaseManager.swift
//  BlogEasy_Example
//
//  Created by Moksh Suthar on 07/06/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import Firebase
import FirebaseCore

class FirebaseManager {
    static var shared = FirebaseManager()
    var firebaseRef = Firestore.firestore().collection("BlogDemo")
    
    func uploadBlog(data : [String : Any]){
        firebaseRef.document("Blog1").setData(data)
    }
}
