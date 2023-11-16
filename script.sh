#!/bin/bash

readonly BASE_DIRECTORY="/your/main/directory"

find_and_add_files() {
    local dir="$1"
    local playlist="${dir%/}.m3u"

    rm -f "$playlist"

    find "$dir" -type f \( -name "*.mp3" -o -name "*.flac" \) | while IFS= read -r file; do
        echo "$file" >> "$playlist"
    done

    echo "Playlist created or updated: $playlist"
}

for dir in "$BASE_DIRECTORY"/*/; do
    find_and_add_files "$dir"
done
