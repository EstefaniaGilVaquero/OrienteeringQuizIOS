//
//  SYBViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 21/8/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYBViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var myDescriptionLBL: UILabel!
    //Creo un diccionario con las imagenes y otro con las descripciones

    let symbolsDictionary: [Int: UIImage] = [1: UIImage(named: "simbolo1")!,
                                             2 : UIImage(named: "simbolo2")!,
                                             3 : UIImage(named: "simbolo3")!,
                                             4 : UIImage(named: "simbolo4")!,
                                             5 : UIImage(named: "simbolo5")!]
    
    let descriptionsDictionary: [Int: String] = [1: "Cantera.",
                                                 2 : "Surco erosión",
                                                 3 : "Terraza.",
                                                 4 : "Espolón",
                                                 5 : "Muro de tierra."]
    
    var randomArray = Set<Int>()
    
    let numeroImagenes = 4
    let delay = 0.5 // time in seconds
    let prueba = ""

                        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //Se carga una descripcion aleatoria
        //El problea es que aqui aun no se que imagenes aleatorias se han cargado, por tanto no puedo seleccionar una descripcion
        //de esas imagenes
        
        self.myDescriptionLBL.text = descriptionsDictionary[RandomInt(min: 1, max: descriptionsDictionary.count)]

        
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.symbolsArray.count
        return numeroImagenes
    }
    

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
         let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SYBCollectionViewCell
        
        //cell.myImageView?.image = self.symbolsArray[indexPath.row]
        
        //calculo un indice aleatorio
        var random = 0
        
        
        repeat {
            random = RandomInt(min: 1, max: self.symbolsDictionary.count)
        } while randomArray.contains(random)
        
        randomArray.insert(random)
        
        cell.myImageView.image = self.symbolsDictionary[random]
        
 
 
        
        return cell
        
    }
    
    func RandomInt(min min: Int, max: Int) -> Int {
        if max < min { return min }

        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
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
