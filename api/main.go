package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"log"
	"os"
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
	router.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong2",
		})
	})
	router.Run() 

	// Run the Gin application on the specified port
	addr := fmt.Sprintf(":%s", port)
	err := router.Run(addr)
	if err != nil {
		log.Fatal("Error starting Gin server: ", err)
	}
}
