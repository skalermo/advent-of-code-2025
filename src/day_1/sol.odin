
package day_1

import "core:log"
import "core:strconv"
import "core:strings"


Rotation :: enum {
	Left,
	Right,
}


Part1Input :: struct {
	distance: int,
	rotation: Rotation,
}


parse_input :: proc(input_str: string) -> [dynamic]Part1Input {
	res: [dynamic]Part1Input
	input_str := input_str
	for line in strings.split_lines_iterator(&input_str) {
		rot: Rotation
		if line == "" do break
		if line[0] == 'L' {
			rot = Rotation.Left
		} else {
			rot = Rotation.Right
		}

		value, ok := strconv.parse_int(line[1:])
		if !ok {
			return nil
		}

		append_elem(&res, Part1Input{distance = value, rotation = rot})
	}
	return res
}

sol_part_1 :: proc(input_str: string) -> int {
	input := parse_input(input_str)
	defer delete_dynamic_array(input)

	cur_dial_pos := 50
	dial_at_0 := 0
	for turn in input {
		switch turn.rotation {
		case Rotation.Left:
			cur_dial_pos = (100 + cur_dial_pos - turn.distance) % 100
		case Rotation.Right:
			cur_dial_pos = (100 + cur_dial_pos + turn.distance) % 100
		}
		if cur_dial_pos == 0 do dial_at_0 += 1
	}
	return dial_at_0
}

sol_part_2 :: proc(input_str: string) -> int {
	input := parse_input(input_str)
	defer delete_dynamic_array(input)

	cur_dial_pos := 50
	dial_points_at_0 := 0
	for turn in input {
		switch turn.rotation {
		case Rotation.Left:
			total_distance_from_0 := (100 - cur_dial_pos) % 100 + turn.distance
			dial_points_at_0 += total_distance_from_0 / 100

			cur_dial_pos = (cur_dial_pos - turn.distance) % 100
			if cur_dial_pos < 0 do cur_dial_pos += 100
		case Rotation.Right:
			total_distance_from_0 := cur_dial_pos + turn.distance
			dial_points_at_0 += total_distance_from_0 / 100

			cur_dial_pos = (cur_dial_pos + turn.distance) % 100
		}
		log.debug("cur_dial_pos", cur_dial_pos, "dial_points_at_0", dial_points_at_0)
	}
	return dial_points_at_0
}
