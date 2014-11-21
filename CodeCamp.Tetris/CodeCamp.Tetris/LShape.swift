class LShape:Shape {
    /*
    
    Orientation 0
    
        | 0•|
        | 1 |
        | 2 | 3 |
    
    Orientation 90

          •
    | 2 | 1 | 0 |
    | 3 |
    
    Orientation 180
    
    | 3 | 2•|
        | 1 |
        | 0 |
    
    Orientation 270
    
          • | 3 |
    | 0 | 1 | 2 |
    
    • marks the row/column indicator for the shape
    
    Pivots about `1`
    
    */
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [ (0, 0), (0, 1),  (0, 2),  (1, 2)],
            Orient.right:     [ (0, 1), (0, 2),  (1,1), (2, 1)],
            Orient.bottom:  [ (1, 2), (1, 1),  (1, 0),  (0,0)],
            Orient.left: [ (0,1), (1, 1),  (2, 1),   (2,0)]
        ]
    }
    
   
}
