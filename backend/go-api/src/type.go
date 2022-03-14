package main

type GetScoreResponse struct {
	Cost      int `json:"cost"`
	Score     int `json:"score"`
	UserCount int `json:"user_count"`
}

type PostScoreRequest struct {
	Score  int    `json:"score"`
	UserId string `json:"user_id"`
}

type PostScoreResponse struct {
	Message string `json:"message"`
}

type GetPodsCountResponse struct {
	Count int `json:"count"`
}
