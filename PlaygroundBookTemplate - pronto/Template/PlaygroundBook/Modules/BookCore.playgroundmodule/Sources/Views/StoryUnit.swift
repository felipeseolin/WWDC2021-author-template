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
//                    NavigationLink(destination: Game()) {
//                        Text("Skip")
//                            .font(.system(size: 30))
//                        Image(systemName: "chevron.forward.2")
//                            .font(.system(size: 35))
//                    }
//                    .padding(.top, 35)
//                    .padding(.trailing, 15)
                    
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
                            EmptyView()
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
                        }
                        
                        if storyIndex < GameController.stories.count - 1 {
                            NavigationLink(destination: StoryUnit(story: GameController.stories[storyIndex + 1], storyIndex: storyIndex + 1)) {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 56.0))
                            }
                            .frame(height: view.size.height - view.size.height / 4)
                            .padding(15)
                        } else {
                            EmptyView()
                        }
                    }
                    .frame(minWidth: view.size.width, idealWidth: view.size.width, maxWidth: view.size.width, minHeight: view.size.height, idealHeight: view.size.height, maxHeight: view.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top, -50)
                }
            }
            .ignoresSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}
