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
    
    //MARK: VARIABLES LOCALES GLOBALES

    var simbolosArray = []
    var simbolosArraySeleccion = [[:]]
    var simbolosDiccionario = [:]
    var respuesta = 0

    
    
    var randomArray : [Int] = []

    
    let numeroImagenes = 4

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Recuperamos de SymbolosMapa.plist
        let path = NSBundle.mainBundle().pathForResource("SymbolosMapa", ofType: "plist")
        simbolosArray = NSArray(contentsOfFile: path!)!

        //Creamos un array de numeros aleatorios
        var random = 0
        
        for indice in 0..<numeroImagenes{
            repeat {
                random = RandomInt(min: 0, max: simbolosArray.count-1)
            }while randomArray.contains(random)
            randomArray.insert(random, atIndex: indice)
            
        }
        
        //Elijo una de las imagenes aleatorias para pillar su descripcion
        respuesta = randomArray[RandomInt(min: 0, max: randomArray.count-1)]
        //Asigno la descripccion al label
        
        simbolosDiccionario = simbolosArray.objectAtIndex(respuesta) as! NSDictionary
        let descripcion = simbolosDiccionario["Descripcion"] as! String
        myDescriptionLBL.text = descripcion
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
        
        
        simbolosDiccionario = simbolosArray.objectAtIndex(randomArray[indexPath.row]) as! NSDictionary
        let imagen = simbolosDiccionario["Imagen"] as! String
        let imagenSimbolo = UIImage(named: imagen)
        
        cell.myImagenSimbolo.image = imagenSimbolo
        

        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       
        //Cuando seleccionen una imagen mostramos check OK/KO
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRectMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0, 100, 100));
        
        if (respuesta == randomArray[indexPath.row]){
            imageView.image = UIImage(named:"checkOK.png")
            
        
        }else{
            imageView.image = UIImage(named:"checkKO.png")
        }
        
        self.view.addSubview(imageView)
        
        
        
    }
    
    func RandomInt(min min: Int, max: Int) -> Int {
        if max < min { return min }

        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }

}
