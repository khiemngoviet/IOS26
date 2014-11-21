class JShape:Shape {
    /*
    
    Orientation 0
    
      • | 0 |
        | 1 |
    | 3 | 2 |
    
    Orientation 90
    
    | 3•|
    | 2 | 1 | 0 |
    
    Orientation 180
    
    | 2•| 3 |
    | 1 |
    | 0 |
    
    Orientation 270
    
    | 0•| 1 | 2 |
            | 3 |
    
    • marks the row/column indicator for the shape
    
    Pivots about `1`
    
    */
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [(1, 0), (1, 1),  (1, 2),  (0, 2)],
            Orient.right:     [(2, 1), (1, 1),  (0, 1),  (0, 0)],
            Orient.bottom:  [(0, 2), (0, 1),  (0, 0),  (1, 0)],
            Orient.left: [(0, 0), (1, 0),  (2, 0),  (2, 1)]
        ]
    }

}
