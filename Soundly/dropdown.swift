//
//  dropdown.swift
//  Soundly
//
//  Created by Nikolai Bain on 29/09/19.
//  Copyright © 2019 Nevin Jojo. All rights reserved.
//

import SwiftUI

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!

    var list = ["1", "2", "3"]

    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{

        return list.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        self.view.endEditing(true)
        return list[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        self.textBox.text = self.list[row]
        self.dropDown.isHidden = true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {

        if textField == self.textBox {
            self.dropDown.isHidden = false
            //if you don't want the users to se the keyboard type:

            textField.endEditing(true)
        }
    }
}
