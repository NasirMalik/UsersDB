import XCTest


class CodeChallengeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUsersTableViewCellPress() {
        XCUIApplication().tables.staticTexts["Kulas Light Apt. 556 Gwenborough 92998-3874"].tap()
    }
}
