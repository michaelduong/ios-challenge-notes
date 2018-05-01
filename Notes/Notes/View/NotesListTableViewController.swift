//
//  NotesListTableViewController.swift
//  Notes
//
//  Created by Michael Duong on 1/19/18.
//  Copyright © 2018 Turnt Labs. All rights reserved.
//

import UIKit

class NotesListTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotesController.shared.notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = NotesController.shared.notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = note.text
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteToDelete = NotesController.shared.notes[indexPath.row]
            NotesController.shared.deleteNotes(note: noteToDelete)
            tableView.reloadData()
        }
    }

    var note: Notes?

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        note = NotesController.shared.notes[indexPath.row]
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNoteDetail" {
            guard let destination = segue.destination as? NotesDetailViewController else { return }
            let noteId = note
            destination.note = noteId
        }
    }
}
