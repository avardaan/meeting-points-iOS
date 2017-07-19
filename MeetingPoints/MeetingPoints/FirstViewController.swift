// Vardaan Aashish

import UIKit

// hard-coded date as global variable to maintain synchronicity
var date1 = ""

class FirstViewController: UIViewController
{
    // trip title label
    @IBOutlet weak var tripTitle: UILabel!
    
    // picture view for background of trip box
    @IBOutlet weak var tripDetailsView: UIView!
    
    // label for date
    @IBOutlet weak var dateLabel: UILabel!
    
    // label to display number of attendees
    @IBOutlet weak var countLabel: UILabel!
    
    // variable that sets the number of attendees, used because manipulating label.text between views was buggy
    var setCount = String()
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // round corners of trip details view
        tripDetailsView.layer.masksToBounds = true
        tripDetailsView.layer.cornerRadius = CGFloat(10)
        
        // set date to global variable for date
        dateLabel.text = date1
        // set count to global variable for count
        countLabel.text = setCount
        // attendees using global array's count
        countLabel.text = String(studentsAttending.count)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // if segue is taking user to ThirdViewController, then make the title of that view the trip chosen by user
        if (segue.identifier == "1to3")
        {
            let destVC : ThirdViewController = segue.destination as! ThirdViewController
            destVC.titleHeader = tripTitle.text!
        }
        
    }
    
    
    
    
    


}

