// MIT License
//
// Copyright (c) 2019 Anton Yereshchenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public struct ContainerConfiguration: SheetContainerConfiguration {
  public var outerSpacing: CGSize = .zero
  
  public var portraitTopOuterMultiplier: CGFloat = .zero
  public var landscapeHorizontalOuterDivider: CGFloat = 1 {
    didSet {
      if landscapeHorizontalOuterDivider == .zero {
        landscapeHorizontalOuterDivider = 1
      }
    }
  }

  public var headerVerticalSpacing: CGFloat = .zero
  
  public var outerHeaderTopSpacing: CGFloat = .zero
  
  public var innerContentSpacing: CGSize = .zero
  public var innerHeaderSpacing: CGSize = .zero
  public var innerActionSpacing: CGSize = .zero
  
  public var actionHeight: CGFloat = .zero
  
  public var containerCornerRadius: CGFloat = .zero
  public var contentCornerRadius: CGFloat = .zero
  public var actionCornerRadius: CGFloat = .zero
  
  public var backgroundColor: UIColor = .white
  public var headerTextColor: UIColor = .black
  public var messageTextColor: UIColor = .black
  public var actionBackgroundColor: UIColor = .white
  public var actionTextColor: UIColor = .black
  public var transitionBackgroundColor: UIColor = .black.withAlphaComponent(0.6)
  
  public var headerSeparatorLineShowed: Bool = false
  public var isSeparatorLineShowed: Bool = true
  public var separatorColor: UIColor = .separator
  
  // MARK: Font
  public var headerTextFont: UIFont = .systemFont(ofSize: 16, weight: .semibold)
  public var messageTextFont: UIFont = .systemFont(ofSize: 12)
  public var actionTextFont: UIFont = .systemFont(ofSize: 16, weight: .medium)
  
  // MARK: Alignment
  public var headerTextAlignment: NSTextAlignment = .center
  public var messageTextAlignment: NSTextAlignment = .center
  
  // MARK: Init
  public init() {
    
  }
  
  public static var `default`: SheetContainerConfiguration {
    var configuration = Self()
//    configuration.outerSpacing = CGSize(width: 18, height: 24)
    configuration.portraitTopOuterMultiplier = 4
    configuration.landscapeHorizontalOuterDivider = 5
//    configuration.headerVerticalSpacing = 8
//    configuration.innerContentSpacing = CGSize(width: 0, height: 8)
    configuration.innerHeaderSpacing = CGSize(width: 20, height: 10)
//    configuration.innerActionSpacing = CGSize(width: 16, height: 16)
    configuration.actionHeight = 48
    configuration.containerCornerRadius = 12
//    configuration.contentCornerRadius = 0
//    configuration.actionCornerRadius = 12
//    configuration.headerTextColor = .systemGray
//    configuration.backgroundColor = .systemBackground
//    configuration.actionBackgroundColor = .orange
//    configuration.actionTextColor = .white
//    configuration.actionTextFont = .systemFont(ofSize: 16, weight: .medium)
//    configuration.transitionBackgroundColor = UIColor.black.withAlphaComponent(0.64)
//    configuration.isSeparatorLineShowed = true
//    configuration.separatorColor = .separator
    return configuration
  }
}
