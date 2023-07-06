//
//  BlogExampleListVC.swift
//  BlogEasy_Example
//
//  Created by Moksh Suthar on 26/05/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import SwiftUI
import BlogEasy

class BlogExampleListVC: UIViewController,ObservableObject {
    
    
    //scroll values for Scroll animation
    @Published var ScrollPer : CGFloat = .zero
    @Published var strachValue : CGFloat = .zero
    @Published var scrollBufferSize = 90.0
    @Published var scrollPosition : CGFloat = .zero
    @Published var coverOpacity : CGFloat = 1
    
    @Published var OpenBlog : BlogData?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view, typically from a nib.
        let swiftUIView =  BlogExampleListView(model: self) // swiftUIView is View
        let childView = UIHostingController(rootView: swiftUIView)
        addChildViewController(childView)
        childView.view.frame = view.bounds
        
        childView.view.backgroundColor = .clear
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
        childView.view.backgroundColor = UIColor.black
        
        OpenBlog = porcheBlog
        
    }
    
    //BlogsData
    var sempleEasyBlog : BlogData = BlogData(coverImage: .uiimage(name: "sempleBlogCover"), content: [
        .title(value: "Introducing BlogEasy: Simplify Your iOS Blog Views"),
        .caption(value: "Are you an iOS developer looking for a convenient and visually appealing way to create blog views within your app? Look no further! Allow me to introduce you to BlogEasy, an iOS framework designed to simplify the process of creating stunning blog views with ease."),
        .caption(value: "With BlogEasy, you can effortlessly incorporate various elements into your blog views, ensuring a captivating user experience. Let's dive into the key elements provided by the BlogEasy framework:"),
        
        .divider,
        .headline(value: "Text Attributes"),
        .caption(value: "BlogEasy offers a range of predefined text attributes to enhance your blog views:"),
        
        .bullet(value: "The main title of your blog post, capturing attention.",config: .init(bulletType: .Text(value: "Title :"))),
        .bullet(value: "Highlights important sections or headings.",config: .init(bulletType: .Text(value: "Headline :"))),
        .bullet(value: "Emphasizes subheadings or subtopics.",config: .init(bulletType: .Text(value: "Subheadline :"))),
        .bullet(value: "Provides context or descriptions.",config: .init(bulletType: .Text(value: "Caption :"))),
        .bullet(value: "Presents smaller-sized captions or supplementary details.",config: .init(bulletType: .Text(value: "Caption2 :"))),
        
        .caption(value: "Additionally, BlogEasy introduces the customText element, providing complete control over text content and appearance through the CoustomTextConfig struct."),
        
        .divider,
        .headline(value: "Image"),
        .caption(value: "The image element in BlogEasy allows you to seamlessly incorporate images into your blog views. Here's a brief overview of the image-related components in BlogEasy:"),
        .image(image: .url(url: "https://images.unsplash.com/photo-1494256997604-768d1f608cac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2429&q=80"),config: .init(source: .init(text: "unsplash.com",url: "https://unsplash.com/photos/NodtnCsLdTE"))),
        .divider,
        .headline(value: "Bullet point"),
        .caption(value: "To organize key points or list items, the bullet element is at your disposal. It allows you to create bulleted lists effortlessly. The BulletPointConfig struct lets you customize the bullet point's appearance."),
        .caption(value: "Here are some Example:"),
        .bullet(value: "car"),
        .bullet(value: "Bike"),
        .bullet(value: "Cycle"),
        .spacer(height: 5),
        .bullet(value: "Football",config: .init(bulletType: .Text(value: "1. "))),
        .bullet(value: "Basketball",config: .init(bulletType: .Text(value: "2. "))),
        .bullet(value: "Handball",config: .init(bulletType: .Text(value: "3. "))),
        .spacer(height: 5),
        .bullet(value: "V8, 5.0L, varying horsepower/torque, naturally aspirated/supercharged, manual/automatic, RWD.",config: .init(bulletType: .Text(value: "Mustang :"))),
        .bullet(value: "V10/V12, varying displacement/horsepower/torque, naturally aspirated/twin-turbocharged, dual-clutch automatic, AWD/RWD.",config: .init(bulletType: .Text(value: "Lamborghini :"))),
        .bullet(value: "V8/V12, varying displacement/horsepower/torque, twin-turbocharged/naturally aspirated, dual-clutch automatic, RWD/AWD.",config: .init(bulletType: .Text(value: "Ferrari :"))),
        .divider,
        .headline(value: "Code Block"),
        .caption(value: "For sharing code snippets or examples, the CodeBlock element comes in handy. It ensures proper formatting and readability of your code within the blog post."),
        .codeView(value: "// Swift \"Hello, World!\" Program\n\nprint(\"Hello, World!\")"),
        .divider,
        .headline(value: "Link"),
        .caption(value: "Include clickable links within your blog views using the link element. You can provide both the displayed text and the corresponding URL, making it easy for readers to navigate to external resources."),
        .link(text: "Refrence : ", url: "https://github.com/Mokshsuthar"),
        .divider,
        .headline(value: "Spacer"),
        .caption(value: "The spacer element helps you control the spacing between different elements within your blog view. You can specify the desired height using the CGFloat value."),
        .caption(value: "Like, here is distance of 20 pixel between to bullet point \"A\" and \"B\""),
        .bullet(value: "A"),
        .spacer(height: 20),
        .bullet(value: "B"),
        .divider,
        .headline(value: "Link Preview"),
        .caption(value: "To enrich your blog posts with dynamic content previews, the linkPreview element is here for you. By providing a URL, you can generate an automatic or custom preview of the linked content."),
        .caption(value: "1. small Preview"),
        .linkPreview(type: .small,url: "https://github.com/Mokshsuthar/BlogEasy"),
        .caption(value: "2. Large Preview"),
        .linkPreview(type: .large,url: "https://github.com/Mokshsuthar/BlogEasy"),
        .caption(value: "By incorporating these elements from the BlogEasy framework, you can create blog views that are visually appealing, highly customizable, and user-friendly. Whether you're building a personal blog, a news app, or any other iOS application requiring blog-related features, BlogEasy simplifies the process.")
        ])
    
    //porche 911 turbo 🥰
    var porcheBlog : BlogData = BlogData(coverImage: .url(url: "https://i.pinimg.com/564x/f2/69/74/f26974c63e5be41d3dcbd21540fd1e40.jpg"), content: [
        .title(value: "Unleash the Power of Performance:"),
        .subheadline(value: "Introducing the Porsche 911 Turbo",config: .init(color: .color(.red))),
        .caption(value: "Are you ready to experience the thrill of unparalleled performance and precision engineering? Get behind the wheel of the iconic Porsche 911 Turbo, a sports car that epitomizes the perfect balance between power and elegance. In this blog, we dive into the heart of the Porsche 911 Turbo and explore its remarkable features that make it a true driving sensation."),
        .spacer(height: 10),
        .image(image: .url(url: "https://www.pngmart.com/files/22/Porsche-911-PNG-HD.png")),
        .spacer(height: 10),
        .bullet(value: "The Porsche 911 Turbo is renowned for its breathtaking speed. Equipped with a turbocharged engine, this powerhouse delivers jaw-dropping acceleration that propels you from 0 to 60 mph in mere seconds. With horsepower figures that range from impressive to mind-blowing, the 911 Turbo offers an exhilarating driving experience that leaves a lasting impression.",config: .init(bulletType: .Text(value: "Blistering Speed:",color: .color(.red)))),
     
        .image(image: .url(url: "https://cdn.shopify.com/s/files/1/0075/5046/8132/files/image-4.png?v=1642267899")),
        .bullet(value: "The sleek and aerodynamic design of the Porsche 911 Turbo is a testament to its performance-oriented nature. Every curve and contour is meticulously crafted to minimize drag and optimize downforce, ensuring superior handling and stability at high speeds. From the distinctive sloping roofline to the iconic rear spoiler, the 911 Turbo exudes a dynamic presence that commands attention on the road.",config: .init(bulletType: .Text(value: "Aerodynamic Design:",color: .color(.red)))),
        .image(image: .url(url: "https://drives.today/upload/000/u41/e/8/porsche-911-993-multi-link-rear-suspension-picture-normal.jpg")),
        .bullet(value: "Porsche leaves no stone unturned when it comes to incorporating cutting-edge technology into the 911 Turbo. From adaptive suspension systems to advanced driver assistance features, this sports car is equipped with state-of-the-art technology to enhance both performance and safety. With intuitive infotainment systems and connectivity options, the 911 Turbo keeps you seamlessly connected, allowing you to enjoy every moment behind the wheel.",config: .init(bulletType: .Text(value: "Advanced Technology:",color: .color(.red)))),
        .image(image: .url(url: "https://i.pinimg.com/564x/df/74/0f/df740f96b358df22aeccca5006679a97.jpg"),config: .init(cornerRadius: 0)),
        .bullet(value: "While the Porsche 911 Turbo is undeniably a performance beast, it also offers a refined and luxurious interior. Step inside and you'll be greeted by premium materials, comfortable seating, and a driver-focused cockpit that exudes sophistication. Whether you're embarking on a thrilling track day or enjoying a spirited drive on the open road, the 911 Turbo ensures that you do so in ultimate comfort and style.",config: .init(bulletType: .Text(value: "Luxurious Comfort:",color: .color(.red)))),
        .caption(value: "Watch the Porsche 911 Turbo in action:"),
        .linkPreview(url: "https://youtu.be/rGObN2F6Hbg"),
        .caption(value: "The Porsche 911 Turbo is a masterpiece of engineering, combining power, agility, and luxury into a single extraordinary package. It represents the pinnacle of automotive performance, delivering an unmatched driving experience that leaves enthusiasts and casual drivers alike in awe."),
        .caption(value: "If you're ready to embark on an adrenaline-fueled journey like no other, the Porsche 911 Turbo is waiting to be your partner on the road. Buckle up, hold on tight, and get ready to experience the sheer thrill of driving perfection."),
        .caption(value: "Visit your nearest Porsche dealership or explore their website to discover more about the incredible Porsche 911 Turbo. Prepare to ignite your passion for driving and unleash the power of performance in the Porsche 911 Turbo."),
    ])
    
    
    func scrollViewDidScroll(value : CGFloat){
        if value < 0 {
            //scroll Down
            ScrollPer = .zero
            strachValue = -value
            scrollPosition = .zero
            
        } else if value > 0 {
            //scroll Up
            strachValue = .zero
            if value <= scrollBufferSize - 10 {
                ScrollPer =  value/scrollBufferSize
                scrollPosition = value
            } else {
                withAnimation(.linear(duration: 0.2)) {
                    ScrollPer = 1
                }
                scrollPosition = scrollBufferSize
            }
            
        } else {
            //scroll rest
            ScrollPer = 0
            scrollPosition = .zero
            strachValue = .zero
        }
        
       
    }
    
    
    func openOnlineBlog(){
        FirebaseManager.shared.getBlog() { blog in
            self.OpenBlog = blog
        }
    }
    
    func getDictOfPorcheBlog() {
        let Dict = porcheBlog.getDict()
        
//        let blogData = BlogData(Dict)
        FirebaseManager.shared.uploadBlog(data: Dict)
    }
}
