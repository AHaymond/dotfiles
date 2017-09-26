# Run Go Run
alias gr="go run"

# Run all go files in the current directory
alias gra="go run *.go"

# Run main.go file in the current directory
alias grm="go run main.go"

function go_build_alpine() {
  if [ ! -z "$1" ]; then
    CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-s' -installsuffix cgo -o $1
  else
    CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-s' -installsuffix cgo
  fi
}
