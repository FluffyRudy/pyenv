pyactivate() {
  if [ -z "$1" ]; then
    echo "Usage: <venv_name>"
    return 1
  fi

  if [ ! -d "$1" ]; then
    echo "Virtual environment not found. Creating a new one."

    echo "Available Python interpreters:"
    py_dirs=("/usr/bin" "/usr/local/bin" "$HOME/.local/bin")
    py_versions=()
    py_version_display=()

    for dir in "${py_dirs[@]}"; do
      if [ -d "$dir" ]; then
        files=($(find "$dir" -maxdepth 1 -type f -executable -name 'python*' ! -name '*-coverage' ! -name '*-config' 2>/dev/null))
        for file in "${files[@]}"; do
          version_output=$("$file" --version 2>&1)
          if [[ $version_output =~ ([0-9]+\.[0-9]+\.[0-9]+) ]]; then
            py_versions+=("$file")
            py_version_display+=("${file}: ${BASH_REMATCH[1]}")
          else
            py_versions+=("$file")
            py_version_display+=("$(basename "$file")")
          fi
        done
      fi
    done

    for i in "${!py_versions[@]}"; do
      echo "$i) ${py_version_display[$i]} (${py_versions[$i]})"
    done

    read -p "Select Python interpreter (default is system-wide Python 3): " choice

    if [ -n "$choice" ] && [[ $choice =~ ^[0-9]+$ ]] && [ "$choice" -ge 0 ] && [ "$choice" -lt "${#py_versions[@]}" ]; then
      python_cmd="${py_versions[$choice]}"
    else
      python_cmd="python3"
    fi

    echo "Using Python interpreter: $python_cmd"

    $python_cmd -m venv "$1"
    sleep 1
  fi

  source "$1/bin/activate"
}
