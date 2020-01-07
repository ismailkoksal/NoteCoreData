//
//  ListNotesViewController.swift
//  NoteCoreData
//
//  Created by Ismail Koksal on 06/01/2020.
//  Copyright © 2020 Ismail Koksal. All rights reserved.
//

import UIKit

class ListNotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listNotes = [Note]()

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return cell
    }

}
