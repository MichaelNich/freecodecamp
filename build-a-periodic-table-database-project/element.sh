
echo Please provide an element as an argument.

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

#Check if user inputed a number
if [[ $1 =~ ^[0-9]+$ ]]
then
  echo cu
  ELEMENT=$($PSQL "SELECT * FROM properties WHERE atomic_number=$1")
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")
  if [[ -z $ELEMENT ]]
  then
    echo I could not find that element in the database.
  else
    echo "$ELEMENT" | while read ATOMIC_NUMBER BAR TYPE BAR ATOMIC_MASS BAR MP BAR BP BAR TYPE_ID
    do
      echo "( $SYMBOL)"| tr -s " "
      #echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
  fi
fi
echo bunda
