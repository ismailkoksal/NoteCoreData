//
//  ViewController.swift
//  NoteCoreData
//
//  Created by Ismail Koksal on 06/01/2020.
//  Copyright © 2020 Ismail Koksal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textNoteTitle: UITextField!
    @IBOutlet weak var textNoteDesc: UITextView!
    var editNote: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let note = editNote {
            textNoteTitle.text = note.title
            textNoteDesc.text = note.desc
        }
    }
    
    @IBAction func actionNoteSave(_ sender: Any) {
        var newNote: Note?
        
        if let note = editNote {
            newNote = note
        } else {
            newNote = Note(context: context)
        }
        
        newNote?.title = textNoteTitle.text
        newNote?.desc = textNoteDesc.text
        newNote?.date_creation = NSDate() as Date
        
        ad.saveContext()
        textNoteTitle.text = ""
        textNoteDesc.text = ""
    }
    
    @IBAction func buttonActionBackToListNotes(_ sender: Any) {
        let listNotesViewController = presentingViewController as? ListNotesViewController
        dismiss(animated: true, completion: {listNotesViewController?.loadNotes()})
    }
}
