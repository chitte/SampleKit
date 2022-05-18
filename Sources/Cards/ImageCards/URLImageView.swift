//
//  URLImageView.swift
//  SampleUIKit
//
//  Created by Office Account on 23/11/21.
//

import SwiftUI

public struct URLImageView: View {
    
    private var placeholderImageName: String
    
    @ObservedObject private var imageDownloader: ImageDownloader
    
    public init(urlString: String) {
        self.placeholderImageName = "placeholderImage"
        self.imageDownloader = ImageDownloader(urlString: urlString)
    }
    
    public var body: some View {
        
        if let uiImage = imageDownloader.uiImage {
            Image(uiImage: uiImage)
                .resizable()
        } else {
            Image.createImageFromSampleUIKit(with: placeholderImageName)
                .resizable()
        }
    }
}

