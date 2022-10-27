-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: esquelle.ridiculopathy.dreamhosters.com
-- Generation Time: May 26, 2020 at 08:08 AM
-- Server version: 5.7.28-log
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swatchity_mysql`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `ad_id` int(11) NOT NULL,
  `ad_label` varchar(215) NOT NULL,
  `ad_img_url` varchar(512) NOT NULL,
  `ad_link_url` varchar(512) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`ad_id`, `ad_label`, `ad_img_url`, `ad_link_url`) VALUES
(1, 'one', 'http://www.swatchity.com/images/ads_01.jpg', 'https://en.wikipedia.org/wiki/Minotaur'),
(2, 'two', 'http://www.swatchity.com/images/ads_02.jpg', 'https://twitter.com/search?q=%23swatchity&src=typd');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `fav_id` int(11) NOT NULL,
  `fav_user_id` int(11) NOT NULL,
  `fav_swatch_id` int(11) NOT NULL,
  `fav_swatch_user_id` int(11) NOT NULL,
  `fav_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`fav_id`, `fav_user_id`, `fav_swatch_id`, `fav_swatch_user_id`, `fav_date`) VALUES
(1, 1, 1, 2, '2015-06-01 13:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_date` datetime NOT NULL,
  `news_excerpt_chi` varchar(256) NOT NULL,
  `news_content_chi` mediumtext NOT NULL,
  `news_headline_chi` varchar(256) NOT NULL,
  `news_headline_eng_uk` varchar(256) NOT NULL,
  `news_excerpt_eng_uk` varchar(256) NOT NULL,
  `news_content_eng_uk` mediumtext NOT NULL,
  `news_headline_eng_us` varchar(256) NOT NULL,
  `news_excerpt_eng_us` varchar(256) NOT NULL,
  `news_content_eng_us` mediumtext NOT NULL,
  `news_headline_esp` varchar(256) NOT NULL,
  `news_excerpt_esp` varchar(256) NOT NULL,
  `news_content_esp` mediumtext NOT NULL,
  `news_headline_fre` varchar(256) NOT NULL,
  `news_excerpt_fre` varchar(256) NOT NULL,
  `news_content_fre` mediumtext NOT NULL,
  `news_headline_ger` varchar(256) NOT NULL,
  `news_excerpt_ger` varchar(256) NOT NULL,
  `news_content_ger` mediumtext NOT NULL,
  `news_headline_ita` varchar(256) NOT NULL,
  `news_excerpt_ita` varchar(256) NOT NULL,
  `news_content_ita` mediumtext NOT NULL,
  `news_headline_rus` varchar(256) NOT NULL,
  `news_excerpt_rus` varchar(256) NOT NULL,
  `news_content_rus` mediumtext NOT NULL,
  `news_headline_vrb` varchar(256) NOT NULL,
  `news_excerpt_vrb` varchar(256) NOT NULL,
  `news_content_vrb` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `news_date`, `news_excerpt_chi`, `news_content_chi`, `news_headline_chi`, `news_headline_eng_uk`, `news_excerpt_eng_uk`, `news_content_eng_uk`, `news_headline_eng_us`, `news_excerpt_eng_us`, `news_content_eng_us`, `news_headline_esp`, `news_excerpt_esp`, `news_content_esp`, `news_headline_fre`, `news_excerpt_fre`, `news_content_fre`, `news_headline_ger`, `news_excerpt_ger`, `news_content_ger`, `news_headline_ita`, `news_excerpt_ita`, `news_content_ita`, `news_headline_rus`, `news_excerpt_rus`, `news_content_rus`, `news_headline_vrb`, `news_excerpt_vrb`, `news_content_vrb`) VALUES
(1, '2015-06-02 18:43:18', 'è¿™æ˜¯æµ‹è¯•èŠ‚å½•ã€‚æˆ‘ä»¬ç”šè‡³ä¼šéœ€è¦è¿™äº›å—ï¼Ÿè‚¯å®š ï¼', 'ç”Ÿæ´»æ›´åŠ ä¸°å¯Œå¤šå½©çš„ç”Ÿæ´»-ä¸Ž Swatchity? \n\n<img src=\"\"images/news/swatchity_team.jpg\"\">\nMeet Swatchity å›¢é˜Ÿ! \n\n<h2>Swatchity æ˜¯ä»€ä¹ˆï¼Ÿ</h2>\nYou ä¸å¦‚é—® \"what å°±æ˜¯ç”Ÿæ´»æœ¬èº«? \"äº‹å®žä¸Šï¼Œå¦‚æžœä½ éœ€è¦ä¸€ä¸ªç­”æ¡ˆï¼Œè¿™å°±æ˜¯å®ƒã€‚Swatchity æ˜¯ç”Ÿæ´» itself.\n\nThis thing...\n', 'Swatchity æ˜¯ä¸€ä»¶äº‹', 'Swatchity is a thing', 'This is a test excerpt. Will we even need these? Sure!', 'Live a more colorful life-with Swatchity? \n\n<img src=\"\"images/news/swatchity_team.jpg\"\">\nMeet the Swatchity Team! \n\n<h2>What is Swatchity?</h2>\nyou might as well ask  \"what is life itself? \" Indeed, if you need an answer, this is it. Swatchity is life itself. \n\nThis is a thing... \n', 'Swatchity is a thing', 'This is a test excerpt. Will we even need these? Sure!', 'Live a more colorful life- with Swatchity?\n\n<img src=\"images/news/swatchity_team.jpg\">\nMeet the Swatchity Team!\n\n<h2>What is Swatchity?</h2>\nYou might as well ask \"what is life itself?\" Indeed, if you need an answer, this is it. Swatchity is life itself.\n\nThis is a thing...\n', 'Swatchity es una cosa', 'Este es un extracto del ensayo. Â¿Necesitamos esto? Seguro!', 'Vivir una vida mÃ¡s colorida, con Swatchity? \n\n<img src=\"\"images/news/swatchity_team.jpg\"\">\nMeet el equipo Swatchity! \n\n<h2>Â¿QuÃ© es Swatchity?</h2>\nYou pedir \"what es la vida misma? \" de hecho, si usted necesita una respuesta, es Ã©sta. Swatchity es itself.\n\nThis la vida es un thing...\n', 'Swatchity est une chose', 'Il s\'agit d\'un extrait de l\'essai. Aurons-nous encore besoin de ceux-ci ? SÃ»r !', 'Vivre une vie plus colorÃ©e-avec Swatchity? \n\n<img src=\"\"images/news/swatchity_team.jpg\"\">\nMeet l\'Ã©quipe de Swatchity! \n\n<h2>Ce qui est Swatchity ?</h2>\nYou peut se demander aussi bien \"what est la vie elle-mÃªme? \" en effet, si vous avez besoin d\'une rÃ©ponse, c\'est elle. Swatchity, c\'est la vie itself.\n\nThis est un thing...\n', 'Swatchity ist eine Sache', 'Dies ist ein Test-Auszug. Brauchen wir diese auch? Sicher!', 'Leben ein bunter Leben-mit Swatchity? \n\n<img src=\"\"images/news/swatchity_team.jpg\"\">\nMeet das Swatchity-Team! \n\n<h2>Was ist Swatchity?</h2>\nYou kÃ¶nnte auch Fragen \"what ist das Leben selbst? \" in der Tat, wenn Sie eine Antwort benÃ¶tigen, das ist es. Swatchity ist Leben-itself.\n\nThis ist ein thing...\n', 'Swatchity Ã¨ una cosa', 'Questo Ã¨ un Estratto del test. Ci serviranno anche questi? Sicuro!', 'Vivere una vita piÃ¹ colorata-con Swatchity? \n\n<img src=\"\"images/news/swatchity_team.jpg\"\">\nMeet Swatchity squadra! \n\n<h2>Che cosa Ã¨ Swatchity?</h2>\nYou potrebbe anche chiedere di \"what Ã¨ la vita stessa? \" anzi, se avete bisogno di una risposta, Ã¨ questo. Swatchity Ã¨ itself.\n\nThis vita Ã¨ un thing...\n', 'Swatchity ÑÑ‚Ð¾ Ð²ÐµÑ‰ÑŒ', 'Ð­Ñ‚Ð¾ Ñ‚ÐµÑÑ‚Ð¾Ð²Ñ‹Ð¹ Ð¾Ñ‚Ñ€Ñ‹Ð²Ð¾Ðº. ÐœÑ‹ Ð´Ð°Ð¶Ðµ Ð´Ð¾Ð»Ð¶Ð½Ñ‹ ÑÑ‚Ð¾? Ð£Ð²ÐµÑ€ÐµÐ½!', 'Ð–Ð¸Ñ‚ÑŒ Ð±Ð¾Ð»ÐµÐµ ÑÑ€ÐºÐ¾Ð¹ Ð¶Ð¸Ð·Ð½Ð¸-Ñ Swatchity? \n\n<img src=\"\"images/news/swatchity_team.jpg\"\">\nMeet Swatchity ÐºÐ¾Ð¼Ð°Ð½Ð´Ð°! \n\n<h2>Ð§Ñ‚Ð¾ Ñ‚Ð°ÐºÐ¾Ðµ Swatchity?</h2>\nYou Ð¼Ð¾Ð¶ÐµÑ‚ Ñ‚Ð°ÐºÐ¶Ðµ ÑÐ¿Ñ€Ð¾ÑÐ¸Ñ‚ÑŒ, \"what ÑÐ²Ð»ÑÐµÑ‚ÑÑ ÑÐ°Ð¼Ð° Ð¶Ð¸Ð·Ð½ÑŒ? \" Ð´ÐµÐ¹ÑÑ‚Ð²Ð¸Ñ‚ÐµÐ»ÑŒÐ½Ð¾, ÐµÑÐ»Ð¸ Ð²Ð°Ð¼ Ð½ÑƒÐ¶ÐµÐ½ Ð¾Ñ‚Ð²ÐµÑ‚, ÑÑ‚Ð¾ Ð¾Ð½. Swatchity â€” ÑÑ‚Ð¾ thing...\n Ð¶Ð¸Ð·Ð½Ð¸ itself.\n\nThis', '{73P6NIH61/H7/P/6IHCJ}', '{6IH7/H7/P/6L76/L2NL8A6;/3HEE/3L/L4LC/CLLM/6IL7L*/758L#}', '{EH4L/P/DB8L/NBEB8K5E/EHKL-/3H6I/73P6NIH61*CC<HDJ/78N=\"HDPJL7/CL37/73P6NIH61_6LPD;GAJ\">CDLL6/6IL/73P6NIH61/6LPD#CC<I2>3IP6/H7/73P6NIH61*</I2>C1B5/DHJI6/P7/3LEE/P7F/\"3IP6/H7/EHKL/H67LEK*\"/HCMLLM^/HK/1B5/CLLM/PC/PC73L8^/6IH7/H7/H6;/73P6NIH61/H7/EHKL/H67LEK;CC6IH7/H7/P/6IHCJ;;;C}'),
(3, '2015-06-02 18:59:41', 'è¿™æ˜¯ä¸€ä¸ªç¬¬äºŒä¸ªæ–°é—»é¡¹ç›®æ‘˜å½•', '<img src=\"images/news/swatchity_team.jpg\">æ­£å¦‚ä½ å¯ä»¥å‘Šè¯‰ä»Žè¿™å¼ ç…§ç‰‡åœ¨æˆ‘ä»¬æœ€è¿‘çš„å†°æ¿€æ·‹é‡‡å–ç¤¾ä¼šï¼Œæˆ‘ä»¬æ˜¯éžå¸¸ä¸åŒçš„ç¾¤ã€‚æœ‰äº›äººå–œæ¬¢æ·±å®çŸ³è‰²è°ƒçš„ç»¿è‰²ã€‚å…¶ä»–äººè¢«å¸å¼•åˆ°æŸ”å’Œçš„ç±³è‰²ã€‚ å®ƒæ˜¯ä¸€ä¸ªæˆ‘ä»¬éƒ½ç›¸å¤„çš„å¥‡è¿¹ ï¼ç„¶è€Œï¼Œè¿˜æœ‰ä¸€ä»¶äº‹ï¼ŒæŠŠæˆ‘ä»¬å‡èšåœ¨ä¸€èµ·ï¼š åœ¨è¿™ä¸€é¡¹ç›®ï¼Œæˆ‘ä»¬çš„åˆ›å§‹äººç¾Žå›½éº¦æ–¯å¾·æ£® Paul * çš„åŸºæœ¬ä¿¡å¿µã€‚\n\nå‘å±•è¿‡ç¨‹ä¸­ï¼Œæˆ‘ä»¬å‘çŽ°äº†ä¹Ÿè®¸æˆ‘ä»¬æœ€å¤§çš„ä¼˜åŠ¿åœ¨äºŽè¿™ä¸°å¯Œçš„ä¸€æ•´å¥—ä¸åŒçš„èƒŒæ™¯ã€‚ä¾‹å¦‚ï¼Œèµ›è¿ª R.æœ‰è®¡ç®—æœºå·¥ç¨‹è™½ç„¶æŸ¯å…‹ T.æ²¡æœ‰ä»»ä½•ç¼–ç ç»éªŒå¹¶ä¸èƒ½ç¡®å®šå¦‚ä½•ä»–å·å…¥äº†ä¸Ž Swatchity æ”¾åœ¨ç¬¬ä¸€ä½ç¡•å£«ã€‚ä»–è¯´å®ƒè·Ÿå›žç­” craigslist ç½‘ç«™å¹¿å‘Šã€‚å…¶ä½™æ˜¯æœ¦æœ¦èƒ§èƒ§çš„ã€‚\n\næ ¹æœ¬çš„é—®é¢˜æ˜¯ä¸¤ä¸ªæ–¹é¢ï¼š Aï¼‰ Swatchity å¾ˆæ£’çš„å› ä¸ºæˆ‘ä»¬çš„äººæ°‘éƒ½æ˜¯ä¼Ÿå¤§å¹¶ä¸” 2ï¼‰ æˆ‘ä»¬éƒ½åœ¨è¿™é‡Œçš„æˆ‘ä»¬è‡ªå·±çš„è‡ªç”±æ„å¿— * *ã€‚\n\n* Swatchity ä¸æ˜¯ä¸€ä¸ªé‚ªæ•™ç»„ç»‡ã€‚\n\n* * Swatchity å†ä¸€æ¬¡ï¼Œä¸æ˜¯ ï¼ˆç›®å‰ï¼‰ æ˜¯ä¸€ä¸ªé‚ªæ•™ç»„ç»‡ã€‚', 'Swatchity å›¢é˜Ÿè§é¢ ï¼', 'Meet the Swatchity Team!', 'This is the excerpt from a second news item', '<img src=\"images/news/swatchity_team.jpg\">As you can tell from this photo taken at our recent ice cream social, we are a very diverse bunch. Some of us like deep jewel-tone green. Others are attracted to muted beiges.  It\'s a miracle that we all get along! There is, however, one thing that binds us together: a fundamental belief in this project and our founder S. Masterson Paul *.\n\nIn the course of development, we have discovered that perhaps our greatest strength lies in this rich panoply of diverse backgrounds. For example, Sadie R. has a masters in computer engineering while Kirk T. has no coding experience whatsoever and is unsure how he got involved with Swatchity in the first place. He says it had something to do with answering a Craigslist ad. The rest is hazy.\n\nThe underlying point is twofol d: A) Swatchity is great because our people are great and 2) we are all here of our own free will * *.\n\n* Swatchity is not a cult.\n\n* * Again, Swatchity is not (currently) a cult.', 'Meet the Swatchity Team!', 'This is the excerpt from a second news item', '<img src=\"images/news/swatchity_team.jpg\">\nAs you can tell from this photo taken at our recent ice cream social, we\'re a very diverse bunch. Some of us like deep jewel-tone green. Others are attracted to muted beiges.  It\'s a miracle that we all get along! There is, however, one thing that binds us together: a fundamental belief in this project and our founder S. Masterson Paul*.\n\nIn the course of development, we\'ve discovered that perhaps our greatest strength lies in this rich panoply of diverse backgrounds. For example, Sadie R. has a masters in computer engineering while Kirk T. has no coding experience whatsoever and is unsure how he got involved with Swatchity in the first place. He says it had something to do with answering a Craigslist ad. The rest is hazy.\n\nThe underlying point is twofold: A) Swatchity is great because our people are great and 2) we are all here of our own free will**.\n\n*Swatchity is not a cult.\n\n**Again, Swatchity is not (currently) a cult.\n', 'Conoce al equipo de Swatchity!', 'Este es el extracto de una noticia de segunda', '<img src=\"images/news/swatchity_team.jpg\">Como se puede decir de esta foto tomada en nuestro reciente helado social, somos un grupo muy diverso. Algunos de nosotros como profundos tonos verde. Otros son atraÃ­dos por silenciado beiges.  Es un milagro que todos nos llevamos! Sin embargo, hay una cosa que nos une: la creencia fundamental en este proyecto y nuestro fundador S. Masterson Paul *.\n\nEn el curso de desarrollo, hemos descubierto que tal vez nuestra mayor fortaleza radica en esta rica panoplia de diversos orÃ­genes. Por ejemplo, Sadie R. tiene una maestrÃ­a en ingenierÃ­a de computadoras mientras que Kirk T. no tiene ninguna codificaciÃ³n ningÃºn tipo de experiencia y estÃ¡ seguro de cÃ³mo se involucrÃ³ con Swatchity en primer lugar. Dice que tuvo algo que ver con responder a un anuncio en Craigslist. El resto es confuso.\n\nLa cuestiÃ³n subyacente es doble: A) Swatchity es genial porque nuestra gente es grande y 2) estamos todos aquÃ­ de nuestra propia voluntad **.\n\n* Swatchity no es una secta.\n\n** Una vez mÃ¡s, no es Swatchity (actualmente) un culto.', 'Rencontrez l\'Ã©quipe de Swatchity !', 'Il s\'agit de l\'extrait d\'un deuxiÃ¨me article', '<img src=\"images/news/swatchity_team.jpg\">Comme vous pouvez le dire de cette photo prise Ã  notre crÃ¨me glacÃ©e rÃ©cente sociale, nous sommes un groupe trÃ¨s diversifiÃ©. Certains d\'entre nous comme le vert profond de ton bijou. D\'autres sont attirÃ©s par les beiges avec sourdine.  C\'est un miracle que nous recevons tous le long ! Il y a, cependant, une chose qui nous unit : une croyance fondamentale dans ce projet et notre fondateur S. Masterson Paul *.\n\nAu cours du dÃ©veloppement, nous avons dÃ©couvert que notre plus grande force rÃ©side peut-Ãªtre dans cette riche panoplie de diverses origines. Par exemple, Sadie R. a une maÃ®trise en informatique de gÃ©nie alors que Kirk T. n\'a aucune expÃ©rience de codage que ce soit et ne sait pas comment il s\'est impliquÃ© avec Swatchity en premier lieu. Il avait quelque chose Ã  voir avec la rÃ©ponse Ã  une annonce de Craigslist, dit-il. Le reste est flou.\n\nLe point sous-jacent est double: A) Swatchity est grande, parce que nos gens sont grands et 2) nous sommes tous ici Ã  notre propre libre arbitre **.\n\n* Swatchity n\'est pas un culte.\n\n** Encore une fois, Swatchity n\'est pas (actuellement) un culte.', 'Treffen Sie das Swatchity-Team!', 'Dies ist der Auszug aus einem zweiten Newseintrag', '<img src=\"images/news/swatchity_team.jpg\">Wie Sie aus dieser Aufnahme bei unserer letzten Eis soziale sagen kÃ¶nnen, sind wir sehr vielfÃ¤ltig. Einige von uns wie Tiefe Juwel-Ton grÃ¼n. Andere sind gedÃ¤mpfte Beiges angezogen.  Es ist ein Wunder, das wir alle miteinander auskommen! Es gibt jedoch eine Sache, die uns miteinander verbindet: der grundlegende glaube an dieses Projekt und unserem GrÃ¼nder S. Masterson Paul *.\n\nIm Laufe der Entwicklung haben wir entdeckt, dass vielleicht unsere grÃ¶ÃŸte StÃ¤rke in diesem reiche Palette unterschiedlicher Herkunft liegt. Sadie R. hat beispielsweise einen Master in Computer engineering, wÃ¤hrend Kirk T. keine Codierung Erfahrung Ã¼berhaupt hat und unsicher ist, wie er in erster Linie mit Swatchity gekommen. Er sagt, dass es etwas mit der Beantwortung einer Craigslist-Anzeige zu tun hatte. Der Rest ist diesig.\n\nDer zugrunde liegende Punkt ist zweierlei: A) Swatchity ist groÃŸ, weil unsere Leute groÃŸ sind und 2) wir alle sind hier von unserem eigenen freien Willen **.\n\n* Swatchity ist keine Sekte.\n\n** Auch Swatchity ist nicht (derzeit) eine Sekte.', 'Incontra il Swatchity Team!', 'Questo Ã¨ l\'Estratto da un articolo secondo', '<img src=\"images/news/swatchity_team.jpg\">Come si puÃ² dire da questa foto scattata al nostro recente gelato sociale, siamo un gruppo molto vario. Alcuni di noi come gioiello-tono profondo verde. Gli altri sono attratti da tenui beige.  Ãˆ un miracolo che tutti andiamo d\'accordo! Tuttavia, c\'Ã¨ una cosa che ci lega: una convinzione fondamentale in questo progetto e il nostro fondatore Paul S. Masterson *.\n\nNel corso dello sviluppo, abbiamo scoperto che forse il nostro maggior punto di forza risiede in questa ricca panoplia degli ambiti di provenienza. Ad esempio, Sadie R. ha un Master in computer engineering mentre Kirk T. non ha alcuna esperienza di codifica alcun tipo e non Ã¨ sicuro come Ã¨ stato coinvolto con Swatchity in primo luogo. Lui dice che aveva qualcosa a che fare con rispondendo a un annuncio Craigslist. Il resto Ã¨ confuso.\n\nIl punto di fondo Ã¨ duplice: A) Swatchity Ã¨ grande, perchÃ© la nostra gente Ã¨ grande e 2) siamo tutti qui del nostro libero arbitrio * *.\n\n* Swatchity non Ã¨ un culto.\n\n* * Nuovo, Swatchity non Ã¨ (attualmente) un culto.', 'ÐÐ°ÑˆÐ° ÐºÐ¾Ð¼Ð°Ð½Ð´Ð° Swatchity!', 'Ð­Ñ‚Ð¾ Ð¾Ñ‚Ñ€Ñ‹Ð²Ð¾Ðº Ð¸Ð· Ð²Ñ‚Ð¾Ñ€Ð¾Ð³Ð¾ Ð¿ÑƒÐ½ÐºÑ‚Ð° ÐÐ¾Ð²Ð¾ÑÑ‚Ð¸', '<img src=\"images/news/swatchity_team.jpg\">ÐšÐ°Ðº Ð²Ñ‹ Ð¼Ð¾Ð¶ÐµÑ‚Ðµ ÑÐºÐ°Ð·Ð°Ñ‚ÑŒ Ð¾Ñ‚ ÑÑ‚Ð¾Ð¹ Ñ„Ð¾Ñ‚Ð¾Ð³Ñ€Ð°Ñ„Ð¸Ð¸, Ð¿Ñ€Ð¸Ð½ÑÑ‚Ñ‹Ñ… Ð½Ð° Ð½Ð°ÑˆÐ¸Ñ… Ð½ÐµÐ´Ð°Ð²Ð½Ð¸Ñ… Ð¼Ð¾Ñ€Ð¾Ð¶ÐµÐ½Ð¾Ð³Ð¾ ÑÐ¾Ñ†Ð¸Ð°Ð»ÑŒÐ½Ð¾Ð¹, Ð¼Ñ‹ ÐºÑƒÑ‡Ñƒ Ð¾Ñ‡ÐµÐ½ÑŒ Ñ€Ð°Ð·Ð½Ð¾Ð¾Ð±Ñ€Ð°Ð·Ð½Ñ‹. ÐÐµÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ðµ Ð¸Ð· Ð½Ð°Ñ ÐºÐ°Ðº Ð³Ð»ÑƒÐ±Ð¾ÐºÑƒÑŽ jewel Ñ‚Ð¾Ð½ Ð·ÐµÐ»ÐµÐ½Ñ‹Ð¹. Ð”Ñ€ÑƒÐ³Ð¸Ðµ Ð¿Ñ€Ð¸Ð²Ð»ÐµÐºÐ°ÑŽÑ‚ Ðº Ð¿Ñ€Ð¸Ð³Ð»ÑƒÑˆÐµÐ½Ð½Ñ‹Ð¼ beiges.  Ð­Ñ‚Ð¾ Ñ‡ÑƒÐ´Ð¾, Ñ‡Ñ‚Ð¾ Ð¼Ñ‹ Ð²ÑÐµ Ð»Ð°Ð´ÑÑ‚! Ð¡ÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÐµÑ‚, Ð¾Ð´Ð½Ð°ÐºÐ¾, Ð¾Ð´Ð½Ð° Ð²ÐµÑ‰ÑŒ, ÐºÐ¾Ñ‚Ð¾Ñ€Ð°Ñ ÑÐ²ÑÐ·Ñ‹Ð²Ð°ÐµÑ‚ Ð½Ð°Ñ Ð²Ð¼ÐµÑÑ‚Ðµ: Ð¾ÑÐ½Ð¾Ð²Ð¾Ð¿Ð¾Ð»Ð°Ð³Ð°ÑŽÑ‰ÑƒÑŽ Ð²ÐµÑ€Ñƒ Ð² ÑÑ‚Ð¾Ð¼ Ð¿Ñ€Ð¾ÐµÐºÑ‚Ðµ Ð¸ Ð½Ð°Ñˆ Ð¾ÑÐ½Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ S. ÐœÐ°ÑÑ‚ÐµÑ€ÑÐ¾Ð½ Paul *.\n\nÐ’ Ð¿Ñ€Ð¾Ñ†ÐµÑÑÐµ Ñ€Ð°Ð·Ð²Ð¸Ñ‚Ð¸Ñ Ð¼Ñ‹ Ð¾Ð±Ð½Ð°Ñ€ÑƒÐ¶Ð¸Ð»Ð¸, Ñ‡Ñ‚Ð¾ Ð²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ Ð½Ð°ÑˆÐ° ÑÐ¸Ð»Ð° Ð»ÐµÐ¶Ð¸Ñ‚ Ð² ÑÑ‚Ð¾Ñ‚ Ð±Ð¾Ð³Ð°Ñ‚Ñ‹Ð¹ Ð°Ñ€ÑÐµÐ½Ð°Ð» Ñ€Ð°Ð·Ð»Ð¸Ñ‡Ð½Ñ‹Ñ… ÑÐ»Ð¾ÐµÐ² Ð¾Ð±Ñ‰ÐµÑÑ‚Ð²Ð°. Ðš Ð¿Ñ€Ð¸Ð¼ÐµÑ€Ñƒ Ð¡ÑÐ´Ð¸ Ñ€. Ð¸Ð¼ÐµÐµÑ‚ ÑÑ‚ÐµÐ¿ÐµÐ½ÑŒ Ð¼Ð°Ð³Ð¸ÑÑ‚Ñ€Ð° Ð² Ð¾Ð±Ð»Ð°ÑÑ‚Ð¸ ÐºÐ¾Ð¼Ð¿ÑŒÑŽÑ‚ÐµÑ€Ð½Ð¾Ð¹ Ñ‚ÐµÑ…Ð½Ð¸ÐºÐ¸ Ð° ÐšÐ¸Ñ€Ðº Ñ‚. Ð½Ðµ Ð¸Ð¼ÐµÐµÑ‚ Ð½Ð¸ÐºÐ°ÐºÐ¾Ð³Ð¾ ÐºÐ¾Ð´Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ñ Ð¾Ð¿Ñ‹Ñ‚Ð° Ð²Ð¾Ð¾Ð±Ñ‰Ðµ Ð¸ Ð½Ðµ Ð·Ð½Ð°ÐµÑ‚Ðµ, ÐºÐ°Ðº Ð¾Ð½ Ð¿Ð¾Ð¿Ð°Ð» Ñ Swatchity Ð² Ð¿ÐµÑ€Ð²ÑƒÑŽ Ð¾Ñ‡ÐµÑ€ÐµÐ´ÑŒ. ÐžÐ½ Ð³Ð¾Ð²Ð¾Ñ€Ð¸Ñ‚, Ñ‡Ñ‚Ð¾ Ð¾Ð½ Ñ‡Ñ‚Ð¾-Ñ‚Ð¾ Ð´ÐµÐ»Ð°Ñ‚ÑŒ Ñ Ð¾Ñ‚Ð²ÐµÑ‡Ð°Ñ Ð½Ð° Ð¾Ð±ÑŠÑÐ²Ð»ÐµÐ½Ð¸Ðµ Ð½Ð° Craigslist. ÐžÑÑ‚Ð°Ð»ÑŒÐ½Ð¾Ðµ-Ñ‚ÑƒÐ¼Ð°Ð½Ð½Ð¾.\n\nÐžÑÐ½Ð¾Ð²Ð½Ð¾Ð¹ Ð¼Ð¾Ð¼ÐµÐ½Ñ‚ Ð¸Ð¼ÐµÐµÑ‚ Ð´Ð²Ð° Ð°ÑÐ¿ÐµÐºÑ‚Ð°: A) Swatchity Ð²ÐµÐ»Ð¸Ðº, Ð¿Ð¾Ñ‚Ð¾Ð¼Ñƒ Ñ‡Ñ‚Ð¾ Ð½Ð°ÑˆÐ¸ Ð»ÑŽÐ´Ð¸ Ð±Ð¾Ð»ÑŒÑˆÐ¸Ðµ Ð¸ 2) Ð¼Ñ‹ Ð²ÑÐµ Ð·Ð´ÐµÑÑŒ Ð¾ Ð½Ð°ÑˆÐµÐ¹ ÑÐ¾Ð±ÑÑ‚Ð²ÐµÐ½Ð½Ð¾Ð¹ Ð²Ð¾Ð»Ðµ **.\n\n* Swatchity ÑÑ‚Ð¾ Ð½Ðµ ÐºÑƒÐ»ÑŒÑ‚.\n\n** Ð¡Ð½Ð¾Ð²Ð°, Ð½Ðµ ÑÐ²Ð»ÑÐµÑ‚ÑÑ Swatchity (Ð² Ð½Ð°ÑÑ‚Ð¾ÑÑ‰ÐµÐµ Ð²Ñ€ÐµÐ¼Ñ) ÐºÑƒÐ»ÑŒÑ‚.', '{DLL6/6IL/73P6NIH61/6LPD#}', '{6IH7/H7/6IL/L2NL8A6/K8BD/P/7LNBCM/CL37/H6LD}', '{<HDJ/78N=\"HDPJL7/CL37/73P6NIH61_6LPD;GAJ\">\nP7/1B5/NPC/6LEE/K8BD/6IH7/AIB6B/6PFLC/P6/B58/8LNLC6/HNL/N8LPD/7BNHPE^/3L\'8L/P/4L81/MH4L87L/O5CNI;/7BDL/BK/57/EHFL/MLLA/GL3LE-6BCL/J8LLC;/B6IL87/P8L/P668PN6LM/6B/D56LM/OLHJL7;//H6\'7/P/DH8PNEL/6IP6/3L/PEE/JL6/PEBCJ#/6IL8L/H7^/IB3L4L8^/BCL/6IHCJ/6IP6/OHCM7/57/6BJL6IL8:/P/K5CMPDLC6PE/OLEHLK/HC/6IH7/A8BGLN6/PCM/B58/KB5CML8/7;/DP76L87BC/AP5E*;\n\nHC/6IL/NB587L/BK/ML4LEBADLC6^/3L\'4L/MH7NB4L8LM/6IP6/AL8IPA7/B58/J8LP6L76/768LCJ6I/EHL7/HC/6IH7/8HNI/APCBAE1/BK/MH4L87L/OPNFJ8B5CM7;/KB8/L2PDAEL^/7PMHL/8;/IP7/P/DP76L87/HC/NBDA56L8/LCJHCLL8HCJ/3IHEL/FH8F/6;/IP7/CB/NBMHCJ/L2AL8HLCNL/3IP67BL4L8/PCM/H7/5C758L/IB3/IL/JB6/HC4BE4LM/3H6I/73P6NIH61/HC/6IL/KH876/AEPNL;/IL/7P17/H6/IPM/7BDL6IHCJ/6B/MB/3H6I/PC73L8HCJ/P/N8PHJ7EH76/PM;/6IL/8L76/H7/IP01;\n\n6IL/5CML8E1HCJ/ABHC6/H7/63BKBEM:/P)/73P6NIH61/H7/J8LP6/OLNP57L/B58/ALBAEL/P8L/J8LP6/PCM/2)/3L/P8L/PEE/IL8L/BK/B58/B3C/K8LL/3HEE**;\n\n*73P6NIH61/H7/CB6/P/N5E6;\n\n**PJPHC^/73P6NIH61/H7/CB6/(N588LC6E1)/P/N5E6;\n}'),
(4, '2015-06-02 19:00:35', 'ç¾Žå›½éº¦æ–¯å¾·æ£® Paul-\'å‡†å¤‡æ›´å¤šå½©çš„äººç”Ÿ', '<img src=\"images/news/blessed_founder_01.jpg\">ç¾Žå›½éº¦æ–¯å¾·æ£® Paul HypeSqueeze å´‡æ•¬çš„ç§‘æŠ€ä¼šè®®æœ¬å‘¨èµ°ä¸Šèˆžå°ï¼Œå’Œå¾€å¸¸ä¸€æ ·ï¼Œçªç„¶äººç¾¤ä¸­å“ç‰Œæ­£å‘ç‹‚ã€‚\n\nåœ¨ä»–çš„è¡¨æ¼”ä¹‹åŽï¼ŒSwatchity å¸¦å›žå®¶å¥–\"æœ€å…·ç ´åæ€§\"â€” â€” ä¸»è¦æ˜¯ç”±äºŽäº‹å®žï¼Œæˆ‘ä»¬æ²¡è¢«é‚€è¯·ï¼Œçº¯ç²¹æŠ€æœ¯æ€§çš„æ„ä¹‰ä¸Šè¯´ï¼Œæ‰“æ‰°åˆ°å¦ä¸€å®¶å…¬å¸çš„æ¼”ç¤ºæ–‡ç¨¿ã€‚å€¼å¾—åº†å¹¸çš„æ˜¯ï¼Œå¸•å…‹å¸Œå°”é¡¿æœ‰éžå¸¸å®½æ¾çš„å®‰å…¨ã€‚\n\nåŽçœ‹åˆ°çš„æ¼”ç¤ºï¼ŒHypeSqueeze çš„å¯çˆ±è„¾æ°”æ£’æ£’ç³– Wattel é—®è¿™ä¸ªé—®é¢˜å¯¹æ¯ä¸ªäººçš„å¿ƒä¸­ã€‚\"ä»€ä¹ˆåœ°ç‹±å‘¢ï¼Ÿå®ƒå¯ä»¥åš...æ ¹æœ¬åŽŽä¸€åˆ‡å—?\"\"æˆ‘æ‹’ç»çš„å‰æä¸‹ï¼Œåº”ç”¨ç¨‹åºéœ€è¦ \'åš\' çš„äº‹æƒ…ï¼Œæ­£å¦‚ä½ æ‰€è¯´çš„\"Paul å›žç­”ã€‚\n\n\"è¯·åŽŸè°…æˆ‘å¦‚æžœè¿™ä¼¼ä¹Žæ˜¯ä¸ç¤¼è²Œçš„ä½†çœ‹ä¸ŠåŽ»å¹¶ä¸åƒä½ çš„äº§å“æœ‰ä»»ä½•æŒ‡å‘å®ƒæ ¹æœ¬ã€‚\"\n\n\"æ„Ÿå…´è¶£ï¼Œä½ ä¼šè¯´ï¼Œ\"Paul è‹¥æœ‰æ‰€æ€åœ°è¯´ã€‚\"æƒ³è±¡ä¸€ä¸‹æ–°ä¸€ä»£çš„å¹³å°å’Œæ¡†æž¶å·²ç»è¿›åŒ–è€Œè¶…è¶Šçš„è¿‡æ—¶çš„é™åˆ¶ï¼ŒæŽˆæƒæ‰€åšçš„äº‹æƒ…ï¼Œæœ‰çš„ç‚¹ã€‚\n\næ‰€å±žç±»åž‹çš„äººç¾¤å‘å‡ºä¸æƒ…æ„¿ä½†æ¸…æ™°å¯é—»çš„å–˜æ¯ã€‚\n\n\"æƒ³è±¡æ•´ä¸ªæ–°çš„è¯æ±‡ï¼Œåœ¨ä¼šè®®ä¸Šæ‰“åŠ¨é‚£äº›æœ¬è¯¥äº†è§£æ›´å¤šçš„äººæŽå‡ºçš„æµè¡Œè¯­ã€‚ç®€å•åœ°è¯´ï¼Œæ˜¯ï¼ŒSwatchity!\"\n\nåœ¨è¿™ä¸€ç‚¹åœ¨ä»–çš„æ¼”è®²ï¼Œé…’åº—çš„å®‰å…¨å°ç»„åŒ…å›´å¾ˆæœ‰é­…åŠ›çš„ Swatchity é¦–å¸­æ‰§è¡Œå®˜å’Œä»–æŠ¬äº†å‡ºåŽ»ï¼Œåˆ°äº†åœè½¦åœºã€‚\n\n\"é©å‘½ï¼Œ\"ä»–å–Šé“ï¼Œ\"å°†è¢« Swatchified!\"', 'åœ¨ HypeSqueeze Swatchity åˆ›å§‹äººè®²è¯', 'Swatchity Founder Speaks at HypeSqueeze', 'S. Masterson Paul-\' Prepare for a more colorful life \'', '<img src=\"images/news/blessed_founder_01.jpg\">S. Masterson Paul took the stage at the venerated tech conference HypeSqueeze this week and, true to form, whipped the crowd into a brand-positive frenzy.\n\nIn the wake of his performance, Swatchity took home the award for \"most disruptive\"-mostly due to the fact that we hadn\'t been invited and, in a purely technical sense, were interrupting another company presentation. Thankfully, the Menlo Park Hilton has very lax security.\n\nAfter seeing the demo, HypeSqueeze\'s lovably cantankerous Lollies Wattel asked the question on everyone mind. \"What the hell does it do? Does it do... anything at all? \"\" I reject the premise that apps need to \' do \' things, as you put it, \"replied Paul.\n\n\"Pardon me if this seems rude, but it doesn\'t seem like your product has any point to it at all.\"\n\n\"Interesting that you would say that,\" mused Paul. \"Imagine for a moment a new generation of platforms and frameworks that have evolved beyond the outmoded constraints that mandated the doing of things, the having of points.\"\n\nThe crowd of industry types emitted a reluctant but clearly audible gasp.\n\n\"Imagine whole new vocabulary of buzzwords to whip out at meetings to impress people who ought to know better. That, in a nutshell, is Swatchity! \"\n\nAt this point in his presentation, the hotels security team surrounded the charismatic Swatchity CEO and carried him out to the parking lot.\n\n\"The revolution,\" he cried, \"will be Swatchified!\"', 'Swatchity Founder Speaks at HypeSqueeze', 'S. Masterson Paul - \'Prepare for a more colorful life\'', '<img src=\"images/news/blessed_founder_01.jpg\">\nS. Masterson Paul took the stage at the venerated tech conference HypeSqueeze this week and, true to form, whipped the crowd into a brand-positive frenzy.\n\nIn the wake of his performance, Swatchity took home the award for \"most disruptive\" - mostly due to the fact that we hadn\'t been invited and, in a purely technical sense, were interrupting another company\'s presentation. Thankfully, the Menlo Park Hilton has very lax security.\n\nAfter seeing the demo, HypeSqueeze\'s lovably cantankerous Lolly Wattel asked the question on everyone\'s mind. \"What the hell does it do? Does it do ...anything at all?\"\n\n\"I reject the premise that apps need to \'do\' things, as you put it,\" replied Paul.\n\n\"Pardon me if this seems rude, but it doesn\'t seem like your product has any point to it at all.\"\n\n\"Interesting that you would say that,\" mused Paul. \"Imagine for a moment a new generation of platforms and frameworks that have evolved beyond the outmoded constraints that mandated the doing of things, the having of points.\"\n\nThe crowd of industry types emitted a reluctant but clearly audible gasp.\n\n\"Imagine whole new vocabulary of buzzwords to whip out at meetings to impress people who ought to know better. That, in a nutshell, is Swatchity!\"\n\nAt this point in his presentation, the hotel\'s security team surrounded the charismatic Swatchity CEO and carried him out to the parking lot.\n\n\"The revolution,\" he cried, \"will be Swatchified!\"', 'Swatchity fundador habla en HypeSqueeze', 'S. Masterson Paul - \'Prepararse para una vida mÃ¡s colorida\'', '<img src=\"images/news/blessed_founder_01.jpg\">Paul S. Masterson subiÃ³ al escenario en la Conferencia de tecnologÃ­a venerada HypeSqueeze esta semana y, fiel a su estilo, batida a la multitud en un frenesÃ­ de marca-positivo.\n\nA raÃ­z de su actuaciÃ³n, Swatchity se llevÃ³ a casa el premio a la \"mÃ¡s perturbadores\" - en su mayorÃ­a debido a que no habÃ­a sido invitados y, en un sentido puramente tÃ©cnico, estaban interrumpiendo la presentaciÃ³n de otra empresa. Afortunadamente, el Hilton Menlo Park tiene una seguridad muy flojo.\n\nDespuÃ©s de ver la demo, lovably cascarrabias Lolly Wattel de HypeSqueeze la pregunta en la mente de todos. \"Â¿QuÃ© diablos hace? Lo que hace.. .cualquier cosa en absoluto. \"\" Rechazo la premisa de que aplicaciones necesitan \'hacer\' cosas, como usted dice,\"respondiÃ³ Paul.\n\n\"Perdona si esto parece grosero, pero no parece que su producto tiene algÃºn sentido en absoluto\".\n\n\"Interesante que dirÃ­as eso,\" reflexionÃ³ Paul. \"Imaginen por un momento una nueva generaciÃ³n de plataformas y frameworks que han evolucionado mÃ¡s allÃ¡ de las limitaciones obsoletas que hacer las cosas, tener puntos por mandato\".\n\nLa multitud de tipos de industria emite un jadeo reticente pero claramente audible.\n\n\"Imagina el nuevo vocabulario de moda para sacar a las reuniones para impresionar a gente que deberÃ­a saber mejor. Que, en pocas palabras, es Swatchity\".\n\nEn este punto en su presentaciÃ³n, equipo de seguridad del hotel habÃ­a rodeado al carismÃ¡tico CEO de Swatchity y lo llevÃ³ a cabo en el estacionamiento.\n\n\"La revoluciÃ³n\", exclamÃ³, \"va ser Swatchified!\"', 'Fondateur de Swatchity parle Ã  HypeSqueeze', 'S. Masterson Paul - Â« PrÃ©parer Ã  une vie plus colorÃ©e Â»', '<img src=\"images/news/blessed_founder_01.jpg\">S. Masterson Paul montÃ©s sur scÃ¨ne lors de la ConfÃ©rence tech vÃ©nÃ©rÃ© HypeSqueeze cette semaine et, fidÃ¨le Ã  ses habitudes, fouettÃ©e la foule dans une frÃ©nÃ©sie de marque positive.\n\nDans la foulÃ©e de sa prestation, Swatchity a remportÃ© le prix pour Â« plus perturbatrices Â» - essentiellement due au fait que nous n\'avait pas Ã©tÃ© invitÃ©s et, dans un sens purement technique, ont Ã©tÃ© interrompre la prÃ©sentation d\'une autre sociÃ©tÃ©. Heureusement, l\'hÃ´tel Hilton de Menlo Park a sÃ©curitÃ© trÃ¨s laxiste.\n\nAprÃ¨s avoir vu la dÃ©mo, adorablement acariÃ¢tre Lolly Wattel de HypeSqueeze a posÃ© la question sur l\'esprit de chacun. \"Ce que l\'enfer fait-elle ? Faut-il faire.. .anything du tout? \"\" Je rejette la prÃ©misse selon laquelle les applications ont besoin de Â« faire Â» des choses, comme vous dites,\"rÃ©pondit Paul.\n\nÂ« Pardonnez-moi si cela semble grossier, mais il ne semble pas que votre produit a n\'importe quel point d\'elle du tout. Â»\n\nÂ« IntÃ©ressant que vous diriez que, Â» disait-il Paul. Â« Imaginez un instant une nouvelle gÃ©nÃ©ration de plateformes et cadres qui ont Ã©voluÃ© au-delÃ  des contraintes dÃ©modÃ©s qui prescrit l\'accomplissement des choses, l\'ayant des points Â».\n\nLa foule des types d\'industrie Ã©mis un soupir rÃ©ticent mais bien audible.\n\n\"Imaginez tout nouveau vocabulaire des mots Ã  la mode pour sortir lors de rÃ©unions d\'impressionner les gens qui devraient savoir mieux. En bref, voilÃ , Swatchity!\"\n\nÃ€ ce stade dans sa prÃ©sentation, Ã©quipe de sÃ©curitÃ© de l\'hÃ´tel entourÃ© de la charismatique CEO de Swatchity et lui effectuÃ©s pour le stationnement.\n\n\"La rÃ©volution\", il s\'Ã©cria, \"va Ãªtre Swatchified!\"', 'Swatchity-GrÃ¼nder spricht bei HypeSqueeze', 'S. Masterson Paul - \'Vorbereitung fÃ¼r ein bunter Leben\'', '<img src=\"images/news/blessed_founder_01.jpg\">S. Masterson Paul nahm der BÃ¼hne bei der verehrt Tech-Konferenz HypeSqueeze diese Woche und getreu Form, peitschte das Publikum in einen Rausch der Marke-Positive.\n\nIm Zuge seiner Leistung holte sich Swatchity den Award fÃ¼r \"sehr stÃ¶rend\" - vor allem aufgrund der Tatsache, dass wir noch nicht eingeladen worden und in rein technischer Hinsicht, eines anderen Unternehmens-PrÃ¤sentation unterbrechen waren. Zum GlÃ¼ck hat die Menlo Park-Hilton sehr lax Sicherheit.\n\nNach der Besichtigung der Demo, Frage HypeSqueezes liebenswert streitsÃ¼chtig Lolly Wattel die Ã¼ber allen KÃ¶pfen. \"Was tut zum Teufel es? Es tut.. was Ã¼berhaupt? \"\" Die PrÃ¤misse, die dass die apps mÃ¼ssen \'tun\', wie Sie ausdrÃ¼ckte, lehne ich ab\", antwortete Paul.\n\n\"Entschuldigen Sie mich, wenn dies unhÃ¶flich scheint, aber es scheint nicht, wie Ihr Produkt es keinen Sinn Ã¼berhaupt hat.\"\n\n\"Interessant, dass Sie das sagen wÃ¼rden\", sinnierte Paul. \"Stellen Sie sich fÃ¼r einen Moment eine neue Generation von Plattformen und Frameworks, die Ã¼ber die veralteten EinschrÃ¤nkungen, die das tun Dinge entwickelt haben, die mit Punkten beauftragt.\"\n\nDie Menge der Industrie Typen ausgegeben, ein Keuchen nur ungern, aber deutlich hÃ¶rbar.\n\n\"Stellen Sie sich ganz neues Vokabular Schlagworten, Peitsche bei Sitzungen zu beeindrucken, die es hÃ¤tten besser wissen. Das ist kurz gesagt, Swatchity!\"\n\nZu diesem Zeitpunkt in seinem Vortrag das Hotel Sicherheitsteam umgeben die charismatische Swatchity-CEO und trug ihn raus auf den Parkplatz.\n\n\"Die Revolution,\" rief er, \"wird Swatchified sein!\"', 'Fondatore di Swatchity parla al HypeSqueeze', 'S. Masterson Paul - \'Preparare per una vita piÃ¹ colorata\'', '<img src=\"images/news/blessed_founder_01.jpg\">S. Paul Masterson Ã¨ salito sul palco alla conferenza tech venerata HypeSqueeze questa settimana e, fedele alla forma, montata la folla in delirio marca-positivo.\n\nSulla scia della sua performance, Swatchity ha portato a casa il premio per \"piÃ¹ dirompente\" - dovuto principalmente al fatto che noi non fosse stati invitati e, in senso puramente tecnico, erano interrompendo la presentazione di un\'altra azienda. Fortunatamente, l\'Hilton di Menlo Park ha molto lassista di sicurezza.\n\nDopo aver visto la demo, amabile irascibile Lolly Wattel di HypeSqueeze ha posto la domanda nella mente di tutti. \"Che cosa diavolo fa? Lo fa... cosa a tutti? \"\" Respingo la premessa che apps hanno bisogno di \'fare\' le cose, come dici tu,\"rispose Paul.\n\n\"Mi scusi se questo sembra scortese, ma non sembra che il prodotto ha alcun punto di esso a tutti.\"\n\n\"Interessante che si direbbe che,\" pensÃ² Paul. \"Immagina per un attimo una nuova generazione di piattaforme e strutture che si sono evoluti oltre i vincoli antiquati che ha incaricato il fare delle cose, avendo dei punti\".\n\nLa folla dei tipi di industria emesso un sussulto riluttante ma chiaramente udibile.\n\n\"Immaginare il nuovo vocabolario delle parole d\'ordine a frustare fuori alle riunioni per impressionare la gente che dovrebbe sapere meglio. Che, in poche parole, Ã¨ Swatchity!\"\n\nA questo punto nella sua presentazione, la squadra di sicurezza dell\'hotel circondato il carismatico CEO di Swatchity e lui effettuati al parcheggio.\n\n\"La rivoluzione\", gridÃ²: \"sarÃ  essere Swatchified!\"', 'ÐžÑÐ½Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ Swatchity Ð³Ð¾Ð²Ð¾Ñ€Ð¸Ñ‚ Ð½Ð° HypeSqueeze', 'S. ÐœÐ°ÑÑ‚ÐµÑ€ÑÐ¾Ð½ Paul - Â«ÐŸÐ¾Ð´Ð³Ð¾Ñ‚Ð¾Ð²Ð¸Ñ‚ÑŒÑÑ Ð±Ð¾Ð»ÐµÐµ ÐºÑ€Ð°ÑÐ¾Ñ‡Ð½Ð°Ñ Ð¶Ð¸Ð·Ð½ÑŒÂ»', '<img src=\"images/news/blessed_founder_01.jpg\">Paul S. ÐœÐ°ÑÑ‚ÐµÑ€ÑÐ¾Ð½ Ð²Ñ‹ÑˆÐ»Ð° Ð½Ð° ÑÑ†ÐµÐ½Ñƒ Ð² ÐºÐ¾Ð½Ñ„ÐµÑ€ÐµÐ½Ñ†Ð¸Ð¸ Ð£Ð²Ð°Ð¶Ð°Ð²ÑˆÐ¸Ð¹ Ñ‚ÐµÐº HypeSqueeze ÑÑ‚Ð¾Ð¹ Ð½ÐµÐ´ÐµÐ»Ðµ Ð¸, Ð²ÐµÑ€Ð½Ñ‹Ð¹ Ñ„Ð¾Ñ€Ð¼Ðµ, Ð²Ð·Ð±Ð¸Ñ‚Ñ‹Ð¼Ð¸ Ñ‚Ð¾Ð»Ð¿Ñ‹ Ð² Ð¸ÑÑÑ‚ÑƒÐ¿Ð»ÐµÐ½Ð¸Ð¸ Ð±Ñ€ÐµÐ½Ð´ Ð¿Ð¾Ð»Ð¾Ð¶Ð¸Ñ‚ÐµÐ»ÑŒÐ½Ñ‹Ñ….\n\nÐ’ Ñ€ÐµÐ·ÑƒÐ»ÑŒÑ‚Ð°Ñ‚Ðµ ÐµÐ³Ð¾ Ð¸ÑÐ¿Ð¾Ð»Ð½ÐµÐ½Ð¸Ñ Swatchity Ð²Ð·ÑÐ» Ð´Ð¾Ð¼Ð¾Ð¹ Ð½Ð°Ð³Ñ€Ð°Ð´Ñƒ Ð·Ð° Â«Ð½Ð°Ð¸Ð±Ð¾Ð»ÐµÐµ Ñ€Ð°Ð·Ñ€ÑƒÑˆÐ¸Ñ‚ÐµÐ»ÑŒÐ½Ñ‹Ð¼Â» - Ð³Ð»Ð°Ð²Ð½Ñ‹Ð¼ Ð¾Ð±Ñ€Ð°Ð·Ð¾Ð¼ Ñ‚ÐµÐ¼, Ñ‡Ñ‚Ð¾ Ð¼Ñ‹ Ð½Ðµ Ð¿Ñ€Ð¸Ð³Ð»Ð°ÑÐ¸Ð»Ð¸ Ð¸ Ð² Ñ‡Ð¸ÑÑ‚Ð¾ Ñ‚ÐµÑ…Ð½Ð¸Ñ‡ÐµÑÐºÐ¾Ð¼ ÑÐ¼Ñ‹ÑÐ»Ðµ, Ð¿Ñ€ÐµÑ€Ñ‹Ð²Ð°Ñ‚ÑŒ Ð¿Ñ€ÐµÐ·ÐµÐ½Ñ‚Ð°Ñ†Ð¸ÑŽ Ð´Ñ€ÑƒÐ³Ð¾Ð¹ ÐºÐ¾Ð¼Ð¿Ð°Ð½Ð¸Ð¸. Ðš ÑÑ‡Ð°ÑÑ‚ÑŒÑŽ Menlo Park Hilton Ð¸Ð¼ÐµÐµÑ‚ Ð¾Ñ‡ÐµÐ½ÑŒ ÑÐ»Ð°Ð±Ñ‹Ð¹ Ð±ÐµÐ·Ð¾Ð¿Ð°ÑÐ½Ð¾ÑÑ‚Ð¸.\n\nÐŸÐ¾ÑÐ»Ðµ Ð¿Ñ€Ð¾ÑÐ¼Ð¾Ñ‚Ñ€Ð° Ð´ÐµÐ¼Ð¾, HypeSqueeze ÑÐµÑ€ÑŒÐµÐ·Ð½Ð¾ Ð²Ð·Ð´Ð¾Ñ€Ð½Ñ‹Ð¹ Ñ„Ñ€ÑƒÐºÑ‚Ð¾Ð²Ð¾Ðµ Wattel Ð·Ð°Ð´Ð°Ð» Ð²Ð¾Ð¿Ñ€Ð¾Ñ Ñƒ Ð²ÑÐµÑ… Ð½Ð° Ð²Ð¸Ð´Ñƒ. Â«Ð¢Ð¾, Ñ‡Ñ‚Ð¾ Ð°Ð´ ÑÑ‚Ð¾? ÐžÐ½ Ð´ÐµÐ»Ð°ÐµÑ‚.. .anything Ð½Ð° Ð²ÑÐµÑ…?Â»Â» Ð¯ Ð¾Ñ‚Ð²ÐµÑ€Ð³Ð°ÑŽ Ð¿Ñ€ÐµÐ´Ð¿Ð¾ÑÑ‹Ð»ÐºÐµ, Ñ‡Ñ‚Ð¾ apps Ð½ÑƒÐ¶Ð½Ð¾ \'ÑÐ´ÐµÐ»Ð°Ñ‚ÑŒ\' Ð²ÐµÑ‰Ð¸, ÐºÐ°Ðº Ð²Ñ‹ Ð²Ñ‹Ñ€Ð°Ð·Ð¸Ð»Ð¸ÑÑŒ,\"Ð¾Ñ‚Ð²ÐµÑ‚Ð¸Ð» Paul.\n\nÂ«ÐŸÑ€Ð¾ÑÑ‚Ð¸Ñ‚Ðµ Ð¼Ð½Ðµ, ÐµÑÐ»Ð¸ ÑÑ‚Ð¾ ÐºÐ°Ð¶ÐµÑ‚ÑÑ Ð³Ñ€ÑƒÐ±Ñ‹Ð¼, Ð½Ð¾ ÑÑ‚Ð¾ Ð½Ðµ Ð¿Ð¾Ñ…Ð¾Ð¶Ðµ, Ñ‡Ñ‚Ð¾ Ð²Ð°Ñˆ Ð¿Ñ€Ð¾Ð´ÑƒÐºÑ‚ Ð¸Ð¼ÐµÐµÑ‚ Ð»ÑŽÐ±ÑƒÑŽ Ñ‚Ð¾Ñ‡ÐºÑƒ ÐµÐ¹ Ð½Ð° Ð²ÑÐµÑ….Â»\n\nÂ«Ð˜Ð½Ñ‚ÐµÑ€ÐµÑÐ½Ð¾, Ñ‡Ñ‚Ð¾ Ð²Ñ‹ Ð±Ñ‹ ÑÐºÐ°Ð·Ð°Ñ‚ÑŒ, Ñ‡Ñ‚Ð¾,Â» Ñ€Ð°Ð·Ð¼Ñ‹ÑˆÐ»ÑÐ» Paul. Â«ÐÐ° Ð¼Ð³Ð½Ð¾Ð²ÐµÐ½Ð¸Ðµ Ð¿Ñ€ÐµÐ´ÑÑ‚Ð°Ð²Ð¸Ñ‚ÑŒ Ð½Ð¾Ð²Ð¾Ðµ Ð¿Ð¾ÐºÐ¾Ð»ÐµÐ½Ð¸Ðµ Ð¿Ð»Ð°Ñ‚Ñ„Ð¾Ñ€Ð¼ Ð¸ ÑÑ‚Ñ€ÑƒÐºÑ‚ÑƒÑ€, ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ðµ ÑÐ»Ð¾Ð¶Ð¸Ð»Ð¸ÑÑŒ Ð·Ð° Ñ€Ð°Ð¼ÐºÐ¸ ÑƒÑÑ‚Ð°Ñ€ÐµÐ²ÑˆÐ¸Ñ… Ð¾Ð³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ð¹, ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ðµ Ð¿Ð¾Ñ€ÑƒÑ‡ÐµÐ½Ð¾ Ð´ÐµÐ»Ð°Ñ‚ÑŒ Ð²ÐµÑ‰Ð¸, Ð¸Ð¼ÐµÑŽÑ‰Ð¸Ðµ Ð¾Ñ‡ÐºÐ¾Ð²Â».\n\nÐ¢Ð¾Ð»Ð¿Ð° Ñ‚Ð¸Ð¿Ð¾Ð² Ð¿Ñ€Ð¾Ð¼Ñ‹ÑˆÐ»ÐµÐ½Ð½Ð¾ÑÑ‚Ð¸ Ð¸Ð·Ð»ÑƒÑ‡Ð°ÐµÐ¼Ñ‹Ð¹ Ð½ÐµÐ¾Ñ…Ð¾Ñ‚Ð½Ð¾, Ð½Ð¾ Ð¾Ñ‚Ñ‡ÐµÑ‚Ð»Ð¸Ð²Ð¾ ÑÐ»Ñ‹ÑˆÐµÐ½ Ð²Ð·Ð´Ð¾Ñ….\n\nÂ«ÐŸÑ€ÐµÐ´ÑÑ‚Ð°Ð²ÑŒÑ‚Ðµ ÑÐµÐ±Ðµ ÑÐ¾Ð²ÐµÑ€ÑˆÐµÐ½Ð½Ð¾ Ð½Ð¾Ð²Ñ‹Ð¹ ÑÐ»Ð¾Ð²Ð°Ñ€ÑŒ ÐºÐ»ÑŽÑ‡ÐµÐ²Ñ‹Ñ… Ð¿Ð¾Ð½ÑÑ‚Ð¸Ð¹, Ñ‡Ñ‚Ð¾Ð±Ñ‹ Ð²Ñ‹ÑÐºÐ¾Ñ‡Ð¸Ñ‚ÑŒ Ð½Ð° Ð·Ð°ÑÐµÐ´Ð°Ð½Ð¸ÑÑ…, Ñ‡Ñ‚Ð¾Ð±Ñ‹ Ð¿Ñ€Ð¾Ð¸Ð·Ð²ÐµÑÑ‚Ð¸ Ð²Ð¿ÐµÑ‡Ð°Ñ‚Ð»ÐµÐ½Ð¸Ðµ Ð½Ð° Ð»ÑŽÐ´ÐµÐ¹, ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ðµ Ð´Ð¾Ð»Ð¶Ð½Ñ‹ Ð·Ð½Ð°Ñ‚ÑŒ Ð»ÑƒÑ‡ÑˆÐµ. Ð’ Ð¾Ð±Ñ‰ÐµÐ¼, ÑÑ‚Ð¾ Swatchity!Â»\n\nÐÐ° Ð´Ð°Ð½Ð½Ñ‹Ð¹ Ð¼Ð¾Ð¼ÐµÐ½Ñ‚ Ð² ÑÐ²Ð¾ÐµÐ¼ Ð²Ñ‹ÑÑ‚ÑƒÐ¿Ð»ÐµÐ½Ð¸Ð¸, ÐºÐ¾Ð¼Ð°Ð½Ð´Ð° Ð¾Ñ‚ÐµÐ»Ñ Ð±ÐµÐ·Ð¾Ð¿Ð°ÑÐ½Ð¾ÑÑ‚Ð¸ Ð¾ÐºÑ€ÑƒÐ¶Ð¸Ð»Ð¸ Ñ…Ð°Ñ€Ð¸Ð·Ð¼Ð°Ñ‚Ð¸Ñ‡Ð½Ñ‹Ð¹ Ð´Ð¸Ñ€ÐµÐºÑ‚Ð¾Ñ€ Swatchity Ð¸ Ð½ÐµÑÐ»Ð¸ ÐµÐ³Ð¾ Ð½Ð° ÑÑ‚Ð¾ÑÐ½ÐºÑƒ.\n\nÂ«Ð ÐµÐ²Ð¾Ð»ÑŽÑ†Ð¸ÑÂ», Ð²Ð¾ÑÐºÐ»Ð¸ÐºÐ½ÑƒÐ» Ð¾Ð½, Â«Ð±ÑƒÐ´ÐµÑ‚ Ð±Ñ‹Ñ‚ÑŒ Swatchified!Â»', '{73P6NIH61/KB5CML8/7ALPF7/P6/I1AL795LL0L}', '{7;/DP76L87BC/AP5E/-/\'A8LAP8L/KB8/P/DB8L/NBEB8K5E/EHKL\'}', '{<HDJ/78N=\"HDPJL7/CL37/OEL77LM_KB5CML8_01;GAJ\">\n7;/DP76L87BC/AP5E/6BBF/6IL/76PJL/P6/6IL/4LCL8P6LM/6LNI/NBCKL8LCNL/I1AL795LL0L/6IH7/3LLF/PCM^/685L/6B/KB8D^/3IHAALM/6IL/N8B3M/HC6B/P/O8PCM-AB7H6H4L/K8LC01;\n\nHC/6IL/3PFL/BK/IH7/AL8KB8DPCNL^/73P6NIH61/6BBF/IBDL/6IL/P3P8M/KB8/\"DB76/MH785A6H4L\"/-/DB76E1/M5L/6B/6IL/KPN6/6IP6/3L/IPMC\'6/OLLC/HC4H6LM/PCM^/HC/P/A58LE1/6LNICHNPE/7LC7L^/3L8L/HC6L885A6HCJ/PCB6IL8/NBDAPC1\'7/A8L7LC6P6HBC;/6IPCFK5EE1^/6IL/DLCEB/AP8F/IHE6BC/IP7/4L81/EP2/7LN58H61;\n\nPK6L8/7LLHCJ/6IL/MLDB^/I1AL795LL0L\'7/EB4POE1/NPC6PCFL8B57/EBEE1/3P66LE/P7FLM/6IL/95L76HBC/BC/L4L81BCL\'7/DHCM;/\"3IP6/6IL/ILEE/MBL7/H6/MB*/MBL7/H6/MB/;;;PC16IHCJ/P6/PEE*\"\n\n\"H/8LGLN6/6IL/A8LDH7L/6IP6/PAA7/CLLM/6B/\'MB\'/6IHCJ7^/P7/1B5/A56/H6^\"/8LAEHLM/AP5E;\n\n\"AP8MBC/DL/HK/6IH7/7LLD7/85ML^/O56/H6/MBL7C\'6/7LLD/EHFL/1B58/A8BM5N6/IP7/PC1/ABHC6/6B/H6/P6/PEE;\"\n\n\"HC6L8L76HCJ/6IP6/1B5/3B5EM/7P1/6IP6^\"/D57LM/AP5E;/\"HDPJHCL/KB8/P/DBDLC6/P/CL3/JLCL8P6HBC/BK/AEP6KB8D7/PCM/K8PDL3B8F7/6IP6/IP4L/L4BE4LM/OL1BCM/6IL/B56DBMLM/NBC768PHC67/6IP6/DPCMP6LM/6IL/MBHCJ/BK/6IHCJ7^/6IL/IP4HCJ/BK/ABHC67;\"\n\n6IL/N8B3M/BK/HCM57681/61AL7/LDH66LM/P/8LE5N6PC6/O56/NELP8E1/P5MHOEL/JP7A;\n\n\"HDPJHCL/3IBEL/CL3/4BNPO5EP81/BK/O5003B8M7/6B/3IHA/B56/P6/DLL6HCJ7/6B/HDA8L77/ALBAEL/3IB/B5JI6/6B/FCB3/OL66L8;/6IP6^/HC/P/C567ILEE^/H7/73P6NIH61#\"\n\nP6/6IH7/ABHC6/HC/IH7/A8L7LC6P6HBC^/6IL/IB6LE\'7/7LN58H61/6LPD/7588B5CMLM/6IL/NIP8H7DP6HN/73P6NIH61/NLB/PCM/NP88HLM/IHD/B56/6B/6IL/AP8FHCJ/EB6;\n\n\"6IL/8L4BE56HBC^\"/IL/N8HLM^/\"3HEE/OL/73P6NIHKHLM#\"}');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `notification_user` int(11) NOT NULL,
  `notification_label` varchar(256) NOT NULL,
  `notification_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `notification_user`, `notification_label`, `notification_date`) VALUES
(1, 1, 'user favrorited your swatch ___BEGINCOLOR___009b5e___ENDCOLOR___.', '2015-05-26 09:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `pals`
--

CREATE TABLE `pals` (
  `pal_id` int(11) NOT NULL,
  `pal_user_me` int(11) NOT NULL,
  `pal_user_you` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pals`
--

INSERT INTO `pals` (`pal_id`, `pal_user_me`, `pal_user_you`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `swatches`
--

CREATE TABLE `swatches` (
  `swatch_id` int(11) NOT NULL,
  `swatch_user` int(11) NOT NULL,
  `swatch_color` varchar(6) NOT NULL,
  `swatch_audience` tinyint(4) NOT NULL DEFAULT '0',
  `swatch_date` datetime NOT NULL,
  `swatch_num_faves` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `swatches`
--

INSERT INTO `swatches` (`swatch_id`, `swatch_user`, `swatch_color`, `swatch_audience`, `swatch_date`, `swatch_num_faves`) VALUES
(1, 1, 'd14b98', 0, '2015-05-19 18:54:31', 0),
(2, 2, '836ae5', 0, '2015-05-19 18:53:48', 0),
(3, 1, 'b1e15a', 0, '2015-05-19 18:52:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_stats_swatches` int(11) NOT NULL DEFAULT '0',
  `user_stats_favs` int(11) NOT NULL DEFAULT '0',
  `user_stats_msgs` int(11) NOT NULL DEFAULT '0',
  `user_stats_avg_color` varchar(7) NOT NULL DEFAULT '999999',
  `user_email` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL DEFAULT '0',
  `user_role` int(11) NOT NULL DEFAULT '0',
  `user_password` varchar(1024) NOT NULL,
  `user_profile` varchar(1024) NOT NULL,
  `user_date_joined` datetime NOT NULL,
  `user_timezone` int(11) NOT NULL,
  `user_language` varchar(64) NOT NULL DEFAULT 'eng_us',
  `user_last_read_message` int(11) NOT NULL,
  `user_last_read_notification` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_stats_swatches`, `user_stats_favs`, `user_stats_msgs`, `user_stats_avg_color`, `user_email`, `user_name`, `user_level`, `user_role`, `user_password`, `user_profile`, `user_date_joined`, `user_timezone`, `user_language`, `user_last_read_message`, `user_last_read_notification`) VALUES
(1, 1, 68, 3, '182A746', 'test@gmail.com', 'test.user', 9, 999, 'INSERT_ENCRYPTED_PASSWORD_HERE', 'ffffff,000000,000000,ffffff', '2015-04-29 14:00:05', -5, 'eng_us', 2102, 1074),
(2, 1, 24, 7, 'F44450', 'test@email.com', 'user2', 3, 1, 'INSERT_ENCRYPTED_PASSWORD_HERE', 'ff0000,00ff00,0000ff,ff00ff', '2015-04-30 18:26:30', -5, 'eng_us', 96, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`fav_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `pals`
--
ALTER TABLE `pals`
  ADD PRIMARY KEY (`pal_id`);

--
-- Indexes for table `swatches`
--
ALTER TABLE `swatches`
  ADD PRIMARY KEY (`swatch_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `fav_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pals`
--
ALTER TABLE `pals`
  MODIFY `pal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `swatches`
--
ALTER TABLE `swatches`
  MODIFY `swatch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
