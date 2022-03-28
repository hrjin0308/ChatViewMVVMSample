//
//  CellSizeCalculator.swift
//  ChatViewMVVMSample
//
//  Created by 진혜림 on 2022/03/29.
//

import UIKit

struct CellSizeCalculator {
  static let maxTextWidth: CGFloat = 200.0
  static let textFontSize: CGFloat = 16.0
  
  static func textCellSize(text: String) -> CGSize {
    return CGSize(
      width: UIScreen.main.bounds.width,
      height: textContentHeight(text: text) + 35.0 + 10.0
    )
  }
  
  private static func textContentHeight(text: String) -> CGFloat {
    let attributedText: NSAttributedString
    attributedText = NSAttributedString(string: text, attributes: [.font: UIFont.systemFont(ofSize: textFontSize)])
    let constraintBox = CGSize(width: maxTextWidth, height: .greatestFiniteMagnitude)
    let rect = attributedText.boundingRect(with: constraintBox, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
    return rect.size.height
  }
}
