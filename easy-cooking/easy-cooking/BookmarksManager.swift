//
//  BookmarksManager.swift
//  easy-cooking
//
//  Created by kanayachi on 2017/06/07.
//  Copyright © 2017年 Kota Watanabe. All rights reserved.
//

import Foundation

class BookmarksManager{
    
    var bookmarks:[RecipeidWithTitle] = []
    
    func getBookmarks(bookmarksArray: [String]) -> [RecipeidWithTitle]{
        for bookmarkString in bookmarksArray {
            bookmarks.append(RecipeidWithTitle(recipeidWithTitle: bookmarkString))
        }
        
        return bookmarks
    }
    
}
