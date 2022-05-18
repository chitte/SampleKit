//
//  ToggleButton.swift
//  SampleUIKit
//
//  Created by Veera Subhash on 21/10/21.
//

import SwiftUI

public struct ToggleButton: View {
    
    @State private var isOn = true
    @Binding var isToggleOn: Bool

    public init(isToggleOn: Binding<Bool>) {
        _isToggleOn = isToggleOn
    }
    
    public var body: some View {
        
        Toggle("", isOn: $isOn)
        .frame(width: 40, height: 60)
        .toggleStyle(CustomToggleStyle(trailingButtonAction: {
            self.isToggleOn.toggle()
        }))
        
    }
}

struct ToggleButton_Previews: PreviewProvider {
    @State static var toggleState: Bool = true
    static var previews: some View {
        ToggleButton(isToggleOn: $toggleState)
    }
}
