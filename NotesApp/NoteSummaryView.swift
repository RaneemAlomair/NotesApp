//
//  NoteSummaryView.swift
//  NotesApp
//
//  Created by Raneem Alomair on 20/10/2025.
//

import SwiftUI

import SwiftUI
import SwiftData

struct NoteSummaryView: View {
    @Bindable var note: Note

    var body: some View {
        HStack {
            Image(systemName: note.isStarred ? "star.fill" : "star")
                .foregroundColor(note.isStarred ? .yellow : .gray)
                .onTapGesture { note.isStarred.toggle() }

            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(note.body)
                    .font(.subheadline)
                    .lineLimit(1)
            }
            .padding(.leading, 5)
        }
    }
}


