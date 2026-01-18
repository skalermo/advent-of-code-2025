package day_2

import "core:math"
import "core:strconv"
import "core:strings"


parse_input :: proc(input_str: string) -> [dynamic][2]int {
	res: [dynamic][2]int
	it := input_str[:len(input_str) - 1]
	for range in strings.split_by_byte_iterator(&it, ',') {
		start_end := strings.split(range, "-")
		defer delete(start_end)
		start, ok := strconv.parse_int(start_end[0])
		end, ok2 := strconv.parse_int(start_end[1])
		if !ok || !ok2 {
			return nil
		}

		append_elem(&res, [2]int{start, end})
	}

	return res
}


number_length :: proc(x: int) -> int {
	if x == 0 do return 1

	le := 0
	x := x
	for x > 0 {
		x = x / 10
		le += 1
	}
	return le
}


sol_part_1 :: proc(input_str: string) -> int {
	input := parse_input(input_str)
	defer delete_dynamic_array(input)

	res := 0

	for range in input {
		start, end := range[0], range[1]
		for x in start ..= end {
			le := number_length(x)
			scale := int(math.pow(10, f32(le / 2)))
			half1 := x / scale
			half2 := x % scale
			if half1 == half2 {
				res += x
			}
		}
	}
	return res
}

find_divisors :: proc(n: int) -> [dynamic]int {
	res: [dynamic]int
	for i in 2 ..= n {
		if n % i == 0 {
			append_elem(&res, i)
		}

	}
	return res
}

is_id_invalid_p2 :: proc(id: int, divisors: [dynamic]int, length: int) -> bool {
	if len(divisors) == 0 {
		return false
	}

	valid := false
	for d in divisors {
		window_size := length / d
		all_match := true
		ten_powed := int(math.pow10_f32(f32(length - window_size)))

		prev_window := id / ten_powed
		id_ := id
		for i in 1 ..< d {
			id_ = id_ % ten_powed
			ten_powed = int(math.pow10_f32(f32(length - window_size * (i + 1))))
			window := id_ / ten_powed
			if prev_window != window {
				all_match = false
				break
			}
			prev_window = window
		}

		if all_match {
			valid = true
			break
		}
	}

	return valid
}

sol_part_2 :: proc(input_str: string) -> int {
	input := parse_input(input_str)
	defer delete_dynamic_array(input)

	divisors: [20][dynamic]int

	for i in 1 ..< 20 {
		divisors[i] = find_divisors(i)
	}


	res := 0
	for range in input {
		a, b := range[0], range[1]
		for i in a ..= b {
			length := number_length(i)
			if is_id_invalid_p2(i, divisors[length], length) {
				res += i
			}
		}
	}


	for i in 1 ..< 20 {
		delete_dynamic_array(divisors[i])
	}

	return res
}
