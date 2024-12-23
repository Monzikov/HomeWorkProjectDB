--операции создания таблиц
-- таблица author Автор книги (фамилия, имя)
create table author (
    id serial,
    firstname varchar(256),
    lastname varchar(256)
);

-- таблица publisher Издательство (наименование организации)
create table publisher (
    id serial,
    name text
);

-- таблица book Книга (информация об авторах*, издательство, издание, год издания, адрес уровня библиотеки* (филиал + местоположение))
create table book (
    isbn varchar(16),
    title varchar(256),
    edition varchar(256),
    publisher_id int,
    publishing_year int,
    information text
);

-- таблица book_author ** Информация о связях авторов и книг
create table book_author (
    author_id int,
    isbn varchar(16)
);

-- таблица library Библиотека (принадлежность к головному филиалу + местоположение)
create table library (
    id serial,
    head_library_id int,
    name text,
    location text
);

-- таблица ** Экземпляры книги в библиотеке (информация о количестве экземпляров конкретной книги в библиотеке)
create table library_books (
    id serial,
    library_id int,
    book_istance_count int
);

-- таблица education_level Уровень образования
create table education_level (
    id serial,
    name varchar(64)
);

-- таблица reader Читатель (фамилия, имя, дата рождения, пол, уровень образования)
create table reader (
    id serial,
    firstname varchar(256),
    lastname varchar(256),
    middlename varchar(256),
    birth_date date,
    sex bool,
    education_id int
);

-- таблица book_in_read Выдача книги (какая книга выдана, дата выдачи, ожидаемая дата возврата, дата фактического возврата) + ссылка на читателя
create table book_in_read (
    id serial,
    reader_id int,
    isbn varchar(16),
    issue_date date,
    back_planning_date date,
    back_fact_date date   
);

-- введение ограничений на созданные таблицы 

-- not null
alter table author alter column firstname set not null;
alter table publisher alter column name set not null;
alter table book alter column title set not null;
alter table reader alter column firstname set not null;
alter table reader alter column lastname set not null;

-- pks
alter table author add constraint author_pk primary key (id);
alter table book add constraint book_pk primary key (isbn);
alter table publisher add constraint publisher_pk primary key (id);
alter table book_author add constraint book_author_pk primary key (author_id, isbn);
alter table library add constraint library_pk primary key (id);
alter table library_books add constraint library_books_pk primary key (id);
alter table education_level add constraint education_level_pk primary key (id);
alter table reader add constraint reader_pk primary key (id);
alter table book_in_read add constraint book_in_read_pk primary key (id);

-- fks
alter table book add constraint book_publisher_fk foreign key (publisher_id) references publisher(id);
alter table book_author add constraint fk_book_author_author_fk foreign key (author_id) references author(id);
alter table book_author add constraint fk_book_author_book_fk foreign key (isbn) references book(isbn);
alter table book_in_read add constraint fk_book_in_read_book_fk foreign key (isbn) references book(isbn);
alter table book_in_read add constraint fk_book_in_read_reader_fk foreign key (reader_id) references reader(id);
