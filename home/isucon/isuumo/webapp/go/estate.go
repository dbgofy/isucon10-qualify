package main

import (
	"fmt"
)

func listEstatesInPolygon(c Coordinates) ([]Estate, error) {
	estates := []Estate{}
	query := fmt.Sprintf(
		`SELECT estate.* FROM estate JOIN estate_location ON estate.id = estate_location.id WHERE ST_Contains(ST_PolygonFromText(%s), estate_location.location) ORDER BY state.popularity DESC, estate.id ASC`,
		c.coordinatesToText(),
	)
	err := db.Select(&estates, query)
	return estates, err
}
