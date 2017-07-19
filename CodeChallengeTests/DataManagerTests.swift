import XCTest
@testable import CodeChallenge

class DataManagerTests: XCTestCase {
    
    var dataManager : DataManager?
    
    override func setUp() {
        super.setUp()
        dataManager = DataManager()

        let realm = RealmProvider.realm()
        try! realm?.write { () -> Void in
            realm?.deleteAll()
        }
        // add dummy data to database
    }
    
    func testUsersFetch() {
        
        let exceptionDesc: XCTestExpectation = self.expectation(description: "exception")
        
        dataManager?.fetchUsersData(.users, { (usersArray, dataError) in
            // 1. Non empty result
            XCTAssertTrue(usersArray?.count == 10)
            
            // Not Nil
            XCTAssertNotNil(usersArray?[0])
            
            // first object Data testing
            let firstObject = usersArray?[0]
            
            XCTAssertEqual(firstObject?.username, "Bret")
            
            XCTAssertEqual(firstObject?.id.value, 1)
            
            XCTAssertEqual(firstObject?.email, "Sincere@april.biz")
            
            exceptionDesc.fulfill()
        })
        
        
        self.waitForExpectations(timeout: 100) { (error) in
            XCTAssertNil(error, "Some error occured")
        }
    }
    
    func testPostsFetch() {
        
        let exceptionDesc: XCTestExpectation = self.expectation(description: "exception")
        
        
        dataManager?.fetchPostsData(.posts, userID:1, { (postsArray, dataError) in
            // 1. Non empty result
            XCTAssertTrue(postsArray?.count == 10)
            
            // Not Nil
            XCTAssertNotNil(postsArray?[0])
            
            // first object Data testing
            let firstObject = postsArray?[0]
            
            XCTAssertEqual(firstObject?.id.value, 1)
            
            XCTAssertEqual(firstObject?.userId.value, 1)
            
            XCTAssertEqual(firstObject?.title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
            
            exceptionDesc.fulfill()
        })
        
        
        self.waitForExpectations(timeout: 20) { (error) in
            XCTAssertNil(error)
        }
    }

    
}
