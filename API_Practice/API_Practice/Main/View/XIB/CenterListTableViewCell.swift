//
//  CenterListTableViewCell.swift
//  API_Practice
//
//  Created by 다훈김 on 2021/09/01.
//

import UIKit

class CenterListTableViewCell: UITableViewCell {
    @IBOutlet weak var centerName: UILabel!
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lng: UILabel!
    var vo:CenterListItemVO?
    var clickedDetail:((CenterListItemVO)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reset() {
        vo = nil
        centerName.text = ""
        adress.text = ""
        lat.text = ""
        lng.text = ""
    }
    
    func setData(vo:CenterListItemVO?) {
        reset()
        
        self.vo = vo
        if let _ = vo?.vo {} else {
            centerName.text = vo?.centerName
            adress.text = vo?.adress
            lat.text = vo?.lat
            lng.text = vo?.lng
        }
    }
    
    
}
