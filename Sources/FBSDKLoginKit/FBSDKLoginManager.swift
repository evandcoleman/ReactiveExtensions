//
//  ReactiveExtensions
//  Copyright © 2017 Evan Coleman. All rights reserved.
//

import FBSDKLoginKit
import ReactiveSwift

extension Reactive where Base: FBSDKLoginManager {
    /// A signal that logs the user in or authorizes additional permissions. Sends the result.
    ///
    /// - parameters:
    ///   - permissions: the optional array of permissions. Note this is converted to NSSet and is only
    ///    an NSArray for the convenience of literal syntax.
    ///    - fromViewController: the view controller to present from. If nil, the topmost view controller will be
    ///    automatically determined as best as possible.
    ///
    public func logIn(withReadPermissions permissions: [String], from fromViewController: UIViewController) -> SignalProducer<FBSDKLoginManagerLoginResult?, NSError> {
        return SignalProducer { observer, disposable in
            self.base.logIn(withReadPermissions: permissions, from: fromViewController) { result, error in
                if let error = error {
                    observer.send(error: error as NSError)
                } else {
                    observer.send(value: result)
                    observer.sendCompleted()
                }
            }
        }
    }
    
    /// A signal that logs the user in or authorizes additional permissions. Sends the result.
    ///
    /// - parameters:
    ///   - permissions: the optional array of permissions. Note this is converted to NSSet and is only
    ///    an NSArray for the convenience of literal syntax.
    ///    - fromViewController: the view controller to present from. If nil, the topmost view controller will be
    ///    automatically determined as best as possible.
    ///
    public func logIn(withPublishPermissions permissions: [String], from fromViewController: UIViewController) -> SignalProducer<FBSDKLoginManagerLoginResult?, NSError> {
        return SignalProducer { observer, disposable in
            self.base.logIn(withPublishPermissions: permissions, from: fromViewController) { result, error in
                if let error = error {
                    observer.send(error: error as NSError)
                } else {
                    observer.send(value: result)
                    observer.sendCompleted()
                }
            }
        }
    }
}
