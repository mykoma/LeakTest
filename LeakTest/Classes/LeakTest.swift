
//
//  File.swift
//  LeakDemoTests
//
//  Created by Gang on 2018/8/18.
//  Copyright © 2018年 Gang. All rights reserved.
//

import Quick
import Nimble

public class LeakContainer {
    weak var testObject: AnyObject?
}

public struct Leak {
    public static let Value = "Value"
    public enum CheckType: String {
        case Object
        case View
        case ViewController
    }
}

class SharedExamplesConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples(Leak.CheckType.Object.rawValue) { (sharedExampleContext: @escaping SharedExampleContext) in
            context("A Object without strong ref", {
                it("Should be nil", closure: {
                    let container = LeakContainer()
                    autoreleasepool(invoking: {
                        var testObject: AnyObject? = sharedExampleContext()[Leak.Value] as AnyObject
                        guard testObject != nil else {
                            expect(false).to(beTrue())
                            return
                        }
                        container.testObject = testObject
                        testObject = nil
                    })
                    expect(container.testObject).toEventually(beNil(), timeout: 3)
                })
            })
        }
        
        sharedExamples(Leak.CheckType.View.rawValue) { (sharedExampleContext: @escaping SharedExampleContext) in
            context("A View without strong ref", {
                it("Should be nil", closure: {
                    let container = LeakContainer()
                    autoreleasepool(invoking: {
                        var testView = sharedExampleContext()[Leak.Value] as? UIView
                        guard let tView = testView else {
                            expect(false).to(beTrue())
                            return
                        }
                        var window: UIWindow? = UIWindow.init(frame: UIScreen.main.bounds)
                        window?.makeKeyAndVisible()
                        window?.addSubview(tView)
                        container.testObject = testView
                        testView = nil
                        window = nil
                    })
                    expect(container.testObject).toEventually(beNil(), timeout: 3)
                })
            })
        }
        
        sharedExamples(Leak.CheckType.ViewController.rawValue) { (sharedExampleContext: @escaping SharedExampleContext) in
            context("A ViewController without strong ref", {
                it("Should be nil", closure: {
                    let container = LeakContainer()
                    autoreleasepool(invoking: {
                        var testVC = sharedExampleContext()[Leak.Value] as? UIViewController
                        guard let tVC = testVC else {
                            expect(false).to(beTrue())
                            return
                        }
                        var window: UIWindow? = UIWindow.init(frame: UIScreen.main.bounds)
                        window?.makeKeyAndVisible()
                        window?.rootViewController = tVC
                        container.testObject = testVC
                        testVC = nil
                        window = nil
                    })
                    expect(container.testObject).toEventually(beNil(), timeout: 3)
                })
            })
        }
    }
}
