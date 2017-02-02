//
//  ReactiveExtensions
//  Copyright © 2017 Evan Coleman. All rights reserved.
//

import Alamofire
import ReactiveSwift

extension DataRequest: ReactiveExtensionsProvider { }

extension Reactive where Base: DataRequest {
    /// A signal that sends the response as a string.
    public func responseString() -> SignalProducer<DataResponse<String>, NSError> {
        return SignalProducer { observer, disposable in
            let request = self.base.responseString { response in
                if let error = response.result.error as? NSError {
                    observer.send(error: error)
                } else {
                    observer.send(value: response)
                    observer.sendCompleted()
                }
            }
            
            disposable += ActionDisposable() {
                request.cancel()
            }
        }
    }
    
    /// A signal that sends the response as a JSON object.
    public func responseJSON() -> SignalProducer<DataResponse<Any>, NSError> {
        return SignalProducer { observer, disposable in
            let request = self.base.responseJSON { response in
                if let error = response.result.error as? NSError {
                    observer.send(error: error)
                } else {
                    observer.send(value: response)
                    observer.sendCompleted()
                }
            }
            
            disposable += ActionDisposable() {
                request.cancel()
            }
        }
    }
    
    /// A signal that sends the response as Data.
    public func responseData() -> SignalProducer<DataResponse<Data>, NSError> {
        return SignalProducer { observer, disposable in
            let request = self.base.responseData { response in
                if let error = response.result.error as? NSError {
                    observer.send(error: error)
                } else {
                    observer.send(value: response)
                    observer.sendCompleted()
                }
            }
            
            disposable += ActionDisposable() {
                request.cancel()
            }
        }
    }
    
    /// A signal that sends the response as a property list object.
    public func responsePropertyList() -> SignalProducer<DataResponse<Any>, NSError> {
        return SignalProducer { observer, disposable in
            let request = self.base.responsePropertyList { response in
                if let error = response.result.error as? NSError {
                    observer.send(error: error)
                } else {
                    observer.send(value: response)
                    observer.sendCompleted()
                }
            }
            
            disposable += ActionDisposable() {
                request.cancel()
            }
        }
    }
    
    /// A signal that sends the response as a property list object.
    public func response() -> SignalProducer<DefaultDataResponse, NSError> {
        return SignalProducer { observer, disposable in
            let request = self.base.response { response in
                if let error = response.error as? NSError {
                    observer.send(error: error)
                } else {
                    observer.send(value: response)
                    observer.sendCompleted()
                }
            }
            
            disposable += ActionDisposable() {
                request.cancel()
            }
        }
    }
}
