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
    var selectedIndexPath : NSIndexPath? = nil
    
    var simbolosArray = []
    var simbolosDiccionario = [:]
    var tituloNavigationController = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "AprendeSimbolosTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        //Maquetacion
        //Estilo background
        
        
        //Ponemos titulo al VC
        self.title = tituloNavigationController
        
        //Recuperamos de .plist
        let path = NSBundle.mainBundle().pathForResource("SimbolosDescripcion", ofType: "plist")
        simbolosArray = NSArray(contentsOfFile: path!)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return simbolosArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AprendeSimbolosTableViewCell
        cell.clipsToBounds = true
        
        //Pinto la imagen correspondiente
        print(indexPath)
        simbolosDiccionario = simbolosArray.objectAtIndex(indexPath.row) as! NSDictionary
        let imagen = simbolosDiccionario["Imagen"] as! String
        let imagenData = UIImage(named: imagen)
        let descripcion = simbolosDiccionario["Descripcion"] as! String
        let descripcionLarga = simbolosDiccionario["DescripcionLarga"] as! String
        
        cell.myImagenAprendeSimbolos.image = imagenData
        cell.myDescripcionAprendeSimbolos.text = descripcion
        cell.myDescripcionLargaAprendeSimbolos.text = descripcionLarga
        
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let index = indexPath
        
        if selectedIndexPath != nil && index == selectedIndexPath{
            return 185
        }else{
            return 65
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        switch selectedIndexPath {
//        case nil:
//            selectedIndexPath = indexPath
//        default:
//            if selectedIndexPath! == indexPath{
//                selectedIndexPath = nil
//            }else{
//                selectedIndexPath = indexPath
//            }
//        }
        
        switch selectedIndexPath {
        case indexPath?:
            selectedIndexPath = nil
        default:
            selectedIndexPath = indexPath
        }
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        
    }

}





























