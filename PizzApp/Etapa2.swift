//
//  Etapa2.swift
//  PizzApp
//
//  Created by Oscar Ortega on 27/04/16.
//  Copyright © 2016 Ozzcorp. All rights reserved.
//

import UIKit

class Etapa2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var tamaño : String = "" //viene de la pantalla anterior
    
    @IBOutlet weak var pickerMasa: UIPickerView!
    var pickerData: [String] = [String] ()
    var masa : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "pizzaImg.jpg")
        self.view.insertSubview(backgroundImage, atIndex: 0)

        // Do any additional setup after loading the view.
        
        self.pickerMasa.delegate = self
        self.pickerMasa.dataSource = self
        print(tamaño)
        
        //Datos del picker
        pickerData = ["", "Delgada", "Crujiente", "Gruesa"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Numero de columnas
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //numero de filas
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // pregunta por los datos que se encuentran en esa posicion
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData [row]
    }
    
    //capturar la seleccion del picker
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        masa = self.pickerData[row]
    }
    
    override func prepareForSegue(segue3: UIStoryboardSegue, sender: AnyObject?) {
        
        if (masa == ""){
            showSimpleAlert()
        }
        else{
            let sigVista = segue3.destinationViewController as! Etapa3
            sigVista.tamaño = tamaño
            sigVista.masa = masa
        }
    }


    /// Show an alert with an "Okay" button.
    func showSimpleAlert() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("No se seleciono la masa de la pizza", comment: "")
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
