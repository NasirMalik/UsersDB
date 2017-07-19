/*
 
 NASIR MAHMOOD
 
 Comment:
 Controller 
 
 */
import UIKit
import RealmSwift

class PostsViewController: UIViewController {
    
    /*fileprivate*/ var postsArray  : [PostModel] = [] // needed in tests
    @IBOutlet var tableView         : UITableView!
    @IBOutlet var activityIndicator : UIActivityIndicatorView!

    var tableViewEstimatedHight = Float?(60.0)
    var tableViewCellIdentifier = ""

    let numberOfSections = 1
    var realm : Realm?
    var user  : UserModel?
    
    //MARK: UIView Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = RealmProvider.realm()
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = CGFloat(tableViewEstimatedHight!)
        tableView.rowHeight = UITableViewAutomaticDimension;

        title=ViewControllerTitles.Posts
        
        activityIndicator.startAnimating()
        DataManager.sharedInstance.fetchPostsData(.posts, userID: user?.id.value) { (postsBlockArray, error) in
            if let postsUnwrapped=postsBlockArray{
                self.postsArray=postsUnwrapped
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
        
    }

}

extension PostsViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.Posts)! as! PostsTableViewCustomCell
        if !postsArray.isEmpty {
            let post = postsArray[indexPath.row]
            cell.populatePostObject(post)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // segue with sender
    }
}
