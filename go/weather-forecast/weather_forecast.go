// Package weather provides a Go API for weather forecast.
package weather

// CurrentCondition is a string variable.
var CurrentCondition string
// CurrentLocation is a string variable.
var CurrentLocation string

// Forecast function returns a string with the weather forecast.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
