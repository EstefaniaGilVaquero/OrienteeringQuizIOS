//
//  SYBQuizsViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 21/8/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class SYBQuizsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var myDescriptionLBL: UILabel!
    @IBOutlet weak var myView: UIView!
    
    //MARK: VARIABLES LOCALES GLOBALES

    var simbolosArray : NSArray = []
   // var simbolosArraySeleccion = [[:]]
    var simbolosDiccionario : NSDictionary = [:]
    var respuesta = 0
    var randomArray : [Int] = []
    var numeroImagenes = 0
    var tituloNavigationController = ""
    var nombrePlist = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Maquetacion
        //Estilo background
        let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)

        view.backgroundColor = menuColo1
        collectionView.backgroundColor = menuColo1
        myView.backgroundColor = menuColo1
        myView.layer.masksToBounds = true
        myView.layer.cornerRadius = 10
        myDescriptionLBL.layer.masksToBounds = true
        myDescriptionLBL.layer.cornerRadius = 10
        
        //Ponemos titulo al VC
        self.title = tituloNavigationController
        
        //Recuperamos de .plist
        let path = Bundle.main.path(forResource: nombrePlist, ofType: "plist")
        simbolosArray = NSArray(contentsOfFile: path!)!

        //Creamos un array de numeros aleatorios
        generarAleatorios()
        
        //Genero una descripcion para mostrar
        generarDescripcion()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.symbolsArray.count
        return numeroImagenes
    }
    

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellReusable", for: indexPath as IndexPath) as! SYBCollectionViewCell
        
        
        //Pinto la imagen correspondiente
        
        
        simbolosDiccionario = simbolosArray.object(at: randomArray[indexPath.row]) as! NSDictionary
        let imagen = simbolosDiccionario["Imagen"] as! String
        let imagenSimbolo = UIImage(named: imagen)
        
        cell.myImagenSimbolo.image = imagenSimbolo
        

        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       
        //Cuando seleccionen una imagen mostramos check OK/KO
        var imageView : UIImageView

        
        imageView  = UIImageView(frame:CGRectMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0, 100, 100));
        
        //delay
        let seconds = 1.0
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        //let dispatchTime = dispatch_time(dispatch_time(DispatchTime.now()), Int64(delay))
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))


        
        if (respuesta == randomArray[indexPath.row]){
            
            imageView.image = UIImage(named:"checkOK.png")

            
            //numeroImagenes = numeroImagenes + 1
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                
                //Creamos un array de numeros aleatorios
                self.generarAleatorios()
                
                //Genero una descripcion para mostrar
                self.generarDescripcion()
                
                self.collectionView?.reloadData()
                
            })
            
            
            
        
        }else{
            imageView.image = UIImage(named:"checkKO.png")
        }
        
        self.view.addSubview(imageView)
        
        //escondemos el check despues de un rato
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            
            imageView.hidden = true
            
        })
        
        
        
    }
    


    func RandomInt(min: Int, max: Int) -> Int {
        if max < min { return min }

        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    func generarAleatorios(){
        //Creamos un array de numeros aleatorios
        var random = 0
        randomArray.removeAll()
        
        for indice in 0..<numeroImagenes{
            repeat {
                random = RandomInt(min: 0, max: simbolosArray.count-1)
            }while randomArray.contains(random)
            randomArray.insert(random, at: indice)
            
        }

    }
    
    func generarDescripcion(){
        respuesta = randomArray[RandomInt(min: 0, max: randomArray.count-1)]
        //Asigno la descripccion al label
        
        simbolosDiccionario = simbolosArray.object(at: respuesta) as! NSDictionary
        let descripcion = simbolosDiccionario["Descripcion"] as! String
        myDescriptionLBL.text = descripcion
    }
    
   

}
