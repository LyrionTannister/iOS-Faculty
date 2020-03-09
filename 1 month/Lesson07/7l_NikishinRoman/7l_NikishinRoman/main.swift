//
//  main.swift
//  7l_NikishinRoman
//
//  Created by Admin on 05.03.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//

import Foundation

//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

struct Song {
    let name: String
}

class MusicBox {
    enum PlayError: Error {
        case noSuchGroup
        case notEnoghtCoins(coinsNeeded: Int)
    }
    
    struct Track {
        let cost: Int
        let lenght: Int
        let trackName : Song
    }
    
    private(set) var playlist = [
        "Abba" : Track(cost: 50, lenght: 290, trackName: Song(name: "Sos")),
        "Metallica" : Track(cost: 30, lenght: 543, trackName: Song(name: "One"))
    ]
    
    var deposite: Int = 0
    
    func play(group name: String) throws -> Song? {
        guard let song = playlist[name] else { throw PlayError.noSuchGroup }
        guard song.cost < deposite else { throw PlayError.notEnoghtCoins(coinsNeeded: song.cost - deposite) }
        
        deposite -= song.cost
        print("Играет песня: \(song.trackName.name)")
        return song.trackName
    }
}

let musicBox = MusicBox()
musicBox.deposite = 40

do  {
    try musicBox.play(group: "Abba")
} catch MusicBox.PlayError.noSuchGroup {
    print("Такой группы нет в доступных")
} catch MusicBox.PlayError.notEnoghtCoins(let coinsNeeded) {
    print("Для прослушивания песни довнесите \(coinsNeeded) монет")
}

//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
enum StackError: Error {
    case noMoreItems
}

class Stack {
    private var elements: [Int] = []
    
    func addToStack(_ element: Int){
        elements.append(element)
    }
    
    func removeFromStack() -> (Int?,StackError?) {
        guard elements.isEmpty == false else { return (nil, .noMoreItems) }
        return (elements.removeFirst(), nil)
    }
}

let intStack  = Stack()
intStack.addToStack(10)

print("\(intStack.removeFromStack())")
print("\(intStack.removeFromStack())")
