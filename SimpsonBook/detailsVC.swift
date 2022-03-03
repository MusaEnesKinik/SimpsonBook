//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by L60809MAC on 23.02.2022.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!    
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedSimpson : Simpson? // tableView da seçilen kişi için değişken oluşturduk ve bunun Simpson objesi olduğunu belirttik
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedSimpson?.name // detailsVC de isim yazan label ı seçilen objenin ismine eşitledik
        jobLabel.text = selectedSimpson?.job // detailsVC de meslek yazan label ı seçilen objenin mesleğine eşitledik
        imageView.image = selectedSimpson?.image // detailsVC de görünece resme seçilen objenin resmini eşitledik
        
    }
    

    
}
