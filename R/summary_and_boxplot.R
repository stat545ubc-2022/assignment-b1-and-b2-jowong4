#' summary_and_boxplot: Summarize numeric vector and output boxplot
#'
#' Summarize a numeric vector input and output a numeric vector containing number of elements, number of unique elements, min,
#' 1st quartile, median, mean, 3rd quartile, max, and number of NAs.
#' This function also outputs a box-and-jitter plot with NA entries removed for visualization purposes
#' (NOTE: the jitters in the box-and-jitter plot are stochastic and can appear in different positions between runs).
#'
#' @param num_vec a numeric vector used to calculate summary statistics. num_vec is short for numeric_vector.
#' @param na.rm logical, remove NA entries when generating summary statistics if TRUE.(NOTE: boxplot will not use NA entries regardless of this parameter).
#' na.rm is what many other functions call the parameter to remove NA, so I just followed the convention.
#'
#' @return a numeric vector containing number of elements, number of unique elements, min, 1st quartile, median, mean, 3rd quartile,
#' max, and number of NAs (in this order).
#'
#' @examples
#' summary_and_boxplot(1:10)
#' summary_and_boxplot(c(1, 2, 3, 4, 5))
#'
#' @export
summary_and_boxplot <- function(num_vec, na.rm = TRUE) {
  if(!is.numeric(num_vec)) {
    stop('This function only works for a numeric vector input!\n',
         'You have provided an object of class: ', class(num_vec)[1], '.\n')
  } else {
    if(length(num_vec) == 0) {
      stop('Your numeric vector has no elements!\n',
           'This function only works for a numeric vector input with a number of elements greater than 0!\n')
    }
  }

  num_NA <- sum(is.na(num_vec))

  message('There are ',
          num_NA,
          ' NA entries in your numeric vector input.')

  if (na.rm & num_NA != 0) {
    message('Removing ',
            sum(is.na(num_vec)),
            ' NA entries from your numeric vector input.')
    num_vec <- num_vec[!is.na(num_vec)]
    if(length(num_vec) == 0) {
      stop('Your numeric vector has no elements after removing NA entries!\n',
           'This function only works for a numeric vector input with a number of non-NA elements greater than 0!\n')
    }
  }

  num_vec_len <- length(num_vec)

  if(num_vec_len == num_NA & !na.rm) {
    stop('Your numeric vector only contains NA entries!\n',
         'This function only works for a numeric vector input with a number of non-NA elements greater than 0!\n')
  }

  uniq_num_vec_len <- length(unique(num_vec))

  message('There are ',
          num_vec_len,
          ' entries in your numeric vector input.')
  message('There are ',
          uniq_num_vec_len,
          ' unique entries in your numeric vector input.')

  num_vector_summary <- as.vector(unclass(summary(num_vec)))
  num_vector_summary[7] <- num_NA # set number of NAs to before NAs were removed if na.rm is TRUE

  message('Min: ', num_vector_summary[1])
  message('1st quartile: ', num_vector_summary[2])
  message('Median: ', num_vector_summary[3])
  message('Mean: ', num_vector_summary[4])
  message('3rd quartile: ', num_vector_summary[5])
  message('Max: ', num_vector_summary[6])

  #plotting boxplot
  df_num_vec <- tibble::as_tibble(num_vec)
  sum_boxplot <- ggplot2::ggplot(df_num_vec, ggplot2::aes(x = factor(0), num_vec)) +
    ggplot2::geom_boxplot(na.rm = TRUE) + # supress warning message about removing NA entries
    ggplot2::geom_jitter(na.rm = TRUE) + # supress warning message about removing NA entries
    ggplot2::theme_bw() +
    ggplot2::theme(axis.title.y = ggplot2::element_blank(),
          axis.title.x = ggplot2::element_blank(),
          axis.text.x = ggplot2::element_blank(),
          axis.ticks.x = ggplot2::element_blank())

  print(sum_boxplot)

  return(c(num_vec_len,
           uniq_num_vec_len,
           num_vector_summary))
}
