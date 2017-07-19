import Foundation
import UIKit

class PostsTableViewCustomCell: UITableViewCell {
    
    @IBOutlet var postTitleLabel : UILabel!
    @IBOutlet var postBodyLabel  : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    open func populatePostObject(_ postObj : PostModel)  {
        postTitleLabel.text  = postObj.title
        postBodyLabel.text   = postObj.body
    }
    
}
