package main

import (
	"flag"
	"fmt"
	"net/http"
	"strconv"

	"main/lib/redis"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	flag.Parse()

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
		user_id := c.Query("user_id")

		// スコアをRedisから取得
		score, err := redis.GetValue(user_id)
		if err != nil {
			c.JSON(http.StatusBadGateway, gin.H{
				"error": fmt.Sprintf("get redis err: %s", err.Error()),
			})
			return
		}

		// コストの取得（ここで計算処理を叩く感じかな）
		cost := 2490
		// 文字列から数値へ
		int_score, _ := strconv.Atoi(score)
		// 累計ユーザー数
		user_count, _ := redis.DBSize()

		c.JSON(http.StatusOK, GetScoreResponse{
			Cost:      cost,
			Score:     int_score,
			UserCount: user_count,
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
		err = redis.HINCRBY(STORE_USER_SCORE, request.UserId, request.Score)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{
				"error": fmt.Sprintf("LOG: %s", err.Error()),
			})
			return
		}

		// err = redis.SetValue(request.UserId, strconv.Itoa(request.Score))
		// if err != nil {
		// 	c.JSON(http.StatusBadGateway, gin.H{
		// 		"error": fmt.Sprintf("get redis err: %s", err.Error()),
		// 	})
		// 	return
		// }

		c.JSON(http.StatusOK, PostScoreResponse{
			Message: "ok",
		})
	})
	// router.POST("/pod", func(c *gin.Context) {
	// 	namespace := c.Query("namespace")
	// 	pod := c.Query("pod_name")
	// 	pod_count, _ := strconv.Atoi(c.Query("pod_count"))
	// 	status, err := k8s.UpdatePodCount(config, namespace, pod, pod_count)
	// 	if err != nil || status == -1 {
	// 		c.JSON(http.StatusBadGateway, gin.H{
	// 			"error": fmt.Sprintf("get k8s err: %s", err.Error()),
	// 		})
	// 		return
	// 	}
	// })
	// router.GET("/pod", func(c *gin.Context) {
	// 	namespace := c.Query("namespace")
	// 	pod := c.Query("pod_name")
	// 	podsCount, err := k8s.GetPodsCount(config, namespace, pod)
	// 	if err != nil || podsCount == -1 {
	// 		c.JSON(http.StatusBadGateway, gin.H{
	// 			"error": fmt.Sprintf("get k8s err: %s", err.Error()),
	// 		})
	// 		return
	// 	}

	// 	c.JSON(http.StatusOK, GetPodsCountResponse{
	// 		Count: podsCount,
	// 	})

	// })
	router.GET("/ws/:userId", func(c *gin.Context) {
		userId := c.Param("userId")
		serveWs(c.Writer, c.Request, userId)
	})

	go h.run()

	router.Run(":80")
}
