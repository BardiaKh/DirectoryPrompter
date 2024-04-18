#!/bin/bash

read -p "Enter the directory path: " directory

# Remove leading/trailing quotes and backslashes
directory="${directory%\\}"
directory="${directory#\\}"
directory="${directory%\'}"
directory="${directory#\'}"

read -p "Enter the desired file extensions (comma-separated): " extensions

IFS=',' read -ra ext_array <<< "$extensions"

# Check the operating system
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  # Windows
  tree=$(tree //a //f "$directory" | sed 's/^/ /')
else
  # macOS and Linux
  tree=$(tree -f --noreport "$directory" | sed 's/^/ /')
fi

file_contents=""

for ext in "${ext_array[@]}"; do
  while IFS= read -r -d '' file; do
    # Normalize file path separators
    normalized_file="${file//\\//}"
    file_contents+="File: ${normalized_file/#$directory\//}\\n"
    file_contents+="$(cat "$file")\\n\\n"
  done < <(find "$directory" -type f -name "*.$ext" -print0)
done

output="Directory Tree:\\n$tree\\n\\nFile Contents:\\n$file_contents"

# Check the operating system and use the appropriate clipboard command
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  # Windows (requires clip.exe)
  printf "%s" "$output" | clip
else
  # macOS and Linux (requires pbcopy)
  printf "%s" "$output" | pbcopy
fi

echo "Directory tree and file contents have been copied to the clipboard."
