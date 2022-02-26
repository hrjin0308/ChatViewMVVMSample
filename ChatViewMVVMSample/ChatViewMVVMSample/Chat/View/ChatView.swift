//
//  ChatView.swift
//  ChatViewMVVMSample
//
//  Created by 진혜림 on 2022/02/26.
//

import UIKit

class ChatView: UIView {
  
  // MARK: - UI
  
  let collectionView = UICollectionView()
  var collectionViewLayout: UICollectionViewLayout {
    set {
      collectionView.collectionViewLayout = newValue
    }
    get {
      return collectionView.collectionViewLayout
    }
  }
  
}
