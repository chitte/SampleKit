//
//  SampleButton.swift
//  SampleUIKit
//
//  Created by Office Account on 03/11/21.
//

import SwiftUI

/*
public struct SampleButton: View {
    
    var buttonTitle: String?
    var buttonImage: Image?
    var forgroundColour: Color
    var backgroundColour: Color
    
    public typealias ButtonActionCallBack = () -> Void
    public var buttonAction: ButtonActionCallBack
    
    public init(buttonTitle: String? = nil, buttonImage: Image? = nil, forgroundColour: Color = SwiftUI.Color.black, backgroundColour: Color = SwiftUI.Color.white, buttonAction: @escaping SampleButton.ButtonActionCallBack = {}) {
        self.buttonTitle = buttonTitle
        self.buttonImage = buttonImage
        self.forgroundColour = forgroundColour
        self.backgroundColour = backgroundColour
        self.buttonAction = buttonAction
    }
    
    
    public var body: some View {
        Button(action: buttonAction){
            
            if let title = buttonTitle {
                getTitleViewWith(title: title)
                
            } else if let image = buttonImage {
                getImageWith(image: image)
            }
        }
    }
    
    
    @ViewBuilder private func getTitleViewWith(title: String) -> some View {
        Text(title)
            .font(SampleTheme.font.imageButton)
            .padding()
            .foregroundColor(forgroundColour)
            .frame(alignment: .center)
    }
    
    @ViewBuilder private func getImageWith(image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .foregroundColor(forgroundColour)
            .frame(alignment: .center)
    }
}

struct SampleButton_Previews: PreviewProvider {
    
  static var stateChanges: Bool = false
    
    static var previews: some View {
        Button("Filter"){
            print("SampleButton Action")
        }
        .frame(width: 175, height: 75, alignment: .center)
        .buttonStyle(SampleButtonStyle(selected: stateChanges))
        
        .previewLayout(.sizeThatFits)
    }
}
*/

public struct SampleButtonStyle: ButtonStyle {
  
    var isSelected: Bool
    private var primaryColour: Color = SwiftUI.Color.orange
    
    public init(selected: Bool, colour: Color = SwiftUI.Color.orange) {
        self.isSelected = selected
        self.primaryColour = colour
    }
    
    public func makeBody(configuration: Configuration) -> some View {
           configuration.label
               .foregroundColor(isSelected ? SwiftUI.Color.white :  primaryColour)
               .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(primaryColour  , lineWidth: 4)
                            .background(isSelected ? primaryColour : SwiftUI.Color.clear)
                        )
            
               .cornerRadius(8)
       }
}
