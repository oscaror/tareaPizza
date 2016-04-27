//
//  Etapa1.swift
//  PizzApp
//
//  Created by Oscar Ortega on 27/04/16.
//  Copyright © 2016 Ozzcorp. All rights reserved.
//

import UIKit

class Etapa1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerTamaño: UIPickerView!
    var pickerData: [String] = [String] ()
    var tamaño : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pickerTamaño.delegate = self
        self.pickerTamaño.dataSource = self
        
        //Datos del pickerView
        pickerData = ["Chica", "Mediana", "Grande"]
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
        tamaño = self.pickerData[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sigVista = segue.destinationViewController as! Etapa2
        sigVista.tamaño = tamaño
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
