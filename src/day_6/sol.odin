package day_6

import "core:strconv"
import "core:strings"


parse_input :: proc(input_str: string) -> (int, int, [dynamic]int, []string) {
	lines := strings.split(input_str, "\n")
	defer delete(lines)

	ops := strings.fields(lines[len(lines) - 2])

	height, width := len(lines) - 2, len(ops)

	// flattened matrix of length H x W
	arr := make([dynamic]int, height * width)

	for line, i in lines[0:len(lines) - 2] {
		words := strings.fields(line)
		defer delete(words)
		for word, j in words {
			num, _ := strconv.parse_int(word)
			arr[i * width + j] = num
		}
	}

	return height, width, arr, ops
}


sol_part_1 :: proc(input_str: string) -> int {
	h, w, arr, ops := parse_input(input_str)
	defer delete(arr)
	defer delete(ops)

	res := 0
	for col_num in 0 ..< w {
		col_res := arr[0 + col_num]
		op := ops[col_num]
		for row_num in 1 ..< h {
			if op == "+" {
				col_res += arr[row_num * w + col_num]
			} else if op == "*" {
				col_res *= arr[row_num * w + col_num]
			}
		}
		res += col_res
	}

	return res
}


parse_input_2 :: proc(input_str: string) -> (int, int, [dynamic]int, []string) {
	lines := strings.split(input_str, "\n")
	defer delete(lines)

	ops := strings.fields(lines[len(lines) - 2])

	height, width := len(lines) - 2, len(lines[0])

	arr := make([dynamic]int, height * width)

	for line, y in lines[0:len(lines) - 2] {
		for r, x in line {
			digit := 0
			if r == ' ' {
				digit = 0
			} else {
				digit = int(r - '0')
			}
			arr[y * width + x] = digit
		}
	}

	return height, width, arr, ops
}


sol_part_2 :: proc(input_str: string) -> int {
	h, w, arr, ops := parse_input_2(input_str)
	defer delete(arr)
	defer delete(ops)

	res := 0
	col_num := 0
	col_res := 0 if ops[0] == "+" else 1

	for x in 0 ..< w {
		col_sum := 0
		for y in 0 ..< h {
			digit := arr[y * w + x]
			if digit == 0 do continue
			col_sum = 10 * col_sum + digit
		}

		if col_sum == 0 {
			col_num += 1
			res += col_res
			col_res = 0 if ops[col_num] == "+" else 1
			continue
		}

		if ops[col_num] == "+" {
			col_res += col_sum
		} else if ops[col_num] == "*" {
			col_res *= col_sum
		}

		if x == w - 1 {
			res += col_res
			continue
		}
	}

	return res
}
