//
//  Vishal22 Sharma on 17/07/22.
//

import XCTest
@testable import NASA

internal class URLSessionValidatorImplTest: XCTestCase {
    private var sut: URLSessionValidatorImpl!
    
    override func setUp() {
        sut = URLSessionValidatorImpl()
    }
    
    func testNoError() {
        XCTAssertNoThrow(sut.validate(error: nil))
    }
    
    func testURLResponse() {
        let httpResponse = HTTPURLResponse(url: URL(string: "http://abc.pl")!, statusCode: 200, httpVersion: "1.1", headerFields: nil)
        XCTAssertNoThrow(sut.validate(urlReponse: httpResponse))
    }
    
    func testData() {
        let data = Data()
        XCTAssertNoThrow(sut.validate(data: data))
    }
}
