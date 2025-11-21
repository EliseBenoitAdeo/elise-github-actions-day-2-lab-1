setup() {
  DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
  PATH="$DIR/../scripts:$PATH"

  load "$DIR/test_helper/bats-support/load"
  load "$DIR/test_helper/bats-assert/load"
}

@test "this is a test" {

}

@test "addition.sh: 5 + 5 equals 10" {
  run addition.sh 5 5
  assert_success
  assert_output "10"
}

@test "addition.sh: missing arg throws an error" {
  run addition.sh 5
  assert_failure
  assert_output "command line arguments are missing"
}

@test "addition.sh: returned exit code is 3" {
  run addition.sh 5
  assert_equal "$status" "3"
}

@test "hello-world.sh: returns Hello not Hola" {
  run hello-world.sh
  assert_output "Hello World!"
}
