//
//  SYBLoginViewController.swift
//  OrienteeringQuiz
//
//  Created by CICE on 4/10/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit
import Parse

class SYBLoginViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myUsernameTF: UITextField!
    @IBOutlet weak var myPasswordTF: UITextField!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myAccederBTN: UIButton!
    @IBOutlet weak var myRegistroBTN: UIButton!
    
    //MARK: - IBACTION
    @IBAction func realizaLoginInParse(_ sender: Any) {
        if myUsernameTF.text == "" || myPasswordTF.text == ""{
            showAlertVCFinal("¡Atención!", "No has rellenado todos los campos.")
        }else{
            myActivityIndicator.isHidden = false
            myActivityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            PFUser.logInWithUsername(inBackground: myUsernameTF.text!, password:myPasswordTF.text!) {
                (user: PFUser?, error: Error?) -> Void in
                
                self.myActivityIndicator.isHidden = true
                self.myActivityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                if let error = error {
                    if let errorString = (error as NSError).userInfo["error"] as? String {
                        NSLog(errorString);
                        self.showAlertVCFinal("ATENCION", errorString as String)
                    }else{
                        self.showAlertVCFinal("ATENCION", "Existe un error en el login")
                    }
                } else {
                    // Hooray! Let them use the app now.
                    NSLog("Logged in!");
                    self.performSegue(withIdentifier: "saltarTabBarControllerFromLogin", sender: self)
                }
            }
            
            
        }

    }
    
//    //TODO: - LOGIN CON FACEBOOK
//    @IBAction func loginConFacebook(sender: AnyObject) {
//        let permissions = ["public_profile"]
//        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) {
//            (user: PFUser?, error: NSError?) -> Void in
//            if let user = user {
//                if user.isNew {
//                    print("User signed up and logged in through Facebook!")
//                    self.performSegueWithIdentifier("saltarTabBarControllerFromLogin", sender: self)
//                } else {
//                    print("User logged in through Facebook!")
//                }
//            } else {
//                print("Uh oh. The user cancelled the Facebook login.")
//            }
//        }
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myRegistroBTN.layer.cornerRadius = 20
        myAccederBTN.layer.cornerRadius = 20
        
        myActivityIndicator.isHidden = true
        let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
        myAccederBTN.backgroundColor = menuColo1
        myActivityIndicator.color = menuColo1
        myRegistroBTN.backgroundColor = menuColo1

    }
    
    //Si el usuario ya esta registrado pasamos al menu
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if PFUser.current() != nil{
            self.performSegue(withIdentifier: "saltarTabBarControllerFromLogin", sender: self)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - ALERTVC
    func showAlertVCFinal(_ tituloData : String, _ mensajeData : String ){
        let alertVC = UIAlertController(title: tituloData, message: mensajeData, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

}


