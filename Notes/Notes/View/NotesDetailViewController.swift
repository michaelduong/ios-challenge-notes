//
//  NotesDetailViewController.swift
//  Notes
//
//  Created by Michael Duong on 1/19/18.
//  Copyright © 2018 Turnt Labs. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {
    
    var note: Notes?

    @IBOutlet weak var noteText: UITextField!
    
    @IBAction func addNote(_ sender: UIBarButtonItem) {
        guard let noteText = noteText.text, !noteText.isEmpty else { return }
        
        if let note = self.note {
            NotesController.shared.updateNotes(text: noteText, note: note)
        } else {
            NotesController.shared.createNotes(text: noteText)
        }
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        noteText.becomeFirstResponder()
        updateViews()
    }

    func updateViews() {
        guard let note = note else { return }
        noteText.text = note.text
    }
}
