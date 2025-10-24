//
//  ContentView.swift
//  NotesApp
//
//  Created by Raneem Alomair on 20/10/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            NotesListView(search: searchText)
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        AddNoteButton()
                    }
                }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .autocorrectionDisabled()
    }
}

struct NotesListView: View {
    @Environment(\.modelContext) private var viewContext
    @Query private var notes: [Note]
    let search: String

    private var displayedNotes: [Note] {
        let q = search.trimmingCharacters(in: .whitespacesAndNewlines)
        let filtered: [Note]
        if q.isEmpty {
            filtered = notes
        } else {
            // case/diacritic-insensitive
            filtered = notes.filter {
                $0.title.localizedCaseInsensitiveContains(q) ||
                $0.body.localizedCaseInsensitiveContains(q)
            }
        }

        return filtered.sorted {
            if $0.isStarred != $1.isStarred {
                return $0.isStarred && !$1.isStarred
            }
            return $0.title.localizedCompare($1.title) == .orderedAscending
        }
    }

    var body: some View {
        List {
            ForEach(displayedNotes) { note in
                NavigationLink {
                    NoteDetailView(note: note)
                } label: {
                    NoteSummaryView(note: note)
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        viewContext.delete(note)
                        try? viewContext.save()
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
    }
}

private struct AddNoteButton: View {
    @Environment(\.modelContext) private var viewContext

    var body: some View {
        Button {
            let newNote = Note(title: "New Note", body: "Note body here…")
            viewContext.insert(newNote)
            try? viewContext.save()
        } label: {
            Image(systemName: "plus")
        }
        .accessibilityLabel("Add Note")
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .modelContainer(for: Note.self, inMemory: true)
}


