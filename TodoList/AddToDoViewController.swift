//
//  AddToDoViewController.swift
//  TodoList
//
//  Created by Porfirio Chávez González on 20/07/21.
//

import UIKit

class AddToDoViewController: UIViewController {

    var toDoTableViewController: ToDoTableViewController? = nil
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var prioritySelect: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToDoAction(_ sender: Any) {
        let newTodo = ToDo()
        newTodo.priority = prioritySelect.selectedSegmentIndex
        
        if let name = textInput.text {
            newTodo.name = name
        }
        
        toDoTableViewController?.toDos.append(newTodo)
        toDoTableViewController?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
