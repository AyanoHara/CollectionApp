//
//  MyData.swift
//  CollectionApp
//
//  Created by AYANO HARA on 2021/04/04.
//

import Foundation

enum categoryType: Int, CaseIterable {
    case anime
    case jpMovie
    case westernMovie
    
    var categoryTitle: String {
        switch self {
        case .anime: return "アニメ"
        case .jpMovie: return "邦画"
        case .westernMovie: return "洋画"
        }
    }
    
    var movies: [String] {
        switch self {
        case .anime: return ["ハウルの動く城", "鬼滅の刃", "ハイキュー", "僕のヒーローアカデミア"]
        case .jpMovie: return["るろうに剣心", "カイジ", "図書館戦争"]
        case .westernMovie: return ["ワイルドスピード", "トップガン"]
        }
    }
}

struct Characters {
    static let anime: [[String]] = [["ハウル"], ["冨岡義勇", "胡蝶しのぶ"], ["木兎さん"], ["梅雨ちゃん"]]
    static let images: [[String]] = [["hauru"], ["tomiokagiyu", "kochoshinobu"], ["bokutosan"], ["tuyuchan"]]
}
