//
//  ChatModel.swift
//  ChatViewMVVMSample
//
//  Created by 진혜림 on 2022/03/28.
//

import Foundation

struct ChatModel {
  func fetch() -> [ChatData] {
    // FIXME: 차후 서버 데이터로 변경 필요. 현재 로컬 파일에서 데이터 가져옴
    guard let path = Bundle.main.path(forResource: "chat-data", ofType: "json") else {
      debugPrint("ERROR: Not Found JSON File")
      return []
    }
    
    do {
      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      let chatListDict = try decoder.decode([String: [ChatData]].self, from: data)
      return chatListDict["chatList"] ?? []
    } catch let error {
      debugPrint("ERROR: JSON Deocde Error \(error)")
      return []
    }
  }
}
