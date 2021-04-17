//
//  Polaroid.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 16/04/21.
//

import SwiftUI

public struct Polaroid: View {
    // MARK: Args
    @ObservedObject public var photo: Photo
    // MARK: Colors
    var lightGray = Color(red: 252.0/255, green: 252.0/255, blue: 252.0/255)
    // MARK: Contet View
    var polaroidContent: some View {
            VStack {
                Image(photo.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 297.6, height: 297.6)
                    .clipped()
                    .padding(.bottom, 5)
                Text(photo.title)
                    .font(.custom("Noteworthy", size: 30))
                    .padding(.bottom, 25)
            }
    }
    // MARK: INIT
    public init(photo: Photo) {
        self.photo = photo
    }
    // MARK: MAIN View
    public var body: some View {
        GeometryReader { view in
            VStack {
                VStack {
                    if photo.isMatched || photo.show {
                        polaroidContent
                    } else {
                        polaroidContent.hidden()
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
}
