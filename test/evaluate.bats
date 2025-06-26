#!/usr/bin/env bats

load "../functions.sh"

@test "run with correct version (3 levels)" {
  run evaluate "name" "software" "1.0.2" "1.0.2"
  [ "$output" = '0 "software version name" - Current version: 1.0.2' ]
}

@test "run with highest version (3 levels)" {
  run evaluate "name" "software" $'1.0.2\n0.9.5\n0.8.7' "1.0.2"
  [ "$output" = '0 "software version name" - Current version: 1.0.2' ]
}

@test "run with current major version, but older minor (3 levels)" {
  run evaluate "name" "software" $'1.0.2\n0.9.5\n0.8.7' "1.0.1"
  [ "$output" = '1 "software version name" - Current version: 1.0.1, available: 1.0.2' ]
}

@test "run with older major version, but current minor (3 levels)" {
  run evaluate "name" "software" $'1.0.2\n0.9.5\n0.8.7' "0.9.5"
  echo $output
  [ "$output" = '0 "software version name" - Current version: 0.9.5 (still supported), available: 1.0.2' ]
}

@test "run with older major version, but older minor (3 levels)" {
  run evaluate "name" "software" $'1.0.2\n0.9.5\n0.8.7' "0.9.4"
  echo $output
  [ "$output" = '1 "software version name" - Current version: 0.9.4, available: 0.9.5 or 1.0.2' ]
}

@test "run with even older major version, but current minor (3 levels)" {
  run evaluate "name" "software" $'1.0.2\n0.9.5\n0.8.7' "0.8.7"
  echo $output
  [ "$output" = '0 "software version name" - Current version: 0.8.7 (still supported), available: 0.9.5 or 1.0.2' ]
}

@test "run with even older major version, but older minor (3 levels)" {
  run evaluate "name" "software" $'1.0.2\n0.9.5\n0.8.7' "0.8.3"
  echo $output
  [ "$output" = '1 "software version name" - Current version: 0.8.3, available: 0.8.7 or 0.9.5 or 1.0.2' ]
}

@test "run with an unsupported version (3 levels)" {
  run evaluate "name" "software" $'1.0.2\n0.9.5\n0.8.7' "0.7.3"
  echo $output
  [ "$output" = '2 "software version name" - Current version: 0.7.3 (not supported), available: 0.8.7 or 0.9.5 or 1.0.2' ]
}
