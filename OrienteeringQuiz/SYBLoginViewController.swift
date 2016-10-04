//
//  SYBLoginViewController.swift
//  OrienteeringQuiz
//
//  Created by CICE on 4/10/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYBLoginViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myUsernameTF: UITextField!
    @IBOutlet weak var myPasswordTF: UITextField!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myAccederBTN: UIButton!
    
    //MARK: - IBACTION

    @IBAction func acceder(sender: AnyObject) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
        myAccederBTN.backgroundColor = menuColo1
        myActivityIndicator.color = menuColo1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


