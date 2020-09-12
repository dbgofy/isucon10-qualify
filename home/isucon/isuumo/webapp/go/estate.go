package main

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo"
)

type EstateCache struct {
	ID           int64   `db:"id" json:"id"`
	Thumbnail    string  `db:"thumbnail" json:"thumbnail"`
	Name         string  `db:"name" json:"name"`
	Description  string  `db:"description" json:"description"`
	Latitude     float64 `db:"latitude" json:"latitude"`
	Longitude    float64 `db:"longitude" json:"longitude"`
	Address      string  `db:"address" json:"address"`
	Rent         int64   `db:"rent" json:"rent"`
	DoorHeight   int64   `db:"door_height" json:"doorHeight"`
	DoorWidth    int64   `db:"door_width" json:"doorWidth"`
	Features     string  `db:"features" json:"features"`
	Popularity   int64   `db:"popularity" json:"-"`
	RentCategory int64   `db:"rent_category" json:"-"`
}

var estateCache []EstateCache

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
	estateCache = []EstateCache{}
	err := db.Select(&estateCache, "SELECT id, thumbnail, name, description, latitude, longitude, address, rent, door_height, door_width, features, popularity, rent_category FROM estate")
	return err
}

func debugEstate(c echo.Context) error {
	return c.JSON(http.StatusOK, estateCache)
}

func (c *EstateCache) Estate() Estate {
	return Estate{
		ID:          c.ID,
		Thumbnail:   c.Thumbnail,
		Name:        c.Name,
		Description: c.Description,
		Latitude:    c.Latitude,
		Longitude:   c.Longitude,
		Address:     c.Address,
		Rent:        c.Rent,
		DoorHeight:  c.DoorHeight,
		DoorWidth:   c.DoorWidth,
		Features:    c.Features,
		Popularity:  c.Popularity,
	}
}
