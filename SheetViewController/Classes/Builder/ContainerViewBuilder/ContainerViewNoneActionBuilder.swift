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

//MARK: - NoneContainerConfigurationBuilder
class NoneContainerConfigurationBuilder: ContainerConfigurationBuilder {
  static func create(with type: SheetAlignmentType) -> SheetContainerConfiguration {
    switch type {
    case .center:
      var configuration = ContainerConfiguration.default
//      configuration.contentCornerRadius = 12
      return configuration
    case .bottom:
      var configuration = ContainerConfiguration.default
      configuration.outerSpacing = CGSize(width: 8, height: 24)
//      configuration.contentCornerRadius = 12
      return configuration
    }
  }
}

//MARK: - ContainerViewNoneActionBuilder class
class ContainerViewNoneActionBuilder: ContainerViewBuilder {
  //MARK: properties
  private let configuration: SheetContainerConfiguration
  
  var parent: UIView
  
  var headerTitle: String?
  var headerMessage: String?
  var actionTitle: String?
  
  var alignmentType: SheetAlignmentType = .bottom
  
  //MARK: inits
  internal required init(parent: UIView, configuration: SheetContainerConfiguration) {
    self.parent = parent
    self.configuration = configuration
  }
  
  //MARK: methods
  @discardableResult
  func create() -> ContainerView {
    switch alignmentType {
    case .center:
      let builder = ContainerCenterViewNoneActionBuilder(
        parent: parent,
        configuration: configuration)
      builder.headerTitle = headerTitle
      builder.headerMessage = headerMessage
      builder.actionTitle = actionTitle
      return builder.create()
    case .bottom:
      let builder = ContainerBottomViewNoneActionBuilder(
        parent: parent,
        configuration: configuration)
      builder.headerTitle = headerTitle
      builder.headerMessage = headerMessage
      builder.actionTitle = actionTitle
      return builder.create()
    }
  }
}

//MARK: - ContainerCenterViewNoneActionBuilder class
class ContainerCenterViewNoneActionBuilder: ContainerViewBuilder {
  //MARK: properties
  private let configuration: SheetContainerConfiguration
  
  var parent: UIView
  
  var headerTitle: String?
  var headerMessage: String?
  var actionTitle: String?
  var isSeparately: Bool?
  
  //MARK: inits
  internal required init(parent: UIView, configuration: SheetContainerConfiguration) {
    self.parent = parent
    self.configuration = configuration
  }
  
  //MARK: methods
  @discardableResult
  func create() -> ContainerView {
    let container = SheetContainerView(frame: .zero)
    parent.addSubview(container)
    container.backgroundColor = configuration.backgroundColor
    container.layer.cornerRadius = configuration.containerCornerRadius
    container.layer.masksToBounds = true
    container.translatesAutoresizingMaskIntoConstraints = false
    
    container.rightAnchor.constraint(
      equalTo: parent.rightAnchor,
      constant: -configuration.outerSpacing.width
      ).isActive = true
    
    container.leftAnchor.constraint(
      equalTo: parent.leftAnchor,
      constant: configuration.outerSpacing.width
      ).isActive = true
    
    container.topAnchor.constraint(
      greaterThanOrEqualTo: parent.topAnchor,
      constant: configuration.outerSpacing.height * configuration.portraitTopOuterMultiplier
      ).isActive = true
    
    container.centerXAnchor.constraint(
      equalTo: parent.centerXAnchor
      ).isActive = true
    
    container.centerYAnchor.constraint(
      equalTo: parent.centerYAnchor
      ).isActive = true
    
    let contentViewBuilder = SheetContentViewBuilder(parent: container,
                                                     configuration: configuration)
    contentViewBuilder.headerTitle = headerTitle
    contentViewBuilder.headerMessage = headerMessage
    let content = contentViewBuilder.create()
    
    container.action = nil
    container.content = content
    
    return container
  }
}

//MARK: - ContainerBottomViewNoneActionBuilder class
class ContainerBottomViewNoneActionBuilder: ContainerViewBuilder {
  //MARK: properties
  private let configuration: SheetContainerConfiguration
  
  var parent: UIView
  
  var headerTitle: String?
  var headerMessage: String?
  var actionTitle: String?
  
  //MARK: inits
  internal required init(parent: UIView, configuration: SheetContainerConfiguration) {
    self.parent = parent
    self.configuration = configuration
  }
  
  //MARK: methods
  @discardableResult
  func create() -> ContainerView {
    let container = SheetContainerView(frame: .zero)
    parent.addSubview(container)
    container.backgroundColor = configuration.backgroundColor
    container.layer.cornerRadius = configuration.containerCornerRadius
    container.layer.masksToBounds = true
    container.translatesAutoresizingMaskIntoConstraints = false

    container.rightAnchor.constraint(
      equalTo: parent.rightAnchor,
      constant: -configuration.outerSpacing.width
      ).isActive = true
    
    container.bottomAnchor.constraint(
      equalTo: parent.bottomAnchor,
      constant: -configuration.outerSpacing.height
      ).isActive = true
    
    container.leftAnchor.constraint(
      equalTo: parent.leftAnchor,
      constant: configuration.outerSpacing.width
      ).isActive = true
    
    container.topAnchor.constraint(
      greaterThanOrEqualTo: parent.topAnchor,
      constant: configuration.outerSpacing.height * configuration.portraitTopOuterMultiplier
      ).isActive = true
    
    let contentViewBuilder = SheetContentViewBuilder(parent: container,
                                                     configuration: configuration)
    contentViewBuilder.headerTitle = headerTitle
    contentViewBuilder.headerMessage = headerMessage
    let content = contentViewBuilder.create()
    
    container.action = nil
    container.content = content
    
    return container
  }
}
