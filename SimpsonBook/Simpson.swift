//
//  Simpson.swift
//  SimpsonBook
//
//  Created by L60809MAC on 23.02.2022.
//

import Foundation
import UIKit

class Simpson { // Simpson adında bir sınıf oluşturduk
    
    // Properties
    var name : String
    var job : String
    var image : UIImage
    
    // Simpson sınıfından oluşturulan her objede init methodu çağırılacak ve isim meslek görsel isteyecek, onlar verilince de properti  ler verilen değerlere eşitlenecek
    
    init(simpsonName: String, simpsonJob: String, simpsonImage: UIImage) {
        
        name = simpsonName
        job = simpsonJob
        image = simpsonImage
        
    }
    
}
