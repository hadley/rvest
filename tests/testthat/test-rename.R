test_that("xml functions are deprecated", {
  x <- minimal_html("<p>Hello</p>")

  expect_snapshot(. <- xml_tag(x))
  expect_snapshot(. <- xml_node(x, "p"))
  expect_snapshot(. <- xml_nodes(x, "p"))
})

test_that("html_node(s) is superseded (no warnings)", {
  x <- minimal_html("<p>Hello</p>")

  expect_equal(html_node(x, "p"), html_element(x, "p"))
  expect_equal(html_nodes(x, "p"), html_elements(x, "p"))
})

test_that("set_values() is deprecated", {
  html <- minimal_html('
    <form><input type="text" name="text" /></form>
  ')
  form <- html_form(html)[[1]]
  expect_snapshot(set_values(form, text = "abc"))
})

test_that("prefixless session functions are deprecated", {
  expect_snapshot({
    s <- html_session("http://rvest.tidyverse.org/")
    . <- follow_link(s, i = 1)

    s <- jump_to(s, "https://rvest.tidyverse.org/reference/index.html")
    s <- back(s)
    s <- forward(s)
  })
})

# session_submit() is tested in form-submit because it needs a test server

