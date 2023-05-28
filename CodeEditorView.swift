//
//  CodeEditorView.swift
//  BlogEasy
//
//  Created by Moksh Suthar on 27/05/23.
//

import Foundation
import SwiftUI
import Highlightr

struct CodeEditorView: View {
    
    var text: String
    var showCopyBtn: Bool = true
    var fontSize: CGFloat = 20
    
    @State var counter = 0
    let highlightr = Highlightr()
    @State var output : NSAttributedString?
    
    @State private var attributedText = NSMutableAttributedString(string: "")
    @State var height: CGFloat = 50
    
    
    init(text : String,fontSize : CGFloat = 20,showCopyBtn: Bool = true) {
        self.text = text
        self.fontSize = fontSize
        self.showCopyBtn = showCopyBtn
        UITextView.appearance().backgroundColor = .clear
    }
    
    
    var body: some View{
        ZStack{
           
                
            VStack(spacing: 0){
                ///copy code

                if showCopyBtn {
                    HStack {

                        Text("Code")
                            .font(.callout.smallCaps())
                            .fontWeight(.bold)
                            .foregroundColor(Color.systemTextColor.opacity(0.5))
                            .fullWidth(alignment: .leading)



                        Button {
    //                                self.setEvent(value: "Response_CodeBlock_Copy_tap")
    //                                self.showDrop(title: "Copied", icon: nil)
    //                                self.hapticFeedback(type: .success)
                            UIPasteboard.general.string = "\(attributedText.string)"
                        } label: {

                            Group{
                                Text(Image(systemName: "doc.on.doc"))
                                    .font(.footnote.smallCaps())

                                +

                                Text(" Copy")
                                    .font(.subheadline.smallCaps())
                            }

                            .foregroundColor(Color.systemTextColor.opacity(0.5))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(Color.systemTextColor.opacity(0.1))
                            .cornerRadius(10)


                        }


                    }
                    .padding(10)
                    .fullWidth()
                    .background(BlurView(style: .systemUltraThinMaterial))
                }
                
                ZStack{
                    TextView(text: $attributedText, height: $height, fontSize: fontSize)
                        .frame(height: height , alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)

                }
                .padding()
                .background(Color.black)
                

            }
            
            RoundedRectangle(cornerRadius: 10).stroke(Color.systemTextColor.opacity(0.3),lineWidth: 2)
            
        }
        .background(Color.clear)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
        .ignoresSafeArea()
        .onAppear {
            if let highlightr = highlightr {
                highlightr.setTheme(to: "paraiso-dark")
                guard let output = highlightr.highlight(text, as: "swift") else { return}
                self.output = output
                self.attributedText = output as! NSMutableAttributedString
               
            }
           
            
           
        }
    }
}

extension String{

    func calculatedHeight(fontSize: CGFloat, width: CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width,
                                          height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.sizeToFit()
        return label.frame.height
    }

}




struct TextView: UIViewRepresentable {
    
    @Binding var text: NSMutableAttributedString
    @Binding var height: CGFloat
    
    var fontSize: CGFloat = 20
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        textView.font = .systemFont(ofSize: fontSize)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
        var frame = uiView.frame
        frame.size.height = uiView.contentSize.height
        //        uiView.frame = frame

        
        if uiView.contentSize.height > self.height {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.2) {
                    height = uiView.contentSize.height
                }
            }
            
        }
        
        
    }
}


