//
//  ToDoDetailsViewController.swift
//  TodoList
//
//  Created by Porfirio Chávez González on 20/07/21.
//

import UIKit

class ToDoDetailsViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    //var todo: ToDo = ToDo()
    var toDoCD: ToDoCD? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let todo = toDoCD {
            if(todo.priority == 1) {
                if let name = todo.name {
                    todoLabel.text = "❗️" + name
                }
            } else if (todo.priority == 2) {
                if let name = todo.name {
                    todoLabel.text = "‼️" + name
                }
            } else {
                if let name = todo.name {
                    todoLabel.text = name
                }
            }
        }
    }
    

    @IBAction func onPressFinish(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDo = toDoCD {
                context.delete(toDo)
            }
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        
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
