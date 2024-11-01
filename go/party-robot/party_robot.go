package partyrobot

import "fmt"

// Welcome greets a person by name.
func Welcome(name string) string {
	return "Welcome to my party, " + name + "!"
}

// HappyBirthday wishes happy birthday to the birthday person and exclaims their age.
func HappyBirthday(name string, age int) string {
	return fmt.Sprintf("Happy birthday %s! You are now %d years old!", name, age)
}

// AssignTable assigns a table to each guest.
func AssignTable(name string, table int, neighbor, direction string, distance float64) string {
  welcome := Welcome(name)
  assignedTable := fmt.Sprintf("You have been assigned to table %03d. ", table)
  directionMsg := fmt.Sprintf("Your table is %s, exactly %.1f meters from here.", direction, distance)
  neighborMsg := fmt.Sprintf("You will be sitting next to %s.", neighbor)

  return welcome + "\n" + assignedTable + directionMsg + "\n" + neighborMsg
}
