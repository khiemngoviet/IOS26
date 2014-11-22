class ZShape:Shape {
   
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [(1, 0), (1, 1), (0, 1), (0, 2)],
            Orient.right:     [(0,0), (1, 0), (1, 1), (2, 1)],
            Orient.bottom:    [(1, 0), (1, 1), (0, 1), (0, 2)],
            Orient.left:      [(0,0), (1, 0), (1, 1), (2, 1)],
        ]
    }
    
    
}
