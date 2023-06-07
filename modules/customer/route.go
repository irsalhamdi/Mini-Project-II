package customer

import (
	"crm/middleware"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type RouterCustomerStruct struct {
	customerRequestHandler RequestHandlerCustomerStruct
}

func NewRouter(
	dbCrud *gorm.DB,
) RouterCustomerStruct {
	return RouterCustomerStruct{
		customerRequestHandler: RequestHandler(
			dbCrud,
		),
	}
}

func (r RouterCustomerStruct) Handle(router *gin.Engine) {
	basepath := "api/v1/customer"
	customerRouter := router.Group(basepath, middleware.Auth)

	customerRouter.POST("/register",
		r.customerRequestHandler.CreateCustomer,
	)

	customerRouter.GET("/:id", middleware.Fetch,
		r.customerRequestHandler.GetCustomerById,
	)
	customerRouter.GET("", middleware.Fetch,
		r.customerRequestHandler.GetAllCustomer,
	)

	customerRouter.PUT("/:id",
		r.customerRequestHandler.UpdateCustomerById,
	)
	customerRouter.DELETE("/:id",
		r.customerRequestHandler.DeleteCustomerById,
	)
}
