-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Mer 05 Juillet 2017 à 21:19
-- Version du serveur :  5.5.55-0+deb8u1
-- Version de PHP :  7.0.19-1~dotdeb+8.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `commercial`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `ref` varchar(250) NOT NULL,
  `name` varchar(500) NOT NULL,
  `smallDesc` varchar(500) NOT NULL,
  `about` varchar(2500) NOT NULL,
  `image` varchar(500) NOT NULL,
  `categorie` int(11) NOT NULL,
  `tags` varchar(500) NOT NULL,
  `prix` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `ref`, `name`, `smallDesc`, `about`, `image`, `categorie`, `tags`, `prix`) VALUES
(1, '', 'Article 1', 'smallDesc article 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 100),
(2, '', 'Article 2', 'smallDesc article 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 10),
(3, '', 'Article 3', 'smallDesc article 3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 30),
(4, '', 'Article 4', 'smallDesc article 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 100),
(5, '', 'Article 5', 'smallDesc article 5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 79),
(6, '', 'Article 6', 'smallDesc article 6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 500),
(7, '', 'Article 7', 'smallDesc article 7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 40),
(8, '', 'Article 8', 'smallDesc article 8', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 85),
(9, '', 'Article 9', 'smallDesc article 9', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 71),
(10, '', 'Article 10', 'smallDesc article 10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 97),
(11, '', 'Chose 1', 'smallDesc article 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempor, ex in ornare elementum, neque turpis laoreet neque, a tincidunt est leo pellentesque arcu. Vivamus sollicitudin arcu sit amet ligula sodales sagittis sit amet a velit. Praesent luctus faucibus nunc, tempor convallis arcu accumsan viverra. Aenean vel cursus sapien, ac blandit neque. Quisque in mi placerat, dapibus leo et, pretium nunc. Sed sagittis orci arcu, quis accumsan leo placerat ut. Suspendisse potenti. Sed pharetra mi augue. Aenean commodo risus non risus suscipit sodales. Nam id risus malesuada, rutrum mauris eget, maximus nunc. Pellentesque tincidunt accumsan quam, eu dictum enim aliquet in. Duis pellentesque lacus quis sem tempus ornare. Donec tempus massa vitae nunc lobortis viverra. Donec ut quam accumsan, iaculis velit sed, elementum quam.\\r\\n\\r\\nIn rhoncus sit amet sapien nec luctus. Aenean sit amet augue vitae urna pellentesque laoreet sed in enim. Maecenas lacus enim, condimentum porttitor libero sed, sagittis tempor lacus. Phasellus facilisis metus vitae nisl volutpat, rhoncus gravida ipsum viverra. Suspendisse massa quam, tincidunt nec risus eget, posuere maximus magna. Aliquam in erat non mi ultrices pharetra id in magna. Quisque purus leo, consectetur ut aliquet eget, lacinia ut eros. Curabitur vestibulum consectetur enim. Vestibulum tempor finibus est sed tempus. Cras venenatis massa nec elit ullamcorper, semper facilisis purus eleifend. Donec auctor sodales purus, id accumsan dolor finibus vitae.\\r\\n\\r\\nPraesent sollicitudin nisl turpis, ac dignissim nibh dapibus non. Nam ultricies nulla ut tortor lobortis, vel rutrum metus feugiat. Cras vitae lorem elit. In elementum gravida sapien. Phasellus at gravida dolor. In sollicitudin in sem id finibus. Mauris in cursus ex. Duis ac lacus vitae nisl sollicitudin vestibulum. Aliquam sodales facilisis ligula sit amet blandit. Pellentesque bibendum finibus massa ut gravida. Fusce ac ligula hendrerit, dictum elit ac, fringilla risus. Suspendisse imperdiet scelerisque magna, sit amet sagittis nunc. Nullam sagittis, quam in ultrices fermentum, orci sapien facilisis nunc, vel fringilla massa nibh eu magna. Integer lobortis sed nisi nec vulputate.\\r\\n\\r\\nCurabitur vitae nunc nulla. Donec sodales non lorem ac vestibulum. Vestibulum id placerat massa, sed auctor ipsum. Suspendisse potenti. Quisque diam dui, imperdiet eget est a, lobortis ornare quam. Vivamus non ex egestas, hendrerit nunc ac, placerat sem. Nullam at quam orci.\\r\\n\\r\\nPe', '', 1, 'test', 100);

-- --------------------------------------------------------

--
-- Structure de la table `article_details`
--

CREATE TABLE `article_details` (
  `ID_Article` int(11) NOT NULL,
  `W` int(11) DEFAULT NULL,
  `K` int(11) DEFAULT NULL,
  `Lm` int(11) DEFAULT NULL,
  `LmW` double DEFAULT NULL,
  `F` int(11) DEFAULT NULL,
  `V` int(11) DEFAULT NULL,
  `IRC` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `Longueur` int(11) DEFAULT NULL,
  `Largeur` int(11) DEFAULT NULL,
  `Profondeur` int(11) DEFAULT NULL,
  `Poids` double DEFAULT NULL,
  `Min` int(11) DEFAULT NULL,
  `Max` int(11) DEFAULT NULL,
  `DEEE` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `name`) VALUES
(1, 'F01'),
(2, 'F02'),
(3, 'F03'),
(4, 'F04'),
(5, 'F05'),
(6, 'F06'),
(7, 'F07'),
(8, 'F08'),
(9, 'F09'),
(10, 'F10'),
(11, 'F11'),
(12, 'F12'),
(13, 'F13'),
(14, 'F32'),
(15, 'F14'),
(16, 'F15'),
(17, 'F16'),
(18, 'F17'),
(19, 'F18'),
(20, 'F19'),
(21, 'F20'),
(22, 'F21'),
(23, 'F22'),
(24, 'F23'),
(25, 'F24'),
(26, 'F26'),
(27, 'F27'),
(28, 'F28'),
(29, 'F29'),
(30, 'F30'),
(31, 'F31');

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

CREATE TABLE `devis` (
  `ID` int(11) NOT NULL,
  `ID_User` int(11) NOT NULL,
  `Societe` varchar(500) NOT NULL,
  `Date_Creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Facture` tinyint(1) NOT NULL DEFAULT '0',
  `Date_Facture` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Date_Validity` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Siret` varchar(500) NOT NULL,
  `Tel` varchar(250) NOT NULL,
  `Fax` varchar(250) NOT NULL,
  `Email` varchar(500) NOT NULL,
  `Adresse` varchar(5000) NOT NULL,
  `CP` varchar(250) NOT NULL,
  `Ville` varchar(500) NOT NULL,
  `Nom` varchar(500) NOT NULL,
  `Prenom` varchar(500) NOT NULL,
  `Prix` double NOT NULL,
  `Reduction` double NOT NULL,
  `Prix_final` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `devis`
--

INSERT INTO `devis` (`ID`, `ID_User`, `Societe`, `Date_Creation`, `Facture`, `Date_Facture`, `Date_Validity`, `Siret`, `Tel`, `Fax`, `Email`, `Adresse`, `CP`, `Ville`, `Nom`, `Prenom`, `Prix`, `Reduction`, `Prix_final`) VALUES
(1, 1, 'test', '2017-06-14 09:06:05', 0, '0000-00-00 00:00:00', '2017-09-12 09:06:05', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(2, 1, 'test', '2017-06-14 09:06:10', 0, '0000-00-00 00:00:00', '2017-09-12 09:06:10', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(3, 1, 'test', '2017-06-14 09:07:17', 0, '0000-00-00 00:00:00', '2017-09-12 09:07:17', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(4, 1, 'test', '2017-06-14 09:10:29', 0, '0000-00-00 00:00:00', '2017-09-12 09:10:29', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(5, 1, 'test', '2017-06-14 09:10:52', 0, '0000-00-00 00:00:00', '2017-09-12 09:10:52', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(6, 1, 'test', '2017-06-14 09:12:14', 0, '0000-00-00 00:00:00', '2017-09-12 09:12:14', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(7, 1, 'test', '2017-06-14 09:12:49', 0, '0000-00-00 00:00:00', '2017-09-12 09:12:49', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(8, 1, 'test', '2017-06-14 09:28:31', 0, '0000-00-00 00:00:00', '2017-09-12 09:28:31', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 130, 13, 117),
(9, 1, 'YRDY', '2017-06-14 09:34:42', 0, '0000-00-00 00:00:00', '2017-09-12 09:34:42', 'RYYREH', '0102030405', '0102030405', 'test@test.com', 'FRFR', '95270', 'seugy', 'test', 'test', 130, 13, 117),
(10, 1, 'YRDY', '2017-06-14 15:33:28', 0, '0000-00-00 00:00:00', '2017-09-12 15:33:28', 'cddccdc', '0102030405', '102030405', 'test@test.com', 'FRFR', '95270', 'seugy', 'test', 'test', 130, 383, 3447),
(11, 1, 'YRDY', '2017-06-14 15:44:21', 0, '0000-00-00 00:00:00', '2017-09-12 15:44:21', 'dedede', '0102030405', '102030405', 'test@test.com', 'FRFR', '95270', 'seugy', 'test', 'test', 3830, 383, 3447),
(12, 1, 'test', '2017-06-15 15:14:11', 0, '0000-00-00 00:00:00', '2017-09-13 15:14:11', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 3830, 383, 3447),
(13, 1, 'test', '2017-06-15 15:19:54', 0, '0000-00-00 00:00:00', '2017-09-13 15:19:54', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 3930, 393, 3537),
(14, 1, 'test', '2017-06-15 18:41:26', 0, '0000-00-00 00:00:00', '2017-09-13 18:41:26', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 4130, 413, 3717),
(15, 3, 'SGDBF', '2017-06-19 14:57:15', 0, '0000-00-00 00:00:00', '2017-09-17 14:57:15', '', '0658888995', '', 'pierre.mehu@saint-gobain.com', '23 Rue des Ardennes', '75019', 'Paris', 'Mehu', 'Pierre', 3044, 304.4, 2739.6),
(19, 3, 'ESGI', '2017-06-22 09:09:16', 0, '0000-00-00 00:00:00', '2017-09-20 09:09:16', 'Reseau-GES', '0140863647', '0137463829', 'ecolesgi@educ.fr', '242 Rue du Faubourg Saint-Antoine', '75012', 'Paris', 'Dupont', 'Jean', 1076, 0, 1076),
(20, 4, 'Societe de test', '2017-06-22 09:54:51', 0, '0000-00-00 00:00:00', '2017-09-20 09:54:51', '', '0130354877', '130354877', 'test@test.com', '50 rue henri farman', '93290', 'Tremblay en france', 'Machin', 'Jean', 1120, 1108.8, 11.2),
(21, 4, 'Societe de test', '2017-06-22 09:55:17', 0, '0000-00-00 00:00:00', '2017-09-20 09:55:17', '', '0130354877', '130354877', 'test@test.com', '50 rue henri farman', '93290', 'Tremblay en france', 'Machin', 'Jean', 1120, 1108.8, 11.2),
(23, 4, '1994', '2017-06-30 20:27:36', 0, '0000-00-00 00:00:00', '2017-09-28 20:27:36', '', '0679251965', '679251965', 'robinpauquet@gmail.com', '12 Hemenway St, 46', '02115', 'Boston', 'Pauquet', 'Robin', 12445, 12320.55, 124.45),
(24, 4, 'test', '2017-07-01 04:19:11', 0, '0000-00-00 00:00:00', '2017-09-29 04:19:11', '', '0102030405', '', 'test@test.com', '1 rue du test', '95270', 'seugy', 'mo', 'moi', 2205, 2182.95, 22.05),
(25, 4, 'test', '2017-07-01 04:21:26', 0, '0000-00-00 00:00:00', '2017-09-29 04:21:26', '', '', '', 'test@test.com', '', '', '', 'test', 'test', 2205, 2182.95, 22.05),
(26, 4, '1994', '2017-07-03 14:01:20', 0, '0000-00-00 00:00:00', '2017-10-01 14:01:20', '', '0679251965', '679251965', 'robinpauquet@gmail.com', '12 Hemenway St, 46', '02115', 'Boston', 'Pauquet', 'Robin', 2305, 2305, 0),
(27, 4, 'Societe de test', '2017-07-03 14:03:59', 0, '0000-00-00 00:00:00', '2017-10-01 14:03:59', '', '0130354877', '130354877', 'test@test.com', '50 rue henri farman', '93290', 'Tremblay en france', 'Machin', 'Jean', 2305, 2305, 0),
(28, 4, 'WebApp', '2017-07-03 22:22:40', 0, '0000-00-00 00:00:00', '2017-10-01 22:22:40', '', '0102030405', '', 'test@tecknologiks.com', '1 rue de l\'ESGI', '75012', 'Paris', 'MEHU', 'Pierre', 12205, 1220.5, 10984.5);

-- --------------------------------------------------------

--
-- Structure de la table `devis_article`
--

CREATE TABLE `devis_article` (
  `ID` int(11) NOT NULL,
  `ID_Devis` int(11) NOT NULL,
  `ID_Article` int(11) NOT NULL,
  `Qte` int(11) NOT NULL,
  `Prix` double NOT NULL,
  `Reduction` double NOT NULL,
  `Prix_final` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `devis_article`
--

INSERT INTO `devis_article` (`ID`, `ID_Devis`, `ID_Article`, `Qte`, `Prix`, `Reduction`, `Prix_final`) VALUES
(1, 6, 1, 38, 100, 10, 90),
(2, 6, 3, 1, 30, 3, 27),
(3, 7, 1, 38, 100, 10, 90),
(4, 7, 3, 1, 30, 3, 27),
(5, 8, 1, 38, 100, 10, 90),
(6, 8, 3, 1, 30, 3, 27),
(7, 9, 1, 38, 100, 10, 90),
(8, 9, 3, 1, 30, 3, 27),
(9, 10, 1, 38, 100, 380, 3420),
(10, 10, 3, 1, 30, 3, 27),
(11, 11, 1, 38, 100, 380, 3420),
(12, 11, 3, 1, 30, 3, 27),
(13, 12, 1, 38, 100, 380, 3420),
(14, 12, 3, 1, 30, 3, 27),
(15, 13, 1, 39, 100, 390, 3510),
(16, 13, 3, 1, 30, 3, 27),
(17, 14, 1, 41, 100, 410, 3690),
(18, 14, 3, 1, 30, 3, 27),
(19, 15, 1, 1, 100, 10, 90),
(20, 15, 2, 1, 10, 1, 9),
(21, 15, 3, 1, 30, 3, 27),
(22, 15, 4, 1, 100, 10, 90),
(23, 15, 5, 23, 79, 181.7, 1635.3),
(24, 15, 6, 1, 500, 50, 450),
(25, 15, 7, 1, 40, 4, 36),
(26, 15, 8, 1, 85, 8.5, 76.5),
(27, 15, 9, 1, 71, 7.1, 63.9),
(28, 15, 10, 3, 97, 29.1, 261.9),
(29, 16, 1, 1, 100, 0, 100),
(30, 16, 4, 1, 100, 0, 100),
(31, 17, 1, 2, 100, 0, 200),
(32, 17, 2, 4, 10, 0, 40),
(33, 17, 3, 2, 30, 0, 60),
(34, 17, 4, 1, 100, 0, 100),
(35, 17, 5, 1, 79, 0, 79),
(36, 17, 6, 1, 500, 0, 500),
(37, 17, 10, 1, 97, 0, 97),
(38, 18, 1, 2, 100, 0, 200),
(39, 18, 2, 4, 10, 0, 40),
(40, 18, 3, 2, 30, 0, 60),
(41, 18, 4, 1, 100, 0, 100),
(42, 18, 5, 1, 79, 0, 79),
(43, 18, 6, 1, 500, 0, 500),
(44, 18, 10, 1, 97, 0, 97),
(45, 19, 1, 2, 100, 0, 200),
(46, 19, 2, 4, 10, 0, 40),
(47, 19, 3, 2, 30, 0, 60),
(48, 19, 4, 1, 100, 0, 100),
(49, 19, 5, 1, 79, 0, 79),
(50, 19, 6, 1, 500, 0, 500),
(51, 19, 10, 1, 97, 0, 97),
(52, 20, 2, 102, 10, 1009.8, 10.2),
(53, 20, 4, 1, 100, 99, 1),
(54, 21, 2, 102, 10, 1009.8, 10.2),
(55, 21, 4, 1, 100, 99, 1),
(56, 23, 1, 11, 100, 1089, 11),
(57, 23, 2, 106, 10, 1049.4, 10.6),
(58, 23, 4, 1, 100, 99, 1),
(59, 23, 8, 1, 85, 84.15, 0.84999999999999),
(60, 23, 11, 101, 100, 9999, 101),
(61, 24, 2, 10, 10, 99, 1),
(62, 24, 4, 10, 100, 990, 10),
(63, 24, 8, 13, 85, 1093.95, 11.05),
(64, 25, 2, 10, 10, 99, 1),
(65, 25, 4, 10, 100, 990, 10),
(66, 25, 8, 13, 85, 1093.95, 11.05),
(67, 26, 1, 1, 100, 100, 0),
(68, 26, 2, 10, 10, 100, 0),
(69, 26, 4, 10, 100, 1000, 0),
(70, 26, 8, 13, 85, 1105, 0),
(71, 27, 1, 1, 100, 100, 0),
(72, 27, 2, 10, 10, 100, 0),
(73, 27, 4, 10, 100, 1000, 0),
(74, 27, 8, 13, 85, 1105, 0),
(75, 28, 4, 10, 100, 100, 900),
(76, 28, 8, 13, 85, 110.5, 994.5),
(77, 28, 11, 101, 100, 1010, 9090);

-- --------------------------------------------------------

--
-- Structure de la table `devis_promo`
--

CREATE TABLE `devis_promo` (
  `ID` int(11) NOT NULL,
  `ID_Devis` int(11) NOT NULL,
  `ID_Promo` double NOT NULL,
  `Reduction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `devis_promo`
--

INSERT INTO `devis_promo` (`ID`, `ID_Devis`, `ID_Promo`, `Reduction`) VALUES
(1, 3, 1, 13),
(2, 4, 1, 13),
(3, 5, 1, 13),
(4, 6, 1, 13),
(5, 7, 1, 13),
(6, 8, 1, 13),
(7, 9, 1, 13),
(8, 10, 1, 383),
(9, 11, 1, 383),
(10, 12, 1, 383),
(11, 13, 1, 393),
(12, 14, 1, 413),
(13, 15, 11, 304),
(14, 20, 27, 1109),
(15, 21, 27, 1109),
(16, 22, 33, 0),
(17, 23, 27, 12321),
(18, 24, 36, 2183),
(19, 25, 36, 2183),
(20, 26, 39, 2305),
(21, 27, 25, 2305),
(22, 28, 1, 1221);

-- --------------------------------------------------------

--
-- Structure de la table `panier_article`
--

CREATE TABLE `panier_article` (
  `ID` int(11) NOT NULL,
  `ID_User` int(11) NOT NULL,
  `ID_Article` int(11) NOT NULL,
  `Qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `panier_article`
--

INSERT INTO `panier_article` (`ID`, `ID_User`, `ID_Article`, `Qte`) VALUES
(81, 1, 1, 9),
(82, 1, 2, 23),
(83, 1, 3, 1),
(84, 1, 4, 1),
(107, 4, 4, 10),
(136, 1, 10, 151),
(189, 4, 8, 13),
(211, 3, 1, 4),
(213, 4, 11, 101);

-- --------------------------------------------------------

--
-- Structure de la table `panier_promo`
--

CREATE TABLE `panier_promo` (
  `ID` int(11) NOT NULL,
  `ID_User` int(11) NOT NULL,
  `ID_Promo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `panier_promo`
--

INSERT INTO `panier_promo` (`ID`, `ID_User`, `ID_Promo`) VALUES
(38, 3, 26),
(40, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `promocode`
--

CREATE TABLE `promocode` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(500) NOT NULL,
  `Code` varchar(50) NOT NULL,
  `Reduction` int(11) NOT NULL,
  `Minimum` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Catégorie` int(11) NOT NULL DEFAULT '0',
  `Validity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `promocode`
--

INSERT INTO `promocode` (`ID`, `Nom`, `Code`, `Reduction`, `Minimum`, `Type`, `Catégorie`, `Validity`) VALUES
(1, '10% sur tout des 10€', 'COM10', 10, 10, 1, 0, '2018-06-07 13:54:39'),
(2, '30% sur tout des 10€', 'COM30', 30, 10, 1, 0, '2018-06-07 13:54:39'),
(25, 'Remboursement', 'SPE_Remb', 100, 1, 1, 0, '2017-07-16 12:51:20');

-- --------------------------------------------------------

--
-- Structure de la table `remise_et_commission`
--

CREATE TABLE `remise_et_commission` (
  `ID` int(11) NOT NULL,
  `Commission` int(11) NOT NULL,
  `RemiseMin` int(11) NOT NULL,
  `RemiseMax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `remise_et_commission`
--

INSERT INTO `remise_et_commission` (`ID`, `Commission`, `RemiseMin`, `RemiseMax`) VALUES
(1, 15, 0, 10),
(2, 13, 10, 20),
(3, 11, 20, 25),
(4, 10, 25, 30),
(5, 9, 30, 35),
(6, 8, 35, 40),
(7, 7, 40, 50),
(8, 5, 50, 100);

-- --------------------------------------------------------

--
-- Structure de la table `TABLE 12`
--

CREATE TABLE `TABLE 12` (
  `Code Fam` varchar(3) DEFAULT NULL,
  `REFERENCE` varchar(17) DEFAULT NULL,
  `LIBELLE court` varchar(85) DEFAULT NULL,
  `LIBELLE long` varchar(66) DEFAULT NULL,
  `PUISSANCE (W)` varchar(4) DEFAULT NULL,
  `TEMPERATURE (K)` varchar(4) DEFAULT NULL,
  `LUMINOSITE (Lm)` varchar(6) DEFAULT NULL,
  `RATIO (Lm/W)` varchar(3) DEFAULT NULL,
  `FAISCEAU (-°)` varchar(5) DEFAULT NULL,
  `TENSION (V)` varchar(3) DEFAULT NULL,
  `IRC` varchar(3) DEFAULT NULL,
  `DUREE DE VIE (H)` varchar(5) DEFAULT NULL,
  `Longueur` varchar(4) DEFAULT NULL,
  `Largeur` varchar(4) DEFAULT NULL,
  `Profondeur` varchar(4) DEFAULT NULL,
  `Poids (g)` varchar(8) DEFAULT NULL,
  `Minimum` varchar(7) DEFAULT NULL,
  `Maximum` varchar(3) DEFAULT NULL,
  `PV UNITAIRE (HT)` varchar(7) DEFAULT NULL,
  `DEEE (HT) INCLUSE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `TABLE 12`
--

INSERT INTO `TABLE 12` (`Code Fam`, `REFERENCE`, `LIBELLE court`, `LIBELLE long`, `PUISSANCE (W)`, `TEMPERATURE (K)`, `LUMINOSITE (Lm)`, `RATIO (Lm/W)`, `FAISCEAU (-°)`, `TENSION (V)`, `IRC`, `DUREE DE VIE (H)`, `Longueur`, `Largeur`, `Profondeur`, `Poids (g)`, `Minimum`, `Maximum`, `PV UNITAIRE (HT)`, `DEEE (HT) INCLUSE`) VALUES
('F01', 'LED-01-18-3-004', 'Panel light 300x300mm 18W - 3000K', 'Panel light 300x300mm 18W - 3000K', '18', '3000', '1500', '', '120', '240', '80', '30000', '295', '295', '9', '1,08', '-22', '45', '61,8', 'R?cylum 0.'),
('F01', 'LED-01-18-4-005', 'Panel light 300x300mm 18W - 4000K', 'Panel light 300x300mm 18W - 4000K', '18', '4000', '1500', '', '120', '240', '80', '30000', '295', '295', '9', '1,08', '-22', '45', '61,8', 'R?cylum 0.'),
('F01', 'LED-01-18-6-006', 'Panel light 300x300mm 18W - 6000K', 'Panel light 300x300mm 18W - 6000K', '18', '6000', '1500', '', '120', '240', '80', '30000', '295', '295', '9', '1,08', '-22', '45', '61,8', 'R?cylum 0.'),
('F01', 'LED-01-40-3-001', 'Panel light 1200x300mm 40W 3000K', 'Panel light 1200x300mm 40W 3000K', '40', '3000', '3702', '', '120', '240', '74', '30000', '1195', '295', '9', '4,6', '-20', '45', '107,6', 'R?cylum 0.'),
('F01', 'LED-01-40-3-007', 'Panel light 600x600mm 40W - 3000K', 'Panel light 600x600mm 40W - 3000K', '40', '3000', '3192', '', '120', '240', '87', '30000', '595', '595', '9', '2,66', '-22', '45', '68', 'R?cylum 0.'),
('F01', 'LED-01-40-35-007', 'Panel light 600x600mm 40W - 3500K', 'Panel light 600x600mm 40W - 3500K', '40', '3500', '3192', '', '120', '240', '87', '30000', '595', '595', '9', '2,66', '-22', '45', '68', 'R?cylum 0.'),
('F01', 'LED-01-40-4-002', 'Panel light 1200x300mm 40W 4000K', 'Panel light 1200x300mm 40W 4000K', '40', '4000', '3702', '', '120', '240', '74', '30000', '1195', '295', '9', '4,6', '-20', '45', '107,6', 'R?cylum 0.'),
('F01', 'LED-01-40-4-008', 'Panel light 600x600mm 40W - 4000K', 'Panel light 600x600mm 40W - 4000K', '40', '4000', '3192', '', '120', '240', '87', '30000', '595', '595', '9', '2,66', '-22', '45', '68', 'R?cylum 0.'),
('F01', 'LED-01-40-6-009', 'Panel light 600x600mm 40W - 6000K', 'Panel light 600x600mm 40W - 6000K', '40', '6000', '3192', '', '120', '240', '87', '30000', '595', '595', '9', '2,66', '-22', '45', '68', 'R?cylum 0.'),
('F01', 'LED-01-72-4-003', 'Panel light 1200x600mm 72W 4000K', 'Panel light 1200x600mm 72W 4000K', '72', '4000', '5698', '', '120', '240', '87', '30000', '1195', '595', '9', '6', '-20', '45', '147,6', 'R?cylum 0.'),
('F01', 'LED-01-72-6-003', 'Panel light 1200x600mm 72W 6000K', 'Panel light 1200x600mm 72W 6000K', '72', '6000', '5698', '', '120', '240', '87', '30000', '1195', '595', '9', '6', '-20', '45', '147,6', 'R?cylum 0.'),
('F02', 'LED-02-12-3-023', 'Downlight slim rond ?170mm 12W 3000K', 'Downlight slim rond ?170mm 12W 3000K', '12', '3000', '960', '', '120', '240', '80', '30000', '174', '174', '20', '0,32', '-22', '45', '18,64', 'R?cylum 0.'),
('F02', 'LED-02-12-4-024', 'Downlight slim rond ?170mm 12W 4000K', 'Downlight slim rond ?170mm 12W 4000K', '12', '4000', '960', '', '120', '240', '80', '30000', '174', '174', '20', '0,32', '-22', '45', '18,64', 'R?cylum 0.'),
('F02', 'LED-02-12-6-025', 'Downlight slim rond ?170mm 12W 6000K', 'Downlight slim rond ?170mm 12W 6000K', '12', '6000', '960', '', '120', '240', '80', '30000', '174', '174', '20', '0,32', '-22', '45', '18,64', 'R?cylum 0.'),
('F02', 'LED-02-18-3-026', 'Downlight slim rond ?225mm 18W 3000K', 'Downlight slim rond ?225mm 18W 3000K', '18', '3000', '1400', '', '120', '240', 'N/A', '30000', '225', '225', '20', '0,38', '-22', '45', '21,6', 'R?cylum 0.'),
('F02', 'LED-02-18-4-027', 'Downlight slim rond ?225mm 18W 4000K', 'Downlight slim rond ?225mm 18W 4000K', '18', '4000', '1400', '', '120', '240', 'N/A', '30000', '225', '225', '20', '0,38', '-22', '45', '21,6', 'R?cylum 0.'),
('F02', 'LED-02-18-6-028', 'Downlight slim rond ?225mm 18W 6000K', 'Downlight slim rond ?225mm 18W 6000K', '18', '6000', '1400', '', '120', '240', 'N/A', '30000', '225', '225', '20', '0,38', '-22', '45', '21,6', 'R?cylum 0.'),
('F02', 'LED-02-20-3-014', 'Downlight slim carr? 240x240mm 20W 3000K', 'Downlight slim carr? 240x240mm 20W 3000K', '20', '3000', '1600', '', '120', '240', '80', '30000', '240', '240', '20', '0,62', '-22', '45', '31', 'R?cylum 0.'),
('F02', 'LED-02-20-3-029', 'Downlight slim rond ?240mm 20W 3000K', 'Downlight slim rond ?240mm 20W 3000K', '20', '3000', '1530', '', '120', '240', '80', '30000', '240', '240', '20', '0,58', '-20', '45', '32', 'R?cylum 0.'),
('F02', 'LED-02-20-4-015', 'Downlight slim carr? 240x240mm 20W 4000K', 'Downlight slim carr? 240x240mm 20W 4000K', '20', '4000', '1600', '', '120', '240', '80', '30000', '240', '240', '20', '0,62', '-22', '45', '31', 'R?cylum 0.'),
('F02', 'LED-02-20-4-030', 'Downlight slim rond ?240mm 20W 4000K', 'Downlight slim rond ?240mm 20W 4000K', '20', '4000', '1530', '', '120', '240', '80', '30000', '240', '240', '20', '0,58', '-20', '45', '32', 'R?cylum 0.'),
('F02', 'LED-02-20-6-016', 'Downlight slim carr? 240x240mm 20W 6000K', 'Downlight slim carr? 240x240mm 20W 6000K', '20', '6000', '1600', '', '120', '240', '80', '30000', '240', '240', '20', '0,62', '-22', '45', '31', 'R?cylum 0.'),
('F02', 'LED-02-20-6-031', 'Downlight slim rond ?240mm 20W 6000K', 'Downlight slim rond ?240mm 20W 6000K', '20', '6000', '1530', '', '120', '240', '80', '30000', '240', '240', '20', '0,58', '-20', '45', '32', 'R?cylum 0.'),
('F02', 'LED-02-24-3-032', 'Downlight slim rond ?300mm 24W 3000K', 'Downlight slim rond ?300mm 24W 3000K', '24', '3000', '2000', '', '120', '240', '80', '30000', '300', '300', '20', '0,72', '-22', '45', '35,4', 'R?cylum 0.'),
('F02', 'LED-02-24-4-033', 'Downlight slim rond ?300mm 24W 4000K', 'Downlight slim rond ?300mm 24W 4000K', '24', '4000', '2000', '', '120', '240', '80', '30000', '300', '300', '20', '0,72', '-22', '45', '35,4', 'R?cylum 0.'),
('F02', 'LED-02-24-6-034', 'Downlight slim rond ?300mm 24W 6000K', 'Downlight slim rond ?300mm 24W 6000K', '24', '6000', '2000', '', '120', '240', '80', '30000', '300', '300', '20', '0,72', '-22', '45', '35,4', 'R?cylum 0.'),
('F02', 'LED-02-6-3-017', 'Downlight slim rond ?120mm 6W 3000K', 'Downlight slim rond ?120mm 6W 3000K', '6', '3000', '426', '', '120', '240', '80', '30000', '120', '120', '20', '0,22', '-20', '45', '14,72', 'R?cylum 0.'),
('F02', 'LED-02-6-4-018', 'Downlight slim rond ?120mm 6W 4000K', 'Downlight slim rond ?120mm 6W 4000K', '6', '4000', '426', '', '120', '240', '80', '30000', '120', '120', '20', '0,22', '-20', '45', '14,72', 'R?cylum 0.'),
('F02', 'LED-02-6-6-019', 'Downlight slim rond ?120mm 6W 6000K', 'Downlight slim rond ?120mm 6W 6000K', '6', '6000', '426', '', '120', '240', '80', '30000', '120', '120', '20', '0,22', '-20', '45', '14,72', 'R?cylum 0.'),
('F02', 'LED-02-9-3-020', 'Downlight slim rond ?145mm 9W 3000K', 'Downlight slim rond ?145mm 9W 3000K', '9', '3000', '700', '', '120', '240', '80', '30000', '146', '146', '20', '0,28', '-22', '45', '17,68', 'R?cylum 0.'),
('F02', 'LED-02-9-4-021', 'Downlight slim rond ?145mm 9W 4000K', 'Downlight slim rond ?145mm 9W 4000K', '9', '4000', '700', '', '120', '240', '80', '30000', '146', '146', '20', '0,28', '-22', '45', '17,68', 'R?cylum 0.'),
('F02', 'LED-02-9-6-022', 'Downlight slim rond ?145mm 9W 6000K', 'Downlight slim rond ?145mm 9W 6000K', '9', '6000', '700', '', '120', '240', '80', '30000', '146', '146', '20', '0,28', '-22', '45', '17,68', 'R?cylum 0.'),
('F03', 'LED-03-5-3-035', 'GU 5.3 5W 3000K non dimmable', 'GU 5.3 5W 3000K non dimmable', '5', '3000', '300', '', '90', '240', 'N/A', '30000', '50', '50', '73', '0,04', '-20', '45', '12', 'R?cylum L'),
('F03', 'LED-03-5-4-036', 'GU 5.3 5W 4000K non dimmable', 'GU 5.3 5W 4000K non dimmable', '5', '4000', '300', '', '90', '240', 'N/A', '30000', '50', '50', '73', '0,04', '-20', '45', '12', 'R?cylum L'),
('F03', 'LED-03-7-3-038', 'GU 5.3 7.5W 3000K non dimmable', 'GU 5.3 7.5W 3000K non dimmable', '7,5', '3000', '380', '', '60', '240', 'N/A', '30000', '50', '50', '61', '0,06', '-20', '45', '16', 'R?cylum L'),
('F03', 'LED-03-7-4-037', 'GU 5.3 7.5W 4000K non dimmable', 'GU 5.3 7.5W 4000K non dimmable', '7,5', '4000', '380', '', '60', '240', 'N/A', '30000', '50', '50', '61', '0,06', '-20', '45', '16', 'R?cylum L'),
('F04', 'LED-04-5-3-039', 'GU 10 5W 3000K non dimmable', 'GU 10 5W 3000K non dimmable', '5', '3000', '450', '', '90', '240', '80', '30000', '50', '50', '60', '0,06', '-20', '45', '12', 'R?cylum L'),
('F04', 'LED-04-5-4-040', 'GU 10 5W 4000K non dimmable', 'GU 10 5W 4000K non dimmable', '5', '4000', '450', '', '90', '240', '80', '30000', '50', '50', '60', '0,06', '-20', '45', '12', 'R?cylum L'),
('F04', 'LED-04-7-3-041', 'GU 10 7W 3000K non dimmable', 'GU 10 7W 3000K non dimmable', '7', '3000', '600', '', '90', '240', '80', '30000', '50', '50', '87', '0,06', '-20', '45', '14', 'R?cylum L'),
('F04', 'LED-04-7-3-043', 'GU10 7.5W dimmable 3000K', 'GU10 7.5W dimmable 3000K', '7,5', '3000', '670', '', '90', '240', '80', '30000', '50', '50', '87', '0,065', '-20', '45', '19,8', 'R?cylum L'),
('F04', 'LED-04-7-4-042', 'GU 10 7W 4000K non dimmable', 'GU 10 7W 4000K non dimmable', '7', '4000', '600', '', '90', '240', '80', '30000', '50', '50', '87', '0,06', '-20', '45', '14', 'R?cylum L'),
('F04', 'LED-04-7-4-044', 'GU10 7.5W dimmable 4000K', 'GU10 7.5W dimmable 4000K', '7,5', '4000', '670', '', '90', '240', '80', '30000', '50', '50', '87', '0,065', '-20', '45', '19,8', 'R?cylum L'),
('F05', 'LED-05-10-3-047', 'Ampoule E27 CORN 10W 3000K', 'Ampoule E27 CORN 10W 3000K', '10', '3000', '900', '', '360', '240', '75', '30000', '50', '50', '120', '0,02', '-22', '45', '29,84', 'R?cylum L'),
('F05', 'LED-05-10-6-048', 'Ampoule E27 CORN 10W 6000K', 'Ampoule E27 CORN 10W 6000K', '10', '6000', '900', '', '360', '240', '75', '30000', '50', '50', '120', '0,02', '-22', '45', '29,84', 'R?cylum L'),
('F05', 'LED-05-13-3-049', 'Ampoule E27 CORN 13W 3000K', 'Ampoule E27 CORN 13W 3000K', '13', '3000', '1170', '', '360', '240', '75', '30000', '60', '60', '145', '0,02', '-22', '45', '38,8', 'R?cylum L'),
('F05', 'LED-05-13-6-050', 'Ampoule E27 CORN 13W 6000K', 'Ampoule E27 CORN 13W 6000K', '13', '6000', '1170', '', '360', '240', '75', '30000', '60', '60', '145', '0,02', '-22', '45', '38,8', 'R?cylum L'),
('F05', 'LED-05-18-3-051', 'Ampoule E27 CORN 18W 3000K', 'Ampoule E27 CORN 18W 3000K', '18', '3000', '1620', '', '360', '240', '75', '30000', '72', '72', '145', '0,02', '-22', '45', '50,8', 'R?cylum L'),
('F05', 'LED-05-18-6-052', 'Ampoule E27 CORN 18W 6000K', 'Ampoule E27 CORN 18W 6000K', '18', '6000', '1620', '', '360', '240', '75', '30000', '72', '72', '145', '0,02', '-22', '45', '50,8', 'R?cylum L'),
('F05', 'LED-05-25-3-053', 'Ampoule E27 CORN 25W 3000K', 'Ampoule E27 CORN 25W 3000K', '25', '3000', '2250', '', '360', '240', '75', '30000', '63', '63', '203', '0,02', '-22', '45', '68,8', 'R?cylum L'),
('F05', 'LED-05-25-6-054', 'Ampoule E27 CORN 25W 6000K', 'Ampoule E27 CORN 25W 6000K', '25', '6000', '2250', '', '360', '240', '75', '30000', '63', '63', '203', '0,02', '-22', '45', '68,8', 'R?cylum L'),
('F05', 'LED-05-30-3-055', 'Ampoule E27 CORN 30W 3000K', 'Ampoule E27 CORN 30W 3000K', '30', '3000', '3300', '', '360', '240', '80', '30000', '75', '75', '201', '0,02', '-20', '45', '74,8', 'R?cylum L'),
('F05', 'LED-05-30-6-056', 'Ampoule E27 CORN 30W 6000K', 'Ampoule E27 CORN 30W 6000K', '30', '6000', '3300', '', '360', '240', '80', '30000', '75', '75', '201', '0,02', '-20', '45', '74,8', 'R?cylum L'),
('F05', 'LED-05-35-3-057', 'Ampoule E27 CORN 35W 3000K', 'Ampoule E27 CORN 35W 3000K', '35', '3000', '3300', '', '360', '240', 'N/A', '50000', '90', '90', '220', '0,02', '-20', '45', '104,68', 'R?cylum L'),
('F05', 'LED-05-35-6-058', 'Ampoule E27 CORN 35W 6000K', 'Ampoule E27 CORN 35W 6000K', '35', '6000', '3300', '', '360', '240', 'N/A', '50000', '90', '90', '220', '0,02', '-20', '45', '104,68', 'R?cylum L'),
('F05', 'LED-05-40-3-059', 'Ampoule E27 CORN 40W 3000K', 'Ampoule E27 CORN 40W 3000K', '40', '3000', '4000', '', '360', '240', 'N/A', '30000', '90', '90', '240', '0,02', '-20', '45', '116,64', 'R?cylum L'),
('F05', 'LED-05-40-6-060', 'Ampoule E27 CORN 40W 6000K', 'Ampoule E27 CORN 40W 6000K', '40', '6000', '4000', '', '360', '240', 'N/A', '30000', '90', '90', '240', '0,02', '-20', '45', '116,64', 'R?cylum L'),
('F05', 'LED-05-4-3-061', 'E14 G45 4W 3000K', 'E14 G45 4W 3000K', '5', '3000', '400', '', '180', '240', '80', '30000', '45', '45', '82', '0,06', '-22', '45', '8', 'R?cylum L'),
('F05', 'LED-05-4-4-062', 'E14 G45 4W 4000K', 'E14 G45 4W 4000K', '5', '4000', '400', '', '180', '240', '80', '30000', '45', '45', '82', '0,06', '-22', '45', '8', 'R?cylum L'),
('F05', 'LED-05-5-3-045', 'E14 C37 5W 3000K', 'E14 C37 5W 3000K', '5', '3000', '400', '', '180', '240', '80', '30000', '37', '37', '100', '0,04', '-20', '45', '8', 'R?cylum L'),
('F05', 'LED-05-5-4-046', 'E14 C37 5W 4000K', 'E14 C37 5W 4000K', '5', '4000', '400', '', '180', '240', '80', '30000', '37', '37', '100', '0,04', '-20', '45', '8', 'R?cylum L'),
('F06', 'LED-06-10-3-063', 'E27 A60 10W 3000K', 'E27 A60 10W 3000K', '10', '3000', '999', '', '180', '240', '80', '30000', '60', '60', '109', '0,08', '-22', '45', '10,5', 'R?cylum L'),
('F06', 'LED-06-10-3-071', 'E27 G95 10W 3000K', 'E27 G95 10W 3000K', '10', '3000', '830', '', '360', '240', '80', '30000', '95', '95', '135', '0,005', '-22', '45', '27,6', 'R?cylum L'),
('F06', 'LED-06-10-4-064', 'E27 A60 10W 4000K', 'E27 A60 10W 4000K', '10', '4000', '999', '', '180', '240', '80', '30000', '60', '60', '109', '0,08', '-22', '45', '10,5', 'R?cylum L'),
('F06', 'LED-06-10-4-072', 'E27 G95 10W 4000K', 'E27 G95 10W 4000K', '10', '4000', '830', '', '360', '240', '82', '30000', '95', '95', '135', '0,005', '-22', '45', '27,6', 'R?cylum L'),
('F06', 'LED-06-12-3-065', 'E27 A60 12W 3000K', 'E27 A60 12W 3000K', '12', '3000', '1129', '', '180', '240', '80', '30000', '60', '60', '109', '0,085', '-22', '45', '11,96', 'R?cylum L'),
('F06', 'LED-06-12-4-066', 'E27 A60 12W 4000K', 'E27 A60 12W 4000K', '12', '4000', '1129', '', '180', '240', '80', '30000', '60', '60', '109', '0,085', '-22', '45', '11,96', 'R?cylum L'),
('F06', 'LED-06-4-3-069', 'E27 G45 5W 3000K', 'E27 G45 5W 3000K', '5', '3000', '400', '', '180', '240', '80', '30000', '45', '45', '84', '0,04', '-22', '45', '8', 'R?cylum L'),
('F06', 'LED-06-4-4-070', 'E27 G45 5W 4000K', 'E27 G45 5W 4000K', '5', '4000', '400', '', '180', '240', '80', '30000', '45', '45', '84', '0,04', '-22', '45', '8', 'R?cylum L'),
('F06', 'LED-06-7-3-067', 'E27 A60 7W 3000K', 'E27 A60 7W 3000K', '7', '3000', '603', '', '180', '240', '80', '30000', '60', '60', '109', '0,075', '-22', '45', '9', 'R?cylum L'),
('F06', 'LED-06-7-4-068', 'E27 A60 7W 4000K', 'E27 A60 7W 4000K', '7', '4000', '603', '', '180', '240', '80', '30000', '60', '60', '109', '0,075', '-22', '45', '9', 'R?cylum L'),
('F07', 'LED-07-35-4-073', 'Ampoule E40 CORN 35W 4000K', 'Ampoule E40 CORN 35W 4000K', '35', '4000', '3600', '', '360', '240', '80', '50000', '90', '90', '220', '0,02', '-20', '45', '104,64', 'R?cylum L'),
('F07', 'LED-07-40-3-074', 'Ampoule E40 CORN 40W 3000K', 'Ampoule E40 CORN 40W 3000K', '40', '3000', '4000', '', '360', '240', '80', '50000', '90', '90', '250', '0,02', '-20', '45', '116,64', 'R?cylum L'),
('F07', 'LED-07-40-4-075', 'Ampoule E40 CORN 40W 4000K', 'Ampoule E40 CORN 40W 4000K', '40', '4000', '4000', '', '360', '240', '80', '50000', '90', '90', '250', '0,02', '-20', '45', '116,64', 'R?cylum L'),
('F07', 'LED-07-40-6-076', 'Ampoule E40 CORN 40W 6000K', 'Ampoule E40 CORN 40W 6000K', '40', '6000', '4000', '', '360', '240', '80', '50000', '90', '90', '250', '0,02', '-20', '45', '116,64', 'R?cylum L'),
('F07', 'LED-07-54-3-077', 'Ampoule E40 CORN 54W 3000K', 'Ampoule E40 CORN 54W 3000K', '54', '3000', '5940', '', '360', '240', '75', '50000', '93', '93', '283', '0,02', '-20', '45', '134,6', 'R?cylum L'),
('F07', 'LED-07-54-4-079', 'Ampoule E40 CORN 54W 4000K', 'Ampoule E40 CORN 54W 4000K', '54', '4000', '5940', '', '360', '240', '75', '50000', '93', '93', '283', '0,02', '-20', '45', '134,6', 'R?cylum L'),
('F07', 'LED-07-54-6-078', 'Ampoule E40 CORN 54W 6000K', 'Ampoule E40 CORN 54W 6000K', '54', '6000', '5940', '', '360', '240', '75', '50000', '93', '93', '283', '0,02', '-20', '45', '134,6', 'R?cylum L'),
('F08', 'LED-08-10-4-079', 'B22 A60 10W 4000K', 'B22 A60 10W 4000K', '10', '4000', '800', '', '270', '240', 'N/A', '30000', '60', '60', '118', '0,02', '-22', '45', '21', 'R?cylum L'),
('F09', 'LED-09-3-3-081', 'G4 3W 12V 3000K', 'G4 3W 12V 3000K', '3', '3000', '270', '', '360', '12', '80', '30000', '13', '13', '38', '0,02', '-22', '45', '11,76', 'R?cylum L'),
('F09', 'LED-09-3-3-082', 'G4 3W 220V 3000K', 'G4 3W 220V 3000K', '3', '3000', '270', '', '360', '220', '80', '30000', '13', '13', '38', '0,02', '-22', '45', '11,76', 'R?cylum L'),
('F09', 'LED-09-3-4-080', 'G4 3W 12V 4000K', 'G4 3W 12V 4000K', '3', '4000', '270', '', '360', '12', '80', '30000', '13', '13', '38', '0,02', '-22', '45', '11,76', 'R?cylum L'),
('F09', 'LED-09-3-4-083', 'G4 3W 220V 4000K', 'G4 3W 220V 4000K', '3', '4000', '270', '', '360', '220', '80', '30000', '13', '13', '38', '0,02', '-22', '45', '11,76', 'R?cylum L'),
('F10', 'LED-10-3-3-084', 'G9 3W 3000K', 'G9 3W 3000K', '3', '3000', '300', '', '360', '240', '80', '30000', '15', '15', '52', '0,02', '-22', '45', '14,72', 'R?cylum L'),
('F10', 'LED-10-3-4-085', 'G9 3W 4000K', 'G9 3W 4000K', '3', '4000', '300', '', '360', '240', '80', '30000', '15', '15', '52', '0,02', '-22', '45', '14,72', 'R?cylum L'),
('F10', 'LED-10-3-6-086', 'G9 3W 6000K', 'G9 3W 6000K', '3', '6000', '300', '', '360', '240', '80', '30000', '15', '15', '52', '0,02', '-22', '45', '14,72', 'R?cylum L'),
('F10', 'LED-10-5-3-087', 'G9 5W 3000K', 'G9 5W 3000K', '5', '3000', '500', '', '360', '240', '80', '30000', '15', '15', '64', '0,02', '-20', '45', '23,64', 'R?cylum L'),
('F10', 'LED-10-5-4-088', 'G9 5W 4000K', 'G9 5W 4000K', '5', '4000', '500', '', '360', '240', '80', '30000', '15', '15', '64', '0,02', '-20', '45', '23,64', 'R?cylum L'),
('F10', 'LED-10-5-6-089', 'G9 5W 6000K', 'G9 5W 6000K', '5', '6000', '500', '', '360', '240', '80', '30000', '15', '15', '64', '0,02', '-20', '45', '23,64', 'R?cylum L'),
('F11', 'LED-11-12-3-090', 'G24 12W 3000K', 'G24 12W 3000K', '12', '3000', '1209', '', '120', '240', '75', '30000', '35', '35', '190', '0,02', '-22', '45', '38,52', 'R?cylum L'),
('F11', 'LED-11-12-4-091', 'G24 12W 4000K', 'G24 12W 4000K', '12', '4000', '1209', '', '120', '240', '75', '30000', '35', '35', '190', '0,02', '-22', '45', '38,52', 'R?cylum L'),
('F11', 'LED-11-7-3-092', 'G24 7W 3000K', 'G24 7W 3000K', '7', '3000', '700', '', '120', '240', '75', '30000', '35', '35', '140', '0,02', '-22', '45', '26,64', 'R?cylum L'),
('F11', 'LED-11-7-4-093', 'G24 7W 4000K', 'G24 7W 4000K', '7', '4000', '700', '', '120', '240', '75', '30000', '35', '35', '140', '0,02', '-22', '45', '26,64', 'R?cylum L'),
('F11', 'LED-11-9-3-094', 'G24 9W 3000K', 'G24 9W 3000K', '9', '3000', '907', '', '120', '240', '75', '30000', '35', '35', '165', '0,02', '-22', '45', '32,56', 'R?cylum L'),
('F11', 'LED-11-9-4-095', 'G24 9W 4000K', 'G24 9W 4000K', '9', '4000', '907', '', '120', '240', '75', '30000', '35', '35', '165', '0,02', '-22', '45', '32,56', 'R?cylum L'),
('F12', 'LED-12-10-3-096', 'R7S 10W 3000K', 'R7S 10W 3000K', '10', '3000', '850', '', '200', '240', '80', '30000', '54', '54', '118', '0,02', '-22', '45', '30,84', 'R?cylum L'),
('F12', 'LED-12-10-4-097', 'R7S 10W 4000K', 'R7S 10W 4000K', '10', '4000', '850', '', '200', '240', '80', '30000', '54', '54', '118', '0,02', '-22', '45', '30,84', 'R?cylum L'),
('F12', 'LED-12-10-6-098', 'R7S 10W 6000K', 'R7S 10W 6000K', '10', '6000', '850', '', '200', '240', '80', '30000', '54', '54', '118', '0,02', '-22', '45', '30,84', 'R?cylum L'),
('F12', 'LED-12-15-3-099', 'R7S 15W 3000K', 'R7S 15W 3000K', '15', '3000', '1300', '', '200', '240', 'N/A', '30000', '54', '54', '189', '0,02', '-22', '45', '46,32', 'R?cylum L'),
('F12', 'LED-12-15-4-100', 'R7S 15W 4000K', 'R7S 15W 4000K', '15', '4000', '1300', '', '200', '240', 'N/A', '30000', '54', '54', '189', '0,02', '-22', '45', '46,32', 'R?cylum L'),
('F12', 'LED-12-15-6-100', 'R7S 15W 6000K', 'R7S 15W 6000K', '15', '6000', '1300', '', '200', '240', 'N/A', '30000', '54', '54', '189', '0,02', '-22', '45', '46,32', 'R?cylum L'),
('F12', 'LED-12-18-3-101', 'R7S 18W 3000K', 'R7S 18W 3000K', '18', '3000', '1800', '', '360', '240', '80', '30000', '22', '22', '189', '0,02', '-22', '45', '68,04', 'R?cylum L'),
('F12', 'LED-12-18-4-102', 'R7S 18W 4000K', 'R7S 18W 4000K', '18', '4000', '1800', '', '360', '240', '80', '30000', '22', '22', '189', '0,02', '-22', '45', '68,04', 'R?cylum L'),
('F12', 'LED-12-18-6-103', 'R7S 18W 6000K', 'R7S 18W 6000K', '18', '6000', '1800', '', '360', '240', '80', '30000', '22', '22', '189', '0,02', '-22', '45', '68,04', 'R?cylum L'),
('F12', 'LED-12-5-3-104', 'R7S 5W 3000K', 'R7S 5W 3000K', '5', '3000', '440', '', '200', '240', 'N/A', '30000', '54', '54', '78', '0,02', '-22', '45', '21,56', 'R?cylum L'),
('F12', 'LED-12-5-4-105', 'R7S 5W 4000K', 'R7S 5W 4000K', '5', '4000', '440', '', '200', '240', 'N/A', '30000', '54', '54', '78', '0,02', '-22', '45', '21,56', 'R?cylum L'),
('F12', 'LED-12-5-6-106', 'R7S 5W 6000K', 'R7S 5W 6000K', '5', '6000', '440', '', '200', '240', 'N/A', '30000', '54', '54', '78', '0,02', '-22', '45', '21,56', 'R?cylum L'),
('F13', 'LED-13-15-3-107', 'AR111 15W 220V 3000K', 'AR111 15W 220V 3000K', '15', '3000', '1300', '', '60', '240', '80', '30000', '110', '110', '67', '0,02', '-22', '45', '48,28', 'R?cylum L'),
('F13', 'LED-13-15-4-108', 'AR111 15W 220V 4000K', 'AR111 15W 220V 4000K', '15', '4000', '1300', '', '60', '240', '80', '30000', '110', '110', '67', '0,02', '-22', '45', '48,28', 'R?cylum L'),
('F13', 'LED-13-15-6-108', 'AR111 15W 220V 6000K', 'AR111 15W 220V 6000K', '15', '6000', '1300', '', '60', '240', '80', '30000', '110', '110', '67', '0,02', '-22', '45', '48,28', 'R?cylum L'),
('F13', 'LED-13-18-3-109', 'AR111 18W 220V 3000K', 'AR111 18W 220V 3000K', '18', '3000', '1550', '', '60', '240', '80', '30000', '110', '110', '67', '0,02', '-22', '45', '51,2', 'R?cylum L'),
('F13', 'LED-13-18-4-110', 'AR111 18W 220V 4000K', 'AR111 18W 220V 4000K', '18', '4000', '1550', '', '60', '240', '80', '30000', '110', '110', '67', '0,02', '-22', '45', '51,2', 'R?cylum L'),
('F13', 'LED-13-18-6-111', 'AR111 18W 220V 6000K', 'AR111 18W 220V 6000K', '18', '6000', '1550', '', '60', '240', '80', '30000', '110', '110', '67', '0,02', '-22', '45', '51,2', 'R?cylum L'),
('F32', 'LED-13-60-0-112', 'Driver pour AR111 12V', 'Driver pour AR111 12V', '60', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '15,4', 'R?cylum 0.'),
('F14', 'LED-14-00-0-139', 'Driver pour tube T5 1200x1500mm', 'Driver pour tube T5 1200x1500mm', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '12,8', ''),
('F14', 'LED-14-00-0-140', 'Driver pour tube T5 600x900mm', 'Driver pour tube T5 600x900mm', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '11', ''),
('F14', 'LED-14-13-3-124', 'Tube LED T5 900mm 13W 3000K', 'Tube LED T5 900mm 13W 3000K', '13', '3000', '1380', '', '180', '240', 'N/A', '30000', '18', '18', '900', '0,02', '-22', '45', '14,88', 'R?cylum L'),
('F14', 'LED-14-13-4-125', 'Tube LED T5 900mm 13W 4000K', 'Tube LED T5 900mm 13W 4000K', '13', '4000', '1380', '', '180', '240', 'N/A', '30000', '18', '18', '900', '0,02', '-22', '45', '14,88', 'R?cylum L'),
('F14', 'LED-14-13-6-126', 'Tube LED T5 900mm 13W 6000K', 'Tube LED T5 900mm 13W 6000K', '13', '6000', '1380', '', '180', '240', 'N/A', '30000', '18', '18', '900', '0,02', '-22', '45', '14,88', 'R?cylum L'),
('F14', 'LED-14-16-3-136', 'Tube LED T5 900mm 16W 3000K avec r?glette', 'Tube LED T5 900mm 16W 3000K avec r?glette', '16', '3000', '1380', '', '180', '240', 'N/A', '30000', '18', '18', '900', '0,02', '-22', '45', '33,15', 'R?cylum L'),
('F14', 'LED-14-16-4-137', 'Tube LED T5 900mm 16W 4000K avec r?glette', 'Tube LED T5 900mm 16W 4000K avec r?glette', '16', '4000', '1380', '', '180', '240', 'N/A', '30000', '18', '18', '900', '0,02', '-22', '45', '33,15', 'R?cylum L'),
('F14', 'LED-14-16-6-138', 'Tube LED T5 900mm 16W 6000K avec r?glette', 'Tube LED T5 900mm 16W 6000K avec r?glette', '16', '6000', '1380', '', '180', '240', 'N/A', '30000', '18', '18', '900', '0,02', '-22', '45', '33,15', 'R?cylum L'),
('F14', 'LED-14-18-3-115', 'Tube LED T5 1200mm 18W 3000K', 'Tube LED T5 1200mm 18W 3000K', '18', '3000', '1700', '', '180', '240', 'N/A', '30000', '18', '18', '1200', '0,02', '-22', '45', '16,96', 'R?cylum L'),
('F14', 'LED-14-18-4-116', 'Tube LED T5 1200mm 18W 4000K', 'Tube LED T5 1200mm 18W 4000K', '18', '4000', '1700', '', '180', '240', 'N/A', '30000', '18', '18', '1200', '0,02', '-22', '45', '16,96', 'R?cylum L'),
('F14', 'LED-14-18-6-117', 'Tube LED T5 1200mm 18W 6000K', 'Tube LED T5 1200mm 18W 6000K', '18', '600', '1700', '', '180', '240', 'N/A', '30000', '18', '18', '1200', '0,02', '-22', '45', '16,96', 'R?cylum L'),
('F14', 'LED-14-20-3-127', 'Tube LED T5 1200mm 20W 3000K avec r?glette', 'Tube LED T5 1200mm 20W 3000K avec r?glette', '20', '3000', '1700', '', '180', '240', 'N/A', '30000', '18', '18', '1200', '0,02', '-22', '45', '36,2', 'R?cylum L'),
('F14', 'LED-14-20-4-128', 'Tube LED T5 1200mm 20W 4000K avec r?glette', 'Tube LED T5 1200mm 20W 4000K avec r?glette', '20', '4000', '1700', '', '180', '240', 'N/A', '30000', '18', '18', '1200', '0,02', '-22', '45', '36,2', 'R?cylum L'),
('F14', 'LED-14-20-6-129', 'Tube LED T5 1200mm 20W 6000K avec r?glette', 'Tube LED T5 1200mm 20W 6000K avec r?glette', '20', '6000', '1700', '', '180', '240', 'N/A', '30000', '18', '18', '1200', '0,02', '-22', '45', '36,2', 'R?cylum L'),
('F14', 'LED-14-22-3-118', 'Tube LED T5 1500mm 22W 3000K', 'Tube LED T5 1500mm 22W 3000K', '22', '3000', '2600', '', '180', '240', 'N/A', '30000', '18', '18', '1500', '0,02', '-22', '45', '20,4', 'R?cylum L'),
('F14', 'LED-14-22-4-119', 'Tube LED T5 1500mm 22W 4000K', 'Tube LED T5 1500mm 22W 4000K', '22', '4000', '2600', '', '180', '240', 'N/A', '30000', '18', '18', '1500', '0,02', '-22', '45', '20,4', 'R?cylum L'),
('F14', 'LED-14-22-6-120', 'Tube LED T5 1500mm 22W 6000K', 'Tube LED T5 1500mm 22W 6000K', '22', '6000', '2600', '', '180', '240', 'N/A', '30000', '18', '18', '1500', '0,02', '-22', '45', '20,4', 'R?cylum L'),
('F14', 'LED-14-30-3-130', 'Tube LED T5 1500mm 30W 3000K avec r?glette', 'Tube LED T5 1500mm 30W 3000K avec r?glette', '30', '3000', '2600', '', '180', '240', 'N/A', '30000', '18', '18', '1500', '0,02', '-22', '45', '39,68', 'R?cylum L'),
('F14', 'LED-14-30-4-131', 'Tube LED T5 1500mm 30W 4000K avec r?glette', 'Tube LED T5 1500mm 30W 4000K avec r?glette', '30', '4000', '2600', '', '180', '240', 'N/A', '30000', '18', '18', '1500', '0,02', '-22', '45', '39,68', 'R?cylum L'),
('F14', 'LED-14-30-6-132', 'Tube LED T5 1500mm 30W 6000K avec r?glette', 'Tube LED T5 1500mm 30W 6000K avec r?glette', '30', '6000', '2600', '', '180', '240', 'N/A', '30000', '18', '18', '1500', '0,02', '-22', '45', '39,68', 'R?cylum L'),
('F14', 'LED-14-6-3-133', 'Tube LED T5 600mm 6W 3000K avec r?glette', 'Tube LED T5 600mm 6W 3000K avec r?glette', '6', '3000', '520', '', '180', '240', 'N/A', '30000', '18', '18', '600', '0,02', '-22', '45', '30', 'R?cylum L'),
('F14', 'LED-14-6-4-134', 'Tube LED T5 600mm 6W 4000K avec r?glette', 'Tube LED T5 600mm 6W 4000K avec r?glette', '6', '4000', '520', '', '180', '240', 'N/A', '30000', '18', '18', '600', '0,02', '-22', '45', '30', 'R?cylum L'),
('F14', 'LED-14-6-6-135', 'Tube LED T5 600mm 6W 6000K avec r?glette', 'Tube LED T5 600mm 6W 6000K avec r?glette', '6', '6000', '520', '', '180', '240', 'N/A', '30000', '18', '18', '600', '0,02', '-22', '45', '30', 'R?cylum L'),
('F14', 'LED-14-9-3-121', 'Tube LED T5 600mm 9W 3000K', 'Tube LED T5 600mm 9W 3000K', '9', '3000', '520', '', '180', '240', 'N/A', '30000', '18', '18', '600', '0,02', '-22', '45', '14,24', 'R?cylum L'),
('F14', 'LED-14-9-4-122', 'Tube LED T5 600mm 9W 4000K', 'Tube LED T5 600mm 9W 4000K', '9', '4000', '520', '', '180', '240', 'N/A', '30000', '18', '18', '600', '0,02', '-22', '45', '14,24', 'R?cylum L'),
('F14', 'LED-14-9-6-123', 'Tube LED T5 600mm 9W 6000K', 'Tube LED T5 600mm 9W 6000K', '9', '6000', '520', '', '180', '240', 'N/A', '30000', '18', '18', '600', '0,02', '-22', '45', '14,24', 'R?cylum L'),
('F15', 'LED-15-14-3-144', 'Tube LED T8 14W 900mm 3000K', 'Tube LED T8 14W 900mm 3000K', '14', '3000', '1400', '', '180', '240', '80', '30000', '30', '30', '900', '0,02', '-20', '45', '19,96', 'R?cylum L'),
('F15', 'LED-15-14-4-145', 'Tube LED T8 14W 900mm 4000K', 'Tube LED T8 14W 900mm 4000K', '14', '4000', '1400', '', '180', '240', '80', '30000', '30', '30', '900', '0,02', '-20', '45', '19,96', 'R?cylum L'),
('F15', 'LED-15-14-6-146', 'Tube LED T8 14W 900mm 6000K', 'Tube LED T8 14W 900mm 6000K', '14', '6000', '1400', '', '180', '240', '80', '30000', '30', '30', '900', '0,02', '-20', '45', '19,96', 'R?cylum L'),
('F15', 'LED-15-15-R-157', 'Tube LED T8 15W 900mm ros?;Tube LED T8 15W 900mm ros?;15', 'Ros?;1250', '', '120', '240', '80', '50000', '29', '32', '900', '0,02', '-20', '50', '37', 'R?cylum', NULL, NULL, NULL),
('F15', 'LED-15-18-3-150', 'Tube LED T8 18W 1200mm 3000K', 'Tube LED T8 18W 1200mm 3000K', '18', '3000', '1800', '', '180', '240', '80', '30000', '30', '30', '1200', '0,02', '-22', '45', '21', 'R?cylum L'),
('F15', 'LED-15-18-4-151', 'Tube LED T8 18W 1200mm 4000K', 'Tube LED T8 18W 1200mm 4000K', '18', '4000', '1800', '', '180', '240', '80', '30000', '30', '30', '1200', '0,02', '-22', '45', '21', 'R?cylum L'),
('F15', 'LED-15-18-6-152', 'Tube LED T8 18W 1200mm 6000K', 'Tube LED T8 18W 1200mm 6000K', '18', '6000', '1800', '', '180', '240', '80', '30000', '30', '30', '1200', '0,02', '-22', '45', '21', 'R?cylum L'),
('F15', 'LED-15-20-R-158', 'Tube LED T8 20W 1200mm ros?;Tube LED T8 20W 1200mm ros?;20', 'Ros?;1600', '', '120', '240', '80', '50000', '29', '32', '1200', '0,02', '-20', '50', '42', 'R?cylum', NULL, NULL, NULL),
('F15', 'LED-15-22-3-147', 'Tube LED T8 22W 1500mm 3000K', 'Tube LED T8 22W 1500mm 3000K', '22', '3000', '2200', '', '180', '240', '80', '30000', '30', '30', '1500', '0,02', '-20', '45', '28', 'R?cylum L'),
('F15', 'LED-15-22-4-148', 'Tube LED T8 22W 1500mm 4000K', 'Tube LED T8 22W 1500mm 4000K', '22', '4000', '2200', '', '180', '240', '80', '30000', '30', '30', '1500', '0,02', '-20', '45', '28', 'R?cylum L'),
('F15', 'LED-15-22-6-149', 'Tube LED T8 22W 1500mm 6000K', 'Tube LED T8 22W 1500mm 6000K', '22', '6000', '2200', '', '180', '240', '80', '30000', '30', '30', '1500', '0,02', '-20', '45', '28', 'R?cylum L'),
('F15', 'LED-15-24-6-149', 'Tube LED T8 600mm 9W 6000K D?tecteur Mouvement 0 ? 100%', 'Tube LED T8 600mm 9W 6000K D?tecteur Mouvement 0 ? 100%', '9', '6000', '900', '', '160', '240', '80', '30000', '26', '26', '600', '0,02', '-22', '45', '35,2', 'R?cylum L'),
('F15', 'LED-15-24-6-149', 'Tube LED T8 1200mm 18W 6000K D?tecteur Mouvement 0 ? 100%', 'Tube LED T8 1200mm 18W 6000K D?tecteur Mouvement 0 ? 100%', '18', '6000', '1800', '', '160', '240', '80', '30000', '26', '26', '1200', '0,02', '-22', '45', '40', 'R?cylum L'),
('F15', 'LED-15-24-6-149', 'Tube LED T8 1500mm 24W 6000K D?tecteur Mouvement 0 ? 100%', 'Tube LED T8 1500mm 24W 6000K D?tecteur Mouvement 0 ? 100%', '24', '6000', '2400', '', '160', '240', '80', '30000', '26', '26', '1500', '0,02', '-22', '45', '53', 'R?cylum L'),
('F15', 'LED-15-24-R-159', 'Tube LED T8 24W 1500mm ros?;Tube LED T8 24W 1500mm ros?;24', 'Ros?;1920', '', '120', '240', '80', '50000', '30', '30', '1500', '0,02', '-20', '50', '56', 'R?cylum', NULL, NULL, NULL),
('F15', 'LED-15-9-3-141', 'Tube LED T8 9W 600mm 3000K', 'Tube LED T8 9W 600mm 3000K', '9', '3000', '900', '', '180', '240', '80', '30000', '30', '30', '600', '0,02', '-22', '45', '17,28', 'R?cylum L'),
('F15', 'LED-15-9-4-142', 'Tube LED T8 9W 600mm 4000K', 'Tube LED T8 9W 600mm 4000K', '9', '4000', '900', '', '180', '240', '80', '30000', '30', '30', '600', '0,02', '-22', '45', '17,28', 'R?cylum L'),
('F15', 'LED-15-9-6-143', 'Tube LED T8 9W 600mm 6000K', 'Tube LED T8 9W 600mm 6000K', '9', '6000', '900', '', '180', '240', '80', '30000', '30', '30', '600', '0,02', '-22', '45', '17,28', 'R?cylum L'),
('F15', 'LED-15-9-R-160', 'Tube LED T8 9W 600mm ros?;Tube LED T8 9W 600mm ros?;9', 'Ros?;800', '', '120', '240', '80', '50000', '29', '32', '600', '0,02', '-20', '50', '32', 'R?cylum', NULL, NULL, NULL),
('F16', 'LED-16-18-4-161', 'R?glette ?tanche 18W 600mm 4000K', 'R?glette ?tanche 18W 600mm 4000K', '18', '4000', '1297', '', '120', '240', '77', '50000', '87', '70', '600', '0,02', '-22', '45', '68,2', 'R?cylum L'),
('F16', 'LED-16-18-6-162', 'R?glette ?tanche 18W 600mm 6000K', 'R?glette ?tanche 18W 600mm 6000K', '18', '6000', '1297', '', '120', '240', '77', '50000', '87', '70', '600', '0,02', '-22', '45', '68,2', 'R?cylum L'),
('F16', 'LED-16-36-4-163', 'R?glette ?tanche 36W 1200mm 4000K', 'R?glette ?tanche 36W 1200mm 4000K', '36', '4000', '2294', '', '120', '240', '75', '50000', '87', '70', '1200', '0,02', '-22', '45', '90', 'R?cylum L'),
('F16', 'LED-16-36-6-164', 'R?glette ?tanche 36W 1200mm 6000K', 'R?glette ?tanche 36W 1200mm 6000K', '36', '6000', '2294', '', '120', '240', '75', '50000', '87', '70', '1200', '0,02', '-22', '45', '90', 'R?cylum L'),
('F16', 'LED-16-40-4-164', 'R?glette ?tanche 40W 1200mm 4000K', 'R?glette ?tanche 40W 1200mm 4000K', '40', '4000', '3247', '', '120', '240', '75', '50000', '87', '70', '1200', '0,02', '-20', '45', '139,48', 'R?cylum L'),
('F16', 'LED-16-40-4-166', 'R?glette ?tanche 40W 1500mm 4000K', 'R?glette ?tanche 40W 1500mm 4000K', '40', '4000', '5718', '', '120', '240', '77', '50000', '87', '70', '1500', '0,02', '-20', '45', '140', 'R?cylum L'),
('F16', 'LED-16-40-6-165', 'R?glette ?tanche 40W 1200mm 6000K', 'R?glette ?tanche 40W 1200mm 6000K', '40', '6000', '3247', '', '120', '240', '75', '50000', '87', '70', '1200', '0,02', '-20', '45', '139,48', 'R?cylum L'),
('F16', 'LED-16-40-6-167', 'R?glette ?tanche 40W 1500mm 6000K', 'R?glette ?tanche 40W 1500mm 6000K', '40', '6000', '5718', '', '120', '240', '77', '50000', '87', '70', '1500', '0,02', '-20', '45', '140', 'R?cylum L'),
('F16', 'LED-16-70-4-166', 'R?glette ?tanche 70W 1500mm 4000K', 'R?glette ?tanche 70W 1500mm 4000K', '70', '4000', '3400', '', '120', '240', '70', '50000', '87', '70', '1500', '0,02', '-22', '45', '166,8', 'R?cylum L'),
('F16', 'LED-16-70-6-167', 'R?glette ?tanche 70W 1500mm 6000K', 'R?glette ?tanche 70W 1500mm 6000K', '70', '6000', '3400', '', '120', '240', '70', '50000', '87', '70', '1500', '0,02', '-22', '45', '166,8', 'R?cylum L'),
('F17', 'LED-17-1000-6-184', 'Projecteur Professionnel 1000W 6000K', 'Projecteur Professionnel 1000W 6000K', '1000', '5500', '131250', '', '105', '240', '80', '40000', '436', '534', '534', '0', '-20', '50', '5985,88', ''),
('F17', 'LED-17-100-4-116', 'Projecteur ext?rieur COB IP65 100W 4000K Noir', 'Projecteur ext?rieur COB IP65 100W 4000K Noir', '50', '4000', '5279', '', '120', '240', '85', '30000', '225', '185', '125', '0', '-22', '45', '249,6', 'R?cylum 0.'),
('F17', 'LED-17-100-4-175', 'Projecteur ext?rieur SMD IP65 100W 4000K Noir', 'Projecteur ext?rieur SMD IP65 100W 4000K Noir', '100', '', '', '', '', '', '', '', '', '', '', '0', '', '', '249,6', 'R?cylum 0.'),
('F17', 'LED-17-100-4-176', 'Projecteur LED ext?rieur 100W 4000K Noir', 'Projecteur LED ext?rieur 100W 4000K Noir', '100', '4000', '10532', '', '120', '240', '85', '30000', '284', '232', '150', '0', '-22', '45', '249,6', 'R?cylum 2.'),
('F17', 'LED-17-100-6-184', 'Projecteur Professionnel 100W 6000K', 'Projecteur Professionnel 100W 6000K', '100', '6000', '12000', '', '105', '240', '80', '40000', 'N/A', 'N/A', 'N/A', '0', '-20', '50', '658,64', ''),
('F02', 'LED-17-10-3-205', 'Spot encastrable orientable ?90mm 10W 3000K', 'Spot encastrable orientable ?90mm 10W 3000K', '10', '3000', '720', '', '60', '240', '80', '30000', '160', '160', '110', '0,3', '-22', '45', '29,4', ''),
('F17', 'LED-17-10-4-170', 'Bras gris pour projecteur pelle 10W', 'Bras gris pour projecteur pelle 10W', '10', '4000', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '', '0', '-22', '45', '12', ''),
('F17', 'LED-17-10-4-174', 'Projecteur pelle gris 10W 4000K (sans bras)', 'Projecteur pelle gris 10W 4000K (sans bras)', '10', '4000', '950', '', '120', '240', '80', '30000', '120', '100', '29', '0', '-22', '45', '35', 'R?cylum 0.'),
('F02', 'LED-17-10-4-206', 'Spot encastrable orientable ?90mm 10W 4000K', 'Spot encastrable orientable ?90mm 10W 4000K', '10', '4000', '720', '', '60', '240', '80', '30000', '160', '160', '110', '0,3', '-22', '45', '29,4', ''),
('F17', 'LED-17-10-4-207', 'Projecteur pelle gris 10W 4000K (avec bras)', 'Projecteur pelle gris 10W 4000K (avec bras)', '10', '4000', '', '', '', '240', '', '30000', '', '', '', '0', '-22', '45', '42', 'R?cylum 0.'),
('F17', 'LED-17-150-4-115', 'Projecteur ext?rieur COB IP65?200W 4000K Noir', 'Projecteur ext?rieur COB IP65?200W 4000K Noir', '30', '4000', '3600', '', '120', '240', '85', '30000', '180', '140', '100', '0', '-22', '45', '360', 'R?cylum 0.'),
('F17', 'LED-17-150-4-176', 'Projecteur ext?rieur SMD IP65 150W 4000K Noir', 'Projecteur ext?rieur SMD IP65 150W 4000K Noir', '150', '', '', '', '', '', '', '', '', '', '', '0', '', '', '360', 'R?cylum 0.'),
('F17', 'LED-17-150-6-184', 'Projecteur Professionnel 150W 6000K', 'Projecteur Professionnel 150W 6000K', '150', '6000', '18000', '', '105', '240', '80', '40000', '330', '340', '340', '0', '-20', '50', '883,24', ''),
('F17', 'LED-17-200-4-177', 'Projecteur ext?rieur SMD IP65 200W 4000K Noir', 'Projecteur ext?rieur SMD IP65 200W 4000K Noir', '200', '', '', '', '', '', '', '', '', '', '', '0', '', '', '525,72', 'R?cylum 0.'),
('F17', 'LED-17-200-4-177', 'Projecteur LED ext?rieur 200W 4000K Noir', 'Projecteur LED ext?rieur 200W 4000K Noir', '200', '4000', '20582', '', '120', '240', '85', '30000', '382', '284', '185', '0', '-22', '45', '525,72', 'R?cylum 2.'),
('F02', 'LED-17-20-3-201', 'Spot encastrable orientable ?134mm 20W 3000K', 'Spot encastrable orientable ?134mm 20W 3000K', '20', '3000', '1440', '', '60', '240', '80', '30000', '160', '160', '110', '0,86', '-22', '45', '57,6', ''),
('F17', 'LED-17-20-4-180', 'Projecteur extractible rond ?165mm 20W 4000K Blanc', 'Projecteur extractible rond ?165mm 20W 4000K Blanc', '20', '4000', '', '', '', '240', '', '30000', '', '', '', '0', '-22', '45', '98', 'R?cylum 0.'),
('F17', 'LED-17-20-4-183', 'Projecteur fixe SMD 20W 4000K', 'Projecteur fixe SMD 20W 4000K', '20', '4000', '2400', '', '120', '240', '85', '30000', '85', '85', '118', '0', '-20', '45', '57,6', ''),
('F02', 'LED-17-20-4-202', 'Spot encastrable orientable ?134mm 20W 4000K', 'Spot encastrable orientable ?134mm 20W 4000K', '20', '4000', '1440', '', '60', '240', '80', '30000', '160', '160', '110', '0,86', '-22', '45', '57,6', ''),
('F17', 'LED-17-28-4-178', 'Projecteur orientable rectangle 28W 4000K Blanc', 'Projecteur orientable rectangle 28W 4000K Blanc', '28', '4000', '3360', '', '100', '240', '90', '50000', '240', '145', '135', '0', '-20', '40', '128', 'R?cylum 0.'),
('F17', 'LED-17-28-4-181', 'Projecteur extractible rond ?195mm 28W 4000K Blanc', 'Projecteur extractible rond ?195mm 28W 4000K Blanc', '28', '4000', '', '', '', '240', '', '30000', '', '', '', '0', '-22', '45', '115,6', 'R?cylum 0.'),
('F17', 'LED-17-30-3-210', 'Projecteur sur rail 30W 3000K 30? blanc', 'Projecteur sur rail 30W 3000K 30? blanc', '30', '3000', '2400', '', '36', '240', '80', '30000', '93', '93', '170', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-30-3-211', 'Projecteur sur rail 30W 3000K 30? noir', 'Projecteur sur rail 30W 3000K 30? noir', '30', '3000', '2400', '', '36', '240', '80', '30000', '93', '93', '170', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-30-4-168', 'Projecteur avec d?tecteur de pr?sence 30W 4000K', 'Projecteur avec d?tecteur de pr?sence 30W 4000K', '30', '4000', '3600', '', '120', '240', '85', '30000', '195', '180', '100', '0', '-22', '45', '118,68', ''),
('F17', 'LED-17-30-4-171', 'Bras gris pour projecteur pelle 30W', 'Bras gris pour projecteur pelle 30W', '30', '4000', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '370', '310', '230', '0', '-22', '45', '14', ''),
('F17', 'LED-17-30-4-172', 'Projecteur ext?rieur SMD IP65 30W 4000K Noir', 'Projecteur ext?rieur SMD IP65 30W 4000K Noir', '50', '4000', '5279', '', '120', '240', '85', '30000', '225', '185', '125', '0', '-22', '45', '68,8', 'R?cylum 0.'),
('F17', 'LED-17-30-4-175', 'Projecteur pelle gris 30W 4000K (sans bras)', 'Projecteur pelle gris 30W 4000K (sans bras)', '30', '4000', '2800', '', '120', '240', '83', '30000', '205', '160', '30', '0', '-22', '45', '78', 'R?cylum 0.'),
('F17', 'LED-17-30-4-208', 'Projecteur pelle gris 30W 4000K (avec bras)', 'Projecteur pelle gris 30W 4000K (avec bras)', '30', '4000', '', '', '', '240', '', '30000', '', '', '', '0', '-22', '45', '88', 'R?cylum 0.'),
('F17', 'LED-17-30-4-212', 'Projecteur sur rail 30W 4000K 30? blanc', 'Projecteur sur rail 30W 4000K 30? blanc', '30', '4000', '2400', '', '36', '240', '80', '30000', '93', '93', '170', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-30-4-213', 'Projecteur sur rail 30W 4000K 30? noir', 'Projecteur sur rail 30W 4000K 30? noir', '30', '4000', '2400', '', '36', '240', '80', '30000', '93', '93', '170', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-3409-4-219', 'Projecteur sur rail 40W 4000K 25? noir', 'Projecteur sur rail 40W 4000K 25? noir', '40', '4000', '2800', '', '36', '240', '80', '30000', '100', '100', '150', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-36-3-184', 'Projecteur sur sc?ne 30W 3000K', 'Projecteur sur sc?ne 30W 3000K', '30', '', '', '', '', '', '', '', '', '', '', '0', '', '', ' - ', ''),
('F17', 'LED-17-38-4-178', 'Projecteur orientable rectangle 38W 4000K Blanc', 'Projecteur orientable rectangle 38W 4000K Blanc', '38', '4000', '4560', '', '100', '240', '90', '50000', '240', '145', '135', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-40-3-214', 'Projecteur sur rail 40W 3000K 25? blanc', 'Projecteur sur rail 40W 3000K 25? blanc', '40', '3000', '2800', '', '36', '240', '80', '30000', '100', '100', '150', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-40-3-215', 'Projecteur sur rail 40W 3000K 25? noir', 'Projecteur sur rail 40W 3000K 25? noir', '40', '3000', '2800', '', '36', '240', '80', '30000', '100', '100', '150', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-40-3-216', 'Projecteur sur rail 40W 3000K 50? blanc', 'Projecteur sur rail 40W 3000K 50? blanc', '40', '3000', '2800', '', '36', '240', '80', '30000', '100', '100', '150', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-40-3-217', 'Projecteur sur rail 40W 3000K 50? noir', 'Projecteur sur rail 40W 3000K 50? noir', '40', '3000', '2800', '', '36', '240', '80', '30000', '100', '100', '150', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-40-4-182', 'Projecteur extractible rond ?195mm 40W 4000K Blanc', 'Projecteur extractible rond ?195mm 40W 4000K Blanc', '40', '4000', '', '', '', '240', '', '30000', '', '', '', '0', '-22', '45', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-40-4-218', 'Projecteur sur rail 40W 4000K 25? blanc', 'Projecteur sur rail 40W 4000K 25? blanc', '40', '4000', '2800', '', '36', '240', '80', '30000', '100', '100', '150', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-40-4-220', 'Projecteur sur rail 40W 4000K 50? blanc', 'Projecteur sur rail 40W 4000K 50? blanc', '40', '4000', '2800', '', '36', '240', '80', '30000', '100', '100', '150', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-40-4-221', 'Projecteur sur rail 40W 4000K 50? noir', 'Projecteur sur rail 40W 4000K 50? noir', '40', '4000', '2800', '', '36', '240', '80', '30000', '100', '100', '150', '0', '-20', '40', '129,6', 'R?cylum 0.'),
('F17', 'LED-17-500-6-184', 'Projecteur Professionnel 500W 6000K', 'Projecteur Professionnel 500W 6000K', '500', '5500', '65625', '', '105', '240', '80', '40000', '410', '430', '430', '0', '-20', '50', '3293,8', ''),
('F17', 'LED-17-50-4-113', 'Projecteur ext?rieur COB IP65 50W 4000K Noir', 'Projecteur ext?rieur COB IP65 50W 4000K Noir', '30', '4000', '3600', '', '120', '240', '85', '30000', '180', '140', '100', '0', '-22', '45', '92', 'R?cylum 0.'),
('F17', 'LED-17-50-4-169', 'Projecteur avec d?tecteur de pr?sence 50W 4000K', 'Projecteur avec d?tecteur de pr?sence 50W 4000K', '50', '4000', '6000', '', '120', '240', '85', '30000', '290', '240', '150', '0', '-22', '45', '145,44', ''),
('F17', 'LED-17-50-4-173', 'Projecteur ext?rieur SMD IP65 50W 4000K Noir', 'Projecteur ext?rieur SMD IP65 50W 4000K Noir', '50', '4000', '5279', '', '120', '240', '85', '30000', '225', '185', '125', '0', '-22', '45', '92', 'R?cylum 0.'),
('F18', 'LED-18-00-0-227', 'Clip de Fixation M?tallique 180? pour Profil?;Clip de Fixation M?tallique 180? pour P', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', 'N/A', '5,8', '', NULL, NULL),
('F18', 'LED-18-00-0-228', 'Clip de Fixation M?tallique 45? pour Profil?;Clip de Fixation M?tallique 45? pour Pro', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', 'N/A', '5,8', '', NULL, NULL),
('F18', 'LED-18-00-0-229', 'Connecteur \'I\' Profil? 24V', 'Connecteur \'I\' Profil? 24V', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', 'N/A', '2,8', ''),
('F18', 'LED-18-00-0-239', 'Switch pour Profil? 24V', 'Switch pour Profil? 24V', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', 'N/A', '5,8', ''),
('F18', 'LED-18-00-0-240', 'Switch Touch (tactile) pour Profil?;Switch Touch (tactile) pour Profil?;-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', 'N/A', '17,68', '', NULL, NULL),
('F18', 'LED-18-120-0-224', 'Bloc d\'Alimentation Profil? Aretha 24V 120W 1,5A', 'Bloc d\'Alimentation Profil? Aretha 24V 120W 1,5A', '120', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', 'N/A', '47,32', ''),
('F18', 'LED-18-120-0-225', 'Bloc d\'Alimentation Profil? Aretha 24V 120W 5A', 'Bloc d\'Alimentation Profil? Aretha 24V 120W 5A', '120', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', 'N/A', '118,56', ''),
('F18', 'LED-18-15-3-230', 'Profil? avec Ruban LED 1000mm 15W 3000K', 'Profil? avec Ruban LED 1000mm 15W 3000K', '15', '3000', '1050', '', '100', '24', '80', '30000', '18', '8', '1000', '0', '0', '45', '48,16', ''),
('F18', 'LED-18-15-4-231', 'Profil? avec Ruban LED 1000mm 15W 4000K', 'Profil? avec Ruban LED 1000mm 15W 4000K', '15', '4000', '1050', '', '100', '24', '80', '30000', '18', '8', '1000', '0', '0', '45', '48,16', ''),
('F18', 'LED-18-15-6-232', 'Profil? avec Ruban LED 1000mm 15W 6000K', 'Profil? avec Ruban LED 1000mm 15W 6000K', '15', '6000', '1050', '', '100', '24', '80', '30000', '18', '8', '1000', '0', '0', '45', '48,16', ''),
('F18', 'LED-18-5-3-233', 'Profil? avec Ruban LED 300mm 5W 3000K', 'Profil? avec Ruban LED 300mm 5W 3000K', '5', '3000', '350', '', '100', '24', '80', '30000', '18', '8', '300', '0', '0', '45', '29,52', ''),
('F18', 'LED-18-5-4-234', 'Profil? avec Ruban LED 300mm 5W 4000K', 'Profil? avec Ruban LED 300mm 5W 4000K', '5', '4000', '350', '', '100', '24', '80', '30000', '18', '8', '300', '0', '0', '45', '29,52', ''),
('F18', 'LED-18-5-6-235', 'Profil? avec Ruban LED 300mm 5W 6000K', 'Profil? avec Ruban LED 300mm 5W 6000K', '5', '6000', '350', '', '100', '24', '80', '30000', '18', '8', '300', '0', '0', '45', '29,52', ''),
('F18', 'LED-18-60-0-226', 'Bloc d\'Alimentation Profil? Aretha 24V 60W 2.5A', 'Bloc d\'Alimentation Profil? Aretha 24V 60W 2.5A', '60', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', 'N/A', '56,24', ''),
('F18', 'LED-18-9-3-236', 'Profil? avec Ruban LED 600mm 9W 3000K', 'Profil? avec Ruban LED 600mm 9W 3000K', '9', '3000', '630', '', '100', '24', '80', '30000', '18', '8', '600', '0', '0', '45', '38,4', ''),
('F18', 'LED-18-9-4-237', 'Profil? avec Ruban LED 600mm 9W 4000K', 'Profil? avec Ruban LED 600mm 9W 4000K', '9', '4000', '630', '', '100', '24', '80', '30000', '18', '8', '600', '0', '0', '45', '38,4', ''),
('F18', 'LED-18-9-6-238', 'Profil? avec Ruban LED 600mm 9W 6000K', 'Profil? avec Ruban LED 600mm 9W 6000K', '9', '6000', '630', '', '100', '24', '80', '30000', '18', '8', '600', '0', '0', '45', '38,4', ''),
('F19', 'LED-19-12-4-241', 'Hublot IP44 ?280mm 12W 4000K', 'Hublot IP44 ?280mm 12W 4000K', '12', '4000', '850', '', '120', '240', '80', '30000', '211', '211', '57', '0', '-20', '40', '30', ''),
('F19', 'LED-19-18-4-242', 'Hublot IP44 ?280mm 18W 4000K', 'Hublot IP44 ?280mm 18W 4000K', '18', '4000', '1480', '', '180', '240', '80', '30000', '255', '255', '40', '0', '-20', '40', '42', ''),
('F19', 'LED-19-18-4-243', 'Hublot IP44 ?300mm 16W 4500K avec d?tecteur de pr?sence', 'Hublot IP44 ?300mm 16W 4500K avec d?tecteur de pr?sence', '16', '4500', '1200', '', '360', '240', 'N/A', '30000', '300', '300', '115', '0', '-20', '45', '98', ''),
('F20', 'LED-20-100-4-244', 'Highbay professionnel 100W 9000Lm 4000K', 'Highbay professionnel 100W 9000Lm 4000K', '100', '4000', '7900', '', '112', '240', '80', '30000', '505', '505', '420', '0', '-22', '45', '388', ''),
('F20', 'LED-20-100-4-248', 'Cloche industrielle SMD 100W 4000 K', 'Cloche industrielle SMD 100W 4000 K', '100', '4000', '12000', '', '60', '240', '80', '40000', '459', '367', '323', '0', '-20', '45', '276', ''),
('F20', 'LED-20-100-6-245', 'Highbay professionnel 100W 9000Lm 6500K', 'Highbay professionnel 100W 9000Lm 6500K', '100', '6500', '7900', '', '112', '240', '80', '30000', '505', '505', '420', '0', '-22', '45', '388', ''),
('F20', 'LED-20-100-6-249', 'Cloche industrielle SMD 100W 6500 K', 'Cloche industrielle SMD 100W 6500 K', '100', '6500', '12000', '', '60', '240', '80', '40000', '459', '367', '323', '0', '-20', '45', '276', ''),
('F20', 'LED-20-150-4-250', 'Cloche industrielle SMD 150W 4000 K', 'Cloche industrielle SMD 150W 4000 K', '150', '4000', '18000', '', '60', '240', '80', '40000', '204', '204', '278', '0', '-20', '45', '340,16', '');
INSERT INTO `TABLE 12` (`Code Fam`, `REFERENCE`, `LIBELLE court`, `LIBELLE long`, `PUISSANCE (W)`, `TEMPERATURE (K)`, `LUMINOSITE (Lm)`, `RATIO (Lm/W)`, `FAISCEAU (-°)`, `TENSION (V)`, `IRC`, `DUREE DE VIE (H)`, `Longueur`, `Largeur`, `Profondeur`, `Poids (g)`, `Minimum`, `Maximum`, `PV UNITAIRE (HT)`, `DEEE (HT) INCLUSE`) VALUES
('F20', 'LED-20-150-6-251', 'Cloche industrielle SMD 150W 6500 K', 'Cloche industrielle SMD 150W 6500 K', '150', '6500', '18000', '', '60', '240', '80', '40000', '204', '204', '278', '0', '-20', '45', '340,16', ''),
('F20', 'LED-20-200-4-246', 'Highbay professionnel 200W 18000Lm 4000K', 'Highbay professionnel 200W 18000Lm 4000K', '200', '4000', '15800', '', '112', '240', '80', '30000', '505', '505', '420', '0', '-22', '45', '615', ''),
('F20', 'LED-20-200-4-252', 'Cloche industrielle SMD 200W 4000 K', 'Cloche industrielle SMD 200W 4000 K', '200', '4000', '24000', '', '60', '240', '80', '40000', '459', '367', '323', '0', '-20', '45', '428,28', ''),
('F20', 'LED-20-200-6-247', 'Highbay professionnel 200W 18000Lm 6500K', 'Highbay professionnel 200W 18000Lm 6500K', '200', '6500', '15800', '', '112', '240', '80', '30000', '505', '505', '420', '0', '-22', '45', '615', ''),
('F20', 'LED-20-200-6-253', 'Cloche industrielle SMD 200W 6500 K', 'Cloche industrielle SMD 200W 6500 K', '200', '6500', '24000', '', '60', '240', '80', '40000', '459', '367', '323', '0', '-20', '45', '428,28', ''),
('F20', 'LED-20-35-3-367', 'Cloche industrielle DECOLED 35W 3000 K', 'Cloche industrielle DECOLED 35W 3000 K', '35', '3000', '3250', '', '90', '240', '83', '50000', '190', '190', '43', '0', '-22', '45', '208,36', ''),
('F20', 'LED-20-35-4-366', 'Cloche industrielle DECOLED 35W 4500 K', 'Cloche industrielle DECOLED 35W 4500 K', '35', '4500', '3250', '', '90', '240', '83', '50000', '190', '190', '43', '0', '-22', '45', '208,36', ''),
('F20', 'LED-20-35-6-368', 'Cloche industrielle DECOLED 35W 6000 K', 'Cloche industrielle DECOLED 35W 6000 K', '35', '6000', '3250', '', '9', '240', '83', '50000', '190', '190', '43', '0', '-22', '45', '208,36', ''),
('F21', 'LED-21-00-0-254', 'Croix de pharmacie RGB 1000x1000mm double face', 'Croix de pharmacie RGB 1000x1000mm double face', '-', '-', 'N/A', '', 'N/A', '240', 'N/A', '30000', '1000', '1000', 'N/A', '0', '-22', '45', '3500', ''),
('F21', 'LED-21-00-0-255', 'Croix de pharmacie RGB 800x800mm monoface', 'Croix de pharmacie RGB 800x800mm monoface', '-', '-', 'N/A', '', 'N/A', '240', 'N/A', '30000', '800', '800', 'N/A', '0', '-22', '45', '2500', ''),
('F22', 'LED-22-00-0-256', 'D?tecteur de Pr?sence PIR 120? Mini', 'D?tecteur de Pr?sence PIR 120? Mini', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '17,68', ''),
('F22', 'LED-22-00-0-257', 'D?tecteur de Pr?sence PIR 160? encastrable', 'D?tecteur de Pr?sence PIR 160? encastrable', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '26,6', ''),
('F22', 'LED-22-00-0-258', 'D?tecteur de Pr?sence PIR 180? en saillie', 'D?tecteur de Pr?sence PIR 180? en saillie', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '23,6', ''),
('F22', 'LED-22-00-0-259', 'D?tecteur de Pr?sence PIR 360? en saillie', 'D?tecteur de Pr?sence PIR 360? en saillie', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '23,6', ''),
('F22', 'LED-22-00-0-260', 'D?tecteur de Pr?sence PIR 360? encastrable', 'D?tecteur de Pr?sence PIR 360? encastrable', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '38,48', ''),
('F23', 'LED-23-10-3-269', 'Ruban LED 1000mm 10W 220V 3000K', 'Ruban LED 1000mm 10W 220V 3000K', '10', '3000', 'N/A', '', '120', '220', 'N/A', '30000', '16', '8', '1000', '0,02', '-22', '45', '10,4', ''),
('F23', 'LED-23-10-4-270', 'Ruban LED 1000mm 10W 220V 4000K', 'Ruban LED 1000mm 10W 220V 4000K', '10', '4000', 'N/A', '', '120', '220', 'N/A', '30000', '16', '8', '1000', '0,02', '-22', '45', '10,4', ''),
('F23', 'LED-23-10-6-271', 'Ruban LED 1000mm 10W 220V 6000K', 'Ruban LED 1000mm 10W 220V 6000K', '10', '6000', 'N/A', '', '120', '220', 'N/A', '30000', '16', '8', '1000', '0,02', '-22', '45', '10,4', ''),
('F23', 'LED-23-10-R-272', 'Ruban LED 1000mm 10W 220V RVB', 'Ruban LED 1000mm 10W 220V RVB', '10', 'RGB', 'N/A', '', '120', '220', 'N/A', '30000', '16', '8', '1000', '0,02', '-22', '45', '10,4', ''),
('F23', 'LED-23-150-0-261', 'Bloc d\'Alimentation Universel NES-150 12V', 'Bloc d\'Alimentation Universel NES-150 12V', '150', '-', '-', '', '-', '-', '-', '-', '-', '-', '-', '#VALEUR!', '-', '-', '81,76', ''),
('F23', 'LED-23-150-0-262', 'Bloc d\'Alimentation \"Mean Well\" NES-150 24V', 'Bloc d\'Alimentation \"Mean Well\" NES-150 24V', '150', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '119,76', ''),
('F23', 'LED-23-200-0-263', 'Bloc d\'Alimentation Universel NES-200 12V', 'Bloc d\'Alimentation Universel NES-200 12V', '200', '-', '-', '', '-', '-', '-', '-', '-', '-', '-', '#VALEUR!', '-', '-', '84,72', ''),
('F23', 'LED-23-200-0-263', 'Bloc d\'Alimentation \"Mean Well\" NES-200 24V', 'Bloc d\'Alimentation \"Mean Well\" NES-200 24V', '200', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '149,72', ''),
('F23', 'LED-23-240-0-264', 'Bloc d\'Alimentation Universel NES-240 12V', 'Bloc d\'Alimentation Universel NES-240 12V', '240', '-', '-', '', '-', '-', '-', '-', '-', '-', '-', '#VALEUR!', '-', '-', '92,72', ''),
('F23', 'LED-23-350-0-265', 'Bloc d\'Alimentation \"Mean Well\" NES-350 24V', 'Bloc d\'Alimentation \"Mean Well\" NES-350 24V', '350', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '164,72', ''),
('F23', 'LED-23-45-4-369', 'Eclairage Lin?aire LED 40W 4000K', 'Eclairage Lin?aire LED 40W 4000K', '40', '4000', '4500', '', '120', '240', '80', '30000', '93', '60', '1195', '0,02', '-22', '45', '119', ''),
('F23', 'LED-23-72-3-273', 'Ruban LED 72W 60LED/m 5m et Bloc d\'Alimentation 3000K', 'Ruban LED 72W 60LED/m 5m et Bloc d\'Alimentation 3000K', '72', '3000', 'N/A', '', '120', '220', 'N/A', '30000', '16', '8', '5000', '0,02', '-22', '45', '74,12', ''),
('F23', 'LED-23-72-4-274', 'Ruban LED 72W 60LED/m 5m et Bloc d\'Alimentation 4000K', 'Ruban LED 72W 60LED/m 5m et Bloc d\'Alimentation 4000K', '72', '4000', 'N/A', '', '120', '220', 'N/A', '30000', '16', '8', '5000', '0,02', '-22', '45', '74,12', ''),
('F23', 'LED-23-72-6-275', 'Ruban LED 72W 60LED/m 5m et Bloc d\'Alimentation 6000K', 'Ruban LED 72W 60LED/m 5m et Bloc d\'Alimentation 6000K', '72', '6000', 'N/A', '', '120', '220', 'N/A', '30000', '16', '8', '5000', '0,02', '-22', '45', '74,12', ''),
('F23', 'LED-23-72-R-268', 'Kit Ruban LED 72W 60LED/m 5m RGB', 'Kit Ruban LED 72W 60LED/m 5m RGB', '72', 'RGB', 'N/A', '', 'N/A', '220', 'N/A', '30000', '16', '8', '5000', '0,02', '-22', '45', '88,96', ''),
('F23', 'LED-23-75-0-266', 'Bloc d\'Alimentation Universel NES-75 12V', 'Bloc d\'Alimentation Universel NES-75 12V', '75', '-', '-', '', '-', '-', '-', '-', '-', '-', '-', '#VALEUR!', '-', '-', '64,76', ''),
('F23', 'LED-23-75-0-267', 'Bloc d\'Alimentation \"Mean Well\" NES-75 24V', 'Bloc d\'Alimentation \"Mean Well\" NES-75 24V', '75', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '104,76', ''),
('F24', 'LED-24-120-3-305', 'Boitier encastrable triple 3x40W 3000K blanc', 'Boitier encastrable triple 3x40W 3000K blanc', '120', '3000', '14400', '', '120', '240', '80', '30000', '660', '220', '180', '0,02', '-20', '40', '403,5', 'R?cylum 0.'),
('F24', 'LED-24-120-3-306', 'Boitier encastrable triple 3x40W 3000K noir', 'Boitier encastrable triple 3x40W 3000K noir', '120', '3000', '14400', '', '120', '240', '80', '30000', '660', '220', '180', '0,02', '-20', '40', '403,5', 'R?cylum 0.'),
('F24', 'LED-24-120-4-307', 'Boitier encastrable triple 3x40W 4000K blanc', 'Boitier encastrable triple 3x40W 4000K blanc', '120', '4000', '14400', '', '120', '240', '80', '30000', '660', '220', '180', '0,02', '-20', '40', '403,5', 'R?cylum 0.'),
('F24', 'LED-24-120-4-308', 'Boitier encastrable triple 3x40W 4000K noir', 'Boitier encastrable triple 3x40W 4000K noir', '120', '4000', '14400', '', '120', '240', '80', '30000', '660', '220', '180', '0,02', '-20', '40', '403,5', 'R?cylum 0.'),
('F24', 'LED-24-40-3-276', 'Bloc LED Lanterne 40W 3000K', 'Bloc LED Lanterne 40W 3000K', '40', '3000', '4800', '', '120', '240', 'N/A', '50000', '440', '766', 'N/A', '0,02', '-20', '45', '449,04', ''),
('F24', 'LED-24-40-3-297', 'Boitier encastrable simple 40W 3000K Blanc', 'Boitier encastrable simple 40W 3000K Blanc', '40', '3000', '4800', '', '120', '240', '80', '30000', '220', '220', '179', '0,02', '-20', '40', '148,5', 'R?cylum 0.'),
('F24', 'LED-24-40-3-298', 'Boitier encastrable simple 40W 3000K Noir', 'Boitier encastrable simple 40W 3000K Noir', '40', '3000', '4800', '', '120', '240', '80', '30000', '220', '220', '179', '0,02', '-20', '40', '148,5', 'R?cylum 0.'),
('F24', 'LED-24-40-4-277', 'Bloc LED Lanterne 40W 4000K', 'Bloc LED Lanterne 40W 4000K', '40', '4000', '4800', '', '120', '240', 'N/A', '50000', '440', '766', 'N/A', '0,02', '-20', '45', '449,04', ''),
('F24', 'LED-24-40-4-299', 'Boitier encastrable simple 40W 4000K Blanc', 'Boitier encastrable simple 40W 4000K Blanc', '40', '4000', '4800', '', '120', '240', '80', '30000', '220', '220', '179', '0,02', '-20', '40', '148,5', 'R?cylum 0.'),
('F24', 'LED-24-40-4-300', 'Boitier encastrable simple 40W 4000K Noir', 'Boitier encastrable simple 40W 4000K Noir', '40', '4000', '4800', '', '120', '240', '80', '30000', '220', '220', '179', '0,02', '-20', '40', '148,5', 'R?cylum 0.'),
('F24', 'LED-24-40-6-278', 'Bloc LED Lanterne 40W 6000K', 'Bloc LED Lanterne 40W 6000K', '40', '6000', '4800', '', '120', '240', 'N/A', '50000', '440', '766', 'N/A', '0,02', '-20', '45', '449,04', ''),
('F24', 'LED-24-60-3-279', 'Bloc LED Lanterne 60W 3000K', 'Bloc LED Lanterne 60W 3000K', '60', '3000', '7200', '', '120', '240', 'N/A', '30000', '440', '766', 'N/A', '0,02', '-20', '45', '538,84', ''),
('F24', 'LED-24-60-4-280', 'Bloc LED Lanterne 60W 4000K', 'Bloc LED Lanterne 60W 4000K', '60', '4000', '7200', '', '120', '240', 'N/A', '30000', '440', '766', 'N/A', '0,02', '-20', '45', '538,84', ''),
('F24', 'LED-24-60-6-281', 'Bloc LED Lanterne 60W 6000K', 'Bloc LED Lanterne 60W 6000K', '60', '6000', '7200', '', '120', '240', 'N/A', '30000', '440', '766', 'N/A', '0,02', '-20', '45', '538,84', ''),
('F24', 'LED-24-80-3-289', 'Boitier encastrable double 2x40W 3000K blanc', 'Boitier encastrable double 2x40W 3000K blanc', '80', '3000', '9600', '', '120', '240', '80', '30000', '440', '220', '180', '0,02', '-20', '40', '268,5', 'R?cylum 0.'),
('F24', 'LED-24-80-3-290', 'Boitier encastrable double 2x40W 3000K noir', 'Boitier encastrable double 2x40W 3000K noir', '80', '3000', '9600', '', '120', '240', '80', '30000', '440', '220', '180', '0,02', '-20', '40', '268,5', 'R?cylum 0.'),
('F24', 'LED-24-80-4-291', 'Boitier encastrable double 2x40W 4000K blanc', 'Boitier encastrable double 2x40W 4000K blanc', '80', '4000', '9600', '', '120', '240', '80', '30000', '440', '220', '180', '0,02', '-20', '40', '268,5', 'R?cylum 0.'),
('F24', 'LED-24-80-4-292', 'Boitier encastrable double 2x40W 4000K noir', 'Boitier encastrable double 2x40W 4000K noir', '80', '4000', '9600', '', '120', '240', '80', '30000', '440', '220', '180', '0,02', '-20', '40', '268,5', 'R?cylum 0.'),
('F26', 'LED-26-00-0-309', 'Rail triphas? 1 m?tre blanc', 'Rail triphas? 1 m?tre blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '30', ''),
('F26', 'LED-26-00-0-310', 'Rail triphas? 1 m?tres noir', 'Rail triphas? 1 m?tres noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '30', ''),
('F26', 'LED-26-00-0-311', 'Rail triphas? 2 m?tres blanc', 'Rail triphas? 2 m?tres blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '60', ''),
('F26', 'LED-26-00-0-312', 'Rail triphas? 2 m?tres noir', 'Rail triphas? 2 m?tres noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '60', ''),
('F26', 'LED-26-00-0-313', 'Rail triphas? 3 m?tres blanc', 'Rail triphas? 3 m?tres blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '90', ''),
('F26', 'LED-26-00-0-314', 'Rail triphas? 3 m?tres noir', 'Rail triphas? 3 m?tres noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '90', ''),
('F27', 'LED-27-00-0-315', 'Capteur de Lumi?re Photo?lectrique', 'Capteur de Lumi?re Photo?lectrique', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '14,72', ''),
('F28', 'LED-28-00-0-316', 'Bobine adh?sif \"3M\" 33 m?tres pour ruban LED 220V', 'Bobine adh?sif \"3M\" 33 m?tres pour ruban LED 220V', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '53,32', ''),
('F28', 'LED-28-00-0-317', 'Contr?leur pour ruban LED 220V avec t?l?commande infrarouge', 'Contr?leur pour ruban LED 220V avec t?l?commande infrarouge', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '88,96', ''),
('F28', 'LED-28-00-0-318', 'Contr?leur pour ruban LED 220V avec t?l?commande radiofr?quence', 'Contr?leur pour ruban LED 220V avec t?l?commande radiofr?quence', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '80,08', ''),
('F29', 'LED-29-00-0-319', 'Support GU10 double sur rail 238?130mm blanc', 'Support GU10 double sur rail 238?130mm blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '56', ''),
('F29', 'LED-29-00-0-320', 'Support GU10 double sur rail 238?130mm noir', 'Support GU10 double sur rail 238?130mm noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '56', ''),
('F29', 'LED-29-00-0-321', 'Support GU10 simple sur rail 233?60mm blanc', 'Support GU10 simple sur rail 233?60mm blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '36', ''),
('F29', 'LED-29-00-0-322', 'Support GU10 simple sur rail 233?60mm noir', 'Support GU10 simple sur rail 233?60mm noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '36', ''),
('F30', 'LED-30-00-2-323', 'E14 C37 5W Filament 4000K', 'E14 C37 5W Filament 4000K', '5', '4000', '400', '', '180', '240', '80', '30000', '37', '37', '99', '0,02', '-22', '45', '15,36', 'R?cylum L'),
('F30', 'LED-30-3-3-325', 'E27 G45 3W Filament 2200K', 'E27 G45 3W Filament 2200K', '3', '2200', '300', '', '360', '240', '80', '30000', '45', '45', '73', '0,012', '-22', '45', '21,56', 'R?cylum L'),
('F30', 'LED-30-6-3-324', 'E27 A60 6W Filament 2200K', 'E27 A60 6W Filament 2200K', '6', '2200', '550', '', '360', '240', '80', '30000', '60', '60', '105', '0,014', '-22', '45', '18,5', 'R?cylum L'),
('F30', 'LED-30-6-3-326', 'E27 G95 6W Filament 2200K dimmable', 'E27 G95 6W Filament 2200K dimmable', '6', '2200', '550', '', '360', '240', '80', '30000', '93', '93', '132', '0,02', '-22', '45', '26', 'R?cylum L'),
('F31', 'LED-31-12-3-330', 'Ampoule LED PAR38 12W 3000K', 'Ampoule LED PAR38 12W 3000K', '12', '3000', '1160', '', '60', '240', 'N/A', '30000', '121', '121', '140', '0,02', '-22', '45', '38,28', 'R?cylum L'),
('F31', 'LED-31-12-4-331', 'Ampoule LED PAR38 12W 4000K', 'Ampoule LED PAR38 12W 4000K', '12', '4000', '1160', '', '60', '240', 'N/A', '30000', '121', '121', '140', '0,02', '-22', '45', '38,28', 'R?cylum L'),
('F31', 'LED-31-12-6-332', 'Ampoule LED PAR38 12W 6000K', 'Ampoule LED PAR38 12W 6000K', '12', '6000', '1160', '', '60', '240', 'N/A', '30000', '121', '121', '140', '0,02', '-22', '45', '38,28', 'R?cylum L'),
('F31', 'LED-31-7-3-327', 'Ampoule LED PAR30 COB 7W 3000K', 'Ampoule LED PAR30 COB 7W 3000K', '7', '3000', '680', '', '60', '240', '60', '30000', '95', '95', '100', '0,02', '-22', '45', '32,44', 'R?cylum L'),
('F31', 'LED-31-7-4-328', 'Ampoule LED PAR30 COB 7W 4000K', 'Ampoule LED PAR30 COB 7W 4000K', '7', '4000', '680', '', '60', '240', '60', '30000', '95', '95', '100', '0,02', '-22', '45', '32,44', 'R?cylum L'),
('F31', 'LED-31-7-6-329', 'Ampoule LED PAR30 COB 7W 6000K', 'Ampoule LED PAR30 COB 7W 6000K', '7', '6000', '680', '', '60', '240', '60', '30000', '95', '95', '100', '0,02', '-22', '45', '32,44', 'R?cylum L'),
('F32', 'LED-32-00-0-333', 'Douille pour ampoule GU10 avec connecteur c?ramique', 'Douille pour ampoule GU10 avec connecteur c?ramique', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '1,68', ''),
('F32', 'LED-32-00-0-334', 'Kit de suspension pour Panneau LED (4)', 'Kit de suspension pour Panneau LED (4)', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '14,72', ''),
('F32', 'LED-32-00-0-335', 'Kit en saillie pour Panneau LED 1200x300mm', 'Kit en saillie pour Panneau LED 1200x300mm', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '59,28', ''),
('F32', 'LED-32-00-0-336', 'Kit en saillie pour panneau LED 1200x600mm', 'Kit en saillie pour panneau LED 1200x600mm', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '83,04', ''),
('F32', 'LED-32-00-0-337', 'Kit en saillie pour Panneau LED 300x300mm', 'Kit en saillie pour Panneau LED 300x300mm', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '34', ''),
('F32', 'LED-32-00-0-338', 'Kit en saillie pour Panneau LED 600x600mm', 'Kit en saillie pour Panneau LED 600x600mm', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '36', ''),
('F32', 'LED-32-00-0-339', 'Collerette carr?e 145?145mm', 'Collerette carr?e 145?145mm', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '145', '145', 'N/A', '0,02', 'N/A', 'N/A', '8', ''),
('F32', 'LED-32-00-0-340', 'Collerette carr?e 170?170mm', 'Collerette carr?e 170?170mm', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '170', '170', 'N/A', '0,02', 'N/A', 'N/A', '10', ''),
('F32', 'LED-32-00-0-341', 'Collerette ronde ?145 blanche', 'Collerette ronde ?145 blanche', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '145', '145', 'N/A', '0,02', 'N/A', 'N/A', '8', ''),
('F32', 'LED-32-00-0-342', 'Collerette ronde ?170 blanche', 'Collerette ronde ?170 blanche', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '170', '170', 'N/A', '0,02', 'N/A', 'N/A', '10', ''),
('F32', 'LED-32-00-0-349', 'Alimentation pour rail blanc', 'Alimentation pour rail blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '10', ''),
('F32', 'LED-32-00-0-350', 'Alimentation pour rail noir', 'Alimentation pour rail noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '10', ''),
('F32', 'LED-32-00-0-351', 'Connecteur angle blanc', 'Connecteur angle blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '10', ''),
('F32', 'LED-32-00-0-352', 'Coude en T pour rail blanc', 'Coude en T pour rail blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '24', ''),
('F32', 'LED-32-00-0-353', 'Coude en T pour rail noir', 'Coude en T pour rail noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '24', ''),
('F32', 'LED-32-00-0-354', 'Coude en X pour rail blanc', 'Coude en X pour rail blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '32', ''),
('F32', 'LED-32-00-0-355', 'Coude en X pour rail noir', 'Coude en X pour rail noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '32', ''),
('F32', 'LED-32-00-0-356', 'Coude flexible pour rail blanc', 'Coude flexible pour rail blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '20', ''),
('F32', 'LED-32-00-0-357', 'Coude flexible pour rail noir', 'Coude flexible pour rail noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '20', ''),
('F32', 'LED-32-00-0-358', 'Embout de fermeture pour rail blanc', 'Embout de fermeture pour rail blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '2', ''),
('F32', 'LED-32-00-0-359', 'Embout de fermeture pour rail noir', 'Embout de fermeture pour rail noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '2', ''),
('F32', 'LED-32-00-0-360', 'Jonction en ligne pour rail blanc', 'Jonction en ligne pour rail blanc', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '10', ''),
('F32', 'LED-32-00-0-361', 'Jonction en ligne pour rail noir', 'Jonction en ligne pour rail noir', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '10', ''),
('F32', 'LED-32-00-0-362', 'Support simple pour tube n?on LED T8 1200mm, sans starter ni ballast', 'Support simple pour tube n?on LED T8 1200mm, sans starter ni balla', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '12', ''),
('F32', 'LED-32-00-0-363', 'Support simple pour tube n?on LED T8 1500mm, sans starter ni ballast', 'Support simple pour tube n?on LED T8 1500mm, sans starter ni balla', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '15', ''),
('F32', 'LED-32-00-0-364', 'Support simple pour tube n?on LED T8 600mm, sans starter ni ballast', 'Support simple pour tube n?on LED T8 600mm, sans starter ni ballas', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '10', ''),
('F32', 'LED-32-00-0-365', 'Support simple pour tube n?on LED T8 900mm, sans starter ni ballast', 'Support simple pour tube n?on LED T8 900mm, sans starter ni ballas', '-', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '10,4', ''),
('F32', 'LED-32-18-0-344', 'Driver dimmable pour downlight slim 15-18w', 'Driver dimmable pour downlight slim 15-18w', '18', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '29,56', ''),
('F32', 'LED-32-200-0-346', 'Variateur de puissance 200W avec t?l?commande IR', 'Variateur de puissance 200W avec t?l?commande IR', '200', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '65,2', ''),
('F32', 'LED-32-20-0-343', 'Driver dimmable 1-10V pour projecteur orientable 5 ? 20W', 'Driver dimmable 1-10V pour projecteur orientable 5 ? 20W', '20', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '51', ''),
('F32', 'LED-32-300-0-347', 'Variateur de puissance 300W avec t?l?commande IR', 'Variateur de puissance 300W avec t?l?commande IR', '300', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '74,12', ''),
('F32', 'LED-32-40-0-345', 'Transformateur dalle dimmable 1 ? 10V 40W', 'Transformateur dalle dimmable 1 ? 10V 40W', '40', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '72', ''),
('F32', 'LED-32-600-0-348', 'Variateur pour dalle 1-10V 600W avec t?l?commande IR', 'Variateur pour dalle 1-10V 600W avec t?l?commande IR', '600', '-', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '0,02', 'N/A', 'N/A', '61,84', '');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Login` varchar(250) NOT NULL,
  `Password` varchar(750) NOT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT '0',
  `Token` varchar(750) NOT NULL,
  `time_end_token` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`ID`, `Login`, `Password`, `Admin`, `Token`, `time_end_token`, `last_timestamp`) VALUES
(1, 'toto', 'tutu', 0, '9f5d85a966b60b6d7fb4a93a5fa3c0d0028fda8880e6366efd', '2017-07-04 17:10:54', '2017-04-07 12:43:37'),
(3, 'pierrot', 'pierrot', 1, 'adcc246aca8ddadb1044388117903f8af2fe567a9e3cb0027f', '2017-07-05 15:48:34', '0000-00-00 00:00:00'),
(4, 'robin', 'robin', 1, '50deace28cdc11e69c57750fe456162a445d2b49e8454dfeb6', '2017-07-05 21:04:43', '0000-00-00 00:00:00'),
(43, 'adresse_mail@gmail.com', 'mail', 1, 'bb2c0eb967b7fbccf42974f06c2baf1181920451604734d767', '2017-07-02 13:57:14', '0000-00-00 00:00:00');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `devis`
--
ALTER TABLE `devis`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `devis_article`
--
ALTER TABLE `devis_article`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `devis_promo`
--
ALTER TABLE `devis_promo`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `panier_article`
--
ALTER TABLE `panier_article`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `user_and_article` (`ID_User`,`ID_Article`);

--
-- Index pour la table `panier_promo`
--
ALTER TABLE `panier_promo`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `user_and_promo` (`ID_User`,`ID_Promo`);

--
-- Index pour la table `promocode`
--
ALTER TABLE `promocode`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `remise_et_commission`
--
ALTER TABLE `remise_et_commission`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT pour la table `devis`
--
ALTER TABLE `devis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `devis_article`
--
ALTER TABLE `devis_article`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT pour la table `devis_promo`
--
ALTER TABLE `devis_promo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `panier_article`
--
ALTER TABLE `panier_article`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
--
-- AUTO_INCREMENT pour la table `panier_promo`
--
ALTER TABLE `panier_promo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT pour la table `promocode`
--
ALTER TABLE `promocode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `remise_et_commission`
--
ALTER TABLE `remise_et_commission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
