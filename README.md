# Workout Diary
Это приложения на Flutter для отображения, добавления тренировок, отлеживания прогресса в них. Данные о тренировках получают из API.
Серверная часть находится в папке [backend](https://github.com/alafonin4/Workouts-diary/tree/main/backend), пока серверная часть представлена монолитом, в дальнейшем будет переписан на микросервисах.
Клиентская часть (приложение на flutter) находится в папке [workouts_diary](https://github.com/alafonin4/Workouts-diary/tree/main/workouts_diary).

У меня не получилось написать код, который будет определять на каком порту запущен клиент в backend'е, поэтому рекомендую запускать такой командой:
```
flutter run -d chrome --web-port=3001
```
Презентация проекта находится [по ссылке](https://disk.yandex.ru/i/RPkY6UfmVStLjA)
