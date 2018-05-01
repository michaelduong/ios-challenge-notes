//
//  NotesController.swift
//  Notes
//
//  Created by Michael Duong on 1/19/18.
//  Copyright © 2018 Turnt Labs. All rights reserved.
//

import Foundation

class NotesController {
    static let shared = NotesController()
    
    var notes: [Notes] = []
    
    init() {
        self.notes = loadToPersistentData()
    }
    
    //CRUD SECTION

    //CREATE
    func createNotes(text: String) {
        let newNotes = Notes(text: text)
        notes.append(newNotes)
        saveToPersistentData()
    }
    
    //UPDATE
    func updateNotes(text: String, note: Notes) {
        note.text = text
        saveToPersistentData()
    }
    
    //DELETE
    func deleteNotes(note: Notes) {
        guard let index = notes.index(of: note) else { return }
        notes.remove(at: index)
        saveToPersistentData()
    }
    
    //ACCESS
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "notes.json"
        let documentsURL = urls[0].appendingPathComponent(fileName)
        return documentsURL
    }
    
    //SAVE
    func saveToPersistentData() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(notes)
            try data.write(to: fileURL())
    
        } catch {
            print("Error while saving: \(error.localizedDescription)")
        }
    }
    
    //LOAD
    func loadToPersistentData() -> [Notes] {
        do {
            let data = try Data(contentsOf: fileURL())
            let jsonDecoder = JSONDecoder()
            let note = try jsonDecoder.decode([Notes].self, from: data)
            return note
            
        } catch {
            print("Error while loading: \(error.localizedDescription)")
            return []
        }
    }
}


