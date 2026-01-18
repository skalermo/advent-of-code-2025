package day_3

import "core:strings"


parse_line :: proc(input_str: string) -> [dynamic]int {
	res: [dynamic]int
	for char in input_str {
		append_elem(&res, int(char - '0'))
	}
	return res
}


find_largest_digit :: proc(
	arr: [dynamic]int,
	start_idx: int = 0,
	end_idx: int = -1,
) -> (
	int,
	int,
) {
	end_idx := end_idx
	max_n := 0
	max_idx := 0

	if end_idx == -1 {
		end_idx = len(arr)
	}

	for n, i in arr[start_idx:end_idx] {
		if n > max_n {
			max_n = n
			max_idx = i
		}
	}

	return max_n, max_idx + start_idx
}


sol_part_1 :: proc(input_str: string) -> int {
	input_str := input_str
	res := 0
	for line in strings.split_lines_iterator(&input_str) {
		if len(line) == 0 do continue
		arr := parse_line(line)
		defer delete_dynamic_array(arr)

		n, idx := find_largest_digit(arr)
		if idx == len(arr) - 1 {
			n2, _ := find_largest_digit(arr, 0, len(arr) - 1)
			res += n2 * 10 + n
		} else {
			n2, _ := find_largest_digit(arr, idx + 1)
			res += n * 10 + n2
		}
	}
	return res
}


sol_part_2 :: proc(input_str: string) -> int {
	// input_str := input_str
	// res := 0

	// for line in strings.split_lines_iterator(&input_str) {
	// 	if len(line) == 0 do continue
	// 	arr := parse_line(line)
	// 	defer delete_dynamic_array(arr)

	// 	digits_to_add := 12
	// 	n, idx := find_largest_digit(arr)
	// 	digits_to_add -= 1

	// 	stack: [dynamic]int
	// 	append_elem(&stack, idx)
	// 	// -1 9 1 8 7

	// 	for digits_to_add > 0 {

	// 		digits_to_add -= 1
	// 	}

	// 	if idx == len(arr) - 1 {
	// 		n2, _ := find_largest_digit(arr, 0, len(arr) - 1)
	// 		res += n2 * 10 + n
	// 	} else {
	// 		n2, _ := find_largest_digit(arr, idx + 1)
	// 		res += n * 10 + n2
	// 	}
	// }
	// return res
	return 0
}
