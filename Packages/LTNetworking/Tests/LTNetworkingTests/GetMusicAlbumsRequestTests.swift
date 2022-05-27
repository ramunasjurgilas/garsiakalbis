import XCTest
import Combine
@testable import LTNetworking


final class GetMusicAlbumsRequestTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func testGetMusicAlbums_ok() throws {
        let expect = XCTestExpectation()
        let session = URLSession.shared
        #warning("Mock data, that real API endpoint would not be executed. Most of the time using OHTTPStub lib or using url session configuration with protocolClasses.")
        GetMusicAlbumsRequest(urlSession: session).exe()
            .sink(receiveValue: { result in
                switch result {
                case .success(let items):
                    XCTAssertNotNil(items)
                case .failure(let error):
                    XCTAssertNil(error, "Shoudl not generate an error")
                }
                expect.fulfill()
            })
            .store(in: &cancellables)
        wait(for: [expect], timeout: 10)
    }
}
