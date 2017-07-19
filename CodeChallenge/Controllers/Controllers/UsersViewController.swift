/*
 
 NASIR MAHMOOD
 
 Comment:
 Controller
 
 */
import UIKit
import RealmSwift

class UsersViewController: UIViewController {
    
    /*fileprivate*/ var usersArray : [UserModel] = [] // needed in tests
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    
    var tableViewEstimatedHight = Float?(150.0)
    var tableViewCellIdentifier = ""
    
    let numberOfSections = 1
    
    var realm : Realm?
    
    //MARK: UIView Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = RealmProvider.realm()
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = CGFloat(tableViewEstimatedHight!)
        tableView.rowHeight = UITableViewAutomaticDimension;

        title=ViewControllerTitles.Users
        
        activityIndicator.startAnimating()
        DataManager.sharedInstance.fetchUsersData(.users) { (usersArray, error) in
            if let usersUnwrapped=usersArray{
                self.usersArray=usersUnwrapped
                OperationQueue.main.addOperation {
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            }

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! PostsViewController
        destinationVC.user  = sender as! UserModel?
        
    }

}

extension UsersViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.Users)! as! UsersTableViewCustomCell
        if !usersArray.isEmpty {
            let user = usersArray[indexPath.row]
            cell.populateReceiepeObject(user)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = usersArray[indexPath.row]
        performSegue(withIdentifier: SegueNames.usersToPostsSegue, sender: user)
    }
}
