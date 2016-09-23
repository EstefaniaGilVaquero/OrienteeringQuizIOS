//
//  SYBMenuViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 21/9/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYBMenuViewController: UIViewController {
    
    //let menuColo1 = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
    let menuColo1 = UIColor(red: 0.957, green: 0.431, blue: 0.165, alpha: 0.8)
    let menuColo2 = UIColor(red: 1, green: 0.533, blue: 0.298, alpha: 0.8)
    let menuColo3 = UIColor(red: 1, green: 0.494, blue: 0.239, alpha: 0.8)
    let menuColo4 = UIColor(red: 0.906, green: 0.353, blue: 0.075, alpha: 0.8)
    let menuColo5 = UIColor(red: 0.761, green: 0.306, blue: 0.075, alpha: 0.8)
    
    
//    shade 0 = #F46E2A = rgb(244,110, 42) = rgba(244,110, 42,1) = rgb0(0.957,0.431,0.165)
//    shade 1 = #FF884C = rgb(255,136, 76) = rgba(255,136, 76,1) = rgb0(1,0.533,0.298)
//    shade 2 = #FF7E3D = rgb(255,126, 61) = rgba(255,126, 61,1) = rgb0(1,0.494,0.239)
//    shade 3 = #E75A13 = rgb(231, 90, 19) = rgba(231, 90, 19,1) = rgb0(0.906,0.353,0.075)
//    shade 4 = #C24E13 = rgb(194, 78, 19) = rgba(194, 78, 19,1) = rgb0(0.761,0.306,0.075)


    @IBOutlet weak var buttonRegistro: UIButton!
    @IBOutlet weak var buttonSymbolosMapa: UIButton!
    @IBOutlet weak var buttonSymbolosDescripcion: UIButton!
    @IBOutlet weak var buttonRanking: UIButton!
    @IBOutlet weak var buttonListado: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonRegistro.backgroundColor = menuColo1
        buttonSymbolosMapa.backgroundColor = menuColo4
        buttonSymbolosMapa.imageView?.image = UIImage(named: "simbolosMapa.png")
        buttonSymbolosDescripcion.backgroundColor = menuColo3
        buttonRanking.backgroundColor = menuColo2
        buttonListado.backgroundColor = menuColo5
        

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
