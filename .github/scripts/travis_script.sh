#!/bin/sh
set -ve

if [ -n "$COVERITY_SCAN_TOKEN" ]; then
  exit 0
fi

if test -e ./builddir; then
  rm -rf ./builddir;
fi


#../configure ${CONFIGURE_OPTS}
meson builddir
cd builddir

# for 'rmw -s' in the restore test
export TERM=xterm

r=0
if [ -z "$DISTCHECK_ONLY" ]; then
  ninja -v;
  ninja test || r=$?;
  if test "x$r" != "x0"; then
    cat ./meson-logs/testlog.txt;
  fi
else
  ninja -v dist || r=$?
  if test "x$r" != "x0"; then
    cat ./test/test-suite.log;
  fi
fi
if test "x$r" = "x0"; then
  ninja clean;
else
  rm -rf ./test;
fi
