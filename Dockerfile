# Використовуємо базовий образ для Go
FROM golang:1.22 AS builder

# Встановлюємо робочу директорію в контейнері
WORKDIR /app

# Копіюємо go.mod та go.sum для встановлення залежностей
COPY go.mod ./

# Встановлюємо залежності Go
RUN go mod tidy

# Копіюємо весь код застосунку в контейнер
COPY . .

# Збираємо застосунок
RUN go build -o /app/main .

# Відкриваємо порт для веб-застосунку
EXPOSE 8080

# Запуск застосунку
CMD ["/app/main"]

