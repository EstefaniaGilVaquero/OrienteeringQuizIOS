//
//  SYBQuizsViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 21/8/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit


class SYBQuizsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  //  @available(iOS 6.0, *)



    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var myDescriptionLBL: UILabel!
    @IBOutlet weak var myView: UIView!
    
    //MARK: VARIABLES LOCALES GLOBALES
   // var simbolosObjeto = PFObject(className:"Simbolos")
    var simbolosArrayGuay = [simbolosModelo]()
    
//    var foundation = [baseMakeUp]()
//    
//    Creates an empty array of baseMakeUp called foundation. You can't use subscripting to add elements to an array, you can only use it to change existing elements. Since your array is empty you add elements with append.
//    
//    foundation.append(baseMakeUp(Brand: "Brand", Color: "Color"))
    
    
    
    
    //--------

    //var simbolosArray : NSArray = []
    
    //var simbolosDiccionario : NSDictionary = [:]
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
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellReusable", for: indexPath as IndexPath) as! SYBCollectionViewCell
        
        
        //Pinto la imagen correspondiente
        
        
        if let imagenSimbolo = simbolosArrayGuay[randomArray[indexPath.row]].imagen {
            imagenSimbolo.getDataInBackground(block: {
                (data: Data?, error: Error?) in
                if error == nil {
                    let image = UIImage(data:data!)
                    cell.myImagenSimbolo.image = image
                }
            })
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        //Cuando seleccionen una imagen mostramos check OK/KO
        var imageView : UIImageView

        
        imageView  = UIImageView(frame:CGRect(x: self.view.frame.size.width / 2.0, y: self.view.frame.size.height / 2.0, width: 100, height: 100));
        
        
//        //delay
//        let seconds = 1.0
//        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
//        //let dispatchTime = dispatch_time(dispatch_time(DispatchTime.now()), Int64(delay))
//        let dispatchTime = DispatchTime.now(dispatch_time_t(DispatchTime.now()), Int64(delay))


        
        if (respuesta == randomArray[indexPath.row]){
            
            imageView.image = UIImage(named:"checkOK.png")

            
            delayWithSeconds(1) {
            
                //Creamos un array de numeros aleatorios
                self.generarAleatorios()
                
                //Genero una descripcion para mostrar
                self.generarDescripcion()
                
                self.collectionView?.reloadData()
                
            }
        
        }else{
            imageView.image = UIImage(named:"checkKO.png")
        }
        
        self.view.addSubview(imageView)
        
        //escondemos el check despues de un rato
        delayWithSeconds(1) {
            imageView.isHidden = true
        }
        
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
                random = RandomInt(min: 0, max: simbolosArrayGuay.count-1)
            }while randomArray.contains(random)
            randomArray.insert(random, at: indice)
            
        }

    }
    
    func generarDescripcion(){
        respuesta = randomArray[RandomInt(min: 0, max: randomArray.count-1)]
        //Asigno la descripccion al label
        
//        simbolosDiccionario = simbolosArray.object(at: respuesta) as! NSDictionary
//        let descripcion = simbolosDiccionario["Descripcion"] as! String
        myDescriptionLBL.text = simbolosArrayGuay[respuesta].descripcionCorta
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    
}

