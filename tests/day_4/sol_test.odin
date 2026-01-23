package tests_day_4

import "../../src/day_4"

import "core:testing"

@(test)
part_1_test_1 :: proc(t: ^testing.T) {
	test_input := `..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@.
`
	res := day_4.sol_part_1(test_input)

	testing.expect_value(t, res, 13)
}

@(test)
part_1_test_2 :: proc(t: ^testing.T) {
	test_input := `@@@@@@@@@.
@@@@@@@@@@
`
	res := day_4.sol_part_1(test_input)

	testing.expect_value(t, res, 3)
}

@(test)
part_2_test_1 :: proc(t: ^testing.T) {
	test_input := `..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@.
`
	res := day_4.sol_part_2(test_input)

	testing.expect_value(t, res, 43)
}

@(test)
part_2_test_2 :: proc(t: ^testing.T) {
	test_input := `@@@
@@@
`
	res := day_4.sol_part_2(test_input)

	testing.expect_value(t, res, 6)
}

@(test)
part_2_test_3 :: proc(t: ^testing.T) {
	test_input := `..........
..........
..........
....@@@@..
....@@@@..
....@@@@..
....@@@...
..........
..........
..........
`
	res := day_4.sol_part_2(test_input)

	testing.expect_value(t, res, 3)
}
