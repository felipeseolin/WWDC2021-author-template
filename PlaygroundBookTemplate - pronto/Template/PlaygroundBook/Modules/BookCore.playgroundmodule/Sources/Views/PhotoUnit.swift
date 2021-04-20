//
//  Photos.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 19/04/21.
//

import SwiftUI

@available(iOS 14.0, *)
public struct PhotoUnit: View {
    var photo: Photo
    var photoIndex: Int
    @Environment(\.presentationMode) var presentationMode
    
    public init(photo: Photo, photoIndex: Int) {
        self.photo = photo
        self.photoIndex = photoIndex
    }
    
    public var body: some View {
        GeometryReader { view in
            VStack {
                // MARK: Photo, Back, and Foward Buttons
                HStack(alignment: .center) {
                    // MARK: Back Button
                    if photoIndex > 0 {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 56.0))
                        }
                        .frame(height: view.size.height - view.size.height / 4)
                        .padding(5)
                    } else {
                        EmptyView()
                    }
                    // MARK: PolaroidWithDescription
                    Button(action: {
                        photo.show = !photo.show
                    }) {
                        PolaroidWithDescription(photo: photo)
                    }
                    .frame(width: view.size.width - 150, height: view.size.height, alignment: .center)
                    // MARK: Foward Button
                    if photoIndex < GameController.photos.count - 1 {
                        NavigationLink(destination: PhotoUnit(photo: GameController.getPhoto(at: photoIndex + 1), photoIndex: photoIndex + 1).navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarTitle(Text(""), displayMode: .inline)) {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 56.0))
                        }
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle(Text(""), displayMode: .inline)
                        .frame(height: view.size.height - view.size.height / 4)
                        .padding(5)
                    } else {
                        EmptyView()
                    }
                }
            }
            .frame(width: view.size.width, height: view.size.height, alignment: .center)
            .background(Image("wood-background").resizable().aspectRatio(contentMode: .fill))
            .ignoresSafeArea(.all)
        }
        .ignoresSafeArea(.all)
        .background(Color.white)
    }
    
}
