-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 10, 2023 at 03:49 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `ID_CATE` int(11) NOT NULL AUTO_INCREMENT,
  `CATENAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_FIELD` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CATE`),
  KEY `category___fk` (`ID_FIELD`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID_CATE`, `CATENAME`, `ID_FIELD`) VALUES
(1, 'Web Development', 1),
(2, 'Game Development', 1),
(3, 'Mobile Development', 1),
(4, 'Data Science', 1),
(5, 'Financial Analysis', 2),
(6, 'Business Strategy', 2),
(7, 'Sales', 2),
(8, 'Web Design', 3),
(9, 'UX Design', 3),
(10, 'Design Tools', 3),
(11, 'Digital Marketing', 4),
(12, 'Branding', 4),
(13, 'Public Relation', 4),
(14, 'Divorce', 14),
(15, 'Divorce', 15),
(16, 'Divorce', 16);

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
CREATE TABLE IF NOT EXISTS `chapter` (
  `ID_CHAPTER` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COURSE` int(11) DEFAULT NULL,
  `CHAPTERNAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_CHAPTER`),
  KEY `FK_RELATIONSHIP_14` (`ID_COURSE`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`ID_CHAPTER`, `ID_COURSE`, `CHAPTERNAME`) VALUES
(8, 4, 'Currency Converter (Android Studio files)\n'),
(7, 4, 'Displaying Messages (Android Studio files)\n'),
(6, 3, 'TextFields (Android Studio files)\n'),
(5, 3, 'Buttons (Android Studio files)\n'),
(4, 2, 'Formatting Text (Android Studio files)\n'),
(3, 2, 'Opening Sample Projects'),
(2, 1, 'Android Studio Versions'),
(1, 1, 'Introduction to HTML'),
(9, 5, 'Times Tables App (Android Studio Files'),
(10, 5, 'App: Egg Timer (Android Studio files)\n'),
(11, 6, 'App: Brain Trainer'),
(12, 6, 'Downloading Web Content (Android Studio files)\n'),
(13, 7, 'App Guess The Celebrity'),
(14, 7, 'App Whats The Weather'),
(15, 7, 'Using Maps In Your Apps'),
(16, 8, 'Showing The Users Location On A Map\n'),
(17, 8, 'App: Hiker\'s Watch'),
(18, 9, 'Getting Information About Locations\n'),
(19, 9, 'Storing Data Permanently'),
(20, 9, 'SQLite Databases (Android Studio files)\n'),
(21, 10, 'App: News Reader'),
(22, 10, 'Setting Up Parse Server On AWS\n'),
(23, 11, 'Advanced Querie'),
(24, 11, 'Advanced Keyboard Management\n'),
(25, 11, 'Importing Photos From The Camera'),
(26, 12, 'IntelliJ and Setup'),
(27, 12, 'Math and Comments'),
(28, 13, 'Device Discovery'),
(29, 13, 'Introduction to HTML'),
(30, 14, 'Android Studio Versions'),
(31, 14, 'Opening Sample Projects'),
(32, 14, 'Formatting Text (Android Studio files)\n'),
(33, 15, 'Buttons (Android Studio files)\n'),
(34, 15, 'TextFields (Android Studio files)\n'),
(35, 16, 'Displaying Messages (Android Studio files)\n'),
(36, 16, 'Currency Converter (Android Studio files)\n'),
(37, 17, 'Times Tables App (Android Studio Files'),
(38, 17, 'App: Egg Timer (Android Studio files)\n'),
(39, 17, 'App: Brain Trainer'),
(40, 18, 'App: Egg Timer (Android Studio files)\n'),
(41, 18, 'App: Brain Trainer'),
(42, 19, 'Downloading Web Content (Android Studio files)\n'),
(43, 19, 'App Guess The Celebrity'),
(44, 20, 'App Guess The Celebrit'),
(45, 20, 'Using Maps In Your Apps'),
(46, 62, 'chapter 1'),
(50, 65, 'Chapter of My course'),
(51, 66, 'Chapter 1');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `ID_COURSE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CATE` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `COURSENAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LENGTHS` int(11) DEFAULT NULL,
  `CREATEDATE` date DEFAULT NULL,
  `LASTUPDATE` date DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  `VIEWED` int(11) DEFAULT NULL,
  `DESCRIPTIONS` varchar(1500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISCOUNT` float DEFAULT NULL,
  `SHORTDES` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RATENUM` int(11) DEFAULT NULL,
  `STUNUM` int(11) DEFAULT NULL,
  `DISABLE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_COURSE`),
  KEY `FK_RELATIONSHIP_4` (`ID_CATE`),
  KEY `FK_RELATIONSHIP_7` (`ID_USER`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`ID_COURSE`, `ID_CATE`, `ID_USER`, `COURSENAME`, `LENGTHS`, `CREATEDATE`, `LASTUPDATE`, `PRICE`, `VIEWED`, `DESCRIPTIONS`, `DISCOUNT`, `SHORTDES`, `RATENUM`, `STUNUM`, `DISABLE`) VALUES
(1, 1, 1, 'React JS Web Development - The Essentials Bootcamp', 52, '2022-12-01', '2023-12-01', 2500000, 9999, '<pre>This course is completely up-to-date with React in 2022, and will be up to date in 2023! A ton of material has been added and revised in this course. In the updated course, you&rsquo;ll find additional content including:<br><br>New sections on React Hooks.<br><br>A ton of reference content for In-Depth JavaScript walkthroughs.<br><br>Revised material for modern React in 2022: createRoot, root.render, modern React Router, etc.<br><br>Revised material for modern Redux in 2022: @reduxjs/toolkit, updates on best practices, etc.<br><br>Extra Github reference content, including a new commit-per-lecture guide to make sure you can troubleshoot at every step of the way in the course.</pre>', 10, 'Updated for 2022-23: React.js essentials bootcamp - React Core, Router, Redux, Hooks, in-depth JS, + detailed guides!', 2050, 10, 0),
(2, 2, 2, 'Complete C# Unity Game Developer 2D', 56, '2021-05-28', '2023-12-02', 2465000, 10000, '<pre>The course has recently been remastered in Unity 2021.1.<br><br>This course started as a runaway success on Kickstarter and has gone on to become the most popular and most watched Unity game development course on Udemy. The course has full English closed-captions throughout.<br><br>Learn how to create video games using Unity, the world-leading free-to-use game development tool. We start super simple so you need no prior experience of Unity or coding! With our online tutorials, you\'ll be amazed what you can achieve right from the first moment you start the course. <br><br>Benefit from our world-class support from both other students, and the GameDevtv team who are regularly engaged in the forums and Q&amp;A section. Go on to build several games including:<br><br>Snow Boarder: A simple Side-Scrolling jumping game using Unity\'s sprite shape tool<br><br>Laser Defender: A Top-Down Space Shooter with enemies to shoot and dodge;<br><br>TileVania: A fast-paced classic Side-Scrolling Platformer using Unity\'s Tilemap tool;<br><br>Quiz Master: A Quiz Game that focuses on learning how to set up user interface in Unity.</pre>', 8, 'Learn Unity in C# & Code Your First Five 2D Video Games for Web, Mac & PC. The Tutorials Cover Tilemap', 2489, 12, 0),
(3, 1, 1, 'Javascript for Beginners', 75, '2020-12-02', '2023-12-06', 1500000, 34854, '<pre>Take this Javascript training course and start learning Javascript today.<br><br>\"As a business guy I have no place in programming.\" Ten years ago you could have gotten away with that statement. Today you say that to your colleagues and they scoff at you before they go back to their computers to fix real problems and do real work.<br><br>If you want to do something useful start by learning Javascript . In these days when the browser is central to all computer use knowing \"the language of the browser\" is the most important step. A few years ago Javascript potential was uncertain and many programmers considered it useless. These days however competent programmers have identified Javascript real potential and uses and it has gone from a toy language to the main language of the browser. It has become one of the most useful languages of this era. Every developer needs at least a basic understanding of Javascript. A developer who knows Javascript is the rockstar of the company and is in constant demand by employers. Our online Javascript<br><br>course will get you started by teaching all the essential aspects of coding in Javascript. So... what\'s it gonna be? Do you want to supercharge your career and be in constant demand by employers? Do you want to learn how to create dynamic and innovative Javascript documents? Start programming today with our Javascript course for Beginners training and take control of your career.</pre>', 30, 'Learn javascript online and supercharge your web design with this Javascript for beginners training course.', 3245, 14, 0),
(4, 3, 2, 'Build Android Apps with App Inventor 2 - No Coding Required', 54, '2020-12-01', '2023-08-25', 2460000, 36588, '<pre>Build Android Apps with App Inventor 2<br><br>Everybody has a great idea for an app. The problem is, not many of those people have the skills or knowledge required to make that idea a reality. Building an app, regardless of its simplicity or platform, requires certain technical know-how like coding, UX/UI design, and more. App Inventor 2, however, cuts through all of the smoke and allows anyone &ndash; even those with no coding experience &ndash; to build Android apps from the ground up. This course will teach you how.<br><br>Build Apps Without Learning Code!<br><br>Gain a practical understanding of programming basics<br>Navigate and use App Inventor 2 efficiently and effectively<br>Create and build your own apps for Android<br>Test and update your apps after you\'ve built them<br>Learn how to publish your app to Google\'s Play Store<br>Android Apps in an Instant<br><br><br>This course will teach you everything you need to know about building apps &ndash; without the complicated coding normally required. If you have a good internet connection, a basic understanding of what an Android app is, and a great idea for an app that doesn\'t yet exist, then you\'re the perfect candidate! While the course is aimed at beginner programmers or those with no coding experience whatsoever, experienced app builders who want to learn from a new angle will benefit too.</pre>', 12, 'Android application,App Inventor 2,Google Play Store,Basic Programming', 4620, 13, 0),
(5, 4, 1, 'Regression Analysis / Data Analytics in Regression', 75, '2019-12-19', '2023-12-20', 4800000, 89979, '<pre>Get marketable and highly sought after skills in this course that will increase your knowledge of data analytics, with a focus on descriptive statistics, an important tool for understanding trends in data and making important business decisions. <br><br>Enroll now to join the more than 2000 students and get instant access to all course content!<br><br>Whether a student or professional in the field, learn the important basics of both descriptive statistics and IBM SPSS so that you can perform data analyses and start using descriptive statistics effectively. </pre>', 25, 'Gain Important and Highly Marketable Skills in Regression Analysis - Tame the Regression Beast Today!', 3540, 8, 0),
(6, 3, 1, 'Gain Important and Highly Marketable Skills in Regression Analysis - Tame the Regression Beast Today!', 87, '2022-12-20', '2023-04-12', 8744440, 88888, '<pre>&gt;&gt; This is the only Udemy course that is referenced from the official Kotlin website as well as the official Android developers website for people who want to learn Kotlin, whether for Android or other purposes!<br><br>&gt;&gt; Learn programming in Kotlin, the most beautiful modern programming language based on Java!<br><br>&gt;&gt; Join this beginner-friendly course to learn to write code with an awesome and easy-to-learn language!<br><br>&gt;&gt; Expand your expertise as a Java or Android Developer and improve the quality of your code!<br><br>&gt;&gt; I\'ll answer every question you have, help you personally if you get stuck and listen to your feedback! Join 15,000+ happy students of mine on Udemy!</pre>', 7, 'Learn Kotlin from scratch! Grasp object-orientation and idiomatic Kotlin to realize coding projects and Android apps!', 4567, 7, 0),
(7, 2, 2, 'Deep Learning Prerequisites: Linear Regression in Python', 70, '2020-02-07', '2023-12-20', 4567000, 11245, '<pre>This course teaches you about one popular technique used in machine learning, data science and statistics: linear regression. We cover the theory from the ground up: derivation of the solution, and applications to real-world problems. We show you how one might code their own linear regression module in Python.<br><br>Linear regression is the simplest machine learning model you can learn, yet there is so much depth that you\'ll be returning to it for years to come. That\'s why it\'s a great introductory course if you\'re interested in taking your first steps in the fields of:<br><br>deep learning<br><br>machine learning<br><br>data science<br><br></pre>', 70, 'Data science, machine learning, and artificial intelligence in Python for students and professionals', 984, 20, 0),
(8, 4, 1, 'Complete Machine Learning & Data Science Bootcamp 2023', 50, '2020-05-15', '2023-10-13', 2050000, 45424, '<pre>This is a top selling Machine Learning and Data Science course just updated this month with the latest trends and skills for 2023! Become a complete Data Scientist and Machine Learning engineer! Join a live online community of 900,000+ engineers and a course taught by industry experts that have actually worked for large companies in places like Silicon Valley and Toronto. Graduates of Andrei&rsquo;s courses are now working at Google, Tesla, Amazon, Apple, IBM, JP Morgan, Meta, + other top tech companies. You will go from zero to mastery!<br><br><br><br></pre>', 15, 'Learn Data Science, Data Analysis, Machine Learning (Artificial Intelligence) and Python with Tensorflow, Pandas & more!', 1050, 14, 0),
(9, 2, 2, 'How to Make a Retro Style 3D FPS in the Godot Game Engine', 45, '2020-10-16', '2023-06-14', 3000000, 42486, '<pre>In this course you\'ll learn how to make an old school fast paced 3D FPS in the Godot Game Engine.<br><br>I\'ll cover how to set up an environment and lighting, make player movement, create four guns: a machete, shotgun, machine gun, and rocket launcher, make two enemies, one melee and one range, with pathfinding and basic ai, create particle effects for explosions and smoke trails, create animations for weapons, create ammo, health, and weapon pickups, and set up a basic hud for the player</pre>', 42, 'Learn how to make an old school fast-paced first person shooter in the Godot game engine', 3044, 18, 0),
(10, 1, 2, 'React JS- Complete Guide for Frontend Web Development', 64, '2021-12-16', '2022-12-14', 4005000, 23455, '<pre>What\'s this course about?<br>This course is a complete guide to become an expert front-end web developer. It contains all the tools and technologies that you should be proficient in work as a React Developer.<br><br>We will go through the journey of learning HTML5, CSS3, Javascript, ES6, jQuery, and React JS.<br><br>Each of these course modules has a project which you can work on.<br><br>Along with the project problem statement video, you will also find the solution video for that project. It is advised to first try working on the project by yourself.<br><br>Once you have completed working on it, you can see the solution video to know what are the best practices and the most optimized way to complete it.<br><br>As you keep on creating new projects, start adding them to your GitHub repository so that by the end of the course you will be having a place to showcase all your work.<br><br>You will definitely enjoy the journey while completing the course!</pre>', 15, 'Become an expert React JS Developer. Learn HTML, CSS, JavaScript, ES6, React JS and jQuery.', 1005, 7, 0),
(11, 5, 12, 'The Complete Financial Analyst Course 2022', 54, '2019-01-23', '2022-01-03', 6000040, 5047, '<p><strong>It</strong><em>&nbsp;</em><strong>covers the following topics, fundamental for every aspiring financial analyst:</strong></p>\n<ul>\n<li>\n<p>Microsoft Excel for beginner and intermediate users &mdash; become proficient with the world&rsquo;s #1 productivity software</p>\n</li>\n<li>\n<p>Accounting, financial statements, and ratios &mdash; making sense of debits and credits, profit and loss statements, balance sheets, liquidity, solvency, profitability, and growth ratios</p>\n</li>\n<li>\n<p>Finance basics &mdash; interest rates, financial math calculations, loan calculations, time value of money, present and future value of cash flows</p>\n</li>\n<li>\n<p>Business analysis &mdash; understanding what drives a business, essential items to be analyzed, the importance of industry cycles, important drivers for the business of start-up, growth, mature and declining companies, industry KPIs</p>\n</li>\n<li>\n<p>Capital budgeting &mdash;&nbsp;decide whether a company\'s project is feasible from a financial perspective and compare different investment opportunities</p>\n</li>\n<li>\n<p>Microsoft PowerPoint for beginner and intermediate users &mdash; The #1 tool for a visual representation of your work, a necessary skill for every financial analyst</p>\n</li>\n</ul>', 15, 'Excel, Accounting, Financial Statement Analysis, Business Analysis, Financial Math, PowerPoint: Everything is Included!', 1000, 15, 0),
(12, 5, 12, 'Financial Statement Analysis – Ratio Analysis', 78, '2018-01-03', '2021-01-12', 5070000, 6570, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<p><strong>The course will discuss and calculate the debt ratios, equity ratios, debt-to-equity ratios, and times interest earned.</strong></p>\n<p><strong>We will explain and compute the profit margin ratio, gross margin ratio, and return on total assets.</strong></p>\n<p><strong>The course will describe and calculate return on equity, book value per common share, and earnings per share.</strong></p>\n<p><strong>We will calculate and analyze price earnings ratio and dividend yield.</strong></p>\n<p><strong>The course will discuss and analyze the components of a financial statement analysis report. We will explain what software can do for us and what software cannot do.</strong></p>\n</div>\n<div class=\"styles--audience--2xuzW\" data-purpose=\"target-audience\">\n<h2 class=\"ud-heading-xl styles--audience__title--1qhlO\">Who this course is for:</h2>\n<ul class=\"styles--audience__list--16EaN\">\n<li>Accounting students</li>\n<li>Business owners &amp; professionals</li>\n<li>Anyone who whats to learn accounting</li>\n</ul>\n</div>', 20, 'Horizontal analysis, vertical analysis, ratio analysis-liquidity & efficiency, solvency, profitability, & market ratios', 2440, 9, 0),
(13, 5, 12, 'Accounting & Financial Statement Analysis: Complete Training', 60, '2021-01-14', '2023-01-23', 6000000, 8100, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<p><strong><em>Accounting is one of the most important skills for people pursuing a career in Finance.</em></strong></p>\n<p>It helps you understand whether a business is profitable.</p>\n<p>It gives you an idea of a company&rsquo;s size.</p>\n<p>It helps you use the past in order to take action in the present and change the future.</p>\n<p><strong><em>However, it&rsquo;s essential that you understand it well.</em></strong></p>\n<p><strong><em>If you want to become&hellip;</em></strong></p>\n<ul>\n<li>\n<p>a Financial Analyst</p>\n</li>\n<li>\n<p>an Accountant</p>\n</li>\n<li>\n<p>an Auditor</p>\n</li>\n<li>\n<p>a Business Analyst</p>\n</li>\n<li>\n<p>a Financial Controller</p>\n</li>\n<li>\n<p>a Financial Manager</p>\n</li>\n<li>\n<p>a CFO</p>\n</li>\n<li>\n<p>a CEO</p>\n<p>&nbsp;</p>\n</li>\n</ul>\n</div>', 21, 'Accounting & Financial Ratio Analysis made easy. Learn important accounting skills that will get your foot in the door!', 3005, 17, 0),
(14, 5, 1, 'Excel Crash Course: Master Excel for Financial Analysis', 54, '2020-01-10', '2022-01-10', 5400000, 5866, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<p><strong>Build a strong foundation in Excel for careers in:</strong></p>\n<ul>\n<li>Investment banking</li>\n<li>Private equity</li>\n<li>Corporate development</li>\n<li>Equity research</li>\n<li>Financial Planning &amp;&nbsp;Analysis (FP&amp;A)</li>\n</ul>\n<p><strong>Learn industry leading best practices.&nbsp;</strong>&nbsp;This course is based on first-hand investment banking training programs at global banks. &nbsp;The quality of instruction you receive in this course&nbsp;will have you just as sharp as if you took&nbsp;an expensive, live Wall Street course.</p>\n<p><strong>Content and Overview&nbsp;</strong>&nbsp;This course starts with the basics and quickly progresses to a level where even experts will learn something new. &nbsp;We think it\'s important to start at the bottom and build a solid base, which is why we review all the foundational&nbsp;skills you need.</p>\n</li>\n</ul>\n</div>', 23, 'Beginner to Advanced: Learn Excel Shortcuts, Formulas & Functions for Financial Modeling & Corporate Finance', 1400, 24, 0),
(15, 5, 2, 'Beginner to Pro in Excel: Financial Modeling and Valuation', 48, '2020-01-10', '2021-01-07', 6850000, 3799, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<p><strong><em>*Updated for November 2022*</em></strong></p>\n<p><strong><em>Do you want to learn how to use Excel in a real working environment?</em></strong></p>\n<p>Are you about to graduate from a university and look for your first job?&nbsp;</p>\n<p>Are you a young professional looking to establish yourself&nbsp;in your new position?&nbsp;</p>\n<p>Would you like to become your team\'s go-to person for financial modeling in Excel?&nbsp;</p>\n<p><strong><em>Join over 180,000+ successful students taking this course.</em></strong></p>\n<p>Your instructor possesses the following extensive experience in financial modeling:&nbsp;</p>\n<ul>\n<li>\n<p>Financial advisory unit of a top-tier consulting firm</p>\n</li>\n<li>\n<p>Experience in M&amp;A transactions executed in the UK, Italy, Germany, Switzerland, and Poland</p>\n</li>\n<li>\n<p>Employed in the in-house Mergers &amp; Acquisitions department of a large multinational corporation</p>\n</li>\n</ul>\n</li>\n</ul>\n</div>', 5, 'Financial Modeling in Excel that would allow you to walk into a job and be a rockstar from day one!', 2500, 10, 0),
(16, 5, 1, 'SAP FICO (Financial Accounting & Management Accounting)', 46, '2020-01-10', '2021-01-21', 500000, 8121, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>After this course, the students will be able to identify and&nbsp;analyse&nbsp;the business requirements of any organization&nbsp;for Record to Report&nbsp;process cycle and to configure SAP FICO modules accordingly.</p>\n<p>Disclaimer: SAP and other products of SAP mentioned in the training is a trademark or registered trademark of SAP SE, Germany. I am not related or affiliated to that.</p>\n</div>\n<div class=\"styles--audience--2xuzW\" data-purpose=\"target-audience\">\n<h2 class=\"ud-heading-xl styles--audience__title--1qhlO\">Who this course is for:</h2>\n<ul class=\"styles--audience__list--16EaN\">\n<li>Anyone who wants to learn SAP FICO configuration and implementation</li>\n<li>SAP Users who want to extend their knowledge to configure SAP FICO</li>\n<li>Other ERP Consultants who want to learn SAP FICO configuration and implementation</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 12, 'The course covers both configuration and end-user processes for SAP FICO module', 2570, 14, 0),
(17, 5, 2, 'The Complete Financial Analyst Training & Investing Course', 34, '2020-01-16', '2022-01-18', 5490000, 8900, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>#1 Best Selling Investing Course on Udemy!&nbsp;Welcome to&nbsp;<em>The COMPLETE Financial Analyst Training and Investing&nbsp;Course&nbsp;</em>by the author of the best selling business course&nbsp;on Udemy,&nbsp;an award winning professor, Columbia MBA graduate, former Goldman, hedge fund founder,&nbsp;venture capitalist,&nbsp;TEDx Talk speaker,&nbsp;author &amp; entrepreneur featured&nbsp;in Forbes, Business Insider, Wired &amp; Venture Beat.</p>\n<p><strong>I guarantee that this is THE&nbsp;most thorough financial analyst&nbsp;course available ANYWHERE on the market - or your money back.&nbsp;</strong>This is the most thorough and longest&nbsp;course I have ever made and anyone can take it and see remarkable improvements in how competitive they are in the finance industry as a financial analyst or as an investor.&nbsp;</p>\n<p><strong>What Will You&nbsp;Learn in this Finance Bootcamp Course?</strong></p>\n<ul>\n<li>\n<p>How to pick stocks.</p>\n</li>\n<li>\n<p>Become an expert in Excel for financial analysts.</p>\n</li>\n<li>\n<p>How an IPO works.</p>\n</li>\n<li>\n<p>How to manage a portfolio.</p>\n</li>\n<li>\n<p>How to build financial models.</p>\n</li>\n<li>\n<p>How to get hired and promoted as a financial analyst.</p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 34, 'Succeed as a Financial Analyst &Investor by Award Winning MBA Prof who worked @Goldman, in Hedge Funds & Venture Capital', 4670, 15, 0),
(18, 5, 12, 'The Complete Investment Banking Course 2022', 45, '2019-01-04', '2022-01-06', 3200000, 8200, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p><strong>Pretty much everything that can come up in an investment banking interview.&nbsp; &nbsp;</strong></p>\n<p>However, the best part is that you will learn different valuation techniques like the ones used by Goldman Sachs, Morgan Stanley and J.P. Morgan. We will show you how to carry out a Discounted Cash Flow valuation, a multiples valuation, and an LBO valuation. You will learn how to estimate a company&rsquo;s cost of capital and future cash flows. Don&rsquo;t worry if these sound unfamiliar right now; everything is shown in the course - step-by-step - with no steps skipped.&nbsp; &nbsp;&nbsp;</p>\n<p><strong>This is a one-stop-shop, providing everything you need to land a job on Wall Street.&nbsp; &nbsp;</strong></p>\n<p><strong>What makes this course different from the rest of the Finance courses out there? &nbsp;</strong></p>\n<ul>\n<li>\n<p>High quality of production:&nbsp;Full-HD video and animations (This isn&rsquo;t a collection of boring lectures!)</p>\n</li>\n<li>\n<p>Knowledgeable instructor (1.5 million students on Udemy; worked in M&amp;A)</p>\n</li>\n<li>\n<p>Complete training:&nbsp;We will cover all major topics and skills you need to land a job in investment banking</p>\n</li>\n<li>\n<p>Extensive Case Studies: To&nbsp;help you reinforce everything you&rsquo;ve learned</p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 47, 'The #1 Course to Land a Job in Investment Banking. IPOs, Bonds, M&A, Trading, LBOs, Valuation: Everything is included!', 2450, 22, 0),
(19, 5, 1, 'Financial Management A Complete Study for CA/CMA/CS/CFA/ACCA', 64, '2020-01-10', '2021-01-07', 5000000, 7000, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p><strong>Who should take this course?</strong></p>\n<p>Are you struggling in understanding&nbsp; Financial Management concepts like Time Value of Money, Ratio Analysis, Cash Flow Analysis, Fund Flow Analysis, Cost of Capital &amp; Capital Structuring Decisions, Capital Budgeting &amp; Working Capital Management?</p>\n<p>Are you a student pursuing professional courses like CA / CMA / CS / CFA /CPA / ACCA / CIMA / MBA Finance or are you a Finance Professional / Banker aspiring to excel in Finance and rise to top in your career?</p>\n<p>Then this course is for you - Financial Management A Complete Study.</p>\n<p><strong>Why you should take this course?</strong></p>\n<ul>\n<li>\n<p>By taking this course, you will be able to see practical side of Financial Management concepts with lot many case studies to solve. Approaching complex topics through case studies is the best way to understand them and you will find lot many in this course.</p>\n</li>\n<li>\n<p>Knowledge on Financial Management is important for every Entrepreneur and Finance Managers. Ignorance in Financial Management can be disastrous because it would invite serious trouble for the very functioning of the organisation.&nbsp;</p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 55, '500+ lectures & case studies for CA IPCC / CFA / CS Final / CMA Inter / MBA Finance / B. Com Final Exams & Professionals', 2000, 40, 0),
(20, 5, 2, 'The Complete Financial Analyst Course 2022', 45, '2019-01-18', '2022-01-06', 5400000, 6400, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p><strong>You simply need to find a way to acquire practical skills that will give you an edge over the other candidates.</strong></p>\n<p><strong>But how can you do that?</strong></p>\n<p>You need the proper training, and you have never seen how analysts in large firms do their work ...</p>\n<p>Stop worrying, please! We are here to help.</p>\n<p><strong>The Complete Financial Analyst Course is the most comprehensive, dynamic, and practical course you will find online.</strong></p>\n<p><strong>Sounds interesting, right?</strong></p>\n<p>At the end of the challenge, you\'ll send us your work, and we\'ll reply&nbsp;with personalized feedback - creating an interactive student experience that optimizes what you\'ll learn from the course.</p>\n<p><strong>What makes this course different from other finance courses?</strong></p>\n<ul>\n<li>\n<p><strong>High-quality production,</strong>&nbsp;HD video and animations (not a collection of boring lectures)</p>\n</li>\n<li>\n<p><strong>Knowledgeable instructors&nbsp;</strong>with experience in such prominent companies&nbsp;like Pwc and Coca-Cola</p>\n</li>\n<li>\n<p><strong>Complete training</strong> covering all major topics and skills necessary&nbsp;to become a top-</p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 8, 'Excel, Accounting, Financial Statement Analysis, Business Analysis, Financial Math, PowerPoint: Everything is Included!', 2005, 7, 0),
(21, 1, 12, 'Angular Crash Course for Busy Developers', 20, '2020-01-03', '2021-04-08', 3400000, 8240, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>This course contains 20 hours of content but<strong>&nbsp;you only need to watch the first 10 hours</strong>. The other 10 hours are recorded with an earlier version of Angular. You don\'t need to watch those videos.&nbsp;So,<strong>&nbsp;in &nbsp;just&nbsp;10 hours, you can learn all the essential&nbsp;Angular concepts!&nbsp;</strong>You can simply dedicate a weekend to this course and by the end of the weekend you\'ll have a good understanding of Angular and you\'ll be able to build real client apps with Angular. More specifically, you\'ll learn about:&nbsp;</p>\n<ul>\n<li><strong>Fundamentals of TypeScript and object-oriented programming&nbsp;</strong></li>\n<li><strong>Displaying data and handling&nbsp;events</strong></li>\n<li>Building re-usable&nbsp;<strong><strong>components</strong></strong>\n<p style=\"text-align: left;\"><strong>You don\'t need any prior knowledge of earlier versions of Angular.</strong>&nbsp;As long as you have some<strong>&nbsp;basic familiarity with HTML, CSS and JavaScript</strong>&nbsp;you can take this course and start learning Angular&nbsp;right now!</p>\n<p>Every section includes a few <strong>bite</strong>-<strong>sized videos</strong>&nbsp;and concludes with a&nbsp;<strong>coding exercise&nbsp;</strong>to help you master what you learn in that section.&nbsp;</p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 33, 'Have limited time to learn Angular 4 (Angular 2+)? Take this course and learn Angular in 10 hours!', 4570, 20, 0),
(22, 1, 12, 'Angular Crash Course for Busy Developers', 58, '2019-01-11', '2022-01-11', 5403000, 4822, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>This course contains 20 hours of content but<strong>&nbsp;you only need to watch the first 10 hours</strong>. The other 10 hours are recorded with an earlier version of Angular. You don\'t need to watch those videos.&nbsp;So,<strong>&nbsp;in &nbsp;just&nbsp;10 hours, you can learn all the essential&nbsp;Angular concepts!&nbsp;</strong>You can simply dedicate a weekend to this course and by the end of the weekend you\'ll have a good understanding of Angular and you\'ll be able to build real client apps with Angular. More specifically, you\'ll learn about:&nbsp;</p>\n<ul>\n<li><strong>Fundamentals of TypeScript and object-oriented programming&nbsp;</strong></li>\n<li><strong>Displaying data and handling&nbsp;events</strong></li>\n<li>Building re-usable&nbsp;<strong><strong>components</strong></strong>\n<p style=\"text-align: left;\"><strong>You don\'t need any prior knowledge of earlier versions of Angular.</strong>&nbsp;As long as you have some<strong>&nbsp;basic familiarity with HTML, CSS and JavaScript</strong>&nbsp;you can take this course and start learning Angular&nbsp;right now!</p>\n<p>Every section includes a few <strong>bite</strong>-<strong>sized videos</strong>&nbsp;and concludes with a&nbsp;<strong>coding exercise&nbsp;</strong>to help you master what you learn in that section.&nbsp;</p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 33, 'Have limited time to learn Angular 4 (Angular 2+)? Take this course and learn Angular in 10 hours!', 2440, 7, 0),
(23, 1, 12, 'The Modern Angular Bootcamp', 25, '2019-01-10', '2022-01-12', 246000, 2055, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p><strong>Planning on building your own apps?</strong>&nbsp;This course will give you a countless number of reusable code snippets that you can utilize on your own personal projects, saving you valuable time.&nbsp; Angular is all about code reusability, and this course will get you started on the right track.&nbsp; Not only will you get incredibly reusable code, but you\'ll also learn to integrate multiple different CSS&nbsp;frameworks with Angular, so you can get some custom styling that suits the needs of your app.</p>\n<p><strong>Learn from someone who has worked with Angular since its 1.0 release.</strong>&nbsp; I have worked with Angular since version 1.0, released many years ago.&nbsp; I\'ve seen an incredible number of design patterns and approaches, and I\'ve narrowed down that list to the critical topics that you need to understand.&nbsp; Rather than showing you every last tiny feature of Angular, you\'ll learn only the&nbsp;<em>best way</em>&nbsp;to achieve any given task.</p>\n<p><strong>But don\'t just take my word for it - check out the reviews for this course!</strong>&nbsp; You\'ll see that other engineers - just like yourself - have had great success and acquired a new understanding of how to build large web apps using Angular.</p>\n</div>\n</li>\n</ul>\n</div>', 4, 'Get job ready with Angular! Understand how to build and deploy production-ready apps.', 1552, 5, 0),
(24, 1, 1, 'PHP for Beginners - Become a PHP Master - CMS Project', 35, '2019-01-17', '2022-05-17', 3400000, 4600, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p><strong>Planning on building your own apps?</strong> This course will give you a countless number of reusable code snippets that you can utilize on your own personal projects, saving you valuable time.&nbsp; Angular is all about code reusability, and this course will get you started on the right track.&nbsp; Not only will you get incredibly reusable code, but you\'ll also learn to integrate multiple different CSS&nbsp;frameworks with Angular, so you can get some custom styling that suits the needs of your app.</p>\n<p><strong>Knowing PHP has allowed me to make enough money to stay home and make courses like this one for students all over the world.</strong> Being a PHP developer can allow anyone to make really good money online and offline, developing dynamic applications.</p>\n<p><strong>There is no limit to what you can do with this knowledge.</strong>&nbsp;PHP is one of the most important web programming languages to learn, and knowing it, will give you&nbsp;<strong>SUPER POWERS</strong> in the web development world and job market place.</p>\n<p><strong>But don\'t just take my word for it - check out the reviews for this course!</strong>&nbsp; You\'ll see that other engineers - just like yourself - have had great success and acquired a new understanding of how to build large web apps using Angular.</p>\n</div>\n</li>\n</ul>\n</div>', 44, 'PHP for Beginners: learn everything you need to become a professional PHP developer with practical exercises & projects.', 3570, 20, 0),
(25, 1, 1, 'PHP with Laravel for beginners - Become a Master in Laravel', 46, '2019-07-25', '2021-04-07', 5377780, 4654, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p><strong>Right now on Laravel 7.10 but of course as new versions come out, I&nbsp;will keep updating the course.</strong></p>\n<p>&nbsp;</p>\n<ul>\n<li>\n<p><strong>Over 30,000 students in this course and over 600,000 students here at Udemy.</strong></p>\n</li>\n<li>\n<p><strong>Best Rated, Best Selling, Biggest and just baddest course on Laravel around :)</strong></p>\n</li>\n<li>\n<p><strong>Oh, it\'s also&nbsp;the best course for complete beginners and of course regular beginners :)</strong></p>\n</li>\n</ul>\n<p>Laravel has become one of the most popular if not the most popular PHP&nbsp;framework. Employers&nbsp;are&nbsp;asking for this skill for all web programming jobs and in this course we have put together all of them, to give you the best chance of landing that job; or taking it to the next level.</p>\n<p><strong>Why is Laravel so popular?</strong>&nbsp;Because once you learn it, creating complex applications are easy to do, because thousands of other people have&nbsp;created code we can plug (packages) into our Laravel application to make it even better.&nbsp;</p>\n<p>There are many reasons why Laravel is on the top when it comes to PHP&nbsp;frameworks but we are not here to talk about that, right?&nbsp;</p>\n</div>\n</li>\n</ul>\n</div>', 10, 'Learn to master Laravel to make advanced applications like the real CMS app we build on this course', 3500, 15, 0),
(26, 1, 12, 'Node.js for Beginners - Become a Node js Developer + Project', 87, '2021-07-22', '2022-06-21', 560000, 1500, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>I&nbsp;don\'t know about you,but regular classes bore me, and that is why on this Node.js course we make it&nbsp;fun to&nbsp;learn LOTS&nbsp;of cool things. This course is meant for total beginners in the NodeJs world.&nbsp;</p>\n<p>&nbsp;</p>\n<p><strong>This is course is for you if..................</strong></p>\n<p><em>You are total beginner to&nbsp;NodeJs</em></p>\n<p><em>You are looking for a better career</em></p>\n<p><em>You are looking to UP&nbsp;your salary as developer</em></p>\n<p><em>You have tried to learn NODE,js before and it was too hard - I&nbsp;make this EASY!</em></p>\n<p><em>You are trying to get into the Angular World</em></p>\n<p><em>You want to become a great Web Developer with a lot of success</em></p>\n<p>You just need to make some serious income as developer&nbsp;</p>\n</div>\n</li>\n</ul>\n</div>', 0, 'Build an Amazing CMS system - Using Express + MongoDB + Bootstrap - Handlebars + Authentication + AJAX + Deployment', 50, 1000, 0),
(27, 1, 1, 'REACT NODE MERN STACK Learn from Scratch Building 2 Projects', 23, '2021-07-02', '2021-07-16', 4900000, 8000, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>Welcome to&nbsp;<strong>Become a FullStack / MERN Stack JavaScript Developer from Scratch with React, NextJs, Node JS, SocketIo and MongoDB</strong>. In this updated course you will&nbsp;<strong>Learn</strong>&nbsp;<strong>React with Node JS from Absolute Scratch - Build A Complete MERN Stack Social Network from Scratch and Deploy to the Cloud Hosting.</strong></p>\n<p><em>In this course you will learn:</em></p>\n<ul>\n<li>\n<p><strong>Node JS From Scratch</strong></p>\n</li>\n<li>\n<p>Node JS&nbsp;<strong>API Development from Scratch</strong></p>\n</li>\n<li>\n<p><strong>React JS from Scratch</strong></p>\n</li>\n<li>\n<p><strong>Modern JavaScript from Scratch</strong></p>\n</li>\n<li>\n<p>A&nbsp;<strong>FullStack Social Network Application</strong>&nbsp;from Scratch</p>\n</li>\n<li>\n<p>Build&nbsp;<strong>Rock Solid Authentication&nbsp;</strong>with&nbsp;<strong>Password Forgot/Password Reset</strong>&nbsp;using JWT</p>\n</li>\n<li>\n<p><strong>Authorization</strong></p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 0, 'Master MERN Stack from Scratch while building awesome Social Network. Covers entire Front/Backend Database & Deployment.', 3007, 4058, 0),
(28, 2, 1, 'Become a Game Designer the Complete Series Coding to Design', 54, '2020-06-25', '2022-06-09', 3500000, 9404, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>If you are serious about becoming a game designer, then you already know that you need the most current and complete game design training possible. To succeed in this competitive industry it is essential to have an expert knowledge of the entire game development pipeline. Whether it\'s your goal to work for a major game studio, or to develop and publish your own indie games, one thing is clear, you will need to be well trained as both a programmer and an artist.<br>Throughout this extensive training series you will learn beginner to expert level techniques in the areas of 3D game development (Unity), computer animation, digital painting, and programming.</p>\n<p>You will be learning expert techniques and workflows from veterans who have been working in the game industry for over 15 years and have a passion for making great games.</p>\n</div>\n</li>\n</ul>\n</div>', 0, 'Master Unity, 3D game design, 2D game design, coding, C#, game development, 3D animation, programming, level design...', 6450, 3405, 0),
(29, 2, 1, 'Unity C# Scripting : Complete C# For Unity Game Development', 34, '2020-04-28', '2022-05-19', 559044, 8740, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>This Course will Teach You everything that you need to get started with C# scripting in Unity. You will learn step by step from scratch every feature of the C# language as well as how to implement it in Unity\'s API for building Games. All The Content works fine in Unity 2022 .</p>\n<p>List of Things You Will Learn:</p>\n<ol>\n<li>\n<p><strong>Learn C# Language from absolute basics</strong></p>\n</li>\n<li>\n<p><strong>Master basic Programming concepts</strong></p>\n</li>\n<li>\n<p><strong>Learn Unity\'s API</strong></p>\n</li>\n<li>\n<p><strong>Learn Object Oriented Programming Concepts</strong></p>\n</li>\n<li>\n<p><strong>Create Ready To Use C# Scripts</strong></p>\n</li>\n<li>\n<p><strong>Apply Your C# Skills for Building Android / Mobile Games</strong></p>\n</li>\n<li>\n<p><strong>Implement Basic AI Features With C#</strong></p>\n</li>\n<li>\n<p><strong>Learn Version Controlling With Github, Bitbucket, Source Tree</strong></p>\n</li>\n</ol>\n</div>\n</li>\n</ul>\n</div>', 0, 'Learn C# Scripting for Unity Game Development from Basics, Create your own 3D & 2D Games With Unity & C#. (2022 Updated)', 8789, 4845, 0),
(30, 2, 2, 'Become a Game Designer the Complete Series Coding to Design', 46, '2021-06-17', '2022-07-13', 4707000, 6706, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>You will be learning expert techniques and workflows from veterans who have been working in the game industry for over 15 years and have a passion for making great games.<br><br>You will be extensively trained on programs like <strong>Unity</strong>,&nbsp;<strong>Maya</strong>,&nbsp;<strong>3DS Max</strong>,&nbsp;<strong>Mudbox</strong>, and&nbsp;<strong>Photoshop</strong>. Learning powerful tools like these are made easy with fun projects that are designed to take the fear out of learning such advanced software like Unity3D.<br><br>Your training will start with Unity, which is a powerful game engine that has been used by countless studios and indie developers all over the world to build some amazing games. Unity\'s intuitive and user friendly interface is an excellent place to start your path to becoming a game designer. You will start by learning the fundamentals of Unity, giving you a great foundation for you to get excited and confident to move on to more advanced Unity projects which will have you building incredible worlds. In addition to mastering the Unity interface you will be learning how to code in the c# programming language, letting you create any 2D or 3D your imagination can come up with.</p>\n</div>\n</li>\n</ul>\n</div>', 0, 'Master Unity, 3D game design, 2D game design, coding, C#, game development, 3D animation, programming, level design...', 3504, 4045, 0),
(31, 2, 1, 'Unreal Engine 5 C++ Developer: Learn C++ & Make Video Games', 78, '2021-05-20', '2022-06-21', 798900, 8788, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>Ready to&nbsp;<strong>make games in the amazing world of Unreal Engine 5</strong>?</p>\n<p>This<strong>&nbsp;</strong>\"<strong>critically-acclaimed</strong>\" and \"<strong>insanely successful</strong>\" Unreal Engine course<strong>&nbsp;</strong>was<strong>&nbsp;created in collaboration with Epic Games.</strong></p>\n<p><strong>The majority of the course has been fully updated and remastered to Unreal Engine 5.&nbsp;</strong>Existing students get all the new material for free.</p>\n<p><strong>Learn how to create and mod video games using Unreal Engine 5</strong>, even if you\'re a complete beginner. Unreal is a free-to-use game development engine used by AAA studios and indie developers worldwide. It is a massive and powerful beast, but&nbsp;<strong>we break it down step-by-step</strong>&nbsp;so you can tame it.</p>\n<p>We start super simple so&nbsp;<strong>no prior experience of Unreal or coding is needed</strong>! With our online tutorials, you\'ll be amazed at what you can achieve. We believe project-based learning is the best way to learn Unreal Engine, so you&rsquo;ll create 5 Unreal games!</p>\n<p>Already know Unreal and want to learn VR&nbsp;or Multiplayer? Check out our other Unreal courses, just&nbsp;<strong>look for the green leaf&nbsp;</strong>for our other world-class Unreal courses.</p>\n</div>\n</li>\n</ul>\n</div>', 0, 'Created in collaboration with Epic Games. Learn C++ from basics while making your first 5 video games in Unreal', 4990, 5955, 0),
(32, 2, 1, 'Complete C# Unity Game Developer 2D', 99, '2019-04-17', '2022-05-13', 8498060, 5889, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>Learn how to create video games using Unity, the world-leading&nbsp;free-to-use game development tool.&nbsp;<strong>We start super simple&nbsp;</strong>so you need no prior experience of&nbsp;Unity or&nbsp;coding! With our online tutorials, you\'ll be amazed what you can achieve right from the first moment you start the course.&nbsp;</p>\n<p>Benefit from our&nbsp;<strong>world-class support&nbsp;</strong>from both other students, and the GameDevtv team who are regularly engaged in the&nbsp;forums and Q&amp;A section. Go on to build several games including:</p>\n<ul>\n<li>\n<p>Snow Boarder: A simple&nbsp;<strong>Side-Scrolling jumping game&nbsp;</strong>using Unity\'s sprite shape tool</p>\n</li>\n<li>\n<p>Laser Defender:&nbsp;A&nbsp;<strong>Top-Down Space Shooter&nbsp;</strong>with enemies to shoot and dodge;</p>\n</li>\n<li>\n<p>TileVania: A fast-paced classic&nbsp;<strong>Side-Scrolling&nbsp;Platformer&nbsp;</strong>using Unity\'s Tilemap tool;</p>\n</li>\n<li>\n<p>Quiz Master: A&nbsp;<strong>Quiz Game&nbsp;</strong>that focuses on learning how to set up user interface in Unity.</p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 10, 'Learn Unity in C# & Code Your First Five 2D Video Games for Web, Mac & PC. The Tutorials Cover Tilemap', 1420, 5404, 0),
(33, 2, 12, 'Create an RPG Game in Unity', 35, '2019-03-14', '2021-06-16', 7801890, 7808, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>Do you want to create a great RPG fantasy game in Unity?</p>\n<p>In this course I am going to take you through the process step by step:</p>\n<p>&nbsp;</p>\n<ul>\n<li>\n<p>Setting up the terrain and level layout</p>\n</li>\n<li>\n<p>creating menus and inventory systems</p>\n</li>\n<li>\n<p>setting up an onscreen mini map</p>\n</li>\n<li>\n<p>creating a shop system to buy ingredients for potions or weapons and armour</p>\n</li>\n<li>\n<p>setting up a dynamic inventory menu where you can mix potions to create unique magic attacks</p>\n</li>\n<li>\n<p>spawning in enemies and boss characters with combat systems and navigation pathfinding</p>\n</li>\n<li>\n<p>setting up player magic attacks and melee combat</p>\n</li>\n<li>\n<p>saving and loading player progress</p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 10, 'By the end of this course you will learn key concepts in advanced game design and upgrade your knowledge of C# coding to an intermediate level', 1549, 2540, 0),
(34, 2, 1, 'Make a fighting game in Unity', 35, '2018-03-27', '2021-05-12', 5780890, 8780, '<div data-purpose=\"safely-set-inner-html:description:description\">\n<ul>\n<li>\n<div data-purpose=\"safely-set-inner-html:description:description\">\n<p>In this course I am going to be showing you how to create your own fighting game inside of the Unity game engine.</p>\n<ul>\n<li>\n<p>We\'re going to be bringing in a series of free characters as well as a wide range of free animations so that each character can have their own unique style.</p>\n</li>\n<li>\n<p>We\'re going to create a character select screen and we\'re also going to setup AI characters, these are computer controlled characters that will fight against you and it will seem as though the AI character is just as effective and just as realistic as a real player. The characters you choose will dynamically load into the level you choose and there are a wide variety of levels to choose from.</p>\n</li>\n<li>\n<p>We will also be setting up a 2 player mode and mapping the controls for 2 game pad controllers so you can have two people playing at the same time. You can control characters either by game pad or by keyboard.</p>\n</li>\n<li>\n<p>We will setup options so that you can set a difficulty level for the AI characters. You will also be able to adjust the volume for music and sound effects independently.</p>\n</li>\n</ul>\n</div>\n</li>\n</ul>\n</div>', 10, 'Make a professional looking two player fighting game in Unity', 1500, 3545, 0),
(35, 3, 1, 'Objective-C Crash Course for Swift Developers', 35, '2021-04-14', '2021-10-19', 8508890, 5454, 'Submit!\n<p>This course is designed for iOS developers who only know Swift. In order to get a job as an iOS developer you need to know the basics of Objective-C. Also there are still a ton of libraries and tutorials all written in Objective-C.</p>\n<p><strong><em>This is the BEST Objective-C course out there!</em></strong></p>\n<p><strong>HOW THIS COURSE WORKS</strong></p>\n<ul>\n<li>You will watch video lectures that teach you the principles.</li>\n<li>You then complete exercises to help you retain what you learn</li>\n<li>You have access to free live help in the chatroom</li>\n</ul>', 15, 'Everything you need to know about modern Objective-C to use it professionally', 3540, 4089, 0),
(36, 3, 2, 'Core Data and Realm - Master Data Persistence for iOS', 35, '2022-05-25', '2023-01-03', 3400000, 954, '<p>Do you have an idea for an app that needs to save user data locally?</p>\n<p>Do you need to learn about Core Data for your work or business?</p>\n<p>Are you looking to brush up on your iOS Development skills by learning about new technologies such as Realm Database?</p>\n<p>Then this is the course for you!</p>\n<p>Join me as I take you step-by-step through building a to do list app that\'s like the Clear app.</p>\n<p>Along the way, we\'ll cover all the essential topics such as:</p>\n<ul>\n<li>How to Use&nbsp;Core Data</li>\n<li>How to Use&nbsp;Realm Database</li>\n<li>How to Properly Set Up a Project with Core Data</li>\n<li>How to Incorporate Realm Database Using Cocoapods</li>\n<li>How to Build a To Do List App</li>\n</ul>', 0, 'Learn to use Core Data, Realm, UserDefaults, NSCoder, iOS File System.', 899, 900, 0);
INSERT INTO `course` (`ID_COURSE`, `ID_CATE`, `ID_USER`, `COURSENAME`, `LENGTHS`, `CREATEDATE`, `LASTUPDATE`, `PRICE`, `VIEWED`, `DESCRIPTIONS`, `DISCOUNT`, `SHORTDES`, `RATENUM`, `STUNUM`, `DISABLE`) VALUES
(37, 3, 1, 'GraphQL with iOS and SwiftUI: The Complete Developers Guide', 34, '2021-02-11', '2022-03-10', 4220000, 5004, '<p>GraphQL is an open-source data query and manipulation language for APIs, and a runtime for fulfilling queries with existing data. GraphQL is gaining popularity at a very fast pace and more and more companies are exposing their data using GraphQL. Some are even saying that GraphQL is the new REST and in a span of few years, it will become the default way for implementing APIs.</p>\n<p>Check out the contents of the course:</p>\n<p><strong>Understanding GraphQL</strong></p>\n<p>In this section, you will learn the concepts behind GraphQL technology and how it is different from REST. You will learn about queries, mutations, fragments and subscriptions.</p>', 0, 'Build GraphQL Apps in SwiftUI Using Apollo, NodeJS and MVVM Design Pattern', 579, 2054, 0),
(38, 3, 12, 'Learn Unity Games Engine & C# By Creating A VR Space Shoote', 34, '2021-02-04', '2022-04-18', 4500000, 8870, '<p>Using the free art assets provided you will construct your moonbase then learn how to pick up objects using your virtual hands, shoot laser guns, destroy asteroids and add user interface elements to enhance the experience!</p>\n<p>We will create some simple C# scripts that create all the systems behind the game, such as spawning asteroids, managing the player score and controlling the timer. Then to round off the project we add some nice finishing particle effects.</p>\n<p>This course is going to teach you the following topics:</p>\n<ul>\n<li>\n<p>Where to find Unity, and how to install it</p>\n</li>\n<li>\n<p>Configuring Unity for VR</p>\n</li>\n<li>\n<p>Using Unity\'s XR interaction system</p>\n</li>\n<li>\n<p>Dealing with art assets and 3D models</p>\n</li>\n<li>\n<p>Lighting 3D environments</p>\n</li>\n</ul>', 0, 'A beginners guide to Unity focusing on making a virtual reality game for the worlds leading headset. ***UPDATED 2022!***', 2400, 3454, 0),
(39, 3, 1, 'A beginners guide to Unity focusing on making a virtual reality game for the worlds leading headset. ***UPDATED 2022!***', 48, '2021-04-15', '2022-04-14', 5888890, 6599, '<p>In this course, Penny introduces augmented reality techniques using her internationally acclaimed holistic teaching style and expertise from over 25 years of teaching, research and work in games and computer graphics. Through-out the course you will follow along with hands-on workshops designed to teach you the fundamental techniques used for designing and developing augmented reality mobile applications.</p>\n<p>From examining its earliest origins to understanding the mash-up of computerised environments with the real world, we will be creating numerous applications for iOS, Android, Mac and PC from simple games to location detection.</p>\n<p><strong>Learn how to program and work with:</strong></p>\n<ul>\n<li>\n<p>iOS</p>\n</li>\n<li>\n<p>Android</p>\n</li>\n<li>\n<p>Wikitude SDK</p>\n</li>\n<li>\n<p>2D Image Recognition and Tracking</p>\n</li>\n</ul>', 0, 'Learn to Create Mobile AR Applications with Wikitude, Integrating ARKit & ARCore for iOS and Android.', 1542, 2444, 0),
(40, 3, 2, 'Multiplayer Virtual Reality (VR) Development With Unity', 15, '2017-01-24', '2021-01-05', 3240000, 5855, '<p><strong>Welcome to Udemy\'s first Multiplayer Virtual Reality Development course!</strong></p>\n<p>Virtual Reality is having its best time ever. Stuck in our homes, we find joy and happiness in VR. But some people still think VR is an isolating experience.</p>\n<p><strong>Not anymore! Virtual Reality has the potential the be the next social impact in our lives. With Multiplayer implementation, we can meet people in Virtual Worlds and communicate with tools that do not exist in the real world.</strong></p>\n<p>In this course, we build a Multiplayer VR project from scratch. Unity\'s XR Interaction Toolkit is used for the Virtual Reality solution. Also, Photon- PUN 2 asset is used for Multiplayer implementation. While learning, you will have much fun with the Game Assets that I will share with you.</p>\n<p><strong>By enrolling in this course, you will learn Multiplayer VR Development Fundamentals such as:</strong></p>\n<ul>\n<li>\n<p>Configuring a Unity project for Oculus Quest with the new XR Interaction Toolkit from Unity 2019.4</p>\n</li>\n<li>\n<p>VR Keyboard Implementation</p>\n</li>\n<li>\n<p>Connecting servers with player name</p>\n</li>\n</ul>', 0, 'Learn the basics of Multiplayer Virtual Reality by building a fully functional project from scratch', 2155, 4545, 0),
(41, 3, 1, 'Complete 35 Projects: Unity VR Games with C# & iPhone Apps', 40, '2019-06-19', '2022-05-20', 3400000, 8980, '<p><strong>Make games and apps like first person shooter, tic tac toe, escape, color converter,&nbsp;and so much more.&nbsp;</strong></p>\n<p><strong>A wildly successful Kickstarter funded this course</strong></p>\n<p>Are you an&nbsp;aspiring C# developers, digital artists, or iOS developer?&nbsp;This is your&nbsp;ULTIMATE&nbsp;guide.</p>\n<p><strong>Sign up now to learn Unity and Xcode</strong></p>\n<p>In Part 1 of this course you\'ll build 30 virtual reality games from start to finish, beginning in Unity&nbsp;5.4.3f1. Then we make&nbsp;original artwork in Blender 2.78&nbsp;and integrating the artwork into the game.&nbsp;<em>That\'s 30 projects you\'ll be able to add to your porfolio!</em></p>\n<p><strong>One of the best features is that you can watch the courses at any speed you want. This means you can speed up the or slow down the video if you want to.</strong></p>\n<p>In Part 2, you learn how to make apps in Xcode 9. This course is project-based, where you follow along with your instructor to build real projects.</p>', 0, 'Make 3D models in Blender, get 2 free books, & 6 webinars! C#, Swift, Xcode, virtual reality, hangman, calculator', 1400, 5596, 0),
(42, 3, 12, 'Unity VR: Oculus Quest Bowling Game in 30 Minutes', 75, '2022-01-20', '2023-01-01', 5488890, 7956, '<p>In this course you will learn how to build a fully functional Oculus Quest bowling application in 30 minutes. The aim of this course is to get you up and running with Oculus Quest development in one sitting.</p>\n<p>&nbsp;</p>\n<p>In this course you will learn how to confidently achieve the following:</p>\n<ol>\n<li>\n<p>Setup your Unity development environment and your Oculus Quest (with an Oculus Link cable for faster testing)</p>\n</li>\n<li>\n<p>Learn how to easily grab and throw objects in VR</p>\n</li>\n<li>\n<p>Learn how to create an interactable menu/UI system</p>\n</li>\n<li>\n<p>Create a fully functional bowling mini game and then add visual polish to it with free assets from the Unity Asset Store</p>\n</li>\n</ol>\n<p>This course is designed for those of you who want a quick way to dive into virtual reality development and who are tired of following outdated tutorials. This course utilizes the latest VR frameworks (XRManagement &amp; XRInteractionToolkit) for Unity.</p>\n<p>&nbsp;</p>', 0, 'Learn how to utilize Unity\'s newest features (XRManagement + XRInteractionToolkit) to build grabbing,throwing, UI & more', 2459, 5700, 0),
(43, 1, 1, 'null', 0, '2023-01-08', '2023-01-08', 0, 0, 'data.FullDes', 0, 'data.ShortDes', 0, 0, 0),
(44, 1, 1, 'NOW', 100, '2023-01-08', '2023-01-08', 7777780, 0, '<p>Hello, TinyMCE!</p>', 0, '<p>Hello, TinyMCE!</p>', 0, 0, 0),
(45, 1, 1, '', 100, '2023-01-08', '2023-01-08', 0, 0, '<p>Hello, TinyMCE!</p>', 0, '<p>Hello, TinyMCE!</p>', 0, 0, 0),
(46, 1, 1, 'now', 100, '2023-01-08', '2023-01-08', 999999, 0, '<p>Hello, TinyMCE!</p>', 0, '<p>Hello, TinyMCE!</p>', 0, 0, 0),
(47, 1, 1, 'now', 100, '2023-01-08', '2023-01-08', 999999, 0, '<p>Hello, TinyMCE!</p>', 0, '<p>Hello, TinyMCE!</p>', 0, 0, 0),
(48, 1, 1, 'dsd', 100, '2023-01-08', '2023-01-08', 2222, 0, '<p>Hello, TinyMCE!</p>', 0, '<p>Hello, TinyMCE!</p>', 0, 0, 0),
(49, 1, 1, 'dsd', 100, '2023-01-08', '2023-01-08', 2222, 0, '<p>Hello, TinyMCE!</p>', 0, '<p>Hello, TinyMCE!</p>', 0, 0, 0),
(50, 1, 1, 'dsd', 100, '2023-01-08', '2023-01-08', 2222, 0, '<p>Hello, TinyMCE!</p>', 0, '<p>Hello, TinyMCE!</p>', 0, 0, 0),
(51, 1, 1, 'dsd', 100, '2023-01-08', '2023-01-08', 2222, 0, '<p>Hello, TinyMCE!</p>', 0, '<p>Hello, TinyMCE!</p>', 0, 0, 0),
(52, 1, 1, 'NWE COURSE', 100, '2023-01-08', '2023-01-08', 99000, 0, '<p>Hello, TinyMCE!</p>', 0, '<p>Hello, TinyMCE!</p>', 0, 0, 0),
(53, 1, 1, 'null', 0, '2023-01-08', '2023-01-08', 0, 0, 'data.FullDes', 10, 'data.ShortDes', 0, 0, 0),
(54, 1, 1, 'null', 0, '2023-01-08', '2023-01-08', 0, 0, 'data.FullDes', 10, 'data.ShortDes', 0, 0, 0),
(55, 1, 1, 'null', 0, '2023-01-08', '2023-01-08', 0, 0, 'data.FullDes', 10, 'data.ShortDes', 0, 0, 0),
(56, 4, 1, 'wqe', 100, '2023-01-09', '2023-01-09', 999999, 0, '', 10, '', 0, 0, 0),
(57, 1, 1, 'null', 0, '2023-01-09', '2023-01-09', 0, 0, 'data.FullDes', 10, 'data.ShortDes', 0, 0, 0),
(58, 1, 1, '', 100, '2023-01-09', '2023-01-09', 111, 0, '', 10, '', 0, 0, 0),
(59, 1, 1, '', 100, '2023-01-09', '2023-01-09', 22222, 0, '', 10, '', 0, 0, 0),
(60, 1, 1, '', 100, '2023-01-09', '2023-01-09', 8888, 0, '', 10, '', 0, 0, 0),
(61, 1, 1, 'new', 100, '2023-01-09', '2023-01-09', 111, 0, '<p>asdas</p>', 10, '<p>asdsa</p>', 0, 0, 0),
(62, 2, 1, 'alone', 100, '2023-01-09', '2023-01-09', 11111, 0, '<p>new</p>', 10, '<p>new</p>', 0, 0, 0),
(65, 1, 24, 'My course', 100, '2023-01-10', '2023-01-10', 100000, 0, 'This is my course', 10, 'Full description of my course', 0, 0, 0),
(66, 3, 24, 'New course', 100, '2023-01-10', '2023-01-10', 1000, 0, '<p>My cpurse yrky87trilyumufv</p>', 10, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
CREATE TABLE IF NOT EXISTS `field` (
  `ID_FIELD` int(11) NOT NULL AUTO_INCREMENT,
  `FIELDNAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_FIELD`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `field`
--

INSERT INTO `field` (`ID_FIELD`, `FIELDNAME`) VALUES
(1, 'Development'),
(2, 'Business'),
(3, 'Design'),
(4, 'Marketing'),
(5, 'Law'),
(8, 'Keeper');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
CREATE TABLE IF NOT EXISTS `lesson` (
  `ID_LESSON` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CHAPTER` int(11) DEFAULT NULL,
  `LESSONNAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_LESSON`),
  KEY `FK_RELATIONSHIP_15` (`ID_CHAPTER`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`ID_LESSON`, `ID_CHAPTER`, `LESSONNAME`, `URL`) VALUES
(25, 12, 'What Are Favicons?', ''),
(24, 11, 'What we\'re building - HTML Personal Site', ''),
(23, 11, 'The Anatomy of an HTML Tag', ''),
(22, 10, 'Math', 'null'),
(21, 10, 'Factory Function', 'null'),
(20, 9, 'Functions', 'null'),
(19, 9, 'Constants', 'null'),
(18, 9, 'Variables', 'null'),
(17, 8, 'Javascript in Node', 'null'),
(16, 8, 'What is Javascript?', 'null'),
(15, 7, 'Pathfinding', 'null'),
(14, 7, 'Project Setup', 'null'),
(13, 6, 'Add Assets To Project', 'null'),
(12, 6, 'Introducing Methods', 'null'),
(11, 5, 'Community Our Projects', 'null'),
(10, 5, 'Install Unity', 'null'),
(9, 4, 'Glossary of Key Terms', 'null'),
(8, 4, 'Core React Review', 'null'),
(7, 3, 'Refactor the portolio to use parcel', 'null'),
(6, 3, 'Section overview', 'null'),
(5, 2, 'Section Control', 'null'),
(4, 2, 'ReactDOM', 'null'),
(3, 2, 'First React App', 'null'),
(2, 1, 'Course Repo of Web Dev and React', 'null'),
(1, 1, 'What u will get from taking this course', 'null'),
(26, 12, 'CSS Static and Relative Positioning', ''),
(27, 12, 'Adding Content to Our Website', ''),
(28, 13, 'Web Design 101 - Wireframing', ''),
(29, 13, 'Styling Our Website Challenges and Solutions', ''),
(30, 13, 'Javascript Variables Exercise Start', ''),
(31, 14, 'Functions Part 1: Creating and Calling Functions', ''),
(32, 14, 'Combining Comparators', ''),
(33, 15, '[Interactive Coding Exercise] Debugging Practice', ''),
(34, 15, 'Day 1 Project: Band Name Generator', ''),
(35, 16, 'Setting Constraints and working with the Safe Area', ''),
(36, 16, 'Working with Containers and Subviews', ''),
(52, 13, 'Web Design 101 - Wireframing', ''),
(53, 17, 'What u will get from taking this course', ''),
(54, 17, 'Course Repo of Web Dev and React', ''),
(55, 17, 'First React App', ''),
(56, 18, 'ReactDOM', ''),
(57, 18, 'Section Control', ''),
(58, 19, 'Section overview', ''),
(59, 20, 'Refactor the portolio to use parcel', ''),
(60, 20, 'Core React Review', ''),
(61, 20, 'Glossary of Key Terms', ''),
(62, 21, 'Install Unity', ''),
(63, 21, 'Community Our Projects', ''),
(64, 21, 'Introducing Methods', ''),
(65, 22, 'Add Assets To Project', ''),
(66, 23, 'Project Setup', ''),
(67, 23, 'Pathfinding', ''),
(68, 24, 'What is Javascript?', ''),
(69, 25, 'Javascript in Node', ''),
(70, 26, 'Variables', ''),
(71, 26, 'Constants', ''),
(72, 27, 'Functions', ''),
(73, 28, 'Factory Function', ''),
(74, 28, 'Math', ''),
(75, 28, 'The Anatomy of an HTML Tag', ''),
(76, 29, 'What we\'re building - HTML Personal Site', ''),
(77, 29, 'What Are Favicons?', ''),
(78, 30, 'CSS Static and Relative Positioning', ''),
(79, 30, 'Adding Content to Our Website', ''),
(80, 30, 'Web Design 101 - Wireframing', ''),
(81, 31, 'Styling Our Website Challenges and Solutions', ''),
(82, 31, 'Javascript Variables Exercise Start', ''),
(83, 32, 'Functions Part 1: Creating and Calling Functions', ''),
(84, 32, 'Combining Comparators', ''),
(85, 33, '[Interactive Coding Exercise] Debugging Practice', ''),
(86, 33, 'Day 1 Project: Band Name Generator', ''),
(87, 34, 'Setting Constraints and working with the Safe Area', ''),
(88, 34, 'Working with Containers and Subviews', ''),
(89, 35, 'Web Design 101 - Wireframing', ''),
(90, 35, 'Web Design 101 - Wireframing', ''),
(91, 35, 'Styling Our Website Challenges and Solutions', ''),
(92, 36, 'Javascript Variables Exercise Start', ''),
(93, 36, 'Functions Part 1: Creating and Calling Functions', ''),
(94, 36, 'Combining Comparators', ''),
(95, 36, '[Interactive Coding Exercise] Debugging Practice', ''),
(96, 37, 'Day 1 Project: Band Name Generator', ''),
(97, 38, 'Setting Constraints and working with the Safe Area', ''),
(98, 38, 'Working with Containers and Subviews', ''),
(99, 39, 'Web Design 101 - Wireframing', ''),
(100, 39, 'Factory Function', ''),
(101, 39, 'Math', ''),
(102, 39, 'The Anatomy of an HTML Tag', ''),
(103, 40, 'What we\'re building - HTML Personal Site', ''),
(104, 40, 'What Are Favicons?', ''),
(105, 40, 'CSS Static and Relative Positioning', ''),
(106, 41, 'Adding Content to Our Website', ''),
(107, 42, 'Web Design 101 - Wireframing', ''),
(108, 42, 'Styling Our Website Challenges and Solutions', ''),
(109, 41, 'Javascript Variables Exercise Start', ''),
(110, 41, 'Functions Part 1: Creating and Calling Functions', ''),
(111, 43, 'Working with Containers and Subviews', ''),
(112, 43, 'Web Design 101 - Wireframing', ''),
(113, 44, 'Web Design 101 - Wireframing', ''),
(114, 44, 'Styling Our Website Challenges and Solutions', ''),
(115, 45, 'Javascript Variables Exercise Start', ''),
(116, 45, 'Functions Part 1: Creating and Calling Functions', ''),
(117, 46, 'lesson 1', '43.mp4'),
(123, 51, 'leesonn 1', 'pexels-kosmo-politeska-10638173.mp4'),
(122, 50, 'lesson 1', '1_preview.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `sid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sess` text COLLATE utf8_unicode_ci NOT NULL,
  `expired` datetime NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `sessions_expired_index` (`expired`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sid`, `sess`, `expired`) VALUES
('eModUBDXw4QyWrumbzaK05CtNv33FJ8Q', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"authUser\":{\"ID_USER\":25,\"USERNAME\":\"vanduc\",\"EMAIL\":\"vanduc@gmail.com\",\"PASSWORD\":\"$2b$10$uHALynHCjGVpye1ST/rhBu5CF9TZPLzOLPFcHSel61Xcnp.Mocm5i\",\"TYPE\":3,\"FULLNAME\":\"van duc\",\"PROFILE\":\"\",\"DISABLE\":0},\"cart\":[],\"retUrl\":\"/admin/field/2\"}', '2023-01-10 05:54:08'),
('aMOi0e-W8Nl1syx6bXp8IND5YsXq4GUi', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"returnURL\":\"http://localhost:3000/categories/byCat/1\",\"authUser\":{\"ID_USER\":24,\"USERNAME\":\"qa\",\"EMAIL\":\"q@\",\"PASSWORD\":\"$2b$10$J2lFqVz5bvTa.58U2nRXue5ArKT.pMbgWCu5wfqV.Lb2/4pdsn0Ei\",\"TYPE\":2,\"FULLNAME\":\"q\",\"PROFILE\":\"\",\"DISABLE\":0},\"cart\":[]}', '2023-01-10 14:23:52'),
('GwoxAgileQCN9ujFkpJxVEgyCE2fIFnZ', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":false,\"returnURL\":\"http://localhost:3000/homePage\",\"authUser\":null,\"cart\":[]}', '2023-01-11 02:10:45'),
('crqAsaxfPammi8zZ6emp1liPsksteyQd', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"returnURL\":\"http://localhost:3000/homePage\",\"authUser\":{\"ID_USER\":26,\"USERNAME\":\"van\",\"EMAIL\":\"xx@gmail.com\",\"PASSWORD\":\"$2b$10$VABQHOpbu/2Ki912S7Ijc.jyFEmbsqBxD4QncwNc966ScGFkyay5.\",\"TYPE\":3,\"FULLNAME\":\"duc\",\"PROFILE\":\"\",\"DISABLE\":0},\"cart\":[]}', '2023-01-11 02:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID_USER` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `FULLNAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROFILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISABLE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_USER`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID_USER`, `USERNAME`, `EMAIL`, `PASSWORD`, `TYPE`, `FULLNAME`, `PROFILE`, `DISABLE`) VALUES
(1, 'Tom', 'tom@gmail.com', '$2b$10$dGxXOMTwt/pAoI1ENM1CAOKQeLByDNtoCwLmP9mbtayeiRJTbksly', 2, 'Tom Andes Lion', '<ul>\r\n<li>dfgfdssdf</li>\r\n</ul>', 1),
(2, 'Linda', 'linda@gmail.com', 'dsgsgs', 2, 'Antonela Linda', '', 1),
(3, 'Leo', 'sigoat@gmail.com', 'dsgsgs', 2, 'Lionel Andres Messi', '', 0),
(4, 'Huu Nien', 'phanthihuunien@gmail.com', 'dsgsgs', 3, 'Phan Thi Huu Nien', '', 1),
(5, 'Van Duc', 'duc@gmail.com', 'dsgsgs', 3, 'Lien Van Duc', '', 0),
(6, 'Quoc Bao', 'bao@gmail.com', 'dsgsgs', 3, 'Huynh Quoc Bao', '', 1),
(7, 'Minh Khoa', 'khoa@gmail.com', 'dsgsgs', 3, 'Nguyen Hoang Minh Khoa', '', 0),
(8, 'Duc Sung', 'sung@gmail.com', 'dsgsgs', 3, 'Phan Duc Sung', '', 1),
(9, 'Harry', 'harry@gmail.com', 'dsgsgs', 1, 'Harry Potter', '', 0),
(10, 'Ron', 'ron@gmail.com', 'dsgsgs', 1, 'Ron Weasley', '', 0),
(11, 'Hermione', 'hermione@gmail.com', 'dsgsgs', 2, 'Hermione Granger', '', 0),
(12, 'Marry', 'marry@gmail.com', 'dsgsgs', 2, 'Marry Green', '', 0),
(13, 'Hakim', 'hakim@gmail.com', 'fafgl', 3, 'Hakim Ziyech', '', 0),
(14, 'Kante', 'cute@gmail.com', 'sg', 3, 'Kan Cute', '', 0),
(15, 'Scaloni', 'hihi@gmail.com', 'sghga', 3, 'Lionel Scaloni', '', 0),
(16, 'Kun', 'kun@gmail.com', 'agsjs', 3, 'Kun Aguero', '', 0),
(17, 'Jr', 'jr@gmai.com', 'agsrh', 3, 'Neymar Jr', '', 1),
(18, 'Martinez', 'nex@gmail.com', 'fshs', 3, 'Lisandro Martinez', '', 1),
(19, 'Fernandez', 'dez@gmail.com', 'afjoagj', 3, 'Enzo Fernandez', '', 0),
(20, 'a', 'as@gmail.com', '$2b$10$INQE0XpAkRnU0m4e8BiUYO1m73s4da6Q3ZOtnVEGgJQ4rOl4TWBKq', 3, 'as', '', 0),
(21, 'a', NULL, '$2b$10$6mN0.C9wgTyJnE8YsJvCHOGb1hD9Vqy1hlaZ8kfTSrB1CzpVY9uCy', 3, NULL, '', 0),
(22, 'bao', 'bao@gmial.com', '$2b$10$hj21lj9KAjrvYag4pr0hBeLUcPk8y955gM.MxeQuEBUUndkwm.lOa', 3, 'quoc bao', '', 0),
(23, 'q', 'captain976431@gmail.com', '$2b$10$GTwMwt0gmnbmZ5zW8YOEres/LaBN2ZlHEdHT4rhduO9oO5saC5mTK', 3, 'q', '', 0),
(24, 'qa', 'q@', '$2b$10$J2lFqVz5bvTa.58U2nRXue5ArKT.pMbgWCu5wfqV.Lb2/4pdsn0Ei', 2, 'q', '', 0),
(25, 'vanduc', 'vanduc@gmail.com', '$2b$10$uHALynHCjGVpye1ST/rhBu5CF9TZPLzOLPFcHSel61Xcnp.Mocm5i', 3, 'van duc', '', 0),
(26, 'van', 'xx@gmail.com', '$2b$10$VABQHOpbu/2Ki912S7Ijc.jyFEmbsqBxD4QncwNc966ScGFkyay5.', 3, 'duc', '', 0),
(27, 'qb', 'asd@Dfs', '$2b$10$f/PAKjgvIYuUAPl76uEndOyVdaa1BXqUgsxUfqmVlc2awmXIXjwnu', 1, 'asdfg', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_course`
--

DROP TABLE IF EXISTS `user_course`;
CREATE TABLE IF NOT EXISTS `user_course` (
  `ID_USER_COURSE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_COURSE` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `RATE` int(11) DEFAULT NULL,
  `FEEDBACK` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DONE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_USER_COURSE`),
  KEY `FK_RELATIONSHIP_8` (`ID_USER`),
  KEY `FK_RELATIONSHIP_9` (`ID_COURSE`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_course`
--

INSERT INTO `user_course` (`ID_USER_COURSE`, `ID_COURSE`, `ID_USER`, `RATE`, `FEEDBACK`, `DONE`) VALUES
(1, 1, 4, 4, 'good', 0),
(2, 1, 5, 5, 'my best course!', 1),
(3, 1, 6, 4, 'how wonderful it is', 1),
(4, 1, 7, 5, 'this course literally has all the stuff i need, lol', 0),
(5, 2, 4, 3, 'quite terrible', 0),
(6, 2, 5, 4, ':))', 0),
(7, 2, 6, 3, 'wow :(', 1),
(8, 7, 8, 4, 'love it', 0),
(9, 7, 4, 5, 'nice :)', 1),
(10, 3, 3, 4, 'Excellent introduction to the topics. There are very minor attribute errors for updated modules, but that gives the student an excellent opportunity to search for solutions on StackOverflow or other websites.', 1),
(11, 3, 4, 4, 'This is an absolutely great introduction to Pandas and many of the powerful functions it has.', 0),
(12, 3, 5, 5, 'The Instructors Expertise is no question. The course was Good but it could be better if it does have more exercises and quiz.', 1),
(13, 4, 5, 4, 'I would like to thanks to our teacher first i bought this course for my final project on last year of university.', 1),
(14, 4, 6, 3, 'hihi', 0),
(15, 5, 3, 4, 'Very great course! Learned a lot and it was explained very clearly. With some more in depth exercises added, this course can go above 4 stars in my opinion.', 1),
(16, 5, 8, 4, 'Great course to learn the ropes (which I did and thank you for that, Boris!) but I\'d like the course to offer more coding exercises with increasing difficulty.', 0),
(17, 6, 7, 5, 'The course is very clear, even fo non english speakers. Everything is explained in a easy way, what gives a strong understanding of basics of the topic a solid base to further work with pandas.', 1),
(18, 6, 6, 4, 'Highly recommended for those wanting to learn python data analytics without any coding background.', 0),
(19, 8, 3, 5, 'Extraordinary!!! Actually, this course went far beyond what I expected.', 1),
(20, 8, 4, 4, 'It‘s really a fun course. Development of a real application from the beginning with installing the environment and step by step enhancing the code.', 1),
(21, 9, 5, 4, 'This is a long one... but yep, a lot of ground was covered. I was mostly interested in unit testing part for Vue. Got what I was looking for and more :) Thanks Boris! I enjoyed this course!', 0),
(22, 9, 6, 5, 'So far, it\'s beyond what I expected unlike most tutorials, this is explicit, and the way the instructor reuses the terms like props', 1),
(23, 10, 7, 4, 'a lot of tests. I wanted to watch about vue, not about tests', 0),
(24, 10, 8, 5, 'This is a great and comprehensive course, in which the workings of Vue (and many topics related to coding with Vue) are explained clearly and in great detail.', 1),
(25, 1, 12, NULL, NULL, 0),
(26, 1, 12, NULL, NULL, 0),
(27, 1, 1, NULL, NULL, 0),
(28, 1, 25, 2, 'aaa', 0),
(29, 1, 24, NULL, NULL, 0),
(30, 16, 26, NULL, NULL, 0),
(31, 5, 24, NULL, NULL, 0),
(32, 66, 26, 3, 'good enoguh', 0),
(33, 66, 26, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `ID_WISHLIST` int(11) NOT NULL AUTO_INCREMENT,
  `ID_USER` int(11) DEFAULT NULL,
  `ID_COURSE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_WISHLIST`),
  KEY `FK_RELATIONSHIP_5` (`ID_USER`),
  KEY `FK_RELATIONSHIP_6` (`ID_COURSE`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`ID_WISHLIST`, `ID_USER`, `ID_COURSE`) VALUES
(1, 1, 1),
(9, 26, 26),
(8, 25, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course` ADD FULLTEXT KEY `COURSENAME` (`COURSENAME`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
