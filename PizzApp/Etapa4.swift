//
//  Etapa4.swift
//  PizzApp
//
//  Created by Oscar Ortega on 27/04/16.
//  Copyright © 2016 Ozzcorp. All rights reserved.
//

import UIKit

class Etapa4: UIViewController {
    
    var tamaño : String = "" //viene de la pantalla anterior
    var masa : String = "" //viene de la pantalla anterior
    var queso : String = "" //viene de la pantalla anterior


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print (tamaño)
        print(masa)
        print (queso)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
