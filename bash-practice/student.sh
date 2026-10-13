
#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Usage: bash student.sh <name> <course>"
    exit 1
fi

name="$1"
course="$2"

echo "Student Name: $name"
echo "Course: $course"
