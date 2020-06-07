//
//  SKScrollControl.swift
//  SeanKit
//
//  Created by Sean Li on 6/6/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI

/*
 Implementation:
 
 Make a SwiftUI List whose List content offset can be controlled.
 
 - Add `private let proxy = SKScrollControlProxy()` to the View struct.
 - On each of the List's components, add `.background(SKScrollControlHelper(proxy: proxy))`
 - To use it run the functions inside proxy to control the List.
 
 */


@available(iOS 13,*)
public struct SKScrollControlHelper: UIViewRepresentable {
    
    let proxy: SKScrollControlProxy // reference type
    
    public init(proxy: SKScrollControlProxy) {
        self.proxy = proxy
    }
    
    public func makeUIView(context: Context) -> UIView {
        return UIView() // managed by SwiftUI, no overloads
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        proxy.catchScrollView(for: uiView) // here UIView is in view hierarchy
    }
}


@available(iOS 13,*)
public class SKScrollControlProxy {
    
    public init(isUserInteractionEnabled: Bool) {
        self.isUserInteractionEnabled = isUserInteractionEnabled
    }
    
    let isUserInteractionEnabled: Bool
    
    public enum Action {
        case end
        case top
        case point(point: CGPoint)
        case offset(point: CGPoint, listHeight: CGFloat)
        case item(item: Int, cellHeight: CGFloat, position: ItemPosition)
    }
    
    public enum ItemPosition {
        case bottom
        case top
    }
    
    private var scrollView: UIScrollView?
    
    public func catchScrollView(for view: UIView) {
        if nil == scrollView {
            scrollView = view.enclosingScrollView()
        }
    }
    
    public func scrollTo(_ action: Action, animated: Bool) {
        if let scroller = scrollView {
            scroller.isUserInteractionEnabled = isUserInteractionEnabled
            var rect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
            switch action {
                
            case .offset(let point, let height):
                // offset the current scroll offset
                var newOffset = scroller.contentOffset
                newOffset.y += point.y
                if newOffset.y < 1 {
                    newOffset.y = 1
                }
                let maxHeight = scroller.contentSize.height - height - 1
                if newOffset.y > maxHeight {
                    newOffset.y = maxHeight
                }
                scroller.setContentOffset(newOffset, animated: animated)
                
            case .item(let item, let cellHeight, let pos):
                // scroll to the item, putting it at either the top or bottom of the list frame
                var offset = CGPoint.zero
                switch pos {
                case .top:
                    offset.y = cellHeight * CGFloat(item)
                case .bottom:
                    offset.y = (cellHeight * CGFloat(item)) - (cellHeight * 3)
                }
                scroller.setContentOffset(offset, animated: animated)
                
            case .end:
                // scroll to the end
                rect.origin.y = scroller.contentSize.height +
                    scroller.contentInset.bottom + scroller.contentInset.top - 1
                scroller.scrollRectToVisible(rect, animated: animated)
            case .point(let point):
                // scroll to a point
                rect.origin.y = point.y
                scroller.scrollRectToVisible(rect, animated: animated)
            default: {
                // default goes to top
                scroller.scrollRectToVisible(rect, animated: animated)
            }()
            }
        }
    }
}



private extension UIView {
    func enclosingScrollView() -> UIScrollView? {
        var next: UIView? = self
        repeat {
            next = next?.superview
            if let scrollview = next as? UIScrollView {
                return scrollview
            }
        } while next != nil
        return nil
    }
}
