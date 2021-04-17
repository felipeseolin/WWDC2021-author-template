//
//  GameController.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 16/04/21.
//

import Foundation

public class GameController {
    // MARK: Stories
    public static let stories: [Story] = [
        Story(image: "story-1", text: "There was a little girl who liked to draw a lot, her name was Sarah"),
        Story(image: "story-2", text: "There was a little girl who liked to draw a lot, her name was Sarah"),
//        Story(image: "story-3", text: "There was a little girl who liked to draw a lot, her name was Sarah"),
//        Story(image: "story-4", text: "There was a little girl who liked to draw a lot, her name was Sarah"),
//        Story(image: "story-1", text: "There was a little girl who liked to draw a lot, her name was Sarah"),
//        Story(image: "story-1", text: "There was a little girl who liked to draw a lot, her name was Sarah"),
//        Story(image: "story-1", text: "There was a little girl who liked to draw a lot, her name was Sarah"),
    ]
    // MARK: Photos
    public static let photos: Set<Photo> = [
        Photo(title: "Uncle and aunt Wedding", image: "photo-1"),
        Photo(title: "Skateboarding", image: "photo-4"),
        Photo(title: "Mom and Baby Sarah", image: "photo-7"),
    ]
    public static var photosGame: [Photo] = []
    public static var selectedPhotos: Set<Photo> = []
    
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
}
