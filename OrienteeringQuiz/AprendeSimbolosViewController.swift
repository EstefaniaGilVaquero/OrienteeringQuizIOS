//
//  AprendeSimbolosViewController.swift
//  OrienteeringQuiz
//
//  Created by CICE on 28/9/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class AprendeSimbolosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var selectedIndexPath : IndexPath? = nil
    
    var simbolosArray : NSArray = []
    var simbolosDiccionario : NSDictionary = [:]
    var tituloNavigationController = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Maquetacion
        //Estilo background
        let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
        tableView.backgroundColor = menuColo1
        tableView.separatorColor = menuColo1
        view.backgroundColor = menuColo1
        
        
        
        
        
        tableView.register(UINib(nibName: "AprendeSimbolosTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        //Ponemos titulo al VC
        self.title = tituloNavigationController
        
        //Recuperamos de .plist
        let path = Bundle.main.path(forResource: "SimbolosDescripcion", ofType: "plist")
        simbolosArray = NSArray(contentsOfFile: path!)! as NSArray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return simbolosArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AprendeSimbolosTableViewCell
        cell.clipsToBounds = true
        
        //Pinto la imagen correspondiente
        print(indexPath)
        simbolosDiccionario = (simbolosArray.object(at: indexPath.row) as! NSDictionary)
        let imagen = simbolosDiccionario["Imagen"] as! String
        let imagenData = UIImage(named: imagen)
        let descripcion = simbolosDiccionario["Descripcion"] as! String
        let descripcionLarga = simbolosDiccionario["DescripcionLarga"] as! String
        
        cell.myImagenAprendeSimbolos.image = imagenData
        cell.myDescripcionAprendeSimbolos.text = descripcion
        cell.myDescripcionLargaAprendeSimbolos.text = descripcionLarga
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let index = indexPath
        
        if selectedIndexPath != nil && index == selectedIndexPath{
            return 195
        }else{
            return 65
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch selectedIndexPath {
        case indexPath?:
            selectedIndexPath = nil
        default:
            selectedIndexPath = indexPath
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        
    }

}





























