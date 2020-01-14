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

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
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
        loadNotes()
    }

}
