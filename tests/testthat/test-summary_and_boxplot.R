test_that("Testing summarize and boxplot function", {
  # setting up different tests
  num_vec <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  num_vec_with_NA <- c(num_vec, rep(NA, 10))
  char_vec <- c('a')
  empty_vec <- num_vec[num_vec < 0]
  NA_vec <- c(1)
  NA_vec[1] = NA # numeric vector with NA entries. c(NA) is not a numeric vector.

  # test valid cases
  expect_equal(summary_and_boxplot(num_vec),
               c(10.00, 10.00,  1.00,  3.25,  5.50,  5.50,  7.75,  10.0, 0.00))
  expect_equal(summary_and_boxplot(num_vec_with_NA),
               c(10.00, 10.00,  1.00,  3.25,  5.50,  5.50,  7.75,  10.0, 10.00))
  expect_equal(summary_and_boxplot(num_vec_with_NA, FALSE),
               c(20.00, 11.00,  1.00,  3.25,  5.50,  5.50,  7.75, 10.00, 10.00))


  # testing error cases
  expect_error(summary_and_boxplot(char_vec),
               paste0('This function only works for a numeric vector input!\n',
                      'You have provided an object of class: ',
                      class(char_vec)[1], '.\n'),
               fixed = TRUE)
  expect_error(summary_and_boxplot(empty_vec),
               paste0('Your numeric vector has no elements!\n',
                      'This function only works for a numeric vector input with a number of elements greater than 0!\n'),
               fixed = TRUE)
  expect_error(summary_and_boxplot(NA_vec),
               paste0('Your numeric vector has no elements after removing NA entries!\n',
                      'This function only works for a numeric vector input with a number of non-NA elements greater than 0!\n'),
               fixed = TRUE)
  expect_error(summary_and_boxplot(NA_vec, FALSE),
               paste0('Your numeric vector only contains NA entries!\n',
                      'This function only works for a numeric vector input with a number of non-NA elements greater than 0!\n'),
               fixed = TRUE)
})

