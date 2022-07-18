//
//  Vishal22 Sharma on 17/07/22.
//

import XCTest
@testable import NASA

internal class URLComponentsProviderImplTest: XCTestCase {
    private var sut: URLComponentsProviderImpl!
    
    override func setUp() {
        sut = URLComponentsProviderImpl()
    }
    
    func testValidProvide() {
        XCTAssertNoThrow(sut.get(queryType: .pictureOfTheDay))
    }
}
