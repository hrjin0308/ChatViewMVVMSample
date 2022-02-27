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
  
  let chatView = ChatView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
    $0.register(ChatCell.self, forCellWithReuseIdentifier: "ChatCell")
  }
  
  var viewModel: ChatViewModel!

  deinit {
    print("Deinit \(classForCoder)")
    //viewModel?.end()
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
    attribute()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()   
    
  }
  
  func bind(_ viewModel: ChatViewModel) {
    self.viewModel = viewModel
    
    viewModel.dataDelegate = self
    viewModel.fetch()
  }
  
  private func attribute() {
    view.backgroundColor = .white
    chatView.dataSource = self
    chatView.delegate = self
  }
  
  private func layout() {
    [chatView].forEach { view.addSubview($0) }
    
    chatView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

extension ChatViewController: ChatViewModelDataDelegate {
  func chatViewModel(viewModel: ChatViewModel, didLoad chatList: [ChatData]) {
    // debugPrint(chatList)
    chatView.reloadData()
  }
}

extension ChatViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.chatList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCell", for: indexPath) as? ChatCell else {
      return UICollectionViewCell()
    }
    
    cell.setData(viewModel.chatList[indexPath.row])
    return cell
  }
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(
      width: UIScreen.main.bounds.width,
      height: 80.0
    )
  }
}
