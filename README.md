# Python Virtual Environment Automation Script

This script provides a simple Bash function to automate the creation and activation of Python virtual environments. By adding this function to your `.bashrc` file, you can streamline your workflow and easily manage virtual environments from the terminal.

## Features

- **Create and Activate Virtual Environments:** Automatically creates a new virtual environment if it doesn’t exist and activates it.
- **Simple Usage:** Just call the function with the name of the virtual environment you want to use.

## Installation

1. **Copy the Script into $HOME/.bashrc:**

   Copy the ```bash script.sh``` into a file named `$HOME/.bashrc `:


2. **Save .bashrc file and exit then source .bashrc file:**
    ```bash
        source "$HOME/.bashrc"
    ```

3. **Usage**
    - Navigate to project directory and type
    ```bash
        pyactivate <venv_name>
    ```
    **If environment exist then it just activate it otherwise it creates and activate it**
