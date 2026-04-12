FROM golang:1.22.2 as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server

#Imagem pequena, quase nada dentro = scratch
FROM scratch
WORKDIR /app
#Copiando o server que foi gerado na primeira etapa para
#Essa nossa pasta app 
COPY --from=build /app/server .
ENTRYPOINT ["./server"]