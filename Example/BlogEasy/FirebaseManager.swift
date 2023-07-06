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
import BlogEasy

class FirebaseManager {
    static var shared = FirebaseManager()
    var firebaseRef = Firestore.firestore().collection("BlogDemo")
    
    func uploadBlog(data : [String : Any]){
        firebaseRef.document("Blog1").setData(data)
    }
    
    func getBlog(handler : @escaping (BlogData) -> Void) {
        firebaseRef.document("Blog1").getDocument { snapShot, error in
            if let snapShot {
                if let data = snapShot.data(){
                    print(data)
                    
                    let blog = BlogData(data)
                    handler(blog)
                }
            }
        }
    }
}
