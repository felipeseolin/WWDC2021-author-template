//
//  StoryUnit.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 16/04/21.
//

import SwiftUI

@available(iOS 14.0, *)
public struct StoryUnit: View {
    var story: Story
    var storyIndex: Int
    @Environment(\.presentationMode) var presentationMode
    @State private var viewSelection: String? = nil
    public init(story: Story, storyIndex: Int) {
        self.story = story
        self.storyIndex = storyIndex
    }
    
    public var body: some View {
        GeometryReader { view in
            NavigationLink(destination: Game().navigationBarHidden(true).navigationBarBackButtonHidden(true).navigationBarTitle(Text(""), displayMode: .inline), tag: "Game", selection: $viewSelection) {
                EmptyView()
            }
            NavigationLink(destination: storyIndex < GameController.stories.count - 1 ? AnyView(StoryUnit(story: GameController.stories[storyIndex + 1], storyIndex: storyIndex + 1).navigationBarTitle("", displayMode: .inline).navigationBarHidden(true)) : AnyView(EmptyView()), tag: "Story", selection: $viewSelection) {
                EmptyView()
            }
            
            ZStack(alignment: .top) {
                // MARK: Skip Button
                if storyIndex < GameController.stories.count - 1 {
                    VStack {
                        Button(action: {
                            GameController.stopStory()
                            self.viewSelection = "Game"
                        }) {
                            Text("Skip")
                                .font(.system(size: 25))
                            Image(systemName: "chevron.forward.2")
                                .font(.system(size: 35))
                        }
                        .navigationBarTitle(Text(""))
                        .padding(20)
                    }
                    .zIndex(1)
                    .frame(width: view.size.width, alignment: .trailing)
                    .background(Color.white)
                } else {
                    EmptyView()
                }
                // MARK: Photo, Back, and Foward Buttons
                HStack(alignment: .center) {
                    // MARK: Back Button
                    if storyIndex > 0 {
                        Button(action: {
                            GameController.playPreviousStory()
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 56.0))
                        }
                        .frame(height: view.size.height - view.size.height / 4)
                        .padding(15)
                    } else {
                        Button(action: {}) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 56.0))
                        }
                        .frame(height: view.size.height - view.size.height / 4)
                        .padding(15)
                        .hidden()
                    }
                    // MARK: Story Image
                    VStack(alignment: .center) {
                        Image(story.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .frame(height: view.size.height / 2, alignment: .center)

                        Text(story.text)
                            .font(.custom("Verdana", size: 22))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.top, 10)
                            .background(Color.white)
                    }
                    // MARK: Foward Button
                    Button(action: {
                        if storyIndex < GameController.stories.count - 1 {
                            print(storyIndex)
                            GameController.playNextStory()
                            self.viewSelection = "Story"
                        } else {
                            GameController.stopStory()
                            self.viewSelection = "Game"
                        }
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 56.0))
                    }
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle(Text(""), displayMode: .inline)
                    .frame(height: view.size.height - view.size.height / 4)
                    .padding(15)
                }
                .padding(.top, -view.size.height / 6)
                .frame(width: view.size.width, height: view.size.height, alignment: .center)
            }
            .frame(width: view.size.width, height: view.size.height, alignment: .top)
            .background(Color.white)
            .padding(.top, 65)
        }
        .ignoresSafeArea(.all)
        .background(Color.white)
    }
}
