package main

import "core:fmt"
import "core:os"
import "core:strings"
// import "day_1"
// import "day_2"
// import "day_3"
// import "day_4"
// import "day_5"
import "day_6"


main :: proc() {
	// input_path := strings.concatenate({#directory, "../inputs/day_1/input"})
	// input_path := strings.concatenate({#directory, "../inputs/day_2/input"})
	// input_path := strings.concatenate({#directory, "../inputs/day_3/input"})
	// input_path := strings.concatenate({#directory, "../inputs/day_4/input"})
	// input_path := strings.concatenate({#directory, "../inputs/day_5/input"})
	input_path := strings.concatenate({#directory, "../inputs/day_6/input"})

	data, ok := os.read_entire_file(input_path, context.allocator)
	if !ok {
		fmt.println("Input file not found")
		return
	}
	defer delete(data, context.allocator)

	sol_part_1 := day_6.sol_part_1(string(data))
	sol_part_2 := day_6.sol_part_2(string(data))
	fmt.println(sol_part_1, sol_part_2)
}
