//
//  PolaroidWithDescription.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 19/04/21.
//

import SwiftUI

public struct PolaroidWithDescription: View {
    // MARK: Args
    @ObservedObject public var photo: Photo
    // MARK: Colors
    var lightGray = Color(red: 252.0/255, green: 252.0/255, blue: 252.0/255)
    // MARK: INIT
    public init(photo: Photo) {
        self.photo = photo
        self.photo.show = true
    }
    // MARK: MAIN View
    public var body: some View {
        VStack {
            VStack {
                if photo.isMatched || photo.show {
                    VStack {
                        Image(uiImage: photo.image)
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 297.6, height: 297.6)
                            .clipped()
                            .padding(.bottom, 5)
                        Text(photo.title)
                            .font(.custom("Noteworthy", size: 30))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 25)
                            .foregroundColor(.black)
                    }
                } else {
                    Text(photo.description ?? "")
                        .font(.custom("Noteworthy", size: 20))
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(.bottom, 35)
                            .frame(width: 297.6, height: 297.6 + 85)
                }
            }
            .padding(.bottom, 10)
            .padding(.top, 12)
            .padding(.leading, 12)
            .padding(.trailing, 12)
        }
        .border(lightGray, width: 1)
        .background(lightGray.shadow(radius: 5, x: 1, y: 1))
    }
}

