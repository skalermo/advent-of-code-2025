package day_4

import "core:strings"


parse_input :: proc(input_str: string) -> ([140][140]rune, int, int) {
	res: [140][140]rune

	it := input_str
	i := 0
	j := 0
	for line in strings.split_lines_iterator(&it) {
		j = 0
		for char in line {
			res[i][j] = char
			j += 1
		}
		i += 1
	}
	return res, i, j
}


count_adjacent_rolls :: proc(
	grid: [140][140]rune,
	height: int,
	width: int,
	y0: int,
	x0: int,
) -> int {
	res := 0
	dirs := [][2]int{{-1, -1}, {-1, 0}, {-1, 1}, {0, 1}, {1, 1}, {1, 0}, {1, -1}, {0, -1}}
	for d in dirs {
		dy, dx := d[0], d[1]
		y := y0 + dy
		x := x0 + dx
		if y < 0 || y >= height || x < 0 || x >= width do continue
		if grid[y][x] == '@' do res += 1
	}
	return res
}


sol_part_1 :: proc(input_str: string) -> int {
	grid, height, width := parse_input(input_str)
	res := 0
	for y in 0 ..< height {
		for x in 0 ..< width {
			if grid[y][x] == '@' && count_adjacent_rolls(grid, height, width, y, x) < 4 {
				res += 1
			}
		}
	}
	return res
}


sol_part_2 :: proc(input_str: string) -> int {
	grid, height, width := parse_input(input_str)
	res := 0

	rolls_removed := 1
	for rolls_removed > 0 {
		new_grid := grid
		rolls_removed = 0

		for y in 0 ..< height {
			for x in 0 ..< width {
				if grid[y][x] == '@' && count_adjacent_rolls(grid, height, width, y, x) < 4 {
					res += 1
					rolls_removed += 1
					new_grid[y][x] = '.'
				}
			}
		}
		grid = new_grid
	}
	return res
}
