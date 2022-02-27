//
//  ChatCell.swift
//  ChatViewMVVMSample
//
//  Created by 진혜림 on 2022/02/27.
//

import UIKit
import Then

class ChatCell: UICollectionViewCell {
  let avatarImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
  }
  let nameLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    $0.textColor = UIColor.label
    $0.numberOfLines = 1
  }
  // FIXME: 따로 chatContentView로 분리할 예정
  let textView = UITextView().then {
    $0.textContainerInset = .zero
    $0.textContainer.lineFragmentPadding = 0.0
    $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    $0.textColor = UIColor.label
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  private func layout() {
    [avatarImageView, nameLabel, textView].forEach {
      self.contentView.addSubview($0)
    }
    
    avatarImageView.snp.makeConstraints { make in
      make.width.height.equalTo(46.0)
      make.leading.equalToSuperview().inset(14.0)
      make.top.equalToSuperview().inset(10.0)
//      make.bottom.greaterThanOrEqualToSuperview().inset(10.0)
    }
    
    nameLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(74.0)
      make.top.equalToSuperview().inset(10.0)
    }

    textView.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(74.0)
      make.top.equalToSuperview().inset(35.0)
      make.trailing.equalToSuperview().inset(14.0)
      make.bottom.equalToSuperview().inset(10.0)
    }
  }
  
  func setData(_ data: ChatData) {
    nameLabel.text = data.sender.name
    textView.text = data.content.text
  }
}
