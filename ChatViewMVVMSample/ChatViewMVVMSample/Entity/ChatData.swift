//
//  ChatData.swift
//  ChatViewMVVMSample
//
//  Created by 진혜림 on 2022/02/26.
//

import Foundation

// 채팅 메시지 타입
enum ChatType: Int {
  case text = 1
}

// 채팅 메시지
struct ChatData: Codable {
  let chatId: Int
  let content: ChatContent
  let sender: User
  let time: Date
}

// 채팅 메시지 내용
struct ChatContent: Codable {
  let text: String?
}
