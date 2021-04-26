/*:
 ![Remember Game](code-cover.jpg)
 
The **Remember Game** is a game made for the elderly and aims to exercise the players' minds. In this way, the game provides a unique experience, as it stimulates memory in two ways: by arranging pairs of scrambled photos, where players must find the matching pair by turning two photos at a time, and also when discussing the moment that photo represents together with the other players, as soon as the pair is found, also increasing the social interaction between family and friends.
 
 # Inspiration
 The [UK NHS](https://www.nhs.uk/mental-health/feelings-symptoms-behaviours/feelings-and-symptoms/loneliness-in-older-people/) says "Older people are especially vulnerable to loneliness and social isolation – and it can have a serious effect on health. But there are ways to overcome loneliness, even if you live alone and find it hard to get out".
 Diseases related to memory loss can be caused by several factors, but the social interaction and brain exercise absence, call attention. Because they are factors that are in the lives of most of the population, but there is a change with the elderly.
 For this reason the Remember Game aims to increase social interaction while stimulating memory, the game itself is made to be as simple as possible, so that none of the players would stop being interested because of rules that could take the focus off of the game, which is the social interaction and remembrance of special moments between the players.
 
 # Share
 To share this Playground your can click on the 􀈂 icon, that are located at the right top corner of your display
 
 # Make your own Remember Game
 - Note: For better experience use this Playground in full screen and at a bigger screen
 
 Here you can edit your Remember Game photos, just add the title and image you want as follows:
 * callout(Photo edit): Photo(title: "My photo title", image: "Click on the icon to change the image")
 
 You can also add a longer description for your photo as follows
 * callout(Photo edit): Photo(title: "My photo title", description: "My photo description", image: "Click on the icon to change the image")
 
 To add elements, simply click and drag on the icon **]:**
 
 To change the photo click on the square icon after the `image: `, then you can select an image from the Photos app, Library, or even that a picture with your Camera. Make sure that an image preview is showing, which indicates that the image was successfully loaded.
 
 # Edit here
 
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
            GameController.playStory()
        }
        
        private mutating func playMainSoundTrack() {
            do {
                guard let path = Bundle.main.path(forResource: "main-soundtrack", ofType: "mp3") else { return }
                let url = URL(fileURLWithPath: path)
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.setVolume(0.2, fadeDuration: 0)
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
                        StoryUnit(story: GameController.stories[0], storyIndex: 0)
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
