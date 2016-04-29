//
//  Etapa4.swift
//  PizzApp
//
//  Created by Oscar Ortega on 27/04/16.
//  Copyright © 2016 Ozzcorp. All rights reserved.
//

import UIKit

class Etapa4: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    
    var tamaño : String = "" //viene de la pantalla anterior
    var masa : String = "" //viene de la pantalla anterior
    var queso : String = "" //viene de la pantalla anterior
    var ingrediente1 : String = ""
    var ingrediente2 : String = ""
    var ingrediente3 : String = ""
    var ingrediente4 : String = ""
    var ingrediente5 : String = ""


    @IBOutlet weak var pickerIngredientes: UIPickerView!
    var pickerData : [[String]] = [[String]] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "pizzaImg.jpg")
        self.view.insertSubview(backgroundImage, atIndex: 0)

        // Do any additional setup after loading the view.
        
        self.pickerIngredientes.delegate = self
        self.pickerIngredientes.dataSource = self
        pickerData = [["", "jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoas"],
                      ["", "jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoas"],
                      ["", "jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoas"],
                      ["", "jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoas"],
                      ["", "jamón", "pepperoni", "pavo", "salchicha", "aceituna", "cebolla", "pimiento", "piña", "anchoas"]]
        print (tamaño)
        print(masa)
        print (queso)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Numero de columnas
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 5
    }
    
    //numero de filas
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData [component].count
    }
    
    // pregunta por los datos que se encuentran en esa posicion
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData [component][row]
    }
    
    //capturar la seleccion del picker
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        ingrediente1 = pickerData[0][pickerIngredientes.selectedRowInComponent(0)]
        ingrediente2 = pickerData[1][pickerIngredientes.selectedRowInComponent(1)]
        ingrediente3 = pickerData[2][pickerIngredientes.selectedRowInComponent(2)]
        ingrediente4 = pickerData[3][pickerIngredientes.selectedRowInComponent(3)]
        ingrediente5 = pickerData[4][pickerIngredientes.selectedRowInComponent(4)]
        
    }
    
    override func prepareForSegue(segue5: UIStoryboardSegue, sender: AnyObject?) {
        
        if ingrediente1 == "" && ingrediente2 == "" && ingrediente3 == "" && ingrediente4 == "" && ingrediente5 == ""{
            showSimpleAlert()
        }
        else{
            let sigVista = segue5.destinationViewController as! Etapa5
            sigVista.tamaño = tamaño
            sigVista.masa = masa
            sigVista.queso = queso
            sigVista.ingrediente1 = ingrediente1
            sigVista.ingrediente2 = ingrediente2
            sigVista.ingrediente3 = ingrediente3
            sigVista.ingrediente4 = ingrediente4
            sigVista.ingrediente5 = ingrediente5
            
        }
    }

    /// Show an alert with an "Okay" button.
    func showSimpleAlert() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("No se selecionaron ingredientes para la pizza", comment: "")
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
