//
//  ViewController.swift
//  SimpsonBook
//
//  Created by L60809MAC on 23.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]() // mySimsons adında değişken oluşturduk ve içine Simpson objelerini koyduk
    var chosenSimpson : Simpson? // chosenSimpson (seçilenSimpson) değişkenini Simpson opsiyonel olarak tanımladık
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self // tableView ın verileri viewControllerdan alacağını belirttik
        tableView.delegate = self // tableView ın delege sinin viewController olduğunu belirttik
        
        // Simpson Objeleri
        
     /* let homer = Simpson()
        homer.name = "Homer"
        homer.job = "Nucleer Safety"
        homer.image = UIImage(named: "Homer")! // Çıkan hatayı kaldırmak için sonuna ! koyduk (Homer adında görsel olduğundan eminim anlamında) */
        
        // Simson objelerini oluşturuyoruz
        
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nucleer Safety", simpsonImage: UIImage(named: "Homer")!)
        
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "Housewife", simpsonImage: UIImage(named: "Marge")!)
        
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Studend", simpsonImage: UIImage(named: "Bart")!)
        
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "Lisa")!)
        
        let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", simpsonImage: UIImage(named: "Maggie")!)
        
        // oluşturduğumuz objeleri diziye (mySimpsons) a aktardık
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
        navigationItem.title = "Simpson Ailesi" // navigation bar a başlık koyduk, uygulama açıldığında en üstte bu başlık görünecek
        
    }

    // Kaç tane satır olacak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count // mySimsons dizisinde kaç tane obje varsa o kadar satır (row) olacak
    }
    
    // Nasıl bir satır olacak
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()  // TableView içerisinde kullanmak için hücre oluşturuyoruz
        cell.textLabel?.text = mySimpsons[indexPath.row].name // cell içerisinde textLabel ı değiştirdik, her satırda ilgili index gösterilecek (tableView da Simpsonların adı görünecek)
        return cell // cell i döderrdik
    }

    // tableView da obje seçilince detailsVC ye geçmesini istiyoruz
    // Bu fonksiyonun içine bir obje seçildiğinde ne olacağını yazıyoruz
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row] // tableView da hangi objeye tıklandıysa onu veriyor
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil) // viewController dan detailsVC a gidiyor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // segue ye hazırlan demek
        if segue.identifier == "toDetailsVC" { // Eğer gerçekten toDetailVC segue sine tıklandıysa
            let destinationVC = segue.destination as! detailsVC // destinationVC (gidilecek olan viewController). chosenSimpson değişkenini self.performSegue yapmadan önce tanımladığım destinationVC değişkenini detailsVC de ki selectedSimpson değişkenine eşitle
            destinationVC.selectedSimpson = chosenSimpson // gidilecek olan viewController ın yani detailsVC de ki selectedSimpson u viewController da (tabelView) da seçillen objeye (chosenSimpson) a eşitliyoruz
        }
    }
    
}

