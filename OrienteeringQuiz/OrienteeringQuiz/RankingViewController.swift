//
//  RankingTableViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 28/1/17.
//  Copyright © 2017 Symbel. All rights reserved.
//

import UIKit
import Parse

class RankingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tituloNavigationController = ""
    var clasificacionArraySingle = [clasificacionModelo]()
    var clasificacionArrayClub = [clasificacionModelo]()
    var myUserClasifPosition = 0
    let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)


        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Maquetacion
        //Estilo background
        let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
        tableView.backgroundColor = menuColo1
        tableView.separatorColor = menuColo1
        view.backgroundColor = menuColo1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let indexPath = IndexPath(row: myUserClasifPosition, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}

extension RankingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var header = ""
        
        switch section {
        case 0:
            header = "Clasificacion Individual"
        case 1:
            header = "Clasificacion Clubes"
        default: break
        }
        return header
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numeroFilas = 0
        
        switch section {
        case 0:
            numeroFilas = clasificacionArraySingle.count
        case 1:
            numeroFilas = clasificacionArrayClub.count
        default: break
        }
        return numeroFilas
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClasificacionCell", for: indexPath) as! RankingTableViewCell
        //Usuario actual
        let currentUser = PFUser.current()
        
        cell.layer.cornerRadius = 10 //set corner radius here
        cell.layer.borderColor = menuColo1.cgColor  // set cell border color here
        cell.layer.borderWidth = 0.5 // set border width here
        cell.imagenUsuario.layer.cornerRadius = 10
        
        
        switch indexPath.section {
        case 0:
            let clasificacionSingleData = clasificacionArraySingle[indexPath.row]
            
           // if (currentUser?.username == clasificacionSingleData.nombreUsuario){
           //     cell.nombreUsuarioLBL.font = UIFont.boldSystemFont(ofSize: 16.0)
           // }
            
            cell.nombreUsuarioLBL.text = clasificacionSingleData.nombreUsuario
            cell.clubUsuarioLBL.text = clasificacionSingleData.club
            cell.puntuacionUsuarioLBL.text = "\(clasificacionSingleData.puntuacion!)"
            
            var imagenRedonda  = UIImageView(frame:CGRect(x: self.view.frame.size.width / 2.0, y: self.view.frame.size.height / 2.0, width: 100, height: 100));
            
            
            
            cell.imagenUsuario.image = clasificacionSingleData.imagenProfile
            break
        case 1:
            let clasificacionClubData = clasificacionArrayClub[indexPath.row]
            
            cell.nombreUsuarioLBL.text = clasificacionClubData.nombreUsuario
            cell.clubUsuarioLBL.text = clasificacionClubData.club
            cell.puntuacionUsuarioLBL.text = "\(clasificacionClubData.puntuacion!)"
            cell.imagenUsuario.image = clasificacionClubData.imagenProfile
            break
        default: break
        }
        
        return cell
    }
}

