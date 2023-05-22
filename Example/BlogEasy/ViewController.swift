//
//  ViewController.swift
//  BlogEasy
//
//  Created by Moksh on 05/22/2023.
//  Copyright (c) 2023 Moksh. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let swiftUIView =  DemoView() // swiftUIView is View
        let childView = UIHostingController(rootView: swiftUIView)
        addChildViewController(childView)
        childView.view.frame = view.bounds
        
        childView.view.backgroundColor = .clear
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
        childView.view.backgroundColor = UIColor.black
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

