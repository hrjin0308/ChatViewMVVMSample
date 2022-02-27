//
//  ChatView.swift
//  ChatViewMVVMSample
//
//  Created by 진혜림 on 2022/02/27.
//

import UIKit

class ChatView: UICollectionView {

  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    
    attribute()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func attribute() {
    self.alwaysBounceVertical = true
    self.backgroundColor = UIColor.clear
    self.keyboardDismissMode = .interactive
    self.showsVerticalScrollIndicator = true
    self.showsHorizontalScrollIndicator = false
    self.autoresizingMask = .flexibleBottomMargin
  }
}
