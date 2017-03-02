//
//  ReactiveExtensions
//  Copyright © 2017 Evan Coleman. All rights reserved.
//

import Eureka
import ReactiveSwift
import Result

private var lifetimeKey: UInt8 = 0
private var lifetimeTokenKey: UInt8 = 0

extension BaseRow: ReactiveExtensionsProvider { }

extension Reactive where Base: BaseRow {
    public var disabled: BindingTarget<Condition> {
        return BindingTarget(on: UIScheduler(), lifetime: lifetime) { [weak base = self.base] value in
            base?.disabled = value
            base?.evaluateDisabled()
        }
    }
}

extension Reactive where Base: BaseRow, Base: RowType {
    public var value: BindingTarget<Base.Cell.Value?> {
        return BindingTarget(on: UIScheduler(), lifetime: lifetime) { [weak base = self.base] value in
            base?.value = value
            base?.updateCell()
        }
    }
    
    public var title: BindingTarget<String?> {
        return BindingTarget(on: UIScheduler(), lifetime: lifetime) { [weak base = self.base] value in
            base?.title = value
            base?.updateCell()
        }
    }
}

extension Reactive where Base: BaseRow, Base: FieldRowConformance {
    public var placeholder: BindingTarget<String?> {
        return BindingTarget(on: UIScheduler(), lifetime: lifetime) { [weak base = self.base] value in
            base?.placeholder = value
            base?.updateCell()
        }
    }
}

extension BaseRow {
    fileprivate func synchronized<Result>(execute: () throws -> Result) rethrows -> Result {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        return try execute()
    }
}

extension Reactive where Base: BaseRow {
    @nonobjc internal var lifetime: Lifetime {
        return base.synchronized {
            if let lifetime = objc_getAssociatedObject(base, &lifetimeKey) as! Lifetime? {
                return lifetime
            }
            
            let token = Lifetime.Token()
            let lifetime = Lifetime(token)
            
            objc_setAssociatedObject(base, &lifetimeTokenKey, token, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            objc_setAssociatedObject(base, &lifetimeKey, lifetime, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            return lifetime
        }
    }
}
