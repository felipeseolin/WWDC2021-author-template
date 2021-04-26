//
//  WinGame.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 17/04/21.
//

import SwiftUI

@available(iOS 14.0, *)
public struct WinGame: View {
    public init() {}
    
    public var body: some View {
        GeometryReader { view in
            VStack {
                Text("Congratulations, you won!")
                    .font(.custom("Noteworthy", size: 50))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.6274509804, alpha: 1)))
                Image("grandma-love")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: view.size.height / 3)
                    .clipped()
                    .padding(.top, view.size.height / 15)
                    .padding(.bottom, view.size.height / 15)
                NavigationLink(
                    destination: Game()
                ) {
                    Text("Play again")
                        .foregroundColor(.white)
                        .font(.custom("Verdana", size: 25))
                }
                .padding(20)
                .background(Color(#colorLiteral(red: 0.9607843137, green: 0.6392156863, blue: 0.6274509804, alpha: 1)))
                .cornerRadius(15)
            }
            .background(Color.white)
            .frame(width: view.size.width, height: view.size.height, alignment: .center)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea(.all)
        }
        .background(Color.white)
        .ignoresSafeArea(.all)
    }
}
