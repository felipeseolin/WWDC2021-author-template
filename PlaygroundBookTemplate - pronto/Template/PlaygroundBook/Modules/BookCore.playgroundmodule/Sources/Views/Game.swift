//
//  Game.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 16/04/21.
//

import SwiftUI

@available(iOS 14.0, *)
public struct Game: View {
    var layout = [GridItem(.adaptive(minimum: 280))]
    var nSelectedCards: Int = 0
    var gameController: GameController
    
    public init() {
        GameController.loadPhotosGame()
        self.gameController = GameController()
    }
    
    public var body: some View {
        GeometryReader { view in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: layout) {
                    ForEach(GameController.photosGame, id: \.id) { photo in
                        Button(action: {
                            if (GameController.selectedPhotos.count >= 2) {
                                return
                            }
                            
                            photo.show = true
                            gameController.selectPhoto(photo)
                            
                            if gameController.checkMatch() {
                                gameController.setSelectPhotoAsMatch()
                                gameController.hidePhotos()
                                gameController.removeSelectedPhotos()
                                
                                if gameController.hasWon() {
                                    print ("WIN!!!!!!!!!")
                                }
                            } else if GameController.selectedPhotos.count == 2 {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    gameController.hidePhotos()
                                    gameController.removeSelectedPhotos()
                                }
                            }
                        }) {
                            Polaroid(photo: photo)
                                .frame(width: 325, height: 405, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(10)
                }
                .padding(.top, 50)
                .frame(minHeight: view.size.height)
            }
            .background(Color(red: 139.0/255, green: 69.0/255, blue: 19.0/255))
            .ignoresSafeArea(.all)
        }
    }
}
