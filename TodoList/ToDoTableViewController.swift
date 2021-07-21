//
//  ToDoTableViewController.swift
//  TodoList
//
//  Created by Porfirio Chávez González on 20/07/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    //var toDos: [ToDo] = []
    var toDosCD: [ToDoCD] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /* for local onlyh
        
        let todo1 = ToDo();
        todo1.name = "Hola Mundo"
        todo1.priority = 0
        
        let todo2 = ToDo()
        todo2.name = "Hi Goodfriend"
        todo2.priority = 1
        
        toDos = [todo1, todo2]
         */
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getTodos() -> Void {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCoreData = try? context.fetch(ToDoCD.fetchRequest()) {
                if let toDos = toDosFromCoreData as? [ToDoCD] {
                    toDosCD = toDos
                    tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDosCD.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let selectedToDo = toDosCD[indexPath.row]

        if selectedToDo.priority == 1 {
            if let name = selectedToDo.name {
                cell.textLabel?.text = "❗️" + name
            }
        } else if selectedToDo.priority == 2 {
            if let name = selectedToDo.name {
                cell.textLabel?.text = "‼️" + name
            }
        } else {
            if let name = selectedToDo.name {
                cell.textLabel?.text = name
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = toDosCD[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: selectedTodo)
    }

    override func viewWillAppear(_ animated: Bool) {
        getTodos()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addToDoViewController = segue.destination as? AddToDoViewController {
            addToDoViewController.toDoTableViewController = self
        }
        
        if let detailsTodoViewController = segue.destination as? ToDoDetailsViewController {
            if let selectedTodo = sender as? ToDoCD {
                detailsTodoViewController.toDoCD = selectedTodo
            }
        }
    }
    

}
