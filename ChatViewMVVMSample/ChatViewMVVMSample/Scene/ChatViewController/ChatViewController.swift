//
//  ChatViewController.swift
//  ChatViewMVVMSample
//
//  Created by 진혜림 on 2022/02/26.
//

import UIKit
import SnapKit
import Then

class ChatViewController: UIViewController {
  
  let chatView = ChatListView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout()
  ).then {
    $0.register(
      ChatListCell.self,
      forCellWithReuseIdentifier: "ChatListCell"
    )
  }
  
  var viewModel: ChatViewModel!

  deinit {
    print("Deinit \(classForCoder)")
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
    attribute()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func bind(_ viewModel: ChatViewModel) {
    self.viewModel = viewModel
    
    self.chatView.bind(viewModel.chatListViewModel)
  }
  
  private func attribute() {
    view.backgroundColor = .white
    self.title = "채팅방"
  }
  
  private func layout() {
    [chatView].forEach { view.addSubview($0) }
    
    chatView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
