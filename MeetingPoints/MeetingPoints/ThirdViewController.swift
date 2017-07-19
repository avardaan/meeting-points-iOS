// Vardaan Aashish

import UIKit

// (global) number of students attending hard-coded event
var studentsAttending = [String]()

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource
{
    // students available to add to the trip
    var availableStudents = students
    
    // table to show who's attending
    @IBOutlet weak var attendingTable: UITableView!
    
    // title
    @IBOutlet weak var titleLabel: UILabel!
    
    // textfield that shows date from global variable
    @IBOutlet weak var dateText: UITextField!
    
    // invisible text field in front of button, used as button
    @IBOutlet weak var addTextField: UITextField!
    
    // variable used to show
    var titleHeader = String()
    
    // date picker for choosing date
    let datePicker = UIDatePicker()
    
    // picker for choosing students to add to trip
    let picker = UIPickerView()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // initialize datepicker for date text field
        createDatePicker()
        
        // edit ability for table row cells
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // set date
        dateText.text = date1
        
        // set header to trip title
        titleLabel.text = titleHeader
        
        // picker setup
        picker.delegate = self
        picker.dataSource = self
        addTextField.inputView = picker
        
        // update available students list
        rememberAvailableStudents()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // function to update availableStudents if user deletes from list of attendees
    func rememberAvailableStudents()
    {
        for s in students
        {
            if (studentsAttending.contains(s))
            {
                // index of students[s] in availableStudents
                let index = availableStudents.index(of: s)
                
                // remove from available students
                availableStudents.remove(at: index!)
            }
        }
    }
    
    
    
    
    // Date picker setup
    func createDatePicker()
    {
        // format for picker
        datePicker.datePickerMode = .date
        
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedDate))
        toolbar.setItems([doneButton], animated: true)
        
        // add toolbar
        dateText.inputAccessoryView = toolbar
        
        // assigning date picker to text field
        dateText.inputView = datePicker
    }
    
    // when user presses done after picking date
    func donePressedDate()
    {
        // format date for text field
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        dateText.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    // TABLE SETUP
    func numberOfSections(in tableView: UITableView) -> Int
    { return 1 }
    
    // TABLE SETUP
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { return studentsAttending.count }
    
    // TABLE SETUP
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        
        cell.textLabel?.text = studentsAttending[indexPath.row]
        
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
            // append to available students
            availableStudents.append(studentsAttending[indexPath.row])
            
            // handle delete (by removing the data from your array and updating the tableview)
            studentsAttending.remove(at: indexPath.row)
            
            // Reload Table
            attendingTable.reloadData()
        }
    }
    
    
    // PICKER SETUP
    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    { return 1 }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    { return availableStudents.count }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    { return availableStudents[row] }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // add selected student to list used by table
        studentsAttending.append(availableStudents[row])
        
        // remove selected student from available students array
        availableStudents.remove(at: row)
        
        // reload table data
        attendingTable.reloadData()
        
        // done editing, remove picker view
        self.view.endEditing(true)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // let destVC : FirstViewController = segue.destination as! FirstViewController
        
        // set global date to date set by user inside trip view
        date1 = dateText.text!
        
        // if user added students to attendees list, update attendees count using global array
        // if (studentsAttending.count > 0)
        // { destVC.setCount = String(studentsAttending.count) }
        // else
        // { destVC.setCount = "0" }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
