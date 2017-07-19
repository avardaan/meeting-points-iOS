// Vardaan Aashish

import UIKit

// global array for ALL students
var students = [String]()

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    // table to display all students
    @IBOutlet weak var studentsTable: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // edit ability for table rows
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // TABLE SETUP
    func numberOfSections(in tableView: UITableView) -> Int
    { return 1 }
    
    // TABLE SETUP
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { return students.count }
    
    // TABLE SETUP
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = students[indexPath.row]
        
        return cell
    }
    
    // TABLE SETUP
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    { return true }
    
    // TABLE SETUP
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            // handle delete (by removing the data from your array and updating the tableview)
            students.remove(at: indexPath.row)
            self.studentsTable.reloadData()
        }
    }
    
    // Alert action to add to group of students
    @IBAction func addStudents(_ sender: UIButton)
    {
        // create alert
        let alert = UIAlertController(title: "Add Student", message: "Enter Name:", preferredStyle: .alert)
        
        //  add text field for name
        alert.addTextField(configurationHandler: nil)
        
        let add = UIAlertAction(title: "Add", style: .default)
        {
            (alertAction: UIAlertAction) in
            
            // variable for the name entered by user
            let newStudent = alert.textFields?[0].text!
            
            // append to group of students
            students.append(newStudent!)
            
            // reload table
            self.studentsTable.reloadData()
        }
        
        // button for cancel if the user doesn't enter anything
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        // add buttons to alertController
        alert.addAction(add)
        alert.addAction(cancel)
        
        // present alert controller
        self.present(alert, animated: true, completion: nil)
    }


}

