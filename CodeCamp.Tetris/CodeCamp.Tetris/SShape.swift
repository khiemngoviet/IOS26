class SShape:Shape {

    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [(0, 0), (0, 1), (1, 1), (1, 2)],
            Orient.right:     [(2, 0), (1, 0), (1, 1), (0, 1)],
            Orient.bottom:  [(0, 0), (0, 1), (1, 1), (1, 2)],
            Orient.left: [(2, 0), (1, 0), (1, 1), (0, 1)]
        ]
    }
    
   
}
