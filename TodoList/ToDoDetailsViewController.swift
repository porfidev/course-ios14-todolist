//
//  ToDoDetailsViewController.swift
//  TodoList
//
//  Created by Porfirio Chávez González on 20/07/21.
//

import UIKit

class ToDoDetailsViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    var todo: ToDo = ToDo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if(todo.priority == 1) {
            todoLabel.text = "❗️" + todo.name
        } else if (todo.priority == 2) {
            todoLabel.text = "‼️" + todo.name
        } else {
            todoLabel.text = todo.name
        }
    }
    

    @IBAction func onPressFinish(_ sender: Any) {
        
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
