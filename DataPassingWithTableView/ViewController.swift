//
//  ViewController.swift
//  DataPassingWithTableView
//
//  Created by Rachana Pandit on 07/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,BackDataPassing {
   
@IBOutlet weak var tblData:UITableView!
@IBOutlet weak var btnAdd:UIButton!
var arrayDataOfTextField = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem?.title = "Add"
        tblData.delegate = self
        tblData.dataSource =  self
    }
    override func viewWillAppear(_ animated: Bool)
    {
        print("called")
        tblData.reloadData()
    }
    
//TableView Methods:----
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayDataOfTextField.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblData.dequeueReusableCell(withIdentifier: "CellData", for: indexPath)
        cell.backgroundColor = .orange
        cell.textLabel?.text = arrayDataOfTextField[indexPath.row]
        return cell
    }
    @IBAction func btnAddClick(_ sender:Any)
    {
        let SecondVC = self.storyboard?.instantiateViewController(withIdentifier: "VC2") as! VC2
        SecondVC.delegateForSecondVC = self
        self.navigationController?.pushViewController(SecondVC, animated: true)
    }
    
// To fetch data from SecondVC
        func passDataToFirstVC(arr: [String])
        {
            arrayDataOfTextField = arr
            print(arrayDataOfTextField.count)
            print(arrayDataOfTextField)
        }
}

