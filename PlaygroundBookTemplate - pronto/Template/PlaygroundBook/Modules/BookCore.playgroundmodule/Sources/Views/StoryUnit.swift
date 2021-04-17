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
    
    public init(story: Story, storyIndex: Int) {
        self.story = story
        self.storyIndex = storyIndex
    }
    
    public var body: some View {
        NavigationView {
            GeometryReader { view in
                VStack(alignment: .trailing) {
                    VStack {
                        NavigationLink(destination: Game()) {
                            Text("Skip")
                                .font(.system(size: 25))
                            Image(systemName: "chevron.forward.2")
                                .font(.system(size: 35))
                        }
                        .navigationBarTitle(Text(""))
                        .border(Color.black)
                    }
                    .background(Color.white)
                    .padding(.top, view.size.height / 10)
                    .padding(.trailing, 15)
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        if storyIndex > 0 {
                            Button(action: {
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
                            
                        VStack(alignment: .center) {
                            Image(story.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                                .frame(height: view.size.height - view.size.height / 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                            Text(story.text)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding(.top, -view.size.height / 16)
                        }
                        
                        NavigationLink(
                            destination:
                                storyIndex < GameController.stories.count - 1 ?
                                AnyView(StoryUnit(story: GameController.stories[storyIndex + 1], storyIndex: storyIndex + 1)) :
                                AnyView(Game().navigationBarTitle("", displayMode: .inline).navigationBarHidden(true))
                        ) {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 56.0))
                        }
                        .frame(height: view.size.height - view.size.height / 4)
                        .padding(15)
                    }
                    .frame(minWidth: view.size.width, idealWidth: view.size.width, maxWidth: view.size.width, minHeight: view.size.height, idealHeight: view.size.height, maxHeight: view.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top, -view.size.height / 7)
                }
                .background(Color.white)
            }
            .ignoresSafeArea(.all)
            .background(Color.white)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
        }
//        .background(Color.white)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
        
    }
}
