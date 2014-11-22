class JShape:Shape {
  
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [(1, 0), (1, 1),  (1, 2),  (0, 2)],
            Orient.right:     [(2, 1), (1, 1),  (0, 1),  (0, 0)],
            Orient.bottom:  [(0, 2), (0, 1),  (0, 0),  (1, 0)],
            Orient.left: [(0, 0), (1, 0),  (2, 0),  (2, 1)]
        ]
    }

}
