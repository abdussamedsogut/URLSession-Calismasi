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
        
        // kisiEkle()
       // kisiSil()
        kisiGuncelle()
    }

    func kisiSil()  {
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_id=119"
        
        request.httpBody = postString.data(using: .utf8)
        // ust satirin ilk amaci postString olarak tanimlanan veriyi 'request'le tanimlanan web servise gondermek
        // ikinci amaci gonderilen verinin turkce uyumlu hale gelmesini saglamak

        
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
    
    func kisiGuncelle() {
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_id=14528&kisi_ad=TESTad&=&kisi_tel=TESTtelx"
        
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

