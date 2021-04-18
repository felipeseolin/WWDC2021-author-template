//
//  Game.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 16/04/21.
//

import SwiftUI

@available(iOS 14.0, *)
public struct Game: View {
    var layout = [GridItem(.adaptive(minimum: 320))]
    var nSelectedCards: Int = 0
    var gameController: GameController
    @State private var viewSelection: String? = nil
    
    public init() {
        GameController.loadPhotosGame()
        self.gameController = GameController()
    }
    
    public var body: some View {
        NavigationView {
            GeometryReader { view in
                NavigationLink(destination: WinGame().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarTitle(Text(""), displayMode: .inline), tag: "WinGame", selection: $viewSelection) {
                    EmptyView()
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout) {
                        ForEach(GameController.photosGame, id: \.id) { photo in
                            Button(action: {
                                if (GameController.selectedPhotos.count >= 2) {
                                    return
                                }
                                
                                photo.show = true
                                gameController.selectPhoto(photo)
                                gameController.playPaperSoundEffect()
                                
                                if gameController.checkMatch() {
                                    gameController.setSelectPhotoAsMatch()
                                    gameController.hidePhotos()
                                    gameController.removeSelectedPhotos()
                                    
                                    if gameController.hasWon() {
                                        self.viewSelection = "WinGame"
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
                    .padding(.top, view.size.height / 25)
                    .padding(.bottom, view.size.height / 25)
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .background(
                    Image("wood-background").resizable().aspectRatio(contentMode: .fill)
                )
                .ignoresSafeArea(.all)
            }
            .ignoresSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}
