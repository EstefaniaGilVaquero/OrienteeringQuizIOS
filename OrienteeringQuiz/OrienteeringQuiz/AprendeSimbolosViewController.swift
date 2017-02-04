//
//  AprendeSimbolosViewController.swift
//  OrienteeringQuiz
//
//  Created by CICE on 28/9/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit

class AprendeSimbolosViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    

    
    var simbolosArrayGuay = [simbolosModelo]()
    var tituloNavigationController = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
//        //Maquetacion
//        //Estilo background
        let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
        tableView.backgroundColor = menuColo1        
        tableView.separatorColor = menuColo1
        view.backgroundColor = menuColo1       
//        
//        tableView.register(UINib(nibName: "AprendeSimbolosTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        //Ponemos titulo al VC
        self.title = tituloNavigationController
    }
    

    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AprendeSimbolosTableViewCell
//        //cell.clipsToBounds = true
//        
//        //Pinto la imagen correspondiente
//        print(indexPath)
//        
//        let card = simbolosArrayGuay[indexPath.row]
//        
//        
//        if let imagenSimbolo = card.imagen {
//            imagenSimbolo.getDataInBackground(block: {
//                (data: Data?, error: Error?) in
//                if error == nil {
//                    let image = UIImage(data:data!)
//                    cell.myImagenAprendeSimbolos.image = image
//                }
//            })
//        }
//
//        cell.myDescripcionAprendeSimbolos.text = card.descripcionCorta
//        cell.myDescripcionLargaAprendeSimbolos.text = card.descripcionLarga
//        
//
//       // let labelSize = rectForText(text: "your text here", font: UIFont.systemFont(ofSize: 17.0), maxSize: CGSize(width: 10, height: 999))
//        cell.myDescripcionLargaAprendeSimbolos.sizeToFit()
//        
//        return cell
//        
//    }
    

}

extension AprendeSimbolosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simbolosArrayGuay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AprendeSimbolosTableViewCell
        
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
//        cell.workTitleLabel.backgroundColor = UIColor(white: 204/255, alpha: 1)
//        cell.workTitleLabel.textAlignment = .center
//        cell.moreInfoTextView.textColor = UIColor(white: 114/255, alpha: 1)
        cell.selectionStyle = .none
        
        cell.myDescripcionLargaAprendeSimbolos.text = card.isExpanded ? card.descripcionLarga : ""
      //  cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
        
        return cell
    }
}


extension AprendeSimbolosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1
        guard let cell = tableView.cellForRow(at: indexPath) as? AprendeSimbolosTableViewCell else { return }
        
        let card = simbolosArrayGuay[indexPath.row]
        
        // 2
        card.isExpanded = !card.isExpanded
        simbolosArrayGuay[indexPath.row] = card
        
        // 3
        cell.myDescripcionLargaAprendeSimbolos.text = card.isExpanded ? card.descripcionLarga : ""
        //cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
        
        // 4
        tableView.beginUpdates()
        tableView.endUpdates()
        
        // 5
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}






























