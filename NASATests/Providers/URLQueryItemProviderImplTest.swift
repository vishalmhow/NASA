//
//  Vishal22 Sharma on 17/07/22.
//

import XCTest
@testable import NASA

internal class URLQueryItemProviderImplTest: XCTestCase {
    private var sut: URLQueryItemProviderImpl!
    
    override func setUp() {
        sut = URLQueryItemProviderImpl()
    }
    
    func testGetAuthenticationItem() {
        XCTAssertNoThrow(sut.getAuthenticationItem())
    }
    
    func testProperQueryItems() {
        XCTAssertNoThrow(sut.get(queryType: .pictureOfTheDay, date: Date()))
    }
}
