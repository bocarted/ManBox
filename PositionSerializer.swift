//
//  PositionSerializer.swift
//  ManBox
//
//  Created by Tatiana Bocharnikova on 27.06.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation

class PositionSerializer {
    static func serializePosition(_ position: Position) -> Data {
        let codedPosition = CodedPosition(position: position)
        let data = NSKeyedArchiver.archivedData(withRootObject: codedPosition)
        return data
    }
    
    static func deserializePosition(data: Data) -> Position? {
        if let codedPosition = NSKeyedUnarchiver.unarchiveObject(with: data) as? CodedPosition {
            let position = codedPosition.getPosition()
            return position
        } else {
            return nil
        }
    }
    
    static func serializeSetOfPositions(_ positions: Set<Position>) -> Data {
        var codedPositions = Set<CodedPosition>()
        for position in positions {
            codedPositions.insert(CodedPosition(position: position))
        }
        let data = NSKeyedArchiver.archivedData(withRootObject: codedPositions)
        return data
    }
    
    static func deserializeSetOfPositions(data: Data) -> Set<Position>? {
        var positions = Set<Position>()
        if let codedPositions = NSKeyedUnarchiver.unarchiveObject(with: data) as? Set<CodedPosition> {
            for codedPosition in codedPositions {
                let position = codedPosition.getPosition()
                positions.insert(position)
            }
            return positions
        } else {
            return nil
        }
    }
}

fileprivate final class CodedPosition: NSObject {
    var position: Position
    
    init(position: Position) {
        self.position = position
    }
    
    func getPosition() -> Position {
        return position
    }
    
    override var hash: Int {
        return position.hashValue
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let somePosition = object as? CodedPosition {
            return somePosition.hash == self.hash
        } else {
            return false
        }
    }
}

extension CodedPosition: NSCoding {
    
    convenience init(coder aDecoder: NSCoder) {
        let x = aDecoder.decodeInteger(forKey: "x")
        let y = aDecoder.decodeInteger(forKey: "y")
        let position = Position(x: x, y: y)
        self.init(position: position)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(position.x, forKey: "x")
        aCoder.encode(position.y, forKey: "y")
    }
}
