#!/usr/bin/env bash

# Synopsis:
# Test the track's exercises.
# 
# At a minimum, this file must check if the example/exemplar solution of each 
# Practice/Concept Exercise passes the exercise's tests.
#
# To check this, you usually have to (temporarily) replace the exercise's solution files
# with its exemplar/example files.
#
# If your track uses skipped tests, make sure to (temporarily) enable these tests
# before running the tests.
#
# The path to the solution/example/exemplar files can be found in the exercise's
# .meta/config.json file, or possibly inferred from the exercise's directory name.

# Example:
# ./bin/test

exit_code=0

# Verify the Concept Exercises
for concept_exercise_dir in ./exercises/concept/*/; do
    if [ -d $concept_exercise_dir ]; then
        echo "Checking $(basename "${concept_exercise_dir}") exercise..."
        # TODO: run command to verify that the exemplar solution passes the tests
    fi
done

# Verify the Practice Exercises
for practice_exercise_dir in ./exercises/practice/*/; do
    if [ -d $practice_exercise_dir ]; then
        echo "Checking $(basename "${practice_exercise_dir}") exercise..."
        res= $(/opt/j9.5/bin/jconsole bin/test_exercise.ijs "$practice_exercise_dir/")
        if [ $? -ne 0 ]; then 
            echo "Error in $("${practice_exercise_dir}")"
            ((exit_code++))
        fi
    fi
done

exit $exit_code
