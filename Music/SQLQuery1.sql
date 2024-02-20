
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

CREATE TABLE [dbo].[Album] (
    [Code]            INT            IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (50)     NOT NULL,
    [PublicationDate]   Date            NULL,
    PRIMARY KEY CLUSTERED ([Code] ASC),
);
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

CREATE TABLE [dbo].[Rating]  (
    [Id]            INT  IDENTITY (1, 1) NOT NULL,
    [AmountOfLikes]  INT   NOT NULL,
    [AmountOfPlays]  INT   NOT NULL,
    [SongId]      INT   NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
);
CREATE TABLE [dbo].[Song] (
    [Id]  INT  IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (50)     NOT NULL,
    [SingerId] INT NOT NULL,
    [AlbumId] INT NOT NULL,
    [TheSongWriter] NVARCHAR (50) NOT NULL,
    [ComposerId]  INT  NOT NULL,
    [ProcessorId] INT NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    [CityId] int NOT NULL,
    [PublicationDate] DATE NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
);

ALTER TABLE  Song
ADD CONSTRAINT FK_SongCity
FOREIGN KEY (CityId) REFERENCES City(Id);

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

ALTER TABLE  Rating
ADD CONSTRAINT FK_RatingSong
FOREIGN KEY (SongId) REFERENCES Song(Id);
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
       ('Israel'),
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
       delete from Country where id=2
       insert into City
      values ('New York', 1), -- United States
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

-- הוסף ערים מארץ ישראל
 ('Tel Aviv', 15),
       ('Jerusalem', 15),
       ('Haifa', 15),
       ('Eilat', 15),
       ('Netanya', 15),
       ('Herzliya', 15),
       ('Ramat Gan', 15),
       ('Beer Sheva', 15),
       ('Tiberias', 15),
       ('Nazareth', 15),
       ('Ashdod', 15),
       ('Ashkelon', 15),
       ('Hadera', 15),
       ('Petah Tikva', 15),
       ('Rishon LeZion', 15),
       ('Holon', 15),
       ('Rehovot', 15),
       ('Bat Yam', 15),
       ('Modin', 15),
       ('Givatayim', 15)
       insert into City 
       values('Lakewood',1)
       update City
       set CountryId=16
        where CountryId=15

       insert into Composer
       values('326038408','Benzi', 'Stein',26,42),
       ('326038409','Yossi', 'Green',68,22),
       ('450826011','Arashi', 'Weinberger',45,43),
       ('458263100','Yitzy', 'Waldner',50,44),
       ('458263101','Udi' ,'Damari',46,36),
       ('586410245','Itzi', 'Berry',35,23)

       INSERT INTO Album (Name,PublicationDate)
VALUES 
('kama tov shenifgashnu','2017-08-03'),
('shetach afor','2018-02-06'),
('bein kach vebein kach','2006-12-18'),
('kemalach','2021-06-15'),
('leyachada shmo','2018-01-26');
insert into Processor
VALUES('859342896','David', 'Toib',33,1),
('546842212','Benny' ,'Lauper',54,23),
('458991326','Yuval' ,'Stopel',40,22),
('356811145','Yoali' ,'Dickman',60,42),
('589422235','Aharla' ,'Nachsoni',56,42),
('589462132','David' ,'Ichilewitz',35,35)

INSERT INTO Composer
VALUES 
        ('938400990','Ishy', 'Ribo',34,23),
        ('586410245','Naftali', 'Kempe',33,23)


insert into Rating
values(40,50,1),
(200,32,2),
(5000,500,3),
(900,200,4),
(500,50,5),
(6000,200,6),
(800,333,7),
(9000,5000,8),
(1000,100,9),
(500,20,10)


