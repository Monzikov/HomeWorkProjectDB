# HomeWorkProjectDB
 HomeWork by DB Advanced

## Репозиторий к Заданию 1 по курсу “Базы данных: продвинутый уровень”.

Схема базы данных для информационной модели библиотеки.
Информационная модель библиотеки описывает следующие сущности:
	- Автор книги (фамилия, имя)
	- Издательство (наименование организации)ы
	- Книга (информация об авторах, издательство, издание, год издания, адрес уровня
библиотеки (филиал + местоположение))
	- Выдача книги (какая книга выдана, дата выдачи, ожидаемая дата возврата, дата
фактического возврата)
	- Читатель (фамилия, имя, дата рождения, пол, уровень образования)

На основе описанной информационной модели спроектирована схема таблиц и связей между
ними в базе данных. Все таблицы находятся в третьей(или более высшей) нормальной
форме. Связи между таблицами организованы посредством введения внешних ключей.(fk)

Результат выполнения задания - подготовленный SQL скрипт, использующий операторы DDL
для создания инфраструктуры БД. ы
Скрипт roll-up.sql сначала инициирует операции создания таблиц без введения ограничений на атрибуты таблиц,
а далее вводит ограничения на созданные таблицы.

Скрипт разработан под СУБД использование PostgreSQL версии 9 и более
