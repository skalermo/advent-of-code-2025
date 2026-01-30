package tests_day_6

import "../../src/day_6"

import "core:testing"

@(test)
part_1_test_1 :: proc(t: ^testing.T) {
	test_input := `
123 328  51 64 
 45 64  387 23 
  6 98  215 314
*   +   *   +  
`
	test_input = test_input[1:]
	res := day_6.sol_part_1(test_input)

	testing.expect_value(t, res, 4277556)
}

@(test)
part_1_test_2 :: proc(t: ^testing.T) {
	test_input := `
123
 45
  6
*
`
	test_input = test_input[1:]
	res := day_6.sol_part_1(test_input)

	testing.expect_value(t, res, 33210)
}

@(test)
part_1_test_3 :: proc(t: ^testing.T) {
	test_input := `
328
 64
 98
+
`
	test_input = test_input[1:]
	res := day_6.sol_part_1(test_input)

	testing.expect_value(t, res, 490)
}

@(test)
part_1_test_4 :: proc(t: ^testing.T) {
	test_input := `
 51
387
215
*
`
	test_input = test_input[1:]
	res := day_6.sol_part_1(test_input)

	testing.expect_value(t, res, 4243455)
}

@(test)
part_1_test_5 :: proc(t: ^testing.T) {
	test_input := `
 64
 23
314
+
`
	test_input = test_input[1:]
	res := day_6.sol_part_1(test_input)

	testing.expect_value(t, res, 401)
}

@(test)
part_2_test_1 :: proc(t: ^testing.T) {
	test_input := `
123 328  51 64 
 45 64  387 23 
  6 98  215 314
*   +   *   +  
`
	test_input = test_input[1:]
	res := day_6.sol_part_2(test_input)

	testing.expect_value(t, res, 3263827)
}

@(test)
part_2_test_2 :: proc(t: ^testing.T) {
	test_input := `
64 
23 
314
+  
`
	test_input = test_input[1:]
	res := day_6.sol_part_2(test_input)

	testing.expect_value(t, res, 1058)
}

@(test)
part_2_test_3 :: proc(t: ^testing.T) {
	test_input := `
 51
387
215
*  
`
	test_input = test_input[1:]
	res := day_6.sol_part_2(test_input)

	testing.expect_value(t, res, 3253600)
}

@(test)
part_2_test_4 :: proc(t: ^testing.T) {
	test_input := `
328
64
98
+
`
	test_input = test_input[1:]
	res := day_6.sol_part_2(test_input)

	testing.expect_value(t, res, 625)
}

@(test)
part_2_test_5 :: proc(t: ^testing.T) {
	test_input := `
123
 45
  6
*
`
	test_input = test_input[1:]
	res := day_6.sol_part_2(test_input)

	testing.expect_value(t, res, 8544)
}
