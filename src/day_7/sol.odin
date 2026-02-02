package day_7

import "core:mem"
import "core:strings"


parse_input :: proc(input_str: string) -> (int, int, [dynamic]rune) {
	lines := strings.split(input_str, "\n")
	defer delete(lines)

	height := len(lines) - 1
	width := len(lines[0])

	arr := make([dynamic]rune, height * width)

	for line, y in lines {
		for r, x in line {
			arr[y * width + x] = r
		}
	}

	return height, width, arr
}


sol_part_1 :: proc(input_str: string) -> int {
	height, width, arr := parse_input(input_str)
	defer delete(arr)

	start_x := width / 2

	beams := make([dynamic]bool, width)
	defer delete(beams)
	new_beams := make([dynamic]bool, width)
	defer delete(new_beams)

	beams[start_x] = true
	splits := 0

	for y in 1 ..< height {
		for x in 0 ..< width {
			if beams[x] && arr[y * width + x] == '.' {
				new_beams[x] = true
			} else if beams[x] && arr[y * width + x] == '^' {
				if x - 1 >= 0 do new_beams[x - 1] = true
				if x + 1 < width do new_beams[x + 1] = true

				splits += 1
			}
		}
		beams, new_beams = new_beams, beams
		mem.zero_slice(new_beams[:])
	}

	return splits
}


sol_part_2 :: proc(input_str: string) -> int {
	height, width, arr := parse_input(input_str)
	defer delete(arr)

	start_x := width / 2

	beams := make([dynamic]int, width)
	defer delete(beams)
	new_beams := make([dynamic]int, width)
	defer delete(new_beams)

	beams[start_x] = 1

	for y in 1 ..< height {
		for x in 0 ..< width {
			if beams[x] > 0 && arr[y * width + x] == '.' {
				new_beams[x] += beams[x]
			} else if beams[x] > 0 && arr[y * width + x] == '^' {
				if x - 1 >= 0 do new_beams[x - 1] += beams[x]
				if x + 1 < width do new_beams[x + 1] += beams[x]
			}
		}
		beams, new_beams = new_beams, beams
		mem.zero_slice(new_beams[:])
	}

	res := 0
	for b in beams {
		res += b
	}

	return res
}
