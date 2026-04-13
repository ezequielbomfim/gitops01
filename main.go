package main

import "net/http"

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Meu App Go language, no GitOps, com Argo, finalizado!"))
	})
	http.ListenAndServe(":8090", nil)
}
