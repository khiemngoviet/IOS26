class SShape:Shape {
    /*
    
    Orientation 0
    
    | 0•|
    | 1 | 2 |
        | 3 |
    
    Orientation 90
    
      • | 1 | 0 |
    | 3 | 2 |
    
    Orientation 180
    
    | 0•|
    | 1 | 2 |
        | 3 |
    
    Orientation 270
    
      • | 1 | 0 |
    | 3 | 2 |
    
    • marks the row/column indicator for the shape
    
    */
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [(0, 0), (0, 1), (1, 1), (1, 2)],
            Orient.right:     [(2, 0), (1, 0), (1, 1), (0, 1)],
            Orient.bottom:  [(0, 0), (0, 1), (1, 1), (1, 2)],
            Orient.left: [(2, 0), (1, 0), (1, 1), (0, 1)]
        ]
    }
    
   
}
