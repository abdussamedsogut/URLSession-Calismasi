//
//  ViewController.swift
//  URLSession Calismasi
//
//  Created by Abdüssamed Söğüt on 11.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        kisiEkle()
        
    }


    
    
    func kisiEkle()  {
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_ad=TESTad&kisi_tel=TESTtel"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            
            if error != nil || data == nil {
                print("Hata")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any] {
                    print(json)
                }
            } catch  {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
    
    
    
    
    
    
}

