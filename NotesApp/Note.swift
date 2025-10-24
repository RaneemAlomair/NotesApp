//
//  Note.swift
//  NotesApp
//
//  Created by Raneem Alomair on 20/10/2025.
//

import SwiftData

@Model
final class Note {
    var title: String
    var body: String
    var isStarred: Bool

    init(title: String, body: String, isStarred: Bool = false) {
        self.title = title
        self.body = body
        self.isStarred = isStarred
    }
}
