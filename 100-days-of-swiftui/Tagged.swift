//
//  Tagged.swift
//  100-days-of-swiftui
//
//  Created by Ahmad Yasser on 03/04/2023.
//

import Foundation
import Tagged

struct User {
    let id: Id
    let email: Email
    let address: String

    typealias Id = Tagged<User, Int>
    typealias Email = Tagged<User, String>
}

struct Subscription {
    let id: Int
}
var subscriptions: [Subscription] = []

func fetchSubscription(byId id: Int) -> Subscription? {
    return subscriptions.first(where: { $0.id == id })
}

func x() {
    let user = User(id: 123, email: "", address: "")
    fetchSubscription(byId: Subscription(id: 1).id)
}


