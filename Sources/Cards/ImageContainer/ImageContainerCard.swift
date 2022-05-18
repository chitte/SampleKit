//
//  ImageContainerCard.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 06/09/21.
//

import SwiftUI

public struct ImageContainerCard: View {
    
//    @State var slideGesture: CGSize = CGSize.zero
//    var distance: CGFloat = UIScreen.main.bounds.size.width
//
//    public var numberOfPages: Int
//    @State var curSlideIndex: Int = 0
    
    public var image: Image
    
    public init(image: Image) {
        self.image = image
    }
    
    public var body: some View {

//        ScrollView {
//            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
//            ZStack(alignment: .center) {
                ZStack(alignment: .topTrailing) {
                    Image("bigImage")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(16)
                    
                    Image("closeBtn")
                        .resizable()
                        .font(.title)
                        .frame(width: 25, height: 25)
                        .offset(x: -10, y: 10)
                }
                .frame(width: 300, height: 230)
//            }
                        
//            DashedProgressIndicator(numberOfPages: numberOfPages, curSlideIndex: curSlideIndex)
            
//        }
        
    }
}

struct ImageContainerCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageContainerCard(image: Image(systemName: "apple"))
    }
}
