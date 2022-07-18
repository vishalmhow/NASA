//
//  Vishal22 Sharma on 17/07/22.
//

import XCTest
@testable import NASA

internal class NASADownloadServiceTest: XCTestCase {
    private var sut: NASADownloadService!
    
    override func setUp() {
        sut = NASADownloadService()
    }
    
    func testRunDownload() {
        XCTAssertNoThrow(sut.runDownload(date: Date().addingTimeInterval(-1 * 60 * 60 * 24), queryType: .pictureOfTheDay, completion: { data in }))
    }
}
