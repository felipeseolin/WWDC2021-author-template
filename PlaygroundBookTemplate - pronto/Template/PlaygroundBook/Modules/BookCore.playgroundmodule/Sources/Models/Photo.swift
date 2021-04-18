//
//  Photo.swift
//  BookCore
//
//  Created by Felipe Seolin Bento on 16/04/21.
//

import Foundation

public class Photo: Hashable, Equatable, Identifiable, ObservableObject, NSCopying {
    public var id = UUID()
    var title: String
    var description: String?
    var image: String
    @Published var show: Bool = false
    @Published var isMatched: Bool = false
    
    public init(title: String, image: String) {
        self.id = UUID()
        self.title = title
        self.image = image
        self.show = false
        self.isMatched = false
    }
    
    public init(title: String, description: String, image: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.image = image
        self.show = false
        self.isMatched = false
    }
    
    public init(id: UUID, title: String, description: String, image: String, show: Bool, isMatched: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.show = show
        self.isMatched = isMatched
    }
    
    public init(title: String, description: String, image: String, show: Bool, isMatched: Bool) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.image = image
        self.show = show
        self.isMatched = isMatched
    }
    
    public init(title: String, description: String, image: String, show: Bool) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.image = image
        self.show = show
        self.isMatched = false
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    public static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return Photo(title: self.title, description: self.description ?? "", image: self.image)
    }
    
    func isMatch(photo: Photo) -> Bool {
        return self.image == photo.image
    }
}
