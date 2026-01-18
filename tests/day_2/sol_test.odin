package tests_day_2

import "../../src/day_2"

import "core:testing"

@(test)
part_1_test_1 :: proc(t: ^testing.T) {
	test_input := `11-21
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 11)
}

@(test)
part_1_test_2 :: proc(t: ^testing.T) {
	test_input := `12-22
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 22)
}

@(test)
part_1_test_3 :: proc(t: ^testing.T) {
	test_input := `95-115
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 99)
}

@(test)
part_1_test_4 :: proc(t: ^testing.T) {
	test_input := `998-1012
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 1010)
}

@(test)
part_1_test_5 :: proc(t: ^testing.T) {
	test_input := `1188511880-1188511890
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 1188511885)
}

@(test)
part_1_test_6 :: proc(t: ^testing.T) {
	test_input := `222220-222224
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 222222)
}

@(test)
part_1_test_7 :: proc(t: ^testing.T) {
	test_input := `1698522-1698528
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 0)
}

@(test)
part_1_test_8 :: proc(t: ^testing.T) {
	test_input := `446443-446449
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 446446)
}

@(test)
part_1_test_9 :: proc(t: ^testing.T) {
	test_input := `38593856-38593862
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 38593859)
}

@(test)
part_1_test_10 :: proc(t: ^testing.T) {
	test_input := `11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
`
	res := day_2.sol_part_1(test_input)

	testing.expect_value(t, res, 1227775554)
}

@(test)
part_2_test_1 :: proc(t: ^testing.T) {
	test_input := `11-22
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 11 + 22)
}

@(test)
part_2_test_2 :: proc(t: ^testing.T) {
	test_input := `95-115
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 99 + 111)
}

@(test)
part_2_test_3 :: proc(t: ^testing.T) {
	test_input := `998-1012
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 999 + 1010)
}

@(test)
part_2_test_4 :: proc(t: ^testing.T) {
	test_input := `1188511880-1188511890
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 1188511885)
}

@(test)
part_2_test_5 :: proc(t: ^testing.T) {
	test_input := `222220-222224
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 222222)
}

@(test)
part_2_test_6 :: proc(t: ^testing.T) {
	test_input := `1698522-1698528
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 0)
}

@(test)
part_2_test_7 :: proc(t: ^testing.T) {
	test_input := `446443-446449
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 446446)
}

@(test)
part_2_test_8 :: proc(t: ^testing.T) {
	test_input := `38593856-38593862
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 38593859)
}

@(test)
part_2_test_9 :: proc(t: ^testing.T) {
	test_input := `565653-565659
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 565656)
}

@(test)
part_2_test_10 :: proc(t: ^testing.T) {
	test_input := `824824821-824824827
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 824824824)
}

@(test)
part_2_test_11 :: proc(t: ^testing.T) {
	test_input := `2121212118-2121212124
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 2121212121)
}

@(test)
part_1_test_12 :: proc(t: ^testing.T) {
	test_input := `11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
`
	res := day_2.sol_part_2(test_input)

	testing.expect_value(t, res, 4174379265)
}
