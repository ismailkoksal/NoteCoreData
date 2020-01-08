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
    
    @IBAction func actionNoteSave(_ sender: Any) {
        let newNote = Note(context: context)
        newNote.title = textNoteTitle.text
        newNote.desc = textNoteDesc.text
        newNote.date_creation = NSDate() as Date
        
        ad.saveContext()
        textNoteTitle.text = ""
        textNoteDesc.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

