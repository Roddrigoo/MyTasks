//
//  ViewController.swift
//  My Tasks
//
//  Created by Rodrigo Rodrigues on 23/11/21.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak private var txtTask: UITextField!
    
    //-----------------------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapToHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapToHideKeyboard.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapToHideKeyboard)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        txtTask.becomeFirstResponder()
    }
    
    //-----------------------------------------------------------------------------------
    //  MARK: - Custom Methods
    //-----------------------------------------------------------------------------------
    
    @objc func hideKeyboard(){
        txtTask.resignFirstResponder()
    }
    
    @IBAction func addTask(_ sender: Any) {
        hideKeyboard()
        
        if let txtTyped  = txtTask.text, txtTyped.isEmpty == false{
            
            let task = TaskManager()
            task.save(tasks: txtTyped)
            txtTask.text = ""
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
