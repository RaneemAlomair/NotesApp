//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Raneem Alomair on 20/10/2025.
//

import SwiftUI
import SwiftData

@main
struct NotesAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Note.self)
        }
    }
}
