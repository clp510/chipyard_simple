#!/bin/bash

help () {
  echo "Build a cycle-accurate VCS simulator for RISCV Gemmini programs,"
  echo 'matching `customConfig` in `configs/GemminiCustomConfigs.scala`.'
  echo
  echo "Usage: $0 [-h|--help] [--debug] [-j [N]]"
  echo
  echo "Options:"
  echo " debug   Builds a VCS simulator which generates waveforms. Without this"
  echo "         option, the simulator will not generate any waveforms."
  echo " j [N]   Allow N jobs at once. Default is 1."
  exit
}

show_help=0
debug=""
j="1"

while [ $# -gt 0 ] ; do
  case $1 in
    -h | --help) show_help=1 ;;
    --debug) debug="debug" ;;
    -j) j=$2; shift
  esac

  shift
done

if [ $show_help -eq 1 ]; then
 help
fi

cd ../../sims/vcs/
make -j$j ${debug} CONFIG=CustomGemminiSoCConfig

