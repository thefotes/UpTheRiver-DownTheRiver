//
//  GlobalFunctions.swift
//  UpTheRiverDownTheRiver
//
//  Created by Peter Foti on 5/25/18.
//  Copyright © 2018 PeterFoti. All rights reserved.
//

func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.cardValue.intValue == rhs.cardValue.intValue
}


func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.name == rhs.name
}


func >(lhs: Card, rhs: Card) -> Bool {
    return lhs.cardValue.intValue > rhs.cardValue.intValue
}


func <(lhs: Card, rhs: Card) -> Bool {
    return lhs.cardValue.intValue < rhs.cardValue.intValue
}
