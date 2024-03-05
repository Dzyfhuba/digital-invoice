package main

import (
	"context"
	"fmt"
	"log"
	"os"

	"firebase.google.com/go/v4/auth"
	"github.com/Dzyfhuba/digital-invoice/api/controllers"
	"github.com/Dzyfhuba/digital-invoice/api/firebase"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"google.golang.org/api/iterator"
)

func init() {
	// Load environment variables from .env file
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
}

func main() {
	// Retrieve the port from the environment variable or use a default value (e.g., 8080)
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	// Initialize the Gin router
	router := gin.Default()

	// Define your routes and handlers here

	router.Use(cors.New(cors.Config{
		AllowOrigins:  []string{"http://localhost:3030"},
		AllowMethods:  []string{"GET", "POST", "PUT", "PATCH", "DELETE"},
		AllowHeaders:  []string{"Origin"},
		ExposeHeaders: []string{"Content-Length"},
	}))

	// routing here
	router.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"hello": "world",
		})
	})

	router.GET("/fire/auth", func(ctx *gin.Context) {
		res := firebase.Auth().Users(context.Background(), "")

		var users []*auth.ExportedUserRecord
		for {
			user, err := res.Next()
			if err == iterator.Done {
				break
			}
			if err != nil {
				log.Fatalf("error listing users: %s\n", err)
			}
			users = append(users, user)
		}

		ctx.JSON(200, gin.H{
			"users": users,
		})
	})

	router.POST("/auth/register", controllers.AuthControllerRegister)

	// Run the Gin application on the specified port
	addr := fmt.Sprintf(":%s", port)
	err := router.Run(addr)
	if err != nil {
		log.Fatal("Error starting Gin server: ", err)
	}
}
