//
//  ReactiveExtensions
//  Copyright © 2017 Evan Coleman. All rights reserved.
//

import FBSDKCoreKit
import ReactiveSwift

extension Reactive where Base: FBSDKGraphRequest {
    /// A signal that starts the request and sends the response.
    public func start() -> SignalProducer<Any?, NSError> {
        return SignalProducer { observer, disposable in
            let connection = self.base.start { connection, result, error in
                if let error = error {
                    observer.send(error: error as NSError)
                } else {
                    observer.send(value: result)
                    observer.sendCompleted()
                }
            }
            
            disposable += ActionDisposable {
                connection?.cancel()
            }
        }
    }
}
