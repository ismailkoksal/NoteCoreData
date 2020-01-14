//
//  ListNotesViewController.swift
//  NoteCoreData
//
//  Created by Ismail Koksal on 06/01/2020.
//  Copyright © 2020 Ismail Koksal. All rights reserved.
//

import UIKit
import CoreData

class ListNotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewListNotes: UITableView!
    
    var listNotes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        tableViewListNotes.delegate = self
        tableViewListNotes.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCellNotes = tableView.dequeueReusableCell(withIdentifier: "cellNote", for: indexPath) as! TableViewCellNotes
        cell.setNote(note: listNotes[indexPath.row])
        
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteNote(_:)), for: .touchUpInside)
        
        cell.editButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: #selector(editNote(_:)), for: .touchUpInside)
        return cell
    }
    
    func loadNotes() {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        do {
            listNotes = try context.fetch(fetchRequest)
            tableViewListNotes.reloadData()
        } catch {
            print("Empty database notes")
        }
    }
    
    @objc func deleteNote(_ sender: UIButton) {
        print("Note cell index : \(sender.tag)")
        context.delete(listNotes[sender.tag])
        do {
            try context.save()
            print("Note cell index : \(sender.tag) is deleted")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        loadNotes()
    }
    
    @objc func editNote(_ sender: UIButton) {
        performSegue(withIdentifier: "editOrAddSegue", sender: listNotes[sender.tag])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editOrAddSegue" {
            if let addOrEdit = segue.destination as? ViewController {
                if let note = sender as? Note {
                    addOrEdit.editNote = note
                }
            }
        }
    }

    @IBAction func buttonAddNoteAction(_ sender: Any) {
        performSegue(withIdentifier: "editOrAddSegue", sender: nil)
    }
}
