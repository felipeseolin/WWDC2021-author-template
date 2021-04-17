//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

import PlaygroundSupport
//import SpriteKit
//import UIKit
import BookCore
import SwiftUI
//let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 768))
//if let scene = GameScene(fileNamed: "GameScene") {
//    scene.scaleMode = .aspectFill
//    sceneView.presentScene(scene)
//}™

if #available(iOS 14, *) {
    struct ContentView: View {
        var body: some View {
            StoryUnit(story: GameController.stories[0], storyIndex: 0)
//            Game()
        }
    }

    PlaygroundPage.current.setLiveView(ContentView())
} else {
    PlaygroundPage.current.setLiveView(Text("Sorry, you need iOS 14 at least"))
}
PlaygroundPage.current.needsIndefiniteExecution = true
