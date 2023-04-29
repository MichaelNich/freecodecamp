PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
    if [[ $1 =~ ^[0-9]+$ ]]
    then
        #ELEMENT=$($PSQL "SELECT * FROM properties WHERE atomic_number=$1")
        ELEMENT=$($PSQL "SELECT atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties LEFT JOIN types USING(type_id) WHERE atomic_number=$1;")
        NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number='$1'")
        SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number='$1'")
        if [[ $ELEMENT ]]
        then
            IFS='|'
            echo "$ELEMENT" | while read ATOMIC_NUMBER TYPE ATOMIC_MASS MP BP TYPE_ID
            do
                echo "The element with atomic number $ATOMIC_NUMBER is ${NAME#" "} (${SYMBOL#" "}). It's a $TYPE, with a mass of $ATOMIC_MASS amu. ${NAME#" "} has a melting point of $MP celsius and a boiling point of $BP celsius."
            done
        else
          echo I could not find that element in the database.
        fi
    else
      NAME=$($PSQL "SELECT SUBSTR(TRIM(name), 1) AS tn FROM elements WHERE TRIM(name)='$1'")
      SYMBOL=$($PSQL "SELECT substr(trim(symbol), 1) AS tm FROM elements WHERE TRIM(symbol)='$1'")
      if [[ $NAME ]]
      then
        ELEMENT_ATOMIC=$($PSQL "SELECT TRIM(atomic_number::text) FROM elements WHERE name='$NAME'")
      elif [[ $SYMBOL ]]
      then
        ELEMENT_ATOMIC=$($PSQL "SELECT TRIM(atomic_number::text) from elements WHERE symbol='$SYMBOL'")
      else
        echo I could not find that element in the database.
      fi
      if [[ $ELEMENT_ATOMIC ]]
      then
        NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number='$ELEMENT_ATOMIC'")
        SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number='$ELEMENT_ATOMIC'")
        #ELEMENT=$($PSQL "SELECT * FROM properties WHERE atomic_number=$ELEMENT_ATOMIC")
        ELEMENT=$($PSQL "SELECT atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM properties LEFT JOIN types USING(type_id) WHERE atomic_number='$ELEMENT_ATOMIC';")
        IFS='|'
        echo "$ELEMENT" | while read ATOMIC_NUMBER TYPE ATOMIC_MASS MP BP TYPE_ID
        do
          echo "The element with atomic number ${ELEMENT_ATOMIC#" "} is ${NAME#" "} (${SYMBOL#" "}). It's a $TYPE, with a mass of $ATOMIC_MASS amu. ${NAME#" "} has a melting point of $MP celsius and a boiling point of $BP celsius."
        done
      fi
    fi
fi
