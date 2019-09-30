case $1 in
  ("iOSTests") SIMULATOR='NetcoTests/iPhone-8/iOS/12.4' ;;
  ("tvOSTests") SIMULATOR='NetcoTests/Apple-TV-1080p/tvOS/12.4' ;;
  ("macOSTests") echo "platform=macOS,arch=x86_64"; exit 0 ;;
  (*) exit -1 ;;
esac

echo "id=$(./scripts/create_simulator.sh $SIMULATOR)"
