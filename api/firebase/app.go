package firebase

import (
	"context"
	"log"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"google.golang.org/api/option"
)

func Auth() *auth.Client {
	opt := option.WithCredentialsFile("dinvoice-dzyfhuba-key.json")
	config := &firebase.Config{ProjectID: "dinvoice-dzyfhuba"}
	app, err := firebase.NewApp(context.Background(), config, opt)

	if err != nil {
		log.Fatalf("error initializing app: %v\n", err)
	}

	client, err := app.Auth(context.Background())
	if err != nil {
		log.Fatalf("error getting Auth client: %v\n", err)
	}

	return client
}
