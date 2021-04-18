/*:
 ![Uma imagem explicativa](code-cover.jpg)
 
 # Título principal!
 
 Um demo *simples* com exemplos de *markup*.
 
 Algo muito importante em **negrito** chama muita **atenção**
 
 
 ## Isso é um subtítulo nível 2
 ### Isso é um subtítulo nível 3
 
 Você pode fazer uma linha para dividir seções
 
 ---
 
 - Note: Uma nota legal que aparece assim
 
 - Experiment: Experimente trocar a velocidade do bonequinho para ver o que acontece!!
 
 ## Bullet Points
* Ponto importante 1
* Ponto ❤️
* Cuidado com as 🕷🕷🕷 **aranhas**
 
1) Numerados
1) Numerados
 
 
 Você pode usar [links](http://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/) com referências
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

if #available(iOS 14, *) {
    struct ContentView: View {
        
        public init() {
            GameController.photos = [
                Photo(title: "Uncle and aunt Wedding 2", image: "photo-1"),
                Photo(title: "Skateboarding 2", image: "photo-4"),
                Photo(title: "Mom and Baby Sarah 2", image: "photo-7"),
            ]
        }
        
        var body: some View {
            NavigationView {
                GeometryReader { view in
                    VStack {
                        StoryUnit(story: GameController.stories[0], storyIndex: 0)
//                        Game()
//                        WinGame()
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

//#-code-completion(literal, show, color)
//Uma variável que pode ser editada por código (tbm só no iPad)
var pontos = /*#-editable-code*/5/*#-end-editable-code*/
var color = /*#-editable-code*/#colorLiteral(red: 0.9921568627, green: 0.7215686275, blue: 0.1529411765, alpha: 1)/*#-end-editable-code*/
