package main

import (
	"fmt"
	"net/http"
	"strconv"

	"main/lib/redis"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	// Set a lower memory limit for multipart forms (default is 32 MiB)
	router.MaxMultipartMemory = 8 << 20 // 8 MiB
	router.Use(cors.New(cors.Config{
		// 許可したいHTTPメソッドの一覧
		AllowMethods: []string{
			"POST",
			"GET",
			"OPTIONS",
			"PUT",
			"DELETE",
		},
		// 許可したいHTTPリクエストヘッダの一覧
		AllowHeaders: []string{
			"Access-Control-Allow-Headers",
			"Content-Type",
			"Content-Length",
			"Accept-Encoding",
			"X-CSRF-Token",
			"Authorization",
		},
		// 許可したいアクセス元の一覧
		AllowOrigins: []string{
			"*",
		},
		MaxAge: 24 * time.Hour,
	}))

	router.GET("/score", func(c *gin.Context) {
		request := GetScoreRequest{}
		err := c.BindJSON(&request)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{
				"error": fmt.Sprintf("get form err: %s", err.Error()),
			})
			return
		}

		// 保存パスをRedisから取得
		score, err := redis.GetValue(request.UserId)
		if err != nil {
			c.JSON(http.StatusBadGateway, gin.H{
				"error": fmt.Sprintf("get redis err: %s", err.Error()),
			})
			return
		}

		// コストの取得（ここで計算処理を叩く感じかな）
		const cost = "1000円"
		// ユーザー数の取得（WebSocketでやるならこのAPIでは返さない気がする）
		const user_count = 10

		c.JSON(http.StatusOK, gin.H{
			"cost": cost,
			"score": score,
			"user_count": strconv.Itoa(user_count),
		})
	})

	router.POST("/score", func(c *gin.Context) {
		request := PostScoreRequest{}
		err := c.BindJSON(&request)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{
				"error": fmt.Sprintf("get form err: %s", err.Error()),
			})
			return
		}

		// スコアをRedisに保存
		err = redis.SetValue(request.UserId, request.Score)
		if err != nil {
			c.JSON(http.StatusBadGateway, gin.H{
				"error": fmt.Sprintf("get redis err: %s", err.Error()),
			})
			return
		}

		c.JSON(http.StatusOK, gin.H{
			"message": "ok",
		})
	})

	router.GET("/ws", func(c *gin.Context) {
		// roomId := c.Param("roomId")
		//roomdIdが存在しているかチェックする
		// result, err := checkRoomId(roomId)
		// if err != nil || !result {
		// 	c.JSON(401, gin.H{
		// 		"message": "Error!",
		// 	})
		// } else {
		// serveWs(c.Writer, c.Request, "maid")
		// }
	})
	router.Run(":8080")
}
