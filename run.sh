#!/bin/bash

if [ $# -eq 2 ]; then
  directory="$1"
  extensions="$2"
else
  read -p "Enter the directory path: " directory
  read -p "Enter the desired file extensions (comma-separated): " extensions
fi

directory="${directory%\\}"
directory="${directory#\\}"
directory="${directory%\'}"
directory="${directory#\'}"

IFS=',' read -ra ext_array <<< "$extensions"

tree=$(tree -f --noreport "$directory" | sed 's/^/ /')

file_contents=""

for ext in "${ext_array[@]}"; do
  while IFS= read -r -d '' file; do
    file_contents+="File: ${file/#$directory\//}\\n"
    file_contents+="$(cat "$file")\\n\\n"
  done < <(find "$directory" -type f -name "*.$ext" -print0)
done

output="Directory Tree:\\n$tree\\n\\nFile Contents:\\n$file_contents"

printf "%s" "$output" | pbcopy

echo "Directory tree and file contents have been copied to the clipboard."
