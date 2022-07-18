//
//  Vishal22 Sharma on 17/07/22.
//

import XCTest
@testable import NASA

internal class URLFactoryImplTest: XCTestCase {
    private var sut: URLFactoryImpl!
    
    override func setUp() {
        sut = URLFactoryImpl()
    }
    
    func testCreateRequestUrlItems() {
        XCTAssertNoThrow(sut.createRequest(queryType: .pictureOfTheDay, date: Date()))
    }
    
    func testCreateRequestLink() {
        let link = "http://abc.pl"
        XCTAssertNoThrow(sut.createRequest(link: link))
    }
}
