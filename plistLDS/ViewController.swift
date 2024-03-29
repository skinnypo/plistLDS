//
//  ViewController.swift
//  plistLDS
//
//  Created by I Putu Krisna on 28/06/19.
//  Copyright © 2019 I Putu Krisna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginButton(_ sender: UIButton) {
        //Read data from Info.plist
        var path = documentFilePath(fileName: "Data.plist")
        var dict : NSDictionary? = NSDictionary(contentsOfFile: path)
        print(dict)
        // Load gamedata template from mainBundle if no saveFile exists
        if dict == nil {
            let mainBundle = Bundle.main
            path = mainBundle.path(forResource: "Info", ofType: "plist")!
            dict = NSDictionary(contentsOfFile: path)

        }
        
        let username = dict?.object(forKey: "username") as! String
        let password = dict?.object(forKey: "password") as! String
        
        if usernameTF.text == username && passwordTF.text == password {
            performSegue(withIdentifier: "successLogin", sender: self)
            
        }
        
    }
    
    func documentFilePath(fileName: String) -> String {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        return fileURL.path
    }
    
}
