package tests_day_1

import "../../src/day_1"

import "core:testing"

@(test)
part_1_test :: proc(t: ^testing.T) {
	test_input := `L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
`
	res := day_1.sol_part_1(test_input)

	testing.expect_value(t, res, 3)
}


@(test)
part_2_test_1 :: proc(t: ^testing.T) {
	test_input := `L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
`
	res := day_1.sol_part_2(test_input)

	testing.expect_value(t, res, 6)
}


@(test)
part_2_test_2 :: proc(t: ^testing.T) {
	test_input := `R1000
`
	res := day_1.sol_part_2(test_input)

	testing.expect_value(t, res, 10)
}

@(test)
part_2_test_3 :: proc(t: ^testing.T) {
	test_input := `R50
`
	res := day_1.sol_part_2(test_input)

	testing.expect_value(t, res, 1)
}

@(test)
part_2_test_4 :: proc(t: ^testing.T) {
	test_input := `L1000
`
	res := day_1.sol_part_2(test_input)

	testing.expect_value(t, res, 10)
}

@(test)
part_2_test_5 :: proc(t: ^testing.T) {
	test_input := `L50
`
	res := day_1.sol_part_2(test_input)

	testing.expect_value(t, res, 1)
}
