//
//  ViewController.swift
//  მარიამ_ანთიძე_ლექცია13
//
//  Created by Mariam Antidze on 21.11.22.
//

import UIKit
class Person {
    var name: String
    var surname: String
    var age: String
    
    init(name: String, surname: String, age: String) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
}
class ViewController: UIViewController {
    
    var persons = [ Person(name: "Mariam", surname: "Antidze", age: "21")
    ]
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.placeholder = "სახელი"
        textField2.placeholder = "გვარი"
        textField3.placeholder = "ასაკი"
        
        let nibFile = UINib(nibName: "myCustomTableViewCell", bundle: nil)
        tableView.register(nibFile, forCellReuseIdentifier: "myCustomTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        var myAlert = UIAlertController(title: "შეცდომა", message: "გთხოვთ შეიყვანოთ ყველა მონაცემი", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){(ACTION) in print("Ok tapped")}
        if (!textField1.hasText || !textField2.hasText || !textField3.hasText )
        {
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true)
        } else {
            var person = Person(name: textField1.text!, surname: textField2.text!, age: (textField3.text!))
            persons.append(person)
            tableView.reloadData()
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  myCell = tableView.dequeueReusableCell(withIdentifier: "myCustomTableViewCell", for: indexPath) as! myCustomTableViewCell
        
        myCell.customNameLabel.text = "\(persons[indexPath.row].name)"
        myCell.customSurnameLabel.text = "\(persons[indexPath.row].surname)"
        myCell.customAgeLabel.text = "\(persons[indexPath.row].age)"
        return myCell
    }
    
}
