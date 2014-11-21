class ZShape:Shape {
    /*
    
    Orientation 0
    
      • | 0 |
    | 2 | 1 |
    | 3 |
    
    Orientation 90
    
    | 0 | 1•|
        | 2 | 3 |
    
    Orientation 180
    
      • | 0 |
    | 2 | 1 |
    | 3 |
    
    Orientation 270
    
    | 0 | 1•|
        | 2 | 3 |

    
    • marks the row/column indicator for the shape
    
    */
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [(1, 0), (1, 1), (0, 1), (0, 2)],
            Orient.right:     [(0,0), (1, 0), (1, 1), (2, 1)],
            Orient.bottom:    [(1, 0), (1, 1), (0, 1), (0, 2)],
            Orient.left:      [(0,0), (1, 0), (1, 1), (2, 1)],
        ]
    }
    
    
}
