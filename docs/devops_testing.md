# Automated Tests {#testing}

🚧 **Under Construction** 🚧


## Unit testing



### Create a test 

You can use below code to write a test. Make sure you have `testthat` package installed and loaded.

```r
test_that(description_of_test, code_of_test)
```


```r
Example:
context("Tests")
# These tests should either return error as it's intended or be silent
test_that("User Data", {
  expect_error(test_data_user())
  expect_error(test_data_user(matrix()))
  expect_error(test_data_user(data.frame()))
  foo <- data.frame(1)
  names(foo) <- NULL
  expect_error(test_data_user(foo))
  expect_warning(test_data_user(data.frame(a = 1, a = 2, check.names = FALSE)))
  expect_silent(mtcars)
})
```

Now, we will look into what kind of tests are possible. Remember, below tests are like bricks, you can build anything with them. Idea should be to keep them simple and use as much as you like. 
### Equality expectations

See if an object is equal to value.

```r
expect_identical()
```

```r
expect_equal()
```

```r
expect_equivalent()
```

```r
expect_reference()
```

### Expect

Use it for writing custom expectations.


```r
expect(ok, failure_message, info = NULL, srcref = NULL, trace = NULL)
```

### Expect error

Check if code throws an error.


```r
expect_error()
```

```r
expect_condition()
```

### Expect invisible

These are pretty cool tests as we can test the function which might return no visible output.

```r
expect_invisible(call, label = NULL)
```

```r
expect_visible(call, label = NULL)
```

### Expect length

It can be helpful to check length of a vector. See if it is as per requirement of software design or function desgn.


```r
expect_length(object, n)
# where n is length
# expect_length(2:20, 18)
```

### Expect match

Check if a string matches to regular expression.

```r
expect_match( object_to_test, regular_expression)
```

### Expect message

This can come handy when you want to check if the code you have written produces warning or messages.

```r
expect_message(object)
```

```r
Example:
dummy_function <- function(a){
  if (a == 0){
    message("a is zero")
    return(a)
  }
}
expect_message(dummy_function(0), "a is zero")
expect_message(dummy_function(1), NA)
```

```r
expect_warning(object)
```

```r
Example:
dummy_function <- function(a){
  if (a == 0){
    warning("a is zero")
    return(a)
  }
}
expect_warning(dummy_function(0), "a is zero")
expect_warning(dummy_function(1), NA)
```

### Expect named

Check if object have name(s). You can also check what it s and if there is no name at all.

```r
# to check if object name is from character vector
expect_named(object, expected_names)
# to check if object name is absent
expect_named(object, NULL)
```

```r
Example:
a <- c( x= 0, y= 1)
expect_named(a)
expect_named(a, c("x", "y"))
expect_named(a, NULL) #check absence of names
```


### Expect null

```r
expect_null(object)
```

```r
Example:
a <- NULL
expect_null(a)
#below is another way to check for equal
expect_equal(a, NULL)
# also you can check type of 'a' object
expect_type(a, "NULL")
```

### Expect output

How to check if your code print output to the console.

```r
expect_output( object, regular_expression)
```

```r
Example:

expect_output(str(mtcars),"11 variables")
```

### expect setequal

You canuse this test to check if two vectors contain the same values. We have two variants, `setequal` and `mapequal`. 


```r
expect_setequal(vector_1, vector_2)
```

```r
list_ex <- list(x =0, y =1)
expect_mapequal(list_ex, list(x =0, y =1))
```

### Expect silent

If you are sure that a code should not output any kind of output, messages or warnings, you can use this test.

```r
expect_silent(object)
```

### Expect vector

You can check if an object has vector properties.


```r
expect_vector(object)
```

```r
Example:
if (requireNamespace("vctrs")) {
expect_vector(1:10, ptype = integer(), size = 10)
show_failure(expect_vector(1:10, ptype = integer(), size = 5))
show_failure(expect_vector(1:10, ptype = character(), size = 5))
}
```

### Fail/ Success

What if you want to manually trigger failure or success, you can do that easily.

```r
fail(message = "Failure has been forced", info = NULL)
succeed(message = "Success has been forced", info = NULL)
```


### Fail reporter

This is a reporter. We will see few of them as we move forward. This throws an error if any test fails. This is usually combined with other reporters.

### Check inheritance

If you want a way to check if an object is inherited from S3 or S4 class,you can use these tests. 


```r
expect_type(x,type)
expect_s3_class(x,class) #for s3
expect_s4_class(x,class) #for s4
```

```r
Example:
  
show_success(expect_s4_class(a, "data.frame"))
expect_type(a$y, "integer")
```

### Logical expectations

These are used when other tests are not according to your expectations(Haha, no pun intended.) These are not very informative.

```r
expect_true(object)
expect_false(object)
```

```r
Example:
a <- 1:999
expect_true( length(a) == 999)
expect_false( length(a) == 0)
expect_equal(length(a), 999)
```


### Skip a test

Assume you are developing something and you think you need to skip some tests or getting false failures. You are 100% sure about it. In that case,you can use `skip()` to skip tests as per requirement.


```r
skip(message)
```
If you want to include conditions, you can do that too.

```r
skip_if_not(condition, message = deparse(substitute(condition)))
skip_if(condition, message = NULL)
```
To check if a package is installed. This can come handy for designing troubleshooting mechanism where packages are dependent on each other.

```r
skip_if_not_installed(pkg, minimum_version = "specify version")
```
Skip if a host is offline. This is handy if a package depends on some website for a functionality and it is offline. Sometimes it's not obvious where the failure occured, having tests on each step will save a lot of time.

```r
skip_if_offline(host = "bdverse.org")
```
And lastly, these are service specific. If you are using CRAN, you may want to skip particular tests. Some 

```r
skip_on_cran()
skip_on_bioc() 
```
To skip on a particular operating system.Supported: "windows", "mac",
"linux" and "solaris".

```r
skip_on_os(os)
```
To skip on CI/CD and other services in your project workflow.

```r
skip_on_ci()
skip_on_travis()
skip_on_appveyor()
skip_on_covr()
```
For translation related.

```r
skip_if_translated(msgid = "'%s' not found") #to check for translation
```

### run all tests with custom location of tests

We may come across a case where you want to run few tests froma directory. 
`test_dir` helps to do just that.

```r
test_dir(testthat_examples(), reporter = "minimal") # you can change reporter
```
Similarly, you have `test_file` to run tests from specific file.

```r
# store path in path variable
test_file(path, reporter = "summary") # you can change reporter
```
What if you want to locate a particular file in a testing directory to do some troubleshooting work. You can use `test_path` for that. It helps you find any test file inside `tests/testthat`

```r
test_path("path to file")
```

### C++ unit testing

This will allow you to do C++ unit testing if needed.

```r
use_catch(dir = getwd()) #directory of package
```

### Regression test

We can do regresion test using `verify_output()` which s specifically designed for that. The output is intuitive. It can be used with git.

```r
# The first argument would usually be `test_path("informative-name.txt"`)
# but that is not permitted in examples
path <- tempfile()
verify_output(path, {
head(mtcars)
log(-10)=
"a" * 3
})
writeLines(readLines(path))
# Use strings to create comments in the output
verify_output(tempfile(), {
"Print method"
head(mtcars)
"Warning"
log(-10)
"Error"
"a" * 3
})
# Use strings starting with # to create headings
verify_output(tempfile(), {
"# Base functions"
head(mtcars)
log(-10)
"a" * 3
})
```

### Automatic testing

Well what if you want to run tests after everychanges instead of running them manually. After all, once your testing infrastructure is up and running, you need not test the codebase manually everytime something changes. here `auto_test` and `auto_test_package` comes handy.

When you are developing code. Run following.

```r
auto_test(code_path,test_path, reporter = "summary")
```
And when you are working with a package, you can run following:

```r
auto_test_package(pkg = "package_pa", reporter = default_reporter(), hash = TRUE)
```

These are pretty much every possible test with testthat. Stay tuned for more updates!

## shinytest


`bdverse` uses shiny for various packages to build beautiful User Interfaces for different packages. Testing shiny applications is very easy and intuitive, Imagine it like recording a screen and then replaying it to make sure everything works as intended. You do not have to write manual tests either. It is that easy. 
Let's begin.

[Shiny tests](https://rstudio.github.io/shinytest/articles/shinytest.html) are a way to test Shiny applications. 
You can install it using following commands.

### Install shinytest

```r
library(devtools)
install_github("rstudio/shinytest")
```
### Record a test

Shiny is a little didiffrent when it comes to testing. Here, we record them and then run the tests.

To record tests, we run following command.


```r
library(shinytest)
recordTest("/path_of_shinyapp")
```
This puts the shiny app in testing/recording mode.
You can then run the application and test it the way you think will be helpful to the bdverse.
The tests will be recoreded and saved.

### Run the recorded test

You can now run the recorded test using following command.


```r
testApp("/path_of_shinyapp")
```
Another way of doing it. Here the second argument will get tests from `tests/` directory.

```r
# testApp("myshinyapp", "mytest")
```
Note: "mytest" is just name of test script. You can change t n test event recorder if you want to. 

If you want to compare the results without rerunning the tests, you can use following command.


```r
snapshotCompare("path_of_shinyapp", "mytest")
#"mytest" s
```

You can visit [here](https://rstudio.github.io/shinytest/articles/in-depth.html) for in depth tests if the above ones are not sufficient for your need.


## Tests library
[**Coming Soon!**]
