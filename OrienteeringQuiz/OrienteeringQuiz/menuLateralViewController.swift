//
//  menuViewController.swift
//  memuDemo
//
//  Created by Parth Changela on 09/10/16.
//  Copyright © 2016 Parth Changela. All rights reserved.
//

import UIKit
import Parse

class menuLateralViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBAction func editarImagen(_ sender: Any) {
        self.pickerPhoto()
    }
    @IBOutlet weak var tblTableView: UITableView!
    @IBOutlet weak var imgProfile: UIImageView!

    
    
    var ManuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findDataFromParse()
        
        ManuNameArray = ["Desconectar","Aprende Simbolos","Quiz Mapa","Quiz Descripcion","Clasificacion"]
        iconArray = [UIImage(named:"home")!,UIImage(named:"home")!,UIImage(named:"message")!,UIImage(named:"map")!,UIImage(named:"setting")!]
        
        imgProfile.layer.borderWidth = 2
        imgProfile.layer.borderColor = UIColor.green.cgColor
        imgProfile.layer.cornerRadius = 50
        
        imgProfile.layer.masksToBounds = false
        imgProfile.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Identificar el segue por el que estamos pasando
        if let destinationVC = segue.destination as? SYBLoginViewController {
            if segue.identifier == "Logout" {
                PFUser.logOutInBackground { (error) in
                    if error != nil{
                        print("Error al hacer logout")
                    }else{
                        print("Logout Completado")
                    }
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManuNameArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.lblMenuname.text! = ManuNameArray[indexPath.row]
        cell.imgIcon.image = iconArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        
        let cell:MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        print(cell.lblMenuname.text!)
        if cell.lblMenuname.text! == "Desconectar"
        {
            
           performSegue(withIdentifier: "Logout", sender: self)
        }
        if cell.lblMenuname.text! == "Aprende Simbolos"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "aprendeViewController") as! AprendeSimbolosViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            
        }
        if cell.lblMenuname.text! == "Quiz Mapa"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "QuizsViewController") as! SYBQuizsViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.lblMenuname.text! == "Quiz Descripcion"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "QuizsViewController") as! SYBQuizsViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)        }
        if cell.lblMenuname.text! == "Clasificacion"
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "clasificacionViewController") as! RankingViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }
    }
    func findDataFromParse(){
        //1. primera consulta
        let queryData = PFUser.query()
        queryData?.whereKey("username", equalTo: (PFUser.current()?.username)!)
        queryData?.findObjectsInBackground(block: { (objectsBusqueda, errorBusqueda) in
            if errorBusqueda == nil{
                if let objectData = objectsBusqueda{
                    for objectDataBusqueda in objectData{
                        
                        //2. segunda consulta
                        let queryBusquedaFoto = PFQuery(className: "ImagenPerfil")
                        queryBusquedaFoto.whereKey("nombreUsuario", equalTo: (PFUser.current()?.username)!)
                        queryBusquedaFoto.findObjectsInBackground(block: { (objectsBusquedaFoto, errorFoto) in
                            if errorFoto == nil{
                                if let objectsBusquedaFotoData = objectsBusquedaFoto{
                                    for objectsBusquedaFotoBucle in objectsBusquedaFotoData{
                                        let userImageFile = objectsBusquedaFotoBucle["ficheroImagen"] as! PFFile
                                        
                                        //3. tercera consulta
                                        userImageFile.getDataInBackground(block: { (imageData, errorImageData) in
                                            if errorImageData == nil{
                                                if let imageDataDesempaquetado = imageData{
                                                    let imagenFinal = UIImage(data: imageDataDesempaquetado)
                                                    self.imgProfile.image = imagenFinal
                                                }
                                            }else{
                                                print("Hola chicos no tenemos imagen :(")
                                            }
                                        })
                                    }
                                }
                            }else{
                                print("Error: \(errorFoto!._userInfo) ")
                            }
                        })
                    }
                }
            }else{
            }
        })
    }
}

//MARK: - DELEGATE UIIMAGEPICKER / PHOTO
extension menuLateralViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func pickerPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            showPhotoMenu()
        }else{
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu(){
        
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Camara", style: .default) { Void  in
            self.takePhotowithCamera()
        }
        let chooseFromLibraryAction = UIAlertAction(title: "Galería", style: .default) { Void  in
            self.choosePhotoFromLibrary()
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(takePhotoAction)
        alertVC.addAction(chooseFromLibraryAction)
        
        present(alertVC, animated: true, completion: nil)
        
    }
    
    func takePhotowithCamera(){
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func choosePhotoFromLibrary(){
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        //fotoSeleccionada = true
        imgProfile.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
}


