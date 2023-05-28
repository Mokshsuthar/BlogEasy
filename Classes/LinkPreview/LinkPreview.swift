import SwiftUI
import LinkPresentation

public struct LinkPreview: View {
    let url: URL?
    
    @State private var isPresented: Bool = false
    @State private var metaData: LPLinkMetadata? = nil
    
    var backgroundColor: Color = Color(.systemGray5)
    var primaryFontColor: Color = .primary
    var secondaryFontColor: Color = .secondary
    var titleLineLimit: Int = 3
    var type: LinkPreviewType = .auto
    
    public init(url: URL?) {
        self.url = url
    }
    
    @ViewBuilder
    var smallTypeLoader: some View {
        HStack(spacing: 8){
            
            ZStack{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: secondaryFontColor))
            }
            .squareFrame(size: 45)
            .background(secondaryFontColor.opacity(0.1))
            .cornerRadius(6)
            
           
            VStack(alignment: .leading, spacing: 0){
                Text("How to pilot through the human roadblocks that clog the path to project execution.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .redacted(reason: .placeholder)
                    .minimumScaleFactor(0.8)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(primaryFontColor)
                    .lineLimit(titleLineLimit)
                   
                
                Text("How to pilot through the human")
                    .foregroundColor(secondaryFontColor)
                    .redacted(reason: .placeholder)
                    .font(.footnote)
            }
            .fullWidth(alignment: .leading)
         }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .fullWidth(height: 60)
        .background(
            Rectangle()
                .foregroundColor(backgroundColor)
        )
        .cornerRadius(12)
    }
    
    @ViewBuilder
    var largeTypeLoader: some View {
        VStack(alignment: .leading, spacing: 0){
            ZStack(alignment: .bottomTrailing){
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: secondaryFontColor))
            }.fullWidth(height: 200)
            
            
            HStack(spacing: 8){
            VStack(alignment: .leading, spacing: 0){
                Text("How to pilot through the human roadblocks that clog the path to project execution.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .redacted(reason: .placeholder)
                    .minimumScaleFactor(0.8)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(primaryFontColor)
                    .lineLimit(titleLineLimit)
                
                Text("How to pilot through the human")
                    .foregroundColor(secondaryFontColor)
                    .redacted(reason: .placeholder)
                    .font(.footnote)
               }
            }
            .padding(.horizontal, 9)
            .padding(.vertical, 8)
            .fullWidth(height: 60)
            .background(
                Rectangle()
                    .foregroundColor(backgroundColor)
            )
        }
        .background(secondaryFontColor.opacity(0.1))
        .cornerRadius(12)
    }
    
    public var body: some View {
        if let url = url {
            if let metaData = metaData {
                Button(action: {
                    if UIApplication.shared.canOpenURL(url) {
                        self.isPresented.toggle()
                    }
                }, label: {
                    LinkPreviewDesign(metaData: metaData, type: type, backgroundColor: backgroundColor, primaryFontColor: primaryFontColor, secondaryFontColor: secondaryFontColor, titleLineLimit: titleLineLimit)
                })
                    .buttonStyle(LinkButton())
                    .fullScreenCover(isPresented: $isPresented) {
                        SfSafariView(url: url)
                            .edgesIgnoringSafeArea(.all)
                    }
                    .animation(.spring(), value: metaData)
            }
            else {
                ZStack{
                    switch type {
                    case .small:
                        smallTypeLoader
                    case .large,.auto:
                        largeTypeLoader
                    }
                }
                .onAppear(perform: {
                    getMetaData(url: url)
                })
                .onTapGesture {
                    if UIApplication.shared.canOpenURL(url) {
                        self.isPresented.toggle()
                    }
                }
                .fullScreenCover(isPresented: $isPresented) {
                    SfSafariView(url: url)
                        .edgesIgnoringSafeArea(.all)
                }
               
            }
        }
    }
    
    func getMetaData(url: URL) {
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: url) { meta, err in
            guard let meta = meta else {return}
            withAnimation(.spring()) {
                self.metaData = meta
            }
        }
    }
}




struct LinkButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
            .animation(.spring(), value: configuration.isPressed)
    }
}
