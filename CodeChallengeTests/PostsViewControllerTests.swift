import XCTest
@testable import CodeChallenge

class PostsViewControllerTests: XCTestCase {

    var usersViewController: PostsViewController!
    
    override func setUp() {
        
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        usersViewController = storyboard.instantiateViewController(withIdentifier: "PostsViewController") as! PostsViewController
        _ = usersViewController.view
    }
    
    func testTableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(usersViewController.tableView)
    }
    
    func testShouldSetTableViewDataSource() {
        XCTAssertNotNil(usersViewController.tableView.dataSource)
    }
    
    func testShouldSetTableViewDelegate() {
        XCTAssertNotNil(usersViewController.tableView.dataSource)
    }
    
    func testConformsToTableViewDataSourceProtocol() {
        
        XCTAssert(usersViewController.conforms(to: UITableViewDataSource.self))
        
        XCTAssert(usersViewController.responds(to: #selector(usersViewController.numberOfSections(in:))))
        
        XCTAssert(usersViewController.responds(to: #selector(usersViewController.tableView(_:numberOfRowsInSection:))))
        
        XCTAssert(usersViewController.responds(to: #selector(usersViewController.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewUsesCustomCell_RecepiesTableViewCustomCell() {
        
         let firstCell = usersViewController.tableView(usersViewController.tableView, cellForRowAt: IndexPath.init(row: 0, section: 0))
        
        XCTAssert(firstCell is PostsTableViewCustomCell)
    }
    
    func testConformsToTableViewDelegateProtocol() {
        
        XCTAssert(usersViewController.conforms(to: UITableViewDelegate.self))
        
        XCTAssert(usersViewController.responds(to: #selector(usersViewController.tableView(_:didSelectRowAt:))))
    }
    
}
