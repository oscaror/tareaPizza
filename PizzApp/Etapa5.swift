//
//  Etapa5.swift
//  PizzApp
//
//  Created by Oscar Ortega on 27/04/16.
//  Copyright © 2016 Ozzcorp. All rights reserved.
//

import UIKit

class Etapa5: UIViewController {
    
    var tamaño : String = "" //viene de la pantalla anterior
    var masa : String = "" //viene de la pantalla anterior
    var queso : String = "" //viene de la pantalla anterior
    var ingrediente1 : String = "" //viene de la pantalla anterior
    var ingrediente2 : String = ""
    var ingrediente3 : String = ""
    var ingrediente4 : String = ""
    var ingrediente5 : String = ""
    

    @IBOutlet weak var tamañoFinal: UILabel!
    @IBOutlet weak var masaFinal: UILabel!
    @IBOutlet weak var quesoFinal: UILabel!
    @IBOutlet weak var ingredientesFinal: UILabel!

    @IBOutlet weak var confirmar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "pizzaImg.jpg")
        self.view.insertSubview(backgroundImage, atIndex: 0)

        // Do any additional setup after loading the view.
        
        tamañoFinal.text = tamaño
        masaFinal.text = masa
        quesoFinal.text = queso
        ingredientesFinal.text = ingrediente1 + " " + ingrediente2 + " " + ingrediente3 + " " + ingrediente4 + " " + ingrediente5
      
        
        
        print (tamaño)
        print (masa)
        print (queso)
        print (ingrediente1)
        print (ingrediente2)
        print (ingrediente3)
        print (ingrediente4)
        print (ingrediente5)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func confirmacion() {
        showOkayCancelAlert()
        //showSimpleAlert()
        
        
    }
    
    /// Show an alert with an "Okay" and "Cancel" button.
    func showOkayCancelAlert() {
        let title = NSLocalizedString("Confirmación", comment: "")
        let message = NSLocalizedString("Estas a punto de ordenar tu pizza, deseas continuar?", comment: "")
        let cancelButtonTitle = NSLocalizedString("Cancelar", comment: "")
        let otherButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertCotroller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Create the actions.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { _ in
            NSLog("The \"Okay/Cancel\" alert's cancel action occured.")
        }
        
        let otherAction = UIAlertAction(title: otherButtonTitle, style: .Default) { _ in
            NSLog("The \"Okay/Cancel\" alert's other action occured.")
            self.showSimpleAlert()
            self.confirmar.hidden = true
            self.navigationItem.hidesBackButton = true

            
        }
        
        // Add the actions.
        alertCotroller.addAction(cancelAction)
        alertCotroller.addAction(otherAction)
        
        presentViewController(alertCotroller, animated: true, completion: nil)
    }

    
    
    /// Show an alert with an "Okay" button.
    func showSimpleAlert() {
        let title = NSLocalizedString("PizzApp", comment: "")
        let message = NSLocalizedString("Tu pizza se esta preparando 🍕😊", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Create the action.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        
        // Add the action.
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
