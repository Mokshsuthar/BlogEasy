//
//  ThreadHalper.swift
//  BlogEasy
//
//  Created by Moksh on 22/05/23.
//

import Foundation
extension Thread {
    // Executes the completion block on the main thread
    static func onMainThread(_ completion: @escaping () -> ()) {
        if Thread.current.isMainThread {
            completion()
        } else {
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    // Executes the completion block on a background thread
    static func onBackgroundThread(_ completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .background).async {
            completion()
        }
    }
    
    // Executes the completion block after the specified number of seconds on the main thread
    static func runAfter(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}

