//
//  VC2.swift
//  DataPassingWithTableView
//
//  Created by Rachana Pandit on 07/11/22.
//

import UIKit

protocol BackDataPassing{
    func passDataToFirstVC(arr:[String])
}

class VC2: UIViewController {

    @IBOutlet weak var txtField1:UITextField!
    @IBOutlet weak var txtField2:UITextField!
    @IBOutlet weak var txtField3:UITextField!
    @IBOutlet weak var btnBack:UIButton!
    var delegateForSecondVC:BackDataPassing!
    var arrayDataToSendVC1 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnBackClick(_ sender : Any)
    {
        guard let delegate = delegateForSecondVC else{
            print("delegate not found")
        return
        }
        arrayDataToSendVC1.append(contentsOf: [txtField1.text!,txtField2.text!,txtField3.text!])
        delegate.passDataToFirstVC(arr: arrayDataToSendVC1)
        self.navigationController?.popViewController(animated: true)
    }
}
