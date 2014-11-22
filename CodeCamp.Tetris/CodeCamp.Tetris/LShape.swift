class LShape:Shape {
   
    
    override var blockRowColumnPositions: [Orient: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orient.top:       [ (0, 0), (0, 1),  (0, 2),  (1, 2)],
            Orient.right:     [ (0, 1), (0, 2),  (1,1), (2, 1)],
            Orient.bottom:  [ (1, 2), (1, 1),  (1, 0),  (0,0)],
            Orient.left: [ (0,1), (1, 1),  (2, 1),   (2,0)]
        ]
    }
    
   
}
