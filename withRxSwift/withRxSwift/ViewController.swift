//
//  ViewController.swift
//  withRxSwift
//
//  Created by eduardo fulgencio on 01/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPeras: UITextField!
    @IBOutlet weak var txtManzanas: UITextField!
    @IBOutlet weak var txtPlatanos: UITextField!
    @IBOutlet weak var lblParcialPeras: UILabel!
    @IBOutlet weak var lblParcialManzanas: UILabel!
    @IBOutlet weak var lblParcialPlatanos: UILabel!
    @IBOutlet weak var lblTotalPeras: UIStackView!
    @IBOutlet weak var lblTotalManzanas: UILabel!
    @IBOutlet weak var lblTotalPlatanos: UILabel!
    
    
    // Objetivo: introducir numero de peras en txtPeras, actualiza el parcial
    // cuando se pulsa enter en el campo txtPeras el valor de parcial peras
    // pasa a acumular el total peras.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

