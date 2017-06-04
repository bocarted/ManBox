//
//  LevelData.swift
//  ManBox
//
//  Created by Таня on 21.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

struct LevelStruct {
    let roomWidth :Int
    let roomHeight : Int
    let startManPosition : Position
    let startBoxPosition : Position
    let winPosition : Position
    let blocks : Set<Position>
    let levelDescription : String
}

let blocksAtLevel1 : Set<Position> = [Position(x: 1, y: 0), Position(x: 2, y: 1), Position(x: 2, y: 2)]
let descriptionOfLevel1 = "👸: Honey, bring me 💍!\n" + "😍: I'm on my way!"
let level1 = LevelStruct(roomWidth: 4, roomHeight: 4, startManPosition: Position(x: 0, y: 0), startBoxPosition: Position(x: 1, y: 2), winPosition: Position(x: 3, y: 3), blocks: blocksAtLevel1, levelDescription: descriptionOfLevel1)

let blocksAtLevel2 : Set<Position> = [Position(x: 2, y: 1), Position(x: 4, y: 3), Position(x: 1, y: 0), Position(x: 1, y: 3)]
let descriptionOfLevel2 = "👸: Honey, bring me that Ring!\n" + "😍: I'm on my way!"
let level2 = LevelStruct(roomWidth: 5, roomHeight: 5, startManPosition: Position(x: 0, y: 0), startBoxPosition: Position(x: 2, y: 3), winPosition: Position(x: 4, y: 4), blocks: blocksAtLevel2, levelDescription: descriptionOfLevel2)

