//
//  LevelData.swift
//  ManBox
//
//  Created by Таня on 21.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

struct Level {
    let roomWidth :Int
    let roomHeight : Int
    let startManPosition : Point
    let startBoxPosition : Point
    let winPosition : Point
    let blocks : Set<Point>
}

let blocksAtLevel1 : Set<Point> = [Point(x: 2, y: 1), Point(x: 4, y: 3), Point(x: 1, y: 0), Point(x: 1, y: 3)]
var level1 = Level(roomWidth: 5, roomHeight: 5, startManPosition: Point(x: 0, y: 0), startBoxPosition: Point(x: 2, y: 3), winPosition: Point(x: 4, y: 4), blocks: blocksAtLevel1)
