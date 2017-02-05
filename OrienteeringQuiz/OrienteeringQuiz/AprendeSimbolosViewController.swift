//
//  AprendeSimbolosViewController.swift
//  OrienteeringQuiz
//
//  Created by CICE on 28/9/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit
import Parse

class AprendeSimbolosViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    

    
    var simbolosArrayGuay = [simbolosModelo]()
    var tituloNavigationController = ""
    let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
    var antiguoIndice = 1
    var selectedIndexPath : IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
//        //Maquetacion
//        //Estilo background
        
        tableView.backgroundColor = menuColo1        
        tableView.separatorColor = menuColo1
        view.backgroundColor = menuColo1       
//        
//        tableView.register(UINib(nibName: "AprendeSimbolosTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        //Ponemos titulo al VC
        self.title = tituloNavigationController
        
        //Obtener simbolos
        obtenerSimbolos()
    }

}

extension AprendeSimbolosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simbolosArrayGuay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AprendeSimbolosTableViewCell
        
        cell.layer.cornerRadius = 10 //set corner radius here
        cell.layer.borderColor = menuColo1.cgColor  // set cell border color here
        cell.layer.borderWidth = 0.5 // set border width here
        
        let card = simbolosArrayGuay[indexPath.row]
        
        cell.myDescripcionAprendeSimbolos.text = card.descripcionCorta
        
        if let imagenSimbolo = card.imagen {
        imagenSimbolo.getDataInBackground(block: {
            (data: Data?, error: Error?) in
            if error == nil {
                let image = UIImage(data:data!)
                    cell.myImagenAprendeSimbolos.image = image
                }
            })
        }
        cell.selectionStyle = .none
        cell.myDescripcionLargaAprendeSimbolos.text = card.isExpanded ? card.descripcionLarga : ""
        
        return cell
    }
}


extension AprendeSimbolosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1
        guard let cell = tableView.cellForRow(at: indexPath) as? AprendeSimbolosTableViewCell else { return }
        
        let card = simbolosArrayGuay[indexPath.row]
        
//        if(selectedIndexPath?.row == indexPath.row){
//            //selectedIndexPath?.removeFirst()
//            //antiguoIndice = antiguoIndice + 1
//
//        }
        
        if (selectedIndexPath != nil){
            //Cierro card anterior
            let antiguoCard = simbolosArrayGuay[antiguoIndice]
            antiguoCard.isExpanded = !antiguoCard.isExpanded
            tableView.reloadRows(at: [selectedIndexPath!], with: .fade)
            
        }
        
        antiguoIndice = indexPath.row
        selectedIndexPath = indexPath
        
        // 2
        card.isExpanded = !card.isExpanded
        simbolosArrayGuay[indexPath.row] = card
        
        // 3
        cell.myDescripcionLargaAprendeSimbolos.text = card.isExpanded ? card.descripcionLarga : ""
        
        // 4
        tableView.beginUpdates()
        tableView.endUpdates()
        
        // 5
        //tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func obtenerSimbolos(){
        
        var result = true
        
        //Miro el idioma del sistema, si es diferente de español, lo pongo en ingles
        var idioma = Locale.current.languageCode
        if (idioma != "es"){
            idioma = "en"
        }
        
        let querySimbolos = PFQuery(className:"Simbolos")
        querySimbolos.whereKey("idioma", equalTo:idioma)
        querySimbolos.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Se han leido \(objects!.count) simbolos en idioma \(idioma)")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object.objectId!)
                        
                        //Obtenemos el simbolo .png
                        let simbolo = simbolosModelo(pTipo: (object["tipo"] as! String?)!, pImagen: (object["imagen"] as! PFFile?)!, pDescripcionCorta: object["descripcionCorta"] as! String, pDescripcionLarga: object["descripcionLarga"] as! String, pIsExpanded: false)
                        
                        
                        self.simbolosArrayGuay.append(simbolo)
                    }
                    
                }
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!._userInfo)")
            }
            
            //Recargar coleccion
            self.tableView.reloadData()
            
        }
        
    }

    
}






























