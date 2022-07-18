//
//  Vishal22 Sharma on 17/07/22.
//

import XCTest
@testable import NASA

internal class DateFactoryImplTest: XCTestCase {
    private var sut: DateFactoryImpl!
    
    override func setUp() {
        sut = DateFactoryImpl()
    }
    
    func testCreateDate() {
        XCTAssertNoThrow(sut.create(year: 2019, month: 05, day: 05))
    }
}
