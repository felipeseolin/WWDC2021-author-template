//
//  Game.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 16/04/21.
//

import SwiftUI
import PlaygroundSupport

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
        GeometryReader { view in
            NavigationLink(destination: WinGame().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarTitle(Text(""), displayMode: .inline), tag: "WinGame", selection: $viewSelection) {
                EmptyView()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: layout) {
                    ForEach(GameController.photosGame, id: \.id) { photo in
                        Button(action: {
                            if (GameController.selectedPhotos.count >= 2 || photo.isMatched) {
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
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        self.viewSelection = "WinGame"
                                        PlaygroundPage.current.assessmentStatus = .pass(message: "Yay, you won! Now, let's try to edit the Playground on the left side and add your own photos. After that, you can share with your family and friends, just like Sarah.")
                                    }
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
            .transition(.asymmetric(insertion: AnyTransition.opacity.combined(with: .slide), removal: .scale))
            .animation(.default)
        }
        .ignoresSafeArea(.all)
    }
}
