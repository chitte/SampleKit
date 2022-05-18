//
//  HorizontalCard.swift
//  SampleUIKit
//
//  Created by VeeraSubhash on 23/08/21.
//

import SwiftUI

extension View {
    func getWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}

//extension VerticalAlignment {
//    struct CustomAlignment: AlignmentID {
//        static func defaultValue(in context: ViewDimensions) -> CGFloat {
//            return context[VerticalAlignment.center]
//        }
//    }
//
//    static let custom = VerticalAlignment(CustomAlignment.self)
//}

public struct HorizontalCard: View {
    
    public typealias CheckBoxButtonCallBack = () -> Void
    public var checkBoxButtonAction: CheckBoxButtonCallBack?
    
    public typealias ArrowButtonCallBack = () -> Void
    public var arrowButtonAction: ArrowButtonCallBack?
    
    public typealias ToggleButtonCallBack = () -> Void
    public var toggleButtonAction: ToggleButtonCallBack?
    
    public typealias TapCardCallBack = () -> Void
    public var tapCardCallBack: TapCardCallBack?
    
    @State private var isOn = true
    
    var cardData: HorizontalCardData
    
    public init(cardData: HorizontalCardData,
                checkBoxButtonAction: CheckBoxButtonCallBack? = nil,
                arrowButtonAction:  ArrowButtonCallBack? = nil,
                toggleButtonAction: ToggleButtonCallBack? = nil,
                tapCardCallBack: TapCardCallBack? = nil) {
        self.cardData = cardData
        self.checkBoxButtonAction = checkBoxButtonAction
        self.arrowButtonAction = arrowButtonAction
        self.toggleButtonAction = toggleButtonAction
        self.tapCardCallBack = tapCardCallBack
    }
    
    public static func createHorizontalCard(cardData: HorizontalCardData,
                                            checkBoxButtonAction: @escaping CheckBoxButtonCallBack,
                                            arrowButtonAction: @escaping ArrowButtonCallBack,
                                            toggleButtonAction: @escaping ToggleButtonCallBack,
                                            width: CGFloat = 39.0) -> HorizontalCard {
        let data = HorizontalCardData(leftIcon: cardData.leftIcon, title: cardData.title, clickableButtonType: cardData.clickableCardType, width: width)
        
        return HorizontalCard(cardData: data,
                              checkBoxButtonAction: {
                                checkBoxButtonAction()
                              }, arrowButtonAction: {
                                arrowButtonAction()
                              }, toggleButtonAction: {
                                toggleButtonAction()
                              }
        )
        
    }
    
    public var body: some View {
        
        HStack(alignment: .center) {
            cardData.leftIcon?
                .resizable()
//                .scaledToFit()
//                .aspectRatio(contentMode: .fit)
                .frame(width: cardData.width, height: cardData.width, alignment: .leading)
                .cornerRadius(SampleTheme.buttonCornerRadius)
            
            Text(cardData.title)
                .font(SampleTheme.font.imageButton)
                .foregroundColor(SampleTheme.color.titleColor)
                .frame(alignment: .leading)
                .padding(.leading, 10)
            
            Spacer()
            
            switch cardData.clickableCardType {
            case .arrow:
                Button(action: {
                    print("Arrow Button Clicked")
                }) {
                    Image.createImageFromSampleUIKit(with: "right-arrow")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 14, height: 14, alignment: .trailing)
                        .onTapGesture {
                            if let arrowButtonAction = arrowButtonAction {
                                arrowButtonAction()
                            }
                        }
                }
            case .toggle:
                Toggle(isOn: $isOn) {
                    Text("")
                }
                .frame(width: 40, height: 20)
                .toggleStyle(CustomToggleStyle(trailingButtonAction: {
                    if let toggleButtonAction = toggleButtonAction {
                        toggleButtonAction()
                    }
                   
                }))
            case .checkbox:
                Button(action: {
                    print("Checkbox Button Clicked")
                }) {
                    // TO DO: - Add condition
//                    Image.createImageFromSampleUIKit(with: "checkbox-unchecked")
//                        .resizable()
//                        .frame(width: 15, height: 15, alignment: .trailing)
                    
                    Toggle(isOn: $isOn) {
                        Text("")
                    }
                    .frame(width: 20, height: 20)
                    .toggleStyle(CheckBoxToggleStyle(trailingButtonAction: {
                        if let checkBoxButtonAction = checkBoxButtonAction {
                            checkBoxButtonAction()
                        }
                    }))
                }
            case nil:
                Spacer().frame(width: 0)
            case .some(.none):
                Spacer()
            }
        }
        .padding(.leading, 10)
        .padding(.trailing, 20)
        .padding([.top, .bottom], 10)
        .frame(height: 54)
        
        .if(tapCardCallBack != nil) { view in
            view.onTapGesture {
                if let tapCardCallBack = tapCardCallBack {
                    tapCardCallBack()
                }
            }
        }
    }
    
}

struct HorizontalCard_Previews: PreviewProvider {
    static var previews: some View {
        let data = HorizontalCardData(leftIcon: Image(systemName: "pencil.circle.fill"), title: "SwiftUI", clickableButtonType: .arrow, width: 10.0)
        HorizontalCard(cardData: data,
                       checkBoxButtonAction: {
                            print("Horizontal Card CheckBoxTrailing Button Action_Previews")
                       },
                       arrowButtonAction: {
                            print("Horizontal Card Arrow Trailing Button Action_Previews")
                       },
                       toggleButtonAction: {
                            print("Horizontal Card Toggle Trailing Button Action_Previews")
                       })
            .background(Color.orange)
    }
}

extension View {
    @ViewBuilder func `if`<T>(_ condition: Bool, transform: (Self) -> T) -> some View where T : View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
