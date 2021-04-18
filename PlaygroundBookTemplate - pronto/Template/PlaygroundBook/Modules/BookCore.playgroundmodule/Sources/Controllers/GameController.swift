//
//  GameController.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 16/04/21.
//

import Foundation
import AVFoundation

public class GameController {
    // MARK: Stories
    public static let stories: [Story] = [
        Story(image: "story-1", text: "There was a little girl who liked to draw a lot, her name was Sarah."),
        Story(image: "story-2", text: "Whenever Sarah finished her drawings, she used to show them to her grandma who lived with her. Until one day she realized that her grandmother no longer recognized her drawings and sometimes she acted weird, looking like she didn't recognize her own granddaughter."),
        Story(image: "story-3", text: "When questioning her mother why, she explains that grandma is gradually losing her memory and the doctor said she needs to exercise her brain."),
        Story(image: "story-4", text: "So the girl decided to make a pretty drawing for her grandma, therefore she ran to get more colored pencils that were on a shelf in her grandma's room"),
        Story(image: "story-5", text: "However, when reaching for the container with the colored pencils, a box fell with several old photos of the family. The girl had never seen these photos and soon had an idea: Make a memory game for her grandmother to exercise her brain trying to memorize the position of the photos and also remembering the moments she lived and telling to her family"),
    ]
    // MARK: Photos
    public static let photos: Set<Photo> = [
        Photo(title: "Uncle and aunt Wedding", image: "photo-1"),
        Photo(title: "Skateboarding", image: "photo-4"),
        Photo(title: "Mom and Baby Sarah", image: "photo-7"),
    ]
    public static var photosGame: [Photo] = []
    public static var selectedPhotos: Set<Photo> = []
    // MARK: Sound Effects
    public var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    public static func loadPhotosGame() {
        GameController.photosGame = []
        
        for _ in 1...2 {
            for photo in photos {
                GameController.photosGame.append(photo.copy() as! Photo)
            }
        }
        GameController.photosGame = GameController.photosGame.shuffled()
    }
    
    public func selectPhoto(_ photo: Photo) {
        if photo.isMatched {
            return
        }
        
        GameController.selectedPhotos.insert(photo)
    }
    
    public func setSelectPhotoAsMatch() {
        if (GameController.selectedPhotos.count < 2) {
            return
        }
        
        let photo1 = self.getSeletedPhoto(at: 0)
        let photo2 = self.getSeletedPhoto(at: 1)
        photo1.isMatched = true
        photo2.isMatched = true
        
        guard let photoGame1 = GameController.photosGame.first(where: { $0 == photo1 }),
              let photoGame2 = GameController.photosGame.first(where: { $0 == photo2 })
            else { return }
        photoGame1.isMatched = true
        photoGame2.isMatched = true
    }
    
    public func hidePhotos() {
        for photo in GameController.selectedPhotos {
            photo.show = false
        }
        
        for photo in GameController.photosGame {
            photo.show = false
        }
    }
    
    public func checkMatch() -> Bool {
        if (GameController.selectedPhotos.count < 2) {
            return false
        }
        
        let photo1 = self.getSeletedPhoto(at: 0)
        let photo2 = self.getSeletedPhoto(at: 1)
        
        return photo1.image == photo2.image
    }
    
    public func hasWon() -> Bool {
        let matchedPhotos = GameController.photosGame.filter { $0.isMatched }
        return matchedPhotos.count == GameController.photosGame.count
    }
    
    public func removeSelectedPhotos() {
        GameController.selectedPhotos.removeAll()
    }
    
    public func getSeletedPhoto(at: Int) -> Photo {
        return GameController.selectedPhotos[GameController.selectedPhotos.index(GameController.selectedPhotos.startIndex, offsetBy: at)]
    }
    
    public func playSound(_ url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.setVolume(0.05, fadeDuration: 0)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            return
        }
    }
    
    public func playPaperSoundEffect() {
        if let path = Bundle.main.path(forResource: "paper", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            self.playSound(url)
        }
    }
}
