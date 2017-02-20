//
//  LoginViewController.swift
//  InstantGram
//
//  Created by Naveen Kashyap on 2/19/17.
//  Copyright © 2017 Naveen Kashyap. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameTextField.text = ""
        passwordTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("You're logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }

    @IBAction func onSignUp(_ sender: Any) {
        
        print("Attempting to make a new user")
        
        let newUser = PFUser()
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        newUser.signUpInBackground { (wasSuccessful: Bool, error: Error?) in
            if wasSuccessful {
                print("user created")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                if error?._code == 202 {
                    print("Ah, shucks! Someone already has that username")
                } else if error?._code == 200 {
                    print("What? You didn't even enter a username")
                } else if error?._code == 201 {
                    print("Okay you didn't even enter a password. That's not safe")
                } else {
                    print(error?.localizedDescription ?? "Ya done fucked up")
                }
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
