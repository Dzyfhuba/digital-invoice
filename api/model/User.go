package model

type User struct {
	Name string `form:"name" binding:"required"`
	Email string `form:"email" binding:"required"`
	Phone string `form:"phone" binding:"required"`
	Photo string `form:"phone"`
	Password string `form:"password" binding:"required"`
	PasswordConfirmation string `form:"password_confirmation" binding:"required"`
}