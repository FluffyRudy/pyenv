pyactivate() {
  if [ -z "$1" ]; then
    echo "Usage: <venv_name>"
    return 1
  fi

  if [ ! -d "$1" ]; then
    echo "Virtual environment not found. Creating a new one."
    
    echo "Available Python interpreters:"
    py_versions=($(ls /usr/bin/python* | grep -E 'python[0-9]+\.[0-9]+'))
    for i in "${!py_versions[@]}"; do
      echo "$i) ${py_versions[$i]}"
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
