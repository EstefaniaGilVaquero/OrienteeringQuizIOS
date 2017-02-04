//
//  RankingTableViewController.swift
//  OrienteeringQuiz
//
//  Created by Estefanía Gil Vaquero on 28/1/17.
//  Copyright © 2017 Symbel. All rights reserved.
//

import UIKit
import Parse

class RankingTableViewController: UITableViewController {
    
    var tituloNavigationController = ""
    var clasificacionArraySingle = [clasificacionModelo]()
    var clasificacionArrayClub = [clasificacionModelo]()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClasificacionCell", for: indexPath) as! RankingTableViewCell
        
        
        cell.layer.cornerRadius=10 //set corner radius here
        cell.layer.borderColor = menuColo1.cgColor  // set cell border color here
        cell.layer.borderWidth = 0.5 // set border width here
        
        switch indexPath.section {
        case 0:
            let clasificacionSingleData = clasificacionArraySingle[indexPath.row]
            
            cell.nombreUsuarioLBL.text = clasificacionSingleData.nombreUsuario
            cell.clubUsuarioLBL.text = clasificacionSingleData.club
            cell.puntuacionUsuarioLBL.text = "\(clasificacionSingleData.puntuacion!)"
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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
        
    
    
}
