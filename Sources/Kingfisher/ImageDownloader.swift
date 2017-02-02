//
//  ReactiveExtensions
//  Copyright © 2017 Evan Coleman. All rights reserved.
//

import Kingfisher
import ReactiveSwift

extension ImageDownloader: ReactiveExtensionsProvider { }

extension Reactive where Base: ImageDownloader {
     /// A signal that downloads an image with a URL.
     ///
     /// - parameters:
     ///   - url: The target URL
     ///
    public func downloadImage(with URL: URL) -> SignalProducer<UIImage?, NSError> {
        return SignalProducer { observer, disposable in
            self.base.downloadImage(with: URL, progressBlock: nil) { (image, error, imageURL, originalData) in
                if let e = error {
                    observer.send(error: e)
                } else {
                    observer.send(value: image)
                    observer.sendCompleted()
                }
            }
        }
    }
}
