package tests_day_5

import "../../src/day_5"

import "core:testing"

@(test)
part_1_test_1 :: proc(t: ^testing.T) {
	test_input := `3-5
10-14
16-20
12-18

1
5
8
11
17
32
`
	res := day_5.sol_part_1(test_input)

	testing.expect_value(t, res, 3)
}

@(test)
part_2_test_1 :: proc(t: ^testing.T) {
	_, merged := day_5.merge_ranges([2]int{3, 5}, [2]int{10, 14})

	testing.expect(t, !merged)
}

@(test)
part_2_test_2 :: proc(t: ^testing.T) {
	new_range, merged := day_5.merge_ranges([2]int{16, 20}, [2]int{12, 18})

	testing.expect(t, merged)
	testing.expect_value(t, new_range, [2]int{12, 20})

	new_range, merged = day_5.merge_ranges([2]int{12, 18}, [2]int{16, 20})

	testing.expect(t, merged)
	testing.expect_value(t, new_range, [2]int{12, 20})
}

@(test)
part_2_test_3 :: proc(t: ^testing.T) {
	new_range, merged := day_5.merge_ranges([2]int{1, 1}, [2]int{2, 2})

	testing.expect(t, merged)
	testing.expect_value(t, new_range, [2]int{1, 2})
}

@(test)
part_2_test_4 :: proc(t: ^testing.T) {
	new_range, merged := day_5.merge_ranges([2]int{1, 1}, [2]int{1, 1})

	testing.expect(t, merged)
	testing.expect_value(t, new_range, [2]int{1, 1})
}

@(test)
part_2_test_5 :: proc(t: ^testing.T) {
	test_input := `3-5
10-14
16-20
12-18

1
5
8
11
17
32
`
	res := day_5.sol_part_2(test_input)

	testing.expect_value(t, res, 14)
}

@(test)
part_2_test_6 :: proc(t: ^testing.T) {
	test_input := `0-0
0-1
3-4
6-7
9-10
2-2
5-5
8-8
0-10
`
	res := day_5.sol_part_2(test_input)

	testing.expect_value(t, res, 11)
}
