if [[ `uname` == 'Darwin' ]]; then
	READLINK='greadlink -e'
else
	READLINK='readlink -e'
fi

get_tmux_status() {
	TMUX_STATUS="$GIT_BRANCH$GIT_DIRTY"

	if [ ${#GIT_FLAGS[@]} -gt 0 ]; then
		TMUX_STATUS="$TMUX_STATUS [`IFS=,; echo "${GIT_FLAGS[*]}"`]"
	fi
}

# Taken from http://aaroncrane.co.uk/2009/03/git_branch_prompt/
find_git_repo() {
	local dir=.
	until [ "$dir" -ef / ]; do
		if [ -f "$dir/.git/HEAD" ]; then
			GIT_REPO=`$READLINK $dir`/
			return
		fi
		dir="../$dir"
	done
	GIT_REPO=''
	return
}

find_git_branch() {
	head=$(< "$1/.git/HEAD")
	if [[ $head == ref:\ refs/heads/* ]]; then
		GIT_BRANCH=${head#*/*/}
	elif [[ $head != '' ]]; then
		GIT_BRANCH='(detached)'
	else
		GIT_BRANCH='(unknown)'
	fi
}

# Taken from https://github.com/jimeh/git-aware-prompt
find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    GIT_DIRTY='*'
  else
    GIT_DIRTY=''
  fi
}


find_git_repo
if [[ $GIT_REPO ]]; then
	CWD=`$READLINK "$(pwd)"`/

	find_git_branch "$GIT_REPO"
	find_git_dirty
	get_tmux_status

	echo $TMUX_STATUS
fi

