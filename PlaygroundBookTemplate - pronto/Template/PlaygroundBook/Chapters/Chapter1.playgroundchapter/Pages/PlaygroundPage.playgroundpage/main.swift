//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

import PlaygroundSupport
import BookCore
import SwiftUI

if #available(iOS 14, *) {
    struct ContentView: View {
        var body: some View {
            NavigationView {
                GeometryReader { view in
                    VStack {
//                        StoryUnit(story: GameController.stories[0], storyIndex: 0)
                        Game()
                    }
                    .frame(width: view.size.width, height: view.size.height)
                    .navigationBarTitle(Text(""), displayMode: .inline)
                }
            }
            .ignoresSafeArea(.all)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }

    PlaygroundPage.current.setLiveView(ContentView())
} else {
    PlaygroundPage.current.setLiveView(Text("Sorry, you need iOS 14 at least"))
}
PlaygroundPage.current.needsIndefiniteExecution = true
