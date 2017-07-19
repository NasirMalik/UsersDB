import Foundation
import UIKit

class UsersTableViewCustomCell: UITableViewCell {
    
    @IBOutlet var nameLabel     : UILabel!
    @IBOutlet var userNameLabel : UILabel!
    @IBOutlet var emailLabel    : UILabel!
    @IBOutlet var addressLabel  : UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    open func populateReceiepeObject(_ userObj : UserModel)  {
        nameLabel.text      = userObj.name
        userNameLabel.text  = userObj.username
        emailLabel.text     = userObj.email
        addressLabel.text   = userObj.completeAddress()
    }
    
}
