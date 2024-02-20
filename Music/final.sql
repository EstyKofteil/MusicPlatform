CREATE TABLE [dbo].[Album] (
    [Code]            INT            IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (50)     NOT NULL,
    [PublicationDate]   Date            NULL,
    PRIMARY KEY CLUSTERED ([Code] ASC),
);

CREATE TABLE [dbo].[Country] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[City] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    [CountryId] int not null,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

ALTER TABLE  City
ADD CONSTRAINT FK_CityCountry
FOREIGN KEY (CountryId) REFERENCES Country(Id);

CREATE TABLE [dbo].[Composer]  (
    [Code]            INT            IDENTITY (1, 1) NOT NULL,
    [ID]            NVARCHAR (10)               NOT NULL,
    [FirstName]           NVARCHAR (50)     NOT NULL,
    [LastName]   NVARCHAR (50)           NOT NULL,
    [Age]         INT           NOT NULL,
    [CityId]      INT         NOT NULL,
    PRIMARY KEY CLUSTERED ([Code] ASC),
);

ALTER TABLE  Composer
ADD CONSTRAINT FK_ComposerCity
FOREIGN KEY (CityId) REFERENCES City(Id);

CREATE TABLE [dbo].[Processor]  (
    [Code]            INT            IDENTITY (1, 1) NOT NULL,
    [ID]            NVARCHAR (10)               NOT NULL,
    [FirstName]           NVARCHAR (50)     NOT NULL,
    [LastName]   NVARCHAR (50)           NOT NULL,
    [Age]         INT           NOT NULL,
    [CityId]      INT         NOT NULL,
    PRIMARY KEY CLUSTERED ([Code] ASC),
);

ALTER TABLE  Processor
ADD CONSTRAINT FK_ProcessorCity
FOREIGN KEY (CityId) REFERENCES City(Id);

CREATE TABLE [dbo].[Singer] (
    [Code]  INT  IDENTITY (1, 1) NOT NULL,
    [Id] NVARCHAR (10) NOT NULL,
    [FirstName]   NVARCHAR (50)     NOT NULL,
    [LastName]    NVARCHAR (50)     NOT NULL,
    [Description] NVARCHAR (50)     NOT NULL,
    [CityId] int NOT NULL,
    [Age] int NOT NULL,
    PRIMARY KEY CLUSTERED ([Code] ASC),
);
ALTER TABLE  Singer
ADD CONSTRAINT FK_SingerCity
FOREIGN KEY (CityId) REFERENCES City(Id);

CREATE TABLE [dbo].[Song] (
    [Id]  INT  IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (50)     NOT NULL,
    [SingerId] INT NOT NULL,
    [AlbumId] INT NULL,
    [TheSongWriter] NVARCHAR (50) NOT NULL,
    [ComposerId]  INT  NOT NULL,
    [ProcessorId] INT NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    [PublicationDate] DATE NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
);

ALTER TABLE  Song
ADD CONSTRAINT FK_SongSinger
FOREIGN KEY (SingerId) REFERENCES Singer(Code);

ALTER TABLE  Song
ADD CONSTRAINT FK_SongAlbum
FOREIGN KEY (AlbumId) REFERENCES Album(Code);

ALTER TABLE  Song
ADD CONSTRAINT FK_SongComposer
FOREIGN KEY (ComposerId) REFERENCES Composer(Code);

ALTER TABLE  Song
ADD CONSTRAINT FK_SongProcessor
FOREIGN KEY (ProcessorId) REFERENCES Processor(Code);

CREATE TABLE [dbo].[Rating]  (
    [Id]            INT  IDENTITY (1, 1) NOT NULL,
    [AmountOfLikes]  INT   NOT NULL,
    [AmountOfPlays]  INT   NOT NULL,
    [SongId]      INT   NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
);

ALTER TABLE  Rating
ADD CONSTRAINT FK_RatingSong
FOREIGN KEY (SongId) REFERENCES Song(Id);


INSERT INTO Album (Name,PublicationDate)
VALUES 
('kama tov shenifgashnu','2017-08-03'),
('shetach afor','2018-02-06'),
('bein kach vebein kach','2006-12-18'),
('kemalach','2021-06-15'),
('leyachada shmo','2018-01-26');


INSERT INTO country 
VALUES ('United States'),
       ('Israel'),
       ('France'),
       ('Germany'),
       ('Japan'),
       ('China'),
       ('Brazil'),
       ('Mexico'),
       ('Italy'),
       ('Spain'),
       ('Canada'),
       ('Australia'),
       ('India'),
       ('Russia'),
       ('South Africa'),
       ('Egypt'),
       ('Argentina'),
       ('Greece'),
       ('Sweden'),
       ('Thailand'),
       ('Netherlands'),
       ('Switzerland'),
       ('Turkey'),
       ('South Korea'),
       ('Indonesia'),
       ('Belgium'),
       ('Norway'),
       ('Denmark'),
       ('Poland'),
       ('Portugal'),
       ('Ireland'),
       ('Austria'),
       ('New Zealand'),
       ('Czech Republic'),
       ('Hungary'),
       ('Chile'),
       ('Malaysia'),
       ('Saudi Arabia'),
       ('United Arab Emirates'),
       ('Singapore'),
       ('Finland'),
       ('Colombia'),
       ('Philippines'),
       ('Vietnam'),
       ('Romania'),
       ('Nigeria'),
       ('Ukraine'),
       ('Kenya'),
       ('Morocco'),
       ('Peru');

 INSERT INTO City
 VALUES('New York', 1), -- United States
       ('Paris', 3), -- France
       ('Berlin', 4), -- Germany
       ('Tokyo', 5), -- Japan
       ('Beijing', 6), -- China
       ('Rio de Janeiro', 7), -- Brazil
       ('Mexico City', 8), -- Mexico
       ('Rome', 9), -- Italy
       ('Madrid', 10), -- Spain
       ('Toronto', 11), -- Canada
       ('Sydney', 12), -- Australia
       ('Mumbai', 13), -- India
       ('Moscow', 14), -- Russia
       ('Johannesburg', 15), -- South Africa
       ('Tel Aviv', 16), -- Israel
       ('Cairo', 17), -- Egypt
       ('Buenos Aires', 18), -- Argentina
       ('Athens', 19), -- Greece
       ('Stockholm', 20), -- Sweden
       ('Bangkok', 21), -- Thailand
       ('Amsterdam', 22), -- Netherlands
       ('Monsi', 1),
-- הוסף ערים מארץ ישראל
       ('Tel Aviv', 2),
       ('Jerusalem', 2),
       ('Haifa', 2),
       ('Eilat', 2),
       ('Netanya', 2),
       ('Herzliya', 2),
       ('Ramat Gan', 2),
       ('Beer Sheva', 2),
       ('Tiberias', 2),
       ('Nazareth', 2),
       ('Ashdod', 2),
       ('Ashkelon', 2),
       ('Hadera', 2),
       ('Petah Tikva', 2),
       ('Rishon LeZion', 2),
       ('Holon', 2),
       ('Rehovot', 2),
       ('Bat Yam', 2),
       ('Modin', 2),
       ('Givatayim', 2),
       ('Lakewood',1);
insert into City
values ('Bnei Brak',2)
INSERT INTO Composer
VALUES  ('326038408','Benzi', 'Stein',26,44),
        ('326038409','Yossi', 'Green',68,1),
        ('450826011','Hershi', 'Weinberger',45,22),
        ('458263100','Yitzy', 'Waldner',50,22),
        ('458263101','Udi' ,'Damari',46,36),
        ('586410245','Itzi', 'Berry',35,24),
        ('938400990','Ishy', 'Ribo',34,24),
        ('586410245','Naftali', 'Kempe',33,24),
        ('458263101','Udi' ,'Damari',46,36),
        ('586410245','Itzi', 'Berry',35,24)

insert into Processor
VALUES
('859342896','David', 'Toib',33,1),
('546832212','Benny' ,'Lauper',54,25),
('458921326','Yuval' ,'Stopel',40,29),
('356865145','Yoali' ,'Dickman',60,44),
('589422235','Aharla' ,'Nachsoni',56,24),
('589162132','David' ,'Ichilewitz',35,40)

ALTER TABLE Singer ALTER COLUMN Description nvarchar(max) NOT NULL;

INSERT INTO Singer
VALUES  ('326038478','Avraham', 'Fried','Avraham Fried, is an American Hasidic singer and composer. Considered one of the greatest Hasidic singers. Fried began his musical career in the early 80s of the 20th century and released dozens of albums including songs that became hits',1,64),
        ('586410245','Naftali', 'Kempe','Naftali Kempe is an Israeli Orthodox Lithuanian singer and composer, in the style of Hasidic music',24,33),
        ('938400990','Ishy', 'Ribo','Yishai Ribo is an Israeli singer-songwriter and musician',24,34),
        ('586410245','Mordechy', 'Shapiro','Mordechai Shapira is an American ultra-Orthodox singer who performs Hasidic music and pop music. Shapira is considered one of the most successful ultra-Orthodox singers on YouTube',22,34),
        ('678900990','Moshe', 'Klien','Moshe Klein is an Israeli ultra-Orthodox singer',33,29);

insert into Song
VALUES
('Byshanim',1,3,'Masechet Yevamot',2,3,'Rhythmic song','2006-12-18'),
('Ani shar',1,1,'Udi Damari',5,7,'Exciting song','2017-08-03'),
('Rak milim pshutot',1,1,'Ishy Ribo',7,3,'Rhythmic song','2017-08-03'),
('Liyot shalem',5,null,'Yosef Dudian',6,5,'An empowering song','2023-05-14'),
('Lashuv habita',3,2,'Ishy Ribo',7,6,'Rhythmic song','2017-12-03'),
('Choshv al yerushalaim',2,4,'Naftali Kempe',8,8,'Exciting song','2021-10-20')

select* from Processor
insert into Processor
VALUES
('458263101','Udi' ,'Damari',46,36),
('586410245','Itzi', 'Berry',35,24)
select * from Song
insert into Rating
values(40,50,1),
(200,32,2),
(5000,500,3),
(900,200,4),
(500,50,5),
(6000,200,6)
