//
//  UserData.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/21.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI
import Combine

final class UserData:ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
