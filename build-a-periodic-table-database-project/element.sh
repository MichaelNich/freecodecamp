
echo Please provide an element as an argument.

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 =~ ^[0-9]+$ ]]
then
  echo cu
  ELEMENT=$($PSQL "SELECT * FROM properties WHERE atomic_number=$1")
  if [[ -z $ELEMENT ]]
  then
    echo 3254
  else
    echo "$ELEMENT"
  fi
fi
echo bunda
