package main

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo"
)

var estateCache []Estate

func listEstatesInPolygon(c echo.Context, coordinates Coordinates) ([]Estate, error) {
	estates := []Estate{}
	query := fmt.Sprintf(
		`SELECT estate.id, estate.thumbnail, estate.name, estate.description, estate.latitude, estate.longitude, estate.address, estate.rent, estate.door_height, estate.door_width, estate.features, estate.popularity FROM estate JOIN estate_location ON estate.id = estate_location.id WHERE ST_Contains(ST_PolygonFromText(%s), estate_location.location) ORDER BY estate.popularity DESC, estate.id ASC`,
		coordinates.coordinatesToText2(),
	)
	c.Echo().Logger.Infof("query = %q", query)
	err := db.Select(&estates, query)
	return estates, err
}

func updateEstateCache() error {
	estateCache = []Estate{}
	err := db.Select(&estateCache, "SELECT id, thumbnail, name, description, latitude, longitude, address, rent, door_height, door_width, features, popularity FROM estate")
	return err
}

func debugEstate(c echo.Context) error {
	return c.JSON(http.StatusOK, estateCache)
}
