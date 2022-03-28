//
//  ChatViewModel.swift
//  ChatViewMVVMSample
//
//  Created by 진혜림 on 2022/02/26.
//

import UIKit

struct ChatViewModel {
  let chatListViewModel: ChatListViewModel
  
  init(model: ChatModel) {
    chatListViewModel = ChatListViewModel(cellData:  model.fetch())
  }
}
