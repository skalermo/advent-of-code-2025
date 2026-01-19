package tests_day_3

import "../../src/day_3"

import "core:testing"

@(test)
part_1_test_1 :: proc(t: ^testing.T) {
	test_input := `987654321111111
`
	res := day_3.sol_part_1(test_input)

	testing.expect_value(t, res, 98)
}

@(test)
part_1_test_2 :: proc(t: ^testing.T) {
	test_input := `811111111111119
`
	res := day_3.sol_part_1(test_input)

	testing.expect_value(t, res, 89)
}

@(test)
part_1_test_3 :: proc(t: ^testing.T) {
	test_input := `234234234234278
`
	res := day_3.sol_part_1(test_input)

	testing.expect_value(t, res, 78)
}

@(test)
part_1_test_4 :: proc(t: ^testing.T) {
	test_input := `818181911112111
`
	res := day_3.sol_part_1(test_input)

	testing.expect_value(t, res, 92)
}

@(test)
part_1_test_5 :: proc(t: ^testing.T) {
	test_input := `987654321111111
811111111111119
234234234234278
818181911112111

`
	res := day_3.sol_part_1(test_input)

	testing.expect_value(t, res, 357)
}

@(test)
part_1_test_6 :: proc(t: ^testing.T) {
	test_input := `1234567899

`
	res := day_3.sol_part_1(test_input)

	testing.expect_value(t, res, 99)
}

@(test)
part_2_test_1 :: proc(t: ^testing.T) {
	test_input := `987654321111111

`
	res := day_3.sol_part_2(test_input)

	testing.expect_value(t, res, 987654321111)
}

@(test)
part_2_test_2 :: proc(t: ^testing.T) {
	test_input := `811111111111119

`
	res := day_3.sol_part_2(test_input)

	testing.expect_value(t, res, 811111111119)
}

@(test)
part_2_test_3 :: proc(t: ^testing.T) {
	test_input := `234234234234278

`
	res := day_3.sol_part_2(test_input)

	testing.expect_value(t, res, 434234234278)
}

@(test)
part_2_test_4 :: proc(t: ^testing.T) {
	test_input := `818181911112111

`
	res := day_3.sol_part_2(test_input)

	testing.expect_value(t, res, 888911112111)
}

@(test)
part_2_test_5 :: proc(t: ^testing.T) {
	test_input := `987654321111111
811111111111119
234234234234278
818181911112111
`
	res := day_3.sol_part_2(test_input)

	testing.expect_value(t, res, 3121910778619)
}
