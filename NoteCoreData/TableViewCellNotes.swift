//
//  TableViewCellNotes.swift
//  NoteCoreData
//
//  Created by Ismail Koksal on 07/01/2020.
//  Copyright © 2020 Ismail Koksal. All rights reserved.
//

import UIKit

class TableViewCellNotes: UITableViewCell {

    @IBOutlet weak var showTitle: UILabel!
    @IBOutlet weak var showDesc: UITextView!
    @IBOutlet weak var showDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNote(note: Note) {
        showTitle.text = note.title
        showDesc.text = note.desc
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        showDate.text = dateFormatter.string(from: note.date_creation!)
    }
}
