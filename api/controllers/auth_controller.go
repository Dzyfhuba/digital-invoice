package controllers

import (
	"context"

	"github.com/Dzyfhuba/digital-invoice/api/model"
	ServiceAuth "github.com/Dzyfhuba/digital-invoice/api/services/auth"
	"github.com/gin-gonic/gin"
)

func AuthControllerRegister(ctx *gin.Context)  {
	var payload model.User

	if payload.Password != payload.PasswordConfirmation {
		ctx.JSON(400, gin.H{
			"error": "Password confirmation not same",
		})
	}

	if err := ctx.ShouldBind(&payload); err == nil {
		auth, err := ServiceAuth.Register(context.Background(), payload)

		if err != nil {
			ctx.JSON(500, gin.H{
				"error": err.Error(),
			})
		}

		ctx.JSON(200, gin.H{
			"message": "Registration success",
			"auth": auth,
		})
	} else {
		ctx.JSON(400, gin.H{
			"error": err.Error(),
			"request": payload,
		})
	}
}