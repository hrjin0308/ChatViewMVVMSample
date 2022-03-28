//
//  ChatListViewModel.swift
//  ChatViewMVVMSample
//
//  Created by 진혜림 on 2022/03/28.
//

import UIKit
import Kingfisher

class ChatListViewModel: NSObject {
  let cellData: [ChatData]
  
  init(cellData: [ChatData]) {
    self.cellData = cellData
  }
}

/*
 Note.
 UICollectionView 관련 함수들을
 VC에 넣을지 ViewModel에 넣을지 되게 애매함..
 이래서 rx랑 같이 쓰면 좋다는거구먼
 */

// MARK: - UICollectionViewDataSource

extension ChatListViewModel: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cellData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCell", for: indexPath) as? ChatListCell else {
      return UICollectionViewCell()
    }
    
    let data = cellData[indexPath.row]
    cell.nameLabel.text = data.sender.name
    cell.textView.text = data.content.text
    cell.avatarImageView.kf.setImage(with: URL(string: data.sender.imgURL))
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ChatListViewModel: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let data = cellData[indexPath.row]
    return CGSize(
      width: UIScreen.main.bounds.width,
      height: CellSizeCalculator.textCellSize(
        text: data.content.text ?? ""
      ).height
    )
  }
}


