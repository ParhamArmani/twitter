//
//  onLoginViewController.swift
//  Twitter
//
//  Created by Parham Armani on 4/29/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class onLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn")==true {
           self.performSegue(withIdentifier: "LoginToHome", sender: self)
            print("Performed Segue Automatically")
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myURL = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myURL, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            print("set \"userLoggedIn\" to true ")

            self.performSegue(withIdentifier: "LoginToHome", sender: self)
            print("Performed Segue Manually")
        }, failure: { (Error) in
            print("Could Not login")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
