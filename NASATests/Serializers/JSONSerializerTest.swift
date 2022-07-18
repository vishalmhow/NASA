//
//  Vishal22 Sharma on 17/07/22.
//

import XCTest
@testable import NASA

internal class JSONSerializerTest: XCTestCase {
    private var sut: JSONSerializer!
    
    override func setUp() {
        sut = JSONSerializer()
    }
    
    func testDecode() {
        let downloader = NASADownloadService()
        XCTAssertNoThrow(downloader.runDownload(date: Date().addingTimeInterval(-1 * 60 * 60 * 24), queryType: .pictureOfTheDay, completion: { data in
            self.sut.decode(ofType: PictureOfTheDay.self, data: data, completion: { pictureOfTheDay in })
        }))
}
}
