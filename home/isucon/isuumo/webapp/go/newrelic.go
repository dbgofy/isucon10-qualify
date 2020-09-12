package main

import (
	"os"

	"github.com/labstack/echo"
	"github.com/newrelic/go-agent/v3/newrelic"
)

const NEWRELIC_TXN = "newrelic-txn"

func newrelicMiddleware() echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		app, err := newrelic.NewApplication(
			newrelic.ConfigAppName("isucon10q"),
			newrelic.ConfigLicense(os.Getenv("NEWRELIC_LICENSE_KEY")),
		)
		if err != nil {
			panic(err)
		}

		return func(c echo.Context) error {
			txn := app.StartTransaction(c.Request().Method + " " + c.Path())
			defer txn.End()

			txn.SetWebResponse(c.Response().Writer)
			r := c.Request()
			txn.SetWebRequestHTTP(r)

			r = newrelic.RequestWithTransactionContext(r, txn)

			c.Set(NEWRELIC_TXN, txn)

			err := next(c)
			if err != nil {
				txn.NoticeError(err)
			}
			return err
		}
	}
}
