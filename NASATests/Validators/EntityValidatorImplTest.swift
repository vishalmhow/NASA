//
//  Vishal22 Sharma on 17/07/22.
//

import XCTest
@testable import NASA

internal class EntityValidatorImplTest: XCTestCase {
    private var sut: EntityValidatorImpl!
    
    override func setUp() {
        sut = EntityValidatorImpl()
    }
    
    func testValidEntity() {
        let pictureOfTheDay = PictureOfTheDay(date: "2019-01-01", explanation: "Haha", hdurl: "http://abc.pl", media_type: "video", service_version: "1.0", title: "funny title", url: "http://abc.pl")
        XCTAssertNoThrow(sut.validate(pictureOfTheDay))
    }
}
