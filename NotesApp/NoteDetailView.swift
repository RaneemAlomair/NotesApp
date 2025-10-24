//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by Raneem Alomair on 20/10/2025.
//

import SwiftUI
import SwiftData

struct NoteDetailView: View {
    @Bindable var note: Note   // SwiftData binding

    var body: some View {
        Form {
            TextField("Title", text: $note.title)
                .font(.title)
                .padding()
            TextEditor(text: $note.body)
                .font(.body)
                .padding()
        }
        .navigationTitle("Edit Note")
    }
}


