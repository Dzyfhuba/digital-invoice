package auth

import (
	"context"

	"firebase.google.com/go/v4/auth"
	"github.com/Dzyfhuba/digital-invoice/api/firebase"
	"github.com/Dzyfhuba/digital-invoice/api/model"
	"github.com/google/uuid"
)

func Register(ctx context.Context, 
		user model.User,
	) (*auth.UserRecord, error) {
	// Get the user from the database
	auth, err := firebase.Auth().CreateUser(ctx, (&auth.UserToCreate{}).Email(user.Email).DisplayName(user.Name).Password(user.Password).PhotoURL(user.Photo).PhoneNumber(user.Phone).UID(uuid.NewString()))

	return auth, err
}
 