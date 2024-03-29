USE [master]
GO
/****** Object:  Database [Photographer]    Script Date: 8/12/2021 6:27:21 PM ******/
CREATE DATABASE [Photographer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Photographer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Photographer.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Photographer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Photographer_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Photographer] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Photographer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Photographer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Photographer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Photographer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Photographer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Photographer] SET ARITHABORT OFF 
GO
ALTER DATABASE [Photographer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Photographer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Photographer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Photographer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Photographer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Photographer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Photographer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Photographer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Photographer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Photographer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Photographer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Photographer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Photographer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Photographer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Photographer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Photographer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Photographer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Photographer] SET RECOVERY FULL 
GO
ALTER DATABASE [Photographer] SET  MULTI_USER 
GO
ALTER DATABASE [Photographer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Photographer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Photographer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Photographer] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Photographer] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Photographer', N'ON'
GO
USE [Photographer]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 8/12/2021 6:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[face_url] [nvarchar](255) NULL,
	[twitter_url] [nvarchar](255) NULL,
	[google_url] [nvarchar](255) NULL,
	[about] [nvarchar](max) NULL,
	[image_main] [nvarchar](max) NULL,
	[map] [nvarchar](max) NULL,
	[content_main] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 8/12/2021 6:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Images]    Script Date: 8/12/2021 6:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] NOT NULL,
	[gallery_id] [int] NOT NULL,
	[image_url] [nvarchar](max) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Contact] ([address], [city], [country], [telephone], [email], [face_url], [twitter_url], [google_url], [about], [image_main], [map], [content_main]) VALUES (N'Gia Binh, Bac Ninh, Viet Nam', N'Bac Ninh', N'Viet Nam', N'0393556120', N'Cuongnmhe140375@fpt.edu.vn', N'https://www.facebook.com/', N'https://twitter.com/', N'https://www.google.com/', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim', N'homeImage.jpg', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59527.30506834611!2d106.0426163922781!3d21.17401439535188!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31350c5b3464ae51%3A0x1a3035b9749102f9!2zVHAuIELhuq9jIE5pbmgsIELhuq9jIE5pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1623862884388!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>', N'Lorem ipsum dolor sit amet')
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (1, N'View Gallery 1', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation1', N'Gallery 1')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (2, N'View Gallery 2', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation2', N'Gallery 2')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (3, N'View Gallery 3', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation3', N'Gallery 3')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (4, N'View Gallery 4', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation4', N'Gallery 4')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (5, N'View Gallery 5', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation5', N'Gallery 5')
INSERT [dbo].[Gallery] ([id], [title], [description], [name]) VALUES (6, N'View Gallery 6', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation6', N'Gallery 6')
SET IDENTITY_INSERT [dbo].[Gallery] OFF
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (1, 1, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (2, 1, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (3, 1, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (4, 1, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (5, 1, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (6, 1, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (7, 1, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (8, 1, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (9, 1, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (10, 1, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (11, 2, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (12, 2, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (13, 2, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (14, 2, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (15, 2, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (16, 2, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (17, 2, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (18, 2, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (19, 2, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (20, 2, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (21, 3, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (22, 3, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (23, 3, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (24, 3, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (25, 3, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (26, 3, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (27, 3, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (28, 3, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (29, 3, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (30, 3, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (31, 4, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (32, 4, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (33, 4, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (34, 4, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (35, 4, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (36, 4, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (37, 4, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (38, 4, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (39, 4, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (40, 4, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (41, 5, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (42, 5, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (43, 5, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (44, 5, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (45, 5, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (46, 5, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (47, 5, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (48, 5, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (49, 5, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (50, 5, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (51, 6, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (52, 6, N'img2.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (53, 6, N'img3.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (54, 6, N'img4.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (55, 6, N'img5.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (56, 6, N'img6.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (57, 6, N'img7.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (58, 6, N'img8.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (59, 6, N'img1.jpg')
INSERT [dbo].[Images] ([id], [gallery_id], [image_url]) VALUES (60, 6, N'img2.jpg')
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_GalleryImages] FOREIGN KEY([gallery_id])
REFERENCES [dbo].[Gallery] ([id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_GalleryImages]
GO
USE [master]
GO
ALTER DATABASE [Photographer] SET  READ_WRITE 
GO
