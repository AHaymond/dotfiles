# a tool developed by an Instructure employee
# team, for assuming AWS IAM roles
# https://github.com/daveadams/go-rapture
if [ -n "$(command -v rapture)" ]; then
  eval "$( command rapture shell-init )"
fi
