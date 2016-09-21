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
    
    var randomArray : [Int] = []
    var contadorImagenesPintadas = 0
    
    let numeroImagenes = 4
    let delay = 0.5 // time in seconds
    let prueba = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //Creamos un array de numeros aleatorios
        var random = 0
        
        for indice in 0..<numeroImagenes{
            repeat {
                random = RandomInt(min: 1, max: self.symbolsDictionary.count)
            }while randomArray.contains(random)
            randomArray.insert(random, atIndex: indice)
            
        }
        
        
    //Elijo una de las imagenes aleatorias para pillar su descripcion
        let respuesta = randomArray[RandomInt(min: 0, max: randomArray.count-1)]
        //Asigno la descripccion al label
        self.myDescriptionLBL.text = descriptionsDictionary[respuesta]
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
        
        
        //Pinto la imagen correspondiente
        
        cell.myImageView.image = self.symbolsDictionary[randomArray[contadorImagenesPintadas]]
        //Aumento contador de imagenes pintadas
        contadorImagenesPintadas = contadorImagenesPintadas + 1
        
        return cell
        
    }
    
    func RandomInt(min min: Int, max: Int) -> Int {
        if max < min { return min }

        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }

}
