# DirectoryPrompter

This bash script generates a directory tree and file contents for a specified directory and file extensions. The output is then copied to the clipboard for easy pasting to your LLM of choice.

## Prerequisites

Before running the script, make sure you have the following:

- macOS or Linux operating system
- `tree` command-line utility installed
  - On macOS, you can install `tree` using Homebrew:
    ```
    brew install tree
    ```
  - Make sure `tree` is added to your system's PATH.
- **Not compatible with windows, yet.**

## Usage

1. Clone the repository or download the `run.sh` script.

2. Open a terminal and navigate to the directory where the script is located.

3. Make the script executable by running the following command:
   ```
   chmod +x run.sh
   ```

4. Run the script with or without command-line arguments:

   - Without command-line arguments:
     ```
     ./run.sh
     ```
     The script will prompt you to enter the directory path and file extensions interactively.

   - With command-line arguments:
     ```
     ./run.sh "/path/to/directory" "txt,md,py"
     ```
     The script will use the provided directory path and file extensions directly, bypassing the prompts.

5. The script will generate the directory tree and file contents, and copy the output to the clipboard.

6. Paste the contents from the clipboard wherever needed.

## Example

To generate the directory tree and file contents for a directory named `project` with file extensions `txt`, `md`, and `py`, run the following command:

```
./run.sh "/path/to/project" "txt,md,py"
```

The output will be copied to the clipboard, ready to be pasted.

## Note

- The script assumes that the `tree` command-line utility is installed and available in the system's PATH.
- The script uses the `pbcopy` command to copy the output to the clipboard on macOS. On Linux, you may need to install `xclip` or `xsel` and modify the script accordingly.

Feel free to customize the script according to your specific requirements.


*Last Update: 04-18-2024*
