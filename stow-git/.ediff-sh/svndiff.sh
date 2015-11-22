#!/bin/sh


run_emacs_cmd() {
  emacsclient --no-wait $C_OR_T --eval "$EVALSTR" 2>&1
}

run_diff2() {
  EVALSTR="(ediff-files \"$1\" \"$2\")"
  run_emacs_cmd
}

run_diff3() {
  EVALSTR="(ediff-files3 \"$1\" \"$2\" \"$3\")"
  run_emacs_cmd
}

run_merge() {
  EVALSTR="(ediff-merge-files-with-ancestor \"$3\" \"$2\" \"$1\" nil \"$4\")"
  run_emacs_cmd
}

# Are we running in X?
if [ -z "$DISPLAY" ]; then
  C_OR_T="-t"
else
  C_OR_T="-c"
fi

case ${#} in
  3)
    run_diff2 "$1" "$2";;
  4)
    run_diff3 "$1" "$2" "$3";;
  5)
    run_merge "$1" "$2" "$3" "$4";;
  *)
    echo "Usage ${0} [FILE1 FILE2] [FILE1 BASE FILE2] [BASE THEIRS MINE MERGED]"
    exit 1
    ;;
esac

if [ ! $(egrep -c '^(<<<<<<<|=======|>>>>>>>|####### Ancestor)' ${_MERGED}) = 0 ]; then
    _MERGEDSAVE=$(${_MKTEMP} --tmpdir `${_BASENAME} ${_MERGED}`.XXXXXXXXXX)
    ${_CP} ${_MERGED} ${_MERGEDSAVE}
    echo 1>&2 "Oops! Conflict markers detected in $_MERGED."
    echo 1>&2 "Saved your changes to ${_MERGEDSAVE}"
    echo 1>&2 "Exiting with code 1."
    exit 1
fi

exit 0
