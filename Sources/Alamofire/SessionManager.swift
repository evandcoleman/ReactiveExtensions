//
//  ReactiveExtensions
//  Copyright © 2017 Evan Coleman. All rights reserved.
//

import Alamofire
import ReactiveSwift

extension SessionManager: ReactiveExtensionsProvider { }

extension Reactive where Base: SessionManager {
    /// A signal that sends a multipart DataRequest.
    public func upload(_ request: URLRequestConvertible, _ multipartFormData: @escaping (MultipartFormData) -> Void) -> SignalProducer<DataRequest, NSError> {
        return SignalProducer { observer, disposable in
            self.base.upload(multipartFormData: multipartFormData, with: request) { result in
                switch result {
                case let .success(request, _, _):
                    observer.send(value: request)
                    observer.sendCompleted()
                case let .failure(error):
                    observer.send(error: error as NSError)
                }
            }
        }
    }
}
