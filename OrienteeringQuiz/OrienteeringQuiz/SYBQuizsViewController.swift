//
//  SYBQuizsViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 21/8/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit
import Parse


class SYBQuizsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  //  @available(iOS 6.0, *)



    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var myDescriptionLBL: UILabel!
    @IBOutlet weak var descripcionView: UIView!
    @IBOutlet weak var puntuacionView: UIView!

    
    //Labels de puntuacion
    @IBOutlet weak var myAciertosTitulo: UILabel!
    @IBOutlet weak var myRondaTitulo: UILabel!
    @IBOutlet weak var myPuntuacionTitulo: UILabel!
    @IBOutlet weak var myAciertos: UILabel!
    @IBOutlet weak var myRonda: UILabel!
    @IBOutlet weak var myPuntuacion: UILabel!
    
    //MARK: VARIABLES LOCALES GLOBALES
   // var simbolosObjeto = PFObject(className:"Simbolos")
    var simbolosArrayGuay = [simbolosModelo]()
    
    var respuesta = 0
    var randomArray : [Int] = []
    var numeroImagenes = 0
    var tituloNavigationController = ""
    var nombrePlist = ""
    
    //variables para quizMix
    var contadorRondas = 1
    var contadorAciertos = 0
    var aciertosPorRonda = 2
    var contadorPuntos = 0
    var numeroImagenesInicial = 0
    var isQuizMix = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Maquetacion
        //Estilo background
        let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
        //let menuColo1 = UIColor(red: 1, green: 0.588, blue: 0.0, alpha: 1)

        view.backgroundColor = menuColo1
        collectionView.backgroundColor = menuColo1
        descripcionView.backgroundColor = UIColor.white
        descripcionView.layer.masksToBounds = true
        descripcionView.layer.cornerRadius = 10
        
        puntuacionView.backgroundColor = UIColor.white
        puntuacionView.layer.masksToBounds = true
        puntuacionView.layer.cornerRadius = 10
        
        //myDescriptionLBL.layer.masksToBounds = true
        //myDescriptionLBL.layer.cornerRadius = 10
        
        actualizarPuntuacion(contadorAciertos: contadorAciertos, contadorRondas: contadorRondas, contadorPuntos: contadorPuntos)
        
        //Ponemos titulo al VC
        self.title = tituloNavigationController
        
        //Si es quizMix seteamos variable a true
        if (tituloNavigationController == "Quiz Mix"){
            isQuizMix = true
            
            //Guardo numeroImagenesInicial
            numeroImagenesInicial = numeroImagenes
        }
        
        //Creamos un array de numeros aleatorios
        generarAleatorios()
        
        //Genero una descripcion para mostrar
        generarDescripcion()
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
        
        
        
        if (respuesta == randomArray[indexPath.row]){
            
            imageView.image = UIImage(named:"checkOK.png")
            
            //Si es quizMix
            if (isQuizMix){
                contadorAciertos = contadorAciertos + 1
                contadorPuntos = contadorPuntos + contadorRondas
                
                if(contadorAciertos == aciertosPorRonda){
                    contadorAciertos = 0
                    contadorRondas = contadorRondas + 1
                    numeroImagenes = numeroImagenes + 1
                }
            }
            
            actualizarPuntuacion(contadorAciertos: contadorAciertos, contadorRondas: contadorRondas, contadorPuntos: contadorPuntos)
            
            delayWithSeconds(1) {
                self.recargarColeccion()
            }
        }else{
            //Falla la respuesta
            //Si es quizMix alert volver a jugar
            if (isQuizMix){
               let refreshAlert = UIAlertController(title: "¡Fallaste!", message: "Tu puntuacion es \(contadorPuntos)", preferredStyle: UIAlertControllerStyle.alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    self.recargarColeccion()
                }))
                
                present(refreshAlert, animated: true, completion: nil)
                
                //Guardo clasificacion en parse
                guardarPuntuacion(contadorPuntos: contadorPuntos)
                
                //Reseteo contadores
                contadorPuntos = 0
                contadorRondas = 1
                contadorAciertos = 0
                numeroImagenes = numeroImagenesInicial
                
                //Limpio label puntuacion
                actualizarPuntuacion(contadorAciertos: contadorAciertos, contadorRondas: contadorRondas, contadorPuntos: contadorPuntos)
            
                
            }else{
                imageView.image = UIImage(named:"checkKO.png")
            }
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
        
        //Si el numero de imagenes a cargar es mayor que los simbolos que tenemos
        if(numeroImagenes > simbolosArrayGuay.count){
            numeroImagenes = simbolosArrayGuay.count
        }
        
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
        myDescriptionLBL.text = simbolosArrayGuay[respuesta].descripcionCorta
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    func actualizarPuntuacion(contadorAciertos: Int, contadorRondas: Int, contadorPuntos: Int){
        myAciertos.text = "\(contadorAciertos)"
        myRonda.text = "\(contadorRondas)"
        myPuntuacion.text = "\(contadorPuntos)"
    }
    
    func recargarColeccion() {
        //Creamos un array de numeros aleatorios
        self.generarAleatorios()
        
        //Genero una descripcion para mostrar
        self.generarDescripcion()
        
        self.collectionView?.reloadData()
    }

    func guardarPuntuacion(contadorPuntos : Int){
        
        //Usuario actual
        let currentUser = PFUser.current()
        
        let query = PFQuery(className: "Clasificacion")
        query.whereKey("nombreUsuario", equalTo: currentUser?.username)
        query.getFirstObjectInBackground {
            (object: PFObject?, error: Error?) -> Void in
            if error != nil || object == nil {
                print("El usuario no esta en la clasificacion aun")
                //Guardo la puntuacion
                let clasificacion = PFObject(className:"Clasificacion")
                clasificacion["puntuacion"] = contadorPuntos
                clasificacion["nombreUsuario"] = currentUser?.username
                clasificacion["club"] = currentUser?["club"]
                clasificacion.saveEventually()
            } else {
                let puntuacionOld = object?["puntuacion"] as! Int
                if (puntuacionOld < contadorPuntos){
                    //Actualizo la puntuacion del usuario
                    print("Actualizo puntuacion del usuario")
                    
                    let objectId = (object?.objectId)! as String
                    
                    let query = PFQuery(className:"Clasificacion")
                    query.getObjectInBackground(withId: objectId){
                        (clasificacion: PFObject?, error: Error?) -> Void in
                        if error != nil {
                            print(error)
                        } else if let clasificacion = clasificacion {
                            clasificacion["puntuacion"] = contadorPuntos
                            clasificacion.saveEventually()
                        }
                    }
                }else{
                    print("La puntuacion de parse es mayor")
                }
            }
        }
    }
}

