//
//  ViewController.swift
//  withRxSwift
//
//  Created by eduardo fulgencio on 01/01/2020.
//  Copyright © 2020 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var txtPeras: UITextField!
    @IBOutlet weak var txtManzanas: UITextField!
    @IBOutlet weak var txtPlatanos: UITextField!
    @IBOutlet weak var lblParcialPeras: UILabel!
    @IBOutlet weak var lblParcialManzanas: UILabel!
    @IBOutlet weak var lblParcialPlatanos: UILabel!

    @IBOutlet weak var lblTotalPeras: UILabel!
    @IBOutlet weak var lblTotalManzanas: UILabel!
    @IBOutlet weak var lblTotalPlatanos: UILabel!
    
    let disposeBag = DisposeBag()
    
    // Objetivo: introducir numero de peras en txtPeras, actualiza el parcial
    // cuando se pulsa enter en el campo txtPeras el valor de parcial peras
    // pasa a acumular el total peras.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTextAndLabelPeras()
        bindTextAndLabelManzanas()
        bindTextAndLabelPlatanos()
    }

    func bindTextAndLabelPeras() {
        
        // Cuando pulse enter se entenderá que confirma el número de unidades
        txtPeras.rx.controlEvent([.editingDidEndOnExit]).subscribe { textIn in
            let suma : Int = Int(self.lblParcialPeras.text!)! + Int(self.lblTotalPeras.text!)!
            self.lblTotalPeras.text = String(suma)
            self.txtPeras.rx.text.onNext("0") // Inicializo a 0
        }.disposed(by: disposeBag)
    
        txtPeras.rx.text.map {
                if $0 == "" {
                    return "0"
                } else {
                    return "\($0!)"
                }
            }.bind(to: lblParcialPeras.rx.text).disposed(by: disposeBag)

        lblTotalPeras.rx.observe(String.self, "text").subscribe(onNext: { text in
              print(text!)
        }).disposed(by: disposeBag)
    }
    
    func bindTextAndLabelManzanas() {
            txtManzanas.rx.controlEvent([.editingDidEndOnExit]).subscribe { textIn in
                let suma : Int = Int(self.lblParcialManzanas.text!)! + Int(self.lblTotalManzanas.text!)!
                self.lblTotalManzanas.text = String(suma)
            }.disposed(by: disposeBag)
        
            txtManzanas.rx.text.map {
                    if $0 == "" {
                        return "0"
                    } else {
                        return "\($0!)"
                    }
                }.bind(to: lblParcialManzanas.rx.text).disposed(by: disposeBag)

            lblTotalManzanas.rx.observe(String.self, "text").subscribe(onNext: { text in
                  print(text!)
            }).disposed(by: disposeBag)
    }
    
    func bindTextAndLabelPlatanos() {
            txtPlatanos.rx.controlEvent([.editingDidEndOnExit]).subscribe { textIn in
                let suma : Int = Int(self.lblParcialPlatanos.text!)! + Int(self.lblTotalPlatanos.text!)!
                self.lblTotalPlatanos.text = String(suma)
            }.disposed(by: disposeBag)
        
            txtPlatanos.rx.text.map {
                    if $0 == "" {
                        return "0"
                    } else {
                        return "\($0!)"
                    }
                }.bind(to: lblParcialPlatanos.rx.text).disposed(by: disposeBag)

            lblTotalPlatanos.rx.observe(String.self, "text").subscribe(onNext: { text in
                  print(text!)
            }).disposed(by: disposeBag)
    }

}

