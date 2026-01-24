package day_5

import "core:strconv"
import "core:strings"


parse_input :: proc(input_str: string) -> ([dynamic][2]int, [dynamic]int) {
	ranges: [dynamic][2]int
	ids: [dynamic]int
	ranges_over := false
	it := input_str
	for line in strings.split_lines_iterator(&it) {
		if line == "" {
			ranges_over = true
			continue
		}
		if !ranges_over {
			start_end := strings.split(line, "-")
			defer delete(start_end)

			start, _ := strconv.parse_int(start_end[0])
			end, _ := strconv.parse_int(start_end[1])
			append_elem(&ranges, [2]int{start, end})
		} else {
			id, _ := strconv.parse_int(line)
			append_elem(&ids, id)
		}
	}
	return ranges, ids
}


sol_part_1 :: proc(input_str: string) -> int {
	ranges, ids := parse_input(input_str)
	defer delete_dynamic_array(ranges)
	defer delete_dynamic_array(ids)

	fresh := 0
	for id in ids {
		for range in ranges {
			start, end := range[0], range[1]
			if start <= id && id <= end {
				fresh += 1
				break
			}
		}
	}

	return fresh
}


merge_ranges :: proc(r1, r2: [2]int) -> ([2]int, bool) {
	s1, e1 := r1[0], r1[1]
	s2, e2 := r2[0], r2[1]

	if s1 > s2 {
		// easier when r1 is always the one on the left
		s1, e1, s2, e2 = s2, e2, s1, e1
	}

	// +1 to account for non-overlapping adjacent ranges, e.g. 1-1, 2-2
	if s1 <= s2 && s2 <= e1 + 1 {
		// x-------------x
		//      x-?
		if e2 >= e1 + 1 {
			// x-------------x
			//      x------------x
			return [2]int{s1, e2}, true
		} else {
			// x-------------x
			//      x--------x
			return [2]int{s1, e1}, true
		}
	}

	// x-----x
	//          x-----x
	return [2]int{0, 0}, false
}


sol_part_2 :: proc(input_str: string) -> int {
	ranges, ids := parse_input(input_str)
	defer delete_dynamic_array(ranges)
	delete_dynamic_array(ids)

	non_overlapping_ranges: map[[2]int]bool
	defer delete(non_overlapping_ranges)

	non_overlapping_ranges[ranges[0]] = true
	for r1 in ranges[1:] {
		cur_range := r1
		for r2 in non_overlapping_ranges {
			new_range, merged := merge_ranges(cur_range, r2)
			if merged {
				cur_range = new_range
				delete_key(&non_overlapping_ranges, r2)
			}
		}
		non_overlapping_ranges[cur_range] = true
	}

	res := 0
	for range in non_overlapping_ranges {
		start, end := range[0], range[1]
		res += end - start + 1
	}

	return res
}
