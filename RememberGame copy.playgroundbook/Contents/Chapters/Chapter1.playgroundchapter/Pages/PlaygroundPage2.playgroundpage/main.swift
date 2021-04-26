/*:
 ![Remember Game](code-cover.jpg)
 
This is the photo gallery, here you can see each photo in more detail. To see the description just click on the photo.
 
 - Note: For better experience use this Playground in full screen and at a bigger screen
 
 # Make your own Remember Game
 The instructions for editing the Playground are on the first page, you can copy and paste the values between the pages
 
 The drawings assets in this Playground has been withdrawn from unDraw, authored by Katerina Limpitsouni
 */

//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
import PlaygroundSupport
import BookCore
import SwiftUI
import AVFoundation

if #available(iOS 14, *) {
    struct ContentView: View {
        public var audioPlayer: AVAudioPlayer = AVAudioPlayer()
        
        public init() {
            //#-end-hidden-code
            //#-code-completion(literal, show)
GameController.photos = /*#-editable-code*/[Photo(title: "Uncle and aunt Wedding", description: "The wedding was at the end of 2012, we had a blast", image: #imageLiteral(resourceName: "photo-1")), Photo(title: "Skateboarding", description: "This is my dad teaching my cousin to skate", image: #imageLiteral(resourceName: "photo-4")), Photo(title: "Mom and Baby Sarah", description: "Oh, this is Baby Sarah, look how cute", image: #imageLiteral(resourceName: "photo-7")),]/*#-end-editable-code*/
            //#-hidden-code
            self.playMainSoundTrack()
        }
        
        private mutating func playMainSoundTrack() {
            do {
                guard let path = Bundle.main.path(forResource: "main-soundtrack", ofType: "mp3") else { return }
                let url = URL(fileURLWithPath: path)
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.setVolume(0.3, fadeDuration: 0)
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                return
            }
        }
        
        var body: some View {
            NavigationView {
                GeometryReader { view in
                    VStack {
                        PhotoUnit(photo: GameController.getPhoto(at: 0), photoIndex: 0)
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
//#-end-hidden-code

/*:
 ---
 The drawings assets in this Playground has been withdrawn from unDraw, authored by Katerina Limpitsouni
 */
