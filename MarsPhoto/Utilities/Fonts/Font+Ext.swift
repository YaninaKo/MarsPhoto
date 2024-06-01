//
//  Font+Ext.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import SwiftUI

extension Text {
    func sfPro(_ style: SFProStyle) -> Text {
        var modifiedText = self

        switch style {
        case .largeTitle:
          modifiedText = modifiedText
            .font(.custom("SF Pro", size: 34))
            .fontWeight(.bold)
        case .title2:
          modifiedText = modifiedText
            .font(.custom("SF Pro", size: 22))
            .fontWeight(.bold)
        case .title:
          modifiedText = modifiedText
            .font(.custom("SF Pro", size: 22))
        case .body2:
          modifiedText = modifiedText
            .font(.custom("SF Pro", size: 17))
            .fontWeight(.bold)
        case .body:
          modifiedText = modifiedText
            .font(.custom("SF Pro", size: 16))
        }

        return modifiedText
      }
}

enum SFProStyle {
  case largeTitle
  case title2
  case title
  case body2
  case body
}
