//
//  SYBMenuViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 21/9/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYBMenuViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 2;
        button.layer.borderWidth = 1;
        button.layer.borderColor = UIColor.blackColor().CGColor
        
        button2.layer.cornerRadius = 2;
        button2.layer.borderWidth = 1;
        button2.layer.borderColor = UIColor.blackColor().CGColor
        
        button3.layer.cornerRadius = 2;
        button3.layer.borderWidth = 1;
        button3.layer.borderColor = UIColor.blackColor().CGColor
        
        button4.layer.cornerRadius = 2;
        button4.layer.borderWidth = 1;
        button4.layer.borderColor = UIColor.blackColor().CGColor
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
