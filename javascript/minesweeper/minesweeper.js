const NEIGHBOR_OFFSETS = [
  [-1, -1], [-1, 0], [-1, 1],
  [0, -1],           [0, 1],
  [1, -1],  [1, 0],  [1, 1]
]

class Minesweeper {
  constructor(rows) {
    this.rows = rows
  }
  annotate() {
    return this.rows.map((columns, i) =>
      columns.replace(/ /g, (cell, j) =>
        this.neighborMines(i, j) || ' '
      )
    )
  }

  neighborMines(i, j) {
    return this.getNeighbors(i, j).reduce((sum, neighbor) => {
      if (neighbor === '*') return sum + 1
      return sum
    }, 0)
  }

  getNeighbors(i, j) {
    return NEIGHBOR_OFFSETS.map(([x, y]) =>
      this.rows[i + x] && this.rows[i + x][j + y]
    )
  }
}


module.exports = Minesweeper
