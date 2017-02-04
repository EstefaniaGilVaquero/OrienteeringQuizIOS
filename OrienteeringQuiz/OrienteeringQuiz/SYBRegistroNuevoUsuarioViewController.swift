//
//  SYBRegistroNuevoUsuarioViewController.swift
//  OrienteeringQuiz
//
//  Created by CICE on 4/10/16.
//  Copyright © 2016 Symbel. All rights reserved.
//

import UIKit
import Parse

class SYBRegistroNuevoUsuarioViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var fotoSeleccionada = false
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myImagenRegistro: UIImageView!
    @IBOutlet weak var myEditTF: UIButton!
    @IBOutlet weak var myUserNameTF: UITextField!
    @IBOutlet weak var myPasswordTF: UITextField!
    @IBOutlet weak var myEmailTF: UITextField!
    @IBOutlet weak var myClubTF: UITextField!
    
 
    
    
    
    
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myRegistrarseBTN: UIButton!
    
    //MARK: - IBACTION
    
    @IBAction func cerrarVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func editarFoto(_ sender: Any) {
        pickerPhoto()
    }
    
    @IBAction func registrarse(_ sender: AnyObject) {
        var errorInicial = ""
        
        if myUserNameTF.text == ""
            || myPasswordTF.text == ""
            || myEmailTF.text == ""
            || myClubTF.text == ""
            || myImagenRegistro.image == nil{
            errorInicial = "Debes rellenar todos los campos"
        }else{
            //La instancia para interactuar con parse
            let user = PFUser()
            user.username = myUserNameTF.text
            user.password = myPasswordTF.text
            user.email = myEmailTF.text
            user["club"] = myClubTF.text
            
            myActivityIndicator.isHidden = false
            myActivityIndicator.startAnimating()
            
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            user.signUpInBackground(block: { (success, singUpError) in
                self.myActivityIndicator.isHidden = true
                self.myActivityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                let errorDataSingUp = singUpError
//                var errorDataPost = ""

//                if !self.fotoSeleccionada{
//                    errorDataPost = "Por favor selecciona una imagen para registrarte"
//                }
//                
//                if errorDataPost != ""{
//                    self.showAlertVCFinal("ATENCION", "Existe un error en el registro")
//                }
                
                if errorDataSingUp != nil{
//                    if let errorString = errorDataSingUp.userInfo["error"] as? NSString{
//                        self.showAlertVCFinal("ATENCION", mensageData: errorString as String)
//                    }else{
//                        self.showAlertVCFinal("ATENCION", mensageData: "Existe un error en el registro")
//                    }
                    if let errorString = (errorDataSingUp as! NSError).userInfo["error"] as? String {
                        NSLog(errorString);
                        self.showAlertVCFinal("ATENCION", errorString as String)
                    }else{
                        self.showAlertVCFinal("ATENCION", "Existe un error en el login")
                    }
                    
                }else{
                    //Metodo de salvar imagen
                    self.singUpConFoto()
                }
            })
            
            
        }
        
        if errorInicial != ""{
            showAlertVCFinal("ATENCION", errorInicial)
        }

    }
    
    @IBAction func myOcultarVCACTION(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - ALERTVC
    func showAlertVCFinal(_ tituloData : String, _ mensageData : String){
        let alertVC = UIAlertController(title: tituloData, message: mensageData, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    //MARK: - SUBIR FOTO A PARSE CON EL REGISTRO
    func singUpConFoto(){
        //instancia de la imagen a subir
        let postImage = PFObject(className: "ImagenPerfil")
        let imageData = UIImageJPEGRepresentation(self.myImagenRegistro.image!, 0.4)
        let imageFile = PFFile(name: "imagePerfilUsuario.jpg", data: imageData!)
        postImage["ficheroImagen"] = imageFile
        postImage["nombreUsuario"] = PFUser.current()?.username
        postImage.saveInBackground { (success, error) in
            if success{
                self.showAlertVCFinal("Genial", "Se ha guardado tu foto")
            }else{
                self.showAlertVCFinal("Uooppppsss", "Parece que tu foto no se ha podido guardar")
            }
            self.fotoSeleccionada = false
            self.myImagenRegistro.image = UIImage(named: "placeholder")
        }
        
        NSLog("Usuario registrado con exito");
        //print("Usuario registrado con exito")
        self.myUserNameTF.text = ""
        self.myPasswordTF.text = ""
        self.myEmailTF.text = ""
        self.myClubTF.text = ""
        
        self.performSegue(withIdentifier: "saltarTabBarControllerFromReg", sender: self)
        
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let menuColo1 = UIColor(red: 0.965, green: 0.467, blue: 0.161, alpha: 1)
        myEditTF.tintColor = menuColo1
        myActivityIndicator.color = menuColo1
        myRegistrarseBTN.backgroundColor = menuColo1
        myActivityIndicator.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

//MARK: - DELEGATE UIIMAGEPICKER / PHOTO
extension SYBRegistroNuevoUsuarioViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        fotoSeleccionada = true
        myImagenRegistro.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
}
