pyactivate() {
  if [ -z "$1" ]; then
   echo "Usuage: <venv_name>"
   return 1
  fi
  if [ ! -d "$1" ]; then
   python3 -m venv "$1"
   sleep 1
  fi
  source "$1/bin/activate"
}
