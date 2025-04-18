####################################
#  Setup
####################################

DOCKERCMD="docker"
DOCKERCOMPOSECMD="docker-compose"

####################################
#  Docker
####################################

# Make docker shorter
alias d="$DOCKERCMD"

# Get docker images
alias di="$DOCKERCMD images"

# Pull docker images
alias dl="$DOCKERCMD pull"

# Push docker images
alias dp="$DOCKERCMD push"

# Get container process
alias dps="$DOCKERCMD ps"

# Get container IP
alias dip="$DOCKERCMD inspect --format '{{ .NetworkSettings.IPAddress }}'"

# I don't know what this does right now
handle_empty(){
  while read line; do
    if test -z "$line"; then
        echo 'There was an empty line, exiting.' # > /dev/stderr
        exit 0;
    fi
    echo "$line"
  done;
}

# clean up volumes
dvolumes() { docker volume ls -qf dangling=true | handle_empty | xargs docker volume rm | cat; }

# clean up networks
dnetworks() {
  docker network ls --format "{{json . }}" | jq -r '.Name' | while read name; do
    if test "$name" == "interos-test"*; then
      docker network rm "$name" | cat
    fi
  done
}

# Stop all containers
dstop() { $DOCKERCMD stop $($DOCKERCMD ps -a -q); }

# Remove all containers
drm() { $DOCKERCMD rm $($DOCKERCMD ps -a -q); }

# Remove all images
dri() { $DOCKERCMD rmi -f $($DOCKERCMD images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() {
  if [ -n "$1" ]; then
    IMAGENAME="$1"
  fi

  if [[ -z "$IMAGENAME" && `head -1 ./Dockerfile | grep -c '^#\s\?IMAGE'` = 1 ]]; then
    IMAGENAME=$(head -1 ./Dockerfile | awk '{print $3}')
  fi

  if [ -n "$IMAGENAME" ]; then
    exec 5>&1
    ID=$($DOCKERCMD build --progress=plain -t=$IMAGENAME . | tee >(cat - >&5) | tail -1 | awk '{print $NF}')
    echo -e "Built image: \033[32m$IMAGENAME\033[39m";
  else
    exec 5>&1
    ID=$($DOCKERCMD build --progress=plain . | tee >(cat - >&5) | tail -1 | awk '{print $NF}')
  fi

  for tag in $(cat "./Dockerfile" | grep "^#\s\?TAG" | awk '{print $NF}'); do
    echo -e "Setting tag: \033[32m$tag\033[39m";
    $DOCKERCMD tag -f $ID $tag;
  done

  unset IMAGENAME
}

# Clean up images
dclean() {
  # $1 Specify search
  #if [ -n "$1" ]; then
  #  search="$1"
  #else
  #  search="<none>"
  #fi

  #$DOCKERCMD rmi -f $($DOCKERCMD images | grep "^$search" | awk '{print $3}');

  #unset search

  docker rmi $(docker images -q -f dangling=true)
}

####################################
#  Docker Compose
####################################

# Make docker-compose shorter
alias dc="$DOCKERCOMPOSECMD"

# Docker compose ps
alias dcps="$DOCKERCOMPOSECMD ps"

# Docker compose up
alias dcu="$DOCKERCOMPOSECMD up"

# Docker compose up -d
alias dcud="$DOCKERCOMPOSECMD up -d"

# Docker compose run
alias dcr="$DOCKERCOMPOSECMD run"

# Docker compose restart
alias dcrs="$DOCKERCOMPOSECMD restart"

# Docker compose start
alias dcs="$DOCKERCOMPOSECMD start"

# Docker compose stop
alias dcp="$DOCKERCOMPOSECMD stop"

# Docker compose logs
alias dcl="$DOCKERCOMPOSECMD logs"

# Docker compose logs -f
alias dclf="$DOCKERCOMPOSECMD logs -f"

# Pull all images in docker-compose.yml
dcpull() {
  if [ -f ./docker-compose.yml ]; then
    echo ""
    echo "Pulling all images listed in the docker-compose.yml file"
    echo ""
    cat ./docker-compose.yml | grep "^\s*image:" | awk '{print $NF}' | uniq | xargs -L1 $DOCKERCMD pull
  else
    echo "No docker-compose.yml file found."
  fi
}


####################################
#  General
####################################

# Show all aliases related to docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
