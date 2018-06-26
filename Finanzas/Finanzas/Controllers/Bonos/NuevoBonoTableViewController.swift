//
//  NuevoBonoTableViewController.swift
//  Finanzas
//
//  Created by Daniel Aragon Ore on 6/22/18.
//  Copyright © 2018 Daragonor. All rights reserved.
//

import UIKit

extension UITextField{
    public var toDouble: Double{
        return Double(self.text!)!
    }
    public var toInt: Int{
        return Int(self.text!)!
    }
}
class NuevoBonoTableViewController: UITableViewController {

    @IBOutlet weak var vNominal: UITextField!
    @IBOutlet weak var vComercial: UITextField!
    @IBOutlet weak var nroAños: UITextField!
    @IBOutlet weak var frecCupon: UITextField!
    @IBOutlet weak var diasXAño: UITextField!
    @IBOutlet weak var tipoTasa: UITextField!
    @IBOutlet weak var cap: UITextField!
    @IBOutlet weak var tasaInteres: UITextField!
    @IBOutlet weak var tasaDescuento: UITextField!
    @IBOutlet weak var impuestoRenta: UITextField!
    @IBOutlet weak var fechaEmision: UITextField!
    @IBOutlet weak var prima: UITextField!
    @IBOutlet weak var estructuracion: UITextField!
    @IBOutlet weak var estructuracionTipo: UITextField!
    @IBOutlet weak var colocacion: UITextField!
    @IBOutlet weak var colocacionTipo: UITextField!
    @IBOutlet weak var flotacion: UITextField!
    @IBOutlet weak var flotacionTipo: UITextField!
    @IBOutlet weak var cavali: UITextField!
    @IBOutlet weak var cavaliTipo: UITextField!
    
    var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(NuevoBonoTableViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(NuevoBonoTableViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        fechaEmision.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UIGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        fechaEmision.text = dateFormatter.string(from: datePicker.date)
    }

    @IBAction func guardar(_ sender: Any) {
        let bono = Bono(vNom:vNominal.toDouble, vCom:vComercial.toDouble, nrAñ:nroAños.toInt, freq: frecCupon.text!, dxAñ:diasXAño.toInt, tTas: tipoTasa.text!, capi:cap.text!, tInt:tasaInteres.toDouble/100, tDesc:tasaDescuento.toDouble/100, impR:impuestoRenta.toDouble/100, fEmi:datePicker?.date, prim:prima.toDouble/100, estr:estructuracion.toDouble/100, estrTipo:estructuracionTipo.text!, colo:colocacion.toDouble/100, coloTipo: colocacionTipo.text!, flot:flotacion.toDouble/100, flotTipo:flotacionTipo.text!, cava:cavali.toDouble/100, cavaTipo:cavaliTipo.text!)
        bono.Aleman()
        User.sharedInstance.bonos.append(bono)
    }
}