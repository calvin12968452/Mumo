-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 
-- 伺服器版本: 10.1.16-MariaDB
-- PHP 版本： 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `mumo`
--

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `cid` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  `info` text NOT NULL,
  `ammount` int(5) NOT NULL,
  `ava_time` datetime NOT NULL,
  `exp_time` datetime NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `gift`
--

CREATE TABLE `gift` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `recid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `goods`
--

CREATE TABLE `goods` (
  `gdid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `info` text NOT NULL,
  `popval` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `grop`
--

CREATE TABLE `grop` (
  `gid` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `message`
--

CREATE TABLE `message` (
  `mid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `content` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `movie`
--

CREATE TABLE `movie` (
  `moid` int(11) NOT NULL,
  `name` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `music`
--

CREATE TABLE `music` (
  `muid` int(11) NOT NULL,
  `name` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `news`
--

CREATE TABLE `news` (
  `nid` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `targid` int(11) NOT NULL,
  `info` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `account` varchar(255) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `userName` varchar(255) CHARACTER SET big5 NOT NULL,
  `userEmail` varchar(255) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `password` varchar(255) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `repassword` varchar(255) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `gender` varchar(255) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `photo` longtext CHARACTER SET latin1 NOT NULL,
  `info` varchar(255) CHARACTER SET big5 NOT NULL,
  `popval` int(11) NOT NULL,
  `money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`uid`, `account`, `userName`, `userEmail`, `password`, `repassword`, `gender`, `photo`, `info`, `popval`, `money`) VALUES
(5, '5566123', 'Tino', 'asdadasd@asdasda', 'ad5566123', 'ad5566123', 'Male', '/9j/4AAQSkZJRgABAgAAAQABAAD/7QCEUGhvdG9zaG9wIDMuMAA4QklNBAQAAAAAAGccAigAYkZCTUQwMTAwMGFhNTAzMDAwMGQ0MDYwMDAwNzQwYjAwMDA1MzBjMDAwMDI5MGQwMDAwZDcxMTAwMDBlNzE5MDAwMGI4MWEwMDAwZTAxYjAwMDBmYTFjMDAwMDRmMmUwMDAwAP/iAhxJQ0NfUFJPRklMRQABAQAAAgxsY21zAhAAAG1udHJSR0IgWFlaIAfcAAEAGQADACkAOWFjc3BBUFBMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD21gABAAAAANMtbGNtcwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACmRlc2MAAAD8AAAAXmNwcnQAAAFcAAAAC3d0cHQAAAFoAAAAFGJrcHQAAAF8AAAAFHJYWVoAAAGQAAAAFGdYWVoAAAGkAAAAFGJYWVoAAAG4AAAAFHJUUkMAAAHMAAAAQGdUUkMAAAHMAAAAQGJUUkMAAAHMAAAAQGRlc2MAAAAAAAAAA2MyAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHRleHQAAAAARkIAAFhZWiAAAAAAAAD21gABAAAAANMtWFlaIAAAAAAAAAMWAAADMwAAAqRYWVogAAAAAAAAb6IAADj1AAADkFhZWiAAAAAAAABimQAAt4UAABjaWFlaIAAAAAAAACSgAAAPhAAAts9jdXJ2AAAAAAAAABoAAADLAckDYwWSCGsL9hA/FVEbNCHxKZAyGDuSRgVRd13ta3B6BYmxmnysab9908PpMP///9sAQwAJBgcIBwYJCAgICgoJCw4XDw4NDQ4cFBURFyIeIyMhHiAgJSo1LSUnMiggIC4/LzI3OTw8PCQtQkZBOkY1Ozw5/9sAQwEKCgoODA4bDw8bOSYgJjk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5OTk5/8IAEQgAuAEUAwAiAAERAQIRAf/EABoAAAEFAQAAAAAAAAAAAAAAAAEAAgMEBQb/xAAYAQEBAQEBAAAAAAAAAAAAAAAAAQIDBP/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/9oADAMAAAERAhEAAAHuEkJJCSQA5uAcCIgWIpEYlVqjkURugyY2zg5UnVLk4k6uKtHq25ZArzUksjYqyXK1iDFRYpejY v1mRo4GszrpJtNIwRa4TSbCEgoJUm1Irc8yljEtZzEkOa/S/r4GxdbttlW2Y1Zbl0dJ5ZrOg56lVEHYQ4VPSTT5fqLneTVrZDTgS0wS1U4AiQAuY6HDywKV6Jio6SAhM6sF2jsaurdgaV30p7KkkdaGVehGWbavOSKtvYl3n6FZ7Pax85cbuwQWsbiq3Odl3TPclzVqLWMka4rDxOwqHKQ71G4zaetBZns1m2UOhodAkta3MZdx4ZilcyQsayJHQntzsMunh7KtPXm1MG/JJnUs8SmlVllIrMALIAsUEnNJu5VmjvnXfFYmszJ24ZcU3hrMPSwW7yfYrvmEJopHRzxrXngnRoEfrxqoM8XvlcwWTGIujwn2sEzma6spIHTJiAzBiFs4SATizHZtV7oUtOCTJnvyVRZosnPNF uRClZ1uWERTlYgdD1z1ijPLuVEwr6VKfz iZ/O2OmNpQO1iVZWnY5NQ4BBAQkhSCEiSCJKpbaGdowBXnAypazqNsNm5rCVdOeiGrHWVocQwUZ PpbNGzj10zj6PTnn6VXQ5aydzM0vTxKC6cSKPM29oIZWSEozTNn47bNW1LnOPpA8uuNbZZaZIKXn62zQ0PT54VIPR57LmnRyCRuFvNl5ixvsm du6TM7pzxLh3uS59nnL6jd7/HHjatPrz0n1rGCexnPpBWLfP7tJ2Tc3zgbQv41TtUKe87cUJ3jTz5pNYyoNZl56xYbHujKOTSr00K5oEOyTFPTj9lkZ6dHLTvXjnlc924dHca3n0dSsx5c3pHTdsmDQnc8eTWMQSSG5YSAAthqSLLmO0L2FCWpXJpUhADXganIVO1gTWrJzzs9tyPD3tcrJBvMBwVjnKQIixIITXBWhzYaEInfG/UcWkJCUlpUggSCQoFQ1wRgcgFFCkBIIKSAkAAgQQVNLZWoI//xAArEAACAgICAQMDBQADAQAAAAABAgADBBESEyEQFCIgMDEFIzJAQSQzQlD/2gAIAQAAAQUC 8R50fQ7nmE6CsrTY2lu7OwMz5I13ca8Yk3ZlhrFZ/b8vLwAaSOxmLTQD/07yeqnOGr IAved7JK8mzntPbKOUqVRblI1gYftV KMpotdvJp/wC/RvCm5lem1m wPrtyVlgAAuPE3bIblDxhJMrvIXC8Pe6iXECuslq K7ssAjGcttwPpcdJyUthrtPuE6HajjK4h /z2kmzWlczsnPQxvlKSvZkslorHJOxVV7/ACTOKxrq1PvqhC40bdV25JsbCs 9mbV7Iazr5LPBieG2OXAlKWMw/LceMssZSrk1M3B1exxq11urYTHo3Vyci215/v6dw4jzD N/asLAXZmoW5zameYRsoDGTzMauY/g5XuNH/qZfBfTB/NSnrGOdirQFRByLXMoVXfAsUW7Es2RUtlcZsgjIF4IbMijLI45c1lz/lzeZOeZHuzALFs2ajOLbPHW/JfQDNKvLY4 NJ0LGct1uZw PSsCqs/0GDzLSr13V7XFqK5KftHtZ49y8Mf5VUIvHJXkKgaacQfs/RuNuOzCW22iHIyZ77J177JnvrZ7y2LlPyRzoOJsCG2dk5idkstUAGb8PUSgx9npVSf09tnFNdihLJXStY1of61QsNa8QJr0bwDagltnBHyo2QJ1lpfjsAUMOxB5lA3ankLNw i fRvxP838QRHYcOYlq9hReM2JyEbe9rNwFpym5Y3wzMSy63qb2zUPGx3lnarbvJZNzpdoKHR8IIiIf20YcQRp4fyv4MsPgR4sH5Yeu5yE3N/RqanETQmpqampjWGyyyxq7/lLXZYttjrjs9lP7k28e2PbqVZGx2iWEMOxhLWXdbfLlNkrppwacDOudc4LOImhND6NTU1NTU4iNj1MeIEfHqsi49agVgDjOMKR6vHt7i5p B7IfEt/moG4/wDAnS03WFlYNFZWP9nYMIEKpuGHzOgMxrHKw81TS5VoL2Vn4uwRac1LbPvZFoprxcnvMe6us72G7OJXkg V/wBAhXZf PyVDrnS3ai/m1BdWETHOSzdVYuqf7OVeyPRa5sl9QtWkA5EvrG8NSKLk3PiiVcPXfpszZmTbzK8rG518cO1bKq3PHHs5S0dk4/CsfveuZd00Jffupuyv1vTRrfeTP8AH0IPA6 ycmAT N54O9jox36AfRqE7tSo2SxhjJY3uYjOsuyWlbFrbTxWr8eltYcPxEQBU9E/Nx29dSrK/KtsI1ysnLmovNbUC0xL/Io27XVarttSW2nl9PETjDWpJqUzgqraHrrxVSmu64ax22kEZjy6w1it6s3Adnbdjnd9VrchYdr mr3WZKIqXZCr7m7l0hwmNxgWxYNxqUJ 0XrEzMQXri4Vtl5anFRX5Tcufrdb0E3ub9MtOzHwLgr47ay8Tl0ri2KbKL2hpLXATX9DKt4lMhVhy8hioe25AYE8ZKdlOIWyLUXsLeDGgxEbI9uvYq8T/UImpqa9LbTXFv22qkbIzAoqbY9eV2/kT/Zz0sZqlyUj05DxcWwNWmh/9L//xAAkEQACAQQBBAIDAAAAAAAAAAAAARECAxAhEhMgMDEEIkBBUf/aAAgBAhEBPwHxSSLvXjQ2SLGhi72syT2SThe8JZ2bGmQyMNpHI5EmzkQhLZBGdkld2pPRRcb9msXEI2bzwFSpFCOaOojqlVypk5kTHsgSY1/GS8SRsqt/tHSZDXj4MqpjMlL0ciumR0UtFyiMKmcq39S3RLKrUjtohIvbIynAq2K4UsvesUfKhMor5oXvEfaR1juI6o7ndIojZKSI5FfxWqvqKz08K5o5sdTxPipqg6qKq5xP5P8A/8QAJBEAAgEEAgIDAAMAAAAAAAAAAAERAgMSIRAgMDETIkEEMkD/2gAIAQERAT8B8LZkIZ C8kjniOV0yE GSSSZeOB6RI2KCSUfUWJog12VHH4b4SGjRjJRbp/SqhL0Q scL0YmGhU9I7yT1b0U3pcGa8jqQtj5qto GNyU/WWfLVOym6m465ou3MEK/o d/gqnU4qLCa99WiC//U/jT6fDslVOJUpQrfoS1DKLWJTZSZgiO P7yrutlVeXGM8R5YI/1//EADYQAAEDAwAHBgQFBQEAAAAAAAEAAhESITEDECIyQVFhEyAwcYGRIzNAQgRicpKhQ1CDorHR/9oACAEAAAY/AvGnuyrQVlOZMkKGnGUaeCbF3uQJMy2Vuyg50CyvZvJCyLsW9Fs2HND6Q0m6p0gPmq9BInkiASt66PCVLsSm6SLFwjyVuDYQa1ZwE2OapGUwufsg41enc2Xzfirt8emxCLqpjmvugqFhTN0LzHBN0ejNzk8l1LZW8fRFDg1OsgBcoytkTZb59NRXGFP88/GIqhbLpWFixRRWEIATfQlE8QFu4UvuVGSiHT5BANFI6qXGT1Rly4lSLqohCYsVDXbPLxnWJ8lu06zzRMamnDUBhqeIgWRB2uSI/gLAaETTUU4uEO5IEuTQBMq6sKvJRccNQxUsRqx4VmyiKdpXwsLMLKhZCiZagTwT4EmycWuDQOS6ytD1Vk4UyUBQZRMjmoqK H Ip6IsfSW/8VBwQUBTGqAYT6n1jgtkD F8N0 oW7/sFNULfW8uC4ey3R7L5Y9lJ0WVurBCNr89UDUJUlPPUJ 1Y8FT9qbMWXErZA7m9/KvpbzaUZ5LIlAV8VS6oiIJTx9qnivRbTLkod7JW85W0jl8xyPxCvmf6hfMH7Av6Z/xhAdnob/kV26P0atxvst1vst0LdC3Qt0LdvrAB6IFxkRCqEzELeGU02jzRa4bytx1zFlTw7kq72A9XIOG1PIr5Z91uOVlKjV1Q8D1GoI6jqF4CzqyhS6OayshZbrKrbOAtGyDLeiwfZYRox5qH48wv/YXD3CB2f3BOqc2fPUVkawih oI6nLCP0OVpdvBgS5EO0x4QJyt4 6ce0MQhBtSfdB1Wei 39q3R 0LdHsiaQY5BboHqtwIWwUULcNcrB15WdWPElzAT5Ky2mgqA0KB3NkCrqjVTBM2Wy2/VXRnVgaiiV8Smk4IViiA4H6qxVwEZ7kvJcORwhRYDgnsGYTCLHBT6nOAG7BhDj1RccBUQQTjx6ii2mCL6oc CpyEXBxqnHBdFUMAQY72SnHdDbKpxu6IUmKwi4bwKJCcyc8ljC FvusEzac6TtT4TdHoxtu5o6PSRMTI1CoSAZRdGBGp9UbRTGlS1UwqG579BqgFdq8w1qdpo6DqnFgAfx6p737InBRfzC2m9QhJvlWFh3C4Zwi9rzzTX8xPcrgTEXQsDnGoLGUUHOgpwjChy6JpZoX34wpWO88GXDkcIjap6oBmeSY6aHYLXYTKYNoPJNHZm5iydtXapc6ETz1irgZQFLQEA3A7lPOyfTlCE7nlb0eas667N0h3DipIj9SOjcz1CLu3jRcoVLSXHzXxhU3oth8N6 BgSrtCpAspGTjoiXGlz BKpqZ5kreB8tZCmFHDWXEwAgOV1pgqRzhCrKe7SPjRzYBdloWjyW1op6hfEa4DyhA3C2dI8eqs4eyupp8PqpZHaf8AVQ5haBkqAAOgU6h1W8E08763tGUGuzML8Q3kE52C8khSNMZCvpV2lNPCB9EGxZWZpHdF8uhirvGqSURG0MSqCIYN5VYbgKNbHRxT3fe5qLeX1U/ahe/VWEVul3VQ0qZue5PaX6tUuMn6oUiQuPqVtO9l X 6f//EACgQAQACAgIBAwMFAQEAAAAAAAEAESExQVFhEHGBIJGhMLHB0fDx4f/aAAgBAAABPyH9St iWCaqbtehyTqB/rDZYIDaCalL3CVOhM1LWniYkyqbnHmNF dssbXtVVnRAlC r0PmctAWjxAtfA7 83o5aliCt1cDH9Eer3k/YmJbpVduofq/f1v0uAWimPMoLfR2hE1TLrMkTzyMauCP9UbQ3Galwc7UNfEMg9v2D9oK1wDrMqhvlXUYK0p/aWzWf5QW010cQQ9JrFl94v8AjzL9GIrRKBh8G/mdTXVjj9BX9V1Lq1mPb4g55bQuXPhIaiFtTbNyr1RFory7Zua6NGwHyX4IDmRpcu5ZrZpIrbBVH/k/BRtzAmAU1 COWgbQhAkB2zPxOTgguzfYHoFrUUcBbHWo5NSnA/d6v6QIupXFhfiZrzY5sbL5/EogpqxFzF5lEY1thTYXVsuwjeMYjz4u h9pVPBa6lDGXtXmdtFF8HUxXAuDjMDkL PuWIfZ7HiUfMuMdCLCvzHArzBMuHsZrt Zgr0AY957l7F16sqV9VSvQcorw1cy1q55mUxmGGl IN9HpmWB8KmQUF9wWES8zdWpyOXHcJpRhe7ee40mWlUKojJznZXEScFaHcqVdS7gHamum5dMDeCW1MW0WysTm2UmZsesGSrbND5uL86NxUyvdLirLxC20S5f1XLlq 9g6waaEhb9lcyjWPi4uWpOpXYv7TCwX3lob634jiu9l rbAeYhDIjGpgJVvJPebLq2WIe57ZwS5wWNgLKhXe6mLbPl1/UKoEwf8uJf4zhKgzhQw9DK9Be0iW0LgfljfUvGM2dTDgvmA1wdiFR/P4SfZRUgPF96lPb4Jff7CPmfCU8sbVfKISrWaGZdM Z1LW4gA2mNo6E 0/dDmUlw9rBT0vmYWXAfmHMDfIEvn7RxwZ31cFQcdDudjYzSiL6F5bxGmVIUmmdw2Aa27W//ACBiEHm9lSgJ2239pRDPHOKwx9rAE7gb9tQfzKwmRnEHIaUeN9gv4P5gFBQq6lS/EvMs8x906g Zwt8zOHo73B/3z8BtEzVX5/om0trun9o8z70F2G1DWBwcNXljihH/AAfSlRFH/WWYDgOe0IByXUEC24fE2rLxBBsgBVpr8QqGhZPEXdry2xIOewFx/wBmCkAKeKqNNrZXmAoACVet4mGHTEwSzhXo9kqcYsfqvXVTBAAWNH3my4OmfJM vGcxFX8wlwHOIH iM tJcSjEzL/kHdz7wf4xqnEp4f2EL34i/YngYZrSmE9yNpATzs/qE7z J5vxKIvpcjTZ1ACj90Rxf5mR2/7mHkfeU7PvEw7rELjSrXUowwBy6n/ov9Tgt Iaiq9s2S39qNpZ3b 0Gup5lfQj9jmBoKqGXFQLUmwlls9OEeN IMsTFq/ExYaMnpqK0zxMq06v8x0EeO5V4VA9vvD3le/oK4MM8fj0gPEu4v4lXR7E H2nvlu4LMLCgoP4YQGWjwscvHzLvV/s5qTOhazjS7jptS2W2/33myQZs7IhGl 4le/jgmLH3MGr88QGF53w/n2i19/bM4BuM/ENAQ1zuk0e7Jfoj2Isf4g39EOhh4/vL8iB7/BDzPzCOrieBmOpR1KJTqUlJSVnjnmViIEDA4I5bvaSnIe0pwB4xF 8TPYiWS8OH4l432TVRi VOoWGbEhYR8uiBCD8xosi xOcaLqYQB BD7uIoINg69b9LlnmX7 ly5f1fPrcfWokLFD7MTse5HYt33Li5dwaZr3iFwZVSc HQwx0dY78zbaUQoT2 0vqUtSqt/e5ZmaGVzH5oLYc78c/p1K9XRW3QXtloU1Ok9K5OiFIUmRJYKBAzQXf2j3Njq/aGynJOWq/mVMN62wHfEu5hEsqxTGFg2Dzi4LsQpN5gOnstw2S1Guoi6DY/ESqAb4TK80Krv2nDLCx 7LhpINM9e303Ll orEr6BLSuFre/Tjhp8VBQxW1 SVesy 8w2cUVMfuHfBc7BeG5gk1VAamdKsmqiMT2i/MvuHFr0r494Vh/wDJUcKFQuRDf UQuXKMmT85TiZBRS18s6DEKIGipRk8izHedy/f7ej7gQeJaBrRcQR8B095XknySplDi6nm5jmLkPaBcvBxME0Wa9yPrURY7ozEmxgGXpslxjI31GRlYdB ZkwS Opb/wAwD39L9EROZTPR JdBkwcZdBRHpKnNrC3khWDFky9oHe0LcupvQhYaz/yWjDqybm7XrVSyqPcsi1ycZmuao9VjMk1kxv5jmRBlXMwgceblA6Un4MKOkFN7LlCt0gl9pbpzei/EoTlRLQDNVv8AU0JuKtLUXu/nCi6jAs7YQ9angIDqHlYaUheR8TFPwmS69GB1rtDeJg3bRh8beVy/QpGpeLTMpQeoSAFq8SmyzheIAqZ7z9yVwpesm/mUBi1GU/iBSCqBqJC7WFjW7BVkLJfZnMt2h4jMs96QV5vMsQXBly5cuDLly41AQaPIiSv7Kizf8xo8dwAd0BuULgLmuoQaUxhc4sduZbiOj8 i42xCzzWZhMVC7lkdl/EwpvV0aP2hDgiyWrd4rDAVLAGgjnoA9X6b m4yyLrmoDlOAsGHnO2bVdlYYnfHRFKvno3AhMinBKQtRRW5l2GXMiPlGK1EhDhvBX qMg2qoQlelfQyofVfrUF4gJSU6hOaPJ6hhxtgFLLAMYCHwVOuJmNsiwfQabMPDO70ooqAgi7QqV9b6j6HrcuXLl jM jLt6nB3MkFteGI6YNDTssriB jf0PoMGX9F/opKlSoH6Vy5foy5//aAAwDAAABEQIRAAAQ888zgvVQ6G4/lcIIIuNa8boJVOu/SFNSlkvXQJwZFqCzoRSxs3 I/wD0XC3dwa6pyCO9zCIavdBeLBTto1c 9/LA 4hBKHaiQHLmmZR3Ry5LuWW7g2tTUbINp5ICQ64dij5qw3DBHUR2IzGb5BAT73yCjXB5aAm/QER0bXZa85Tn598d86ZYspLcOBTYPy baFkfdYF8ZQKFLVNwFZTYaceDsP/EAB4RAQEBAAMBAQEBAQAAAAAAAAEAERAhMUEgUWGB/9oACAECEQE/EP3t5dE4nr1PY9n2Wzh8tbwSflW9kvNhOpbZb/Uuod8BZnON0cL3PaM9cPsOTr7Zl3yTPbokiDVlX8krobx6FlntO7PiUMBCuHuZalY2yCLDGLai7sPkjBJRaD219bGx5sdbL7T/AHk5z4XSSvtrakHLFmRoH2fNh0ttv2FMwSRclGM9W2/juHZMsvK25GQBCHSxJs6AbDELdpwniRLG039vRiekwCC9ROxwbZV1EdlE2PTIbslw2Mr/AMu4mA2GB0X9CQex2yZ8tJ64LeDxVaCMNYRF8y7x2/2MwwDpKO7eGtjbwOcbLwz6jDuz4WwzyXvWWGyyz9PDw8PJHP8A/8QAHhEBAQEAAwADAQEAAAAAAAAAAQARECExMEFRIGH/2gAIAQERAT8Q5fYjzksHHg1ds7MXVkvdsTwuNseS22S0YD7tEbBpDJep9sYmnCB7sMDJDYtH21PLZf2EbOs4W3G0nBDBjraM1I3LEtjVv0YEEc rS2zbIUJdZVMv0kXtLP27Z/xIUomZAPIP2yyTOWcWc2RiA8sss2AWWWQ9wSwo1OWF3 xkMHrQ7mwj5ZyW2lpxnAPWZjJd wZJto27sTuk7nU4I26409hHBu9L2haDAv0Q7 recgk5B3 zCBBrkzmWzJlCyBvku4FuPVpCfwslv8pazE6w53E8QI9izrIBZZ8WbOHCMcbn8vw58Lx//8QAJxABAQACAQMEAQUBAQAAAAAAAREAITFBUWFxgZGhELHB0eHw8SD/2gAIAQAAAT8Q/wDTxgh7mXU/B ACu7Xx I5LATrizaBiQ cMcwtgLN5sXdCD8sQlEqgs9jEvDSiOSqEsL0Of1xIgVBFOydzEd1ckX jPqc5BLuDCKw15K/riJlUoFUU6A/1jDVxroQOhr13vHqY2QQIvU8mj6w9yjIFQwOu3BKgE0Vd10fHzvFNgXQONAXy9U9sQFkEaAGs3P UxXR1OQndP1T0pjBFTgqUbXnn M3H1/wDbj04OhcvJvXX8OXw 8y Ph L6/Dkefh/Edz3xnp1BVdA9 2OLhsFUc0eun98fNogd517OzU 8uQDUiBEb3/0wrlIFRo627IdDFRkLICAUpwa t5sfDeIG4VP93ynKgBsmQ4E t7xrpQLobN7teuEK9kghEF8L27Zo EPQYFL1xFK3HuirfjJNJYBRKRZ01mjGnRUHk6x/T423Wn7coXs/sfxnuxxRQFUHXxkPCSUAIkVxPKfzXI0jITpevqflz4oac1Px3xZuqXifm/lBVQDavTOSBSC30VG4nT9sQSADQVJAdFPvo3BERBBFtRF/bNogSLFAlX sYiiWgUOj4fbIFYIEYSboce KgAgdR7nPuHOIUWYL1DuLjmrpNFQ17caMiggVKhYK8Fe ajKFulZNuVwn2yjU3Br0PT5MFsAEOCjPdwCBEFhGm Gd8HoFVADfKvGDUgEukK7Hrx0HBL10D7FfwgXemCv0mCaBgKpCivPquIAgqBEiA5j1d n54Y84cvF7fh4emUeEfRync f/AAgUBVyzYqEUgKodTXTGjZbV2nM3zX04xILDAwIGkvP9ZJAhAaPQHob65vbIAELN156/pkcEkIKhwHoemSjAACyd/X98CUSdCSFE67c2NrxBQ1QaL4DKEEAKpTNHde3TE5YAgA00nJrx7ORKH2DQgDiHb7zmixixUr0PVMuxA9GqAFb6TQe T7ZwReVBzp6p74rVA0QRV2HB7GAxgK2xqT1xCBHguEBZQQbOs7wvxhuyapWDcWdNfeC0RpYK8hqtOFyjWhlOzjYaVO77fnhkc8pxvEeKpWc/gxcfxHY Mjtik3ET5yaBgIIOFThU8cZJbyqJaoOni O/XpJ3LiSAT9s0SARIrLdvT2euGNUjsB6Rt2h1njEjAKIoPHPjLQAqoSO2dI/OLg1ACuy r65cBwHAFyOB8d8CoGopkFXQnfv1xTyIgAEB9LkZgFLCoUU3DwnvkRFQAqqwvEPDmzVAQKoi306BzqOK0yAvAER429 uFhjAyIpFPJ1XEkiUAV69r57Za1YNOEYnyYMGNKEV6dd9vnE6oUIpR6HcZ07Y6CFBVEu Ontm1DhCNbKMnV6nXHRSGBG/jEsQTRYLjtEwtYj6TnHhOuCpxPX8fBlcr4/AvAuXvBIkGzVPTvg1oGgyOtnP9YwzQCUVTYnXXW89MspIUAEvFjf341hmHKFod8ff/cklHkQXr5oZEQteIO4L0ntk8IIhr1aOp6425A6IBOGHf1zbgKAIgCPaB074l4EqAEgrwelys0ESBtK63tMY21kAFj1npgZilQ0BrQ8fJxjVEo63IqSd/XDmGAYO2NJzE /lOQKyABVtfXthpGyGoYGvUxPKqsQqtX7w2toKiDQ3fVwDYglA4L39ZxgerIoIoFe2bCAalqbS8NPvIsxQVCsv6D8ZV1cCorojm5ICeUW1eL69M3A7SMBeSrZjmMrRQ6CyiPnjAeX/ACUcTpp0oJOonfF7odAj9M0Ya5qz6xEAa7VseNYAUUEI7LkJsbpOvhyIauW2npBw8GtFT0vBv2mpmkEAY6XfPP1gA1iFCUXe3NXIrRZxHj2uInfG0czhQ/2sVURFXgl1t6BmzErRVpP9M0OdmlaCyPTWUUTUOgvUHPPXH5WEAKs6AeD6wTNcYRtJ2F9eN468sFKTzF8 MaGrAFF5b0fR cd6RZFAPGv9rG2i7UNq93rk2diky96a7XEGm6a4w6UUCGNAsCx69MeDQgUSii6byOmuuC0VQ2kJHqLiAAKIiN6A3v14y6iLXCRFeg3664uaHEPJEHk0b86zSVK0gq6e72MBqjpAcvGa OlQ5f8AmSkmMAi83T1dsn0KSBF5Ds4es cBDbR3d6x0uwCSuMOip1wJLod/GKlK7C3hUEFGRvQfp95SEFQaq9DLkOHAHv1njBN0iCI2x5MGNQoKmfOFKIUVC/fmubCRJ7axtLCDSsGnnJqnKdUPbriFWwKk1GDjqLWsiqu8km9nKzJaLgLwmOsC9GznKWsMkjvu 2XLixYAgk5l srRAiDW Jk0qKa4L/3BaZ1gqh61 8A0iJSNr2IPbJaBkUpuw5coxSUCC0An75vJEqDlVnK/TUyNDAGQAC8bPvzgrSoyaOtGiD0wIcEAXWSYwSRKct5x6lChTBCLH0wgMSggKqujj sQmmzSqPHfDjtLOXjHV02XrecvjBKF4jcIvQBSE1p6ZJRRbQi0HJrCUJLqFm/bEPuIh175dBQNAlHX1kfQsUEVeUyiCpON3WRCgsil1HfXnBCFQwVhNr7ZegKgKEbLvNtkC2kqhPhxi86SoWbcWXYoBqOlxw4LsYbJiRYpOKOPBtibUDVhvqzDtBRDYiQe MO0JCd9GvUwq8gYzwa sQ2/Py4GDEZEZR/cxl1KXSXW/wBMYC3SqnT0zm17gx60sIqVOnQMP6BARPTtnmGBK3EaI7fGNY82Wo2jWlv1gsABClZuKE82zbwHrk2jUm1p37MDW3dYebmrVJDRyIrdojsNQ62/8wXNME8jex89sVpZi5RGod3GWe PV74vQaFVG55yTQg6cew uKNTWkeyi7 ckTFEDpYyc9/WKTKsRAPHDg AlLNa0vb ri0IAEN8j1x4ubE5BTnHakbaSaf5xyiKhKV159cLOFRwu2IVQ3sbrRw84qqQ2D8UMreCoqlrP7yFsEOO1f2y8VbQQ5msRarN3ibmGEeZ5euKwlCUv6ZpwZSPcSn04ng zB3InQbkTk62ucm/fE9N3Orl13me98XO6iduMD0k7lYJXQDwMv1nRxBpXCnWmtCYcU8QH3j2we7K3oehj2/w4uKGMRTZv9vvAYKYGttFxw8XzZh1oiQgEB0FvDn0zZkANUI3hOePOa0VUYIg5DXb mkwiIsAc7YaTX2FKJKKIiydzDY15B36y0El5XPOjKxGqlau10df9cnMAQWk1CYka6CgoGgOwuxvW9OXVBTJponXn2zehKBSjF1xXo5UXQipx0/fC9SZ2YjfYUNlUZh0DPCv63NhIKAgCXh7/GcCh4R uL6Xqhi y9z 1w6Z7gL/ABku6eA/XAc27oP0zox7q50gPQw7x6uQE0MO2MZSE7Y/9zj2098d n2cfN8uPk caWF7oXF/UZBffDKRAAIBwB0zSTQNgnEemEBOgHdzt55wqBKgIFWvuvjnCaU9Rc2No D cREaMGOO3QG8py/3OUC0uJtIgzRH675KMbUVchP4yJEHbBGNPvAMUwRHde2HUFOh4xFYI0F5wOEIppO AcqMVb/uMYAW4DbBYeXBKdFrUlBHkT9fOJTExQSPZHOHF4r6pxi /g3l8fLj6vnL4 8B5 c8HywHhlPLkeT2zsv1nu MfV MTy5fJi TF8mDjff7xfJ85XcTszBex94j4TuOJ6Ynehw96DOEGxgx7MziQUEB LjsNo5cYDfX2MpUFNXgXIKUiIIH4w1KVCaa0hdevTeUyTh0A4Tx88YhBEloEOh98QxIRYHSOonQY5WQ0EGA5dHt0Mnl4AIqaU7pH3xbyyWs7HlwNOESEgXc4YecvqfGU7p7Ga7vxlO78ZTv9ZDv9ZP9MfZyYnkc06nzj5HzienyZPT5yrGEQoWXoQ sF6EAVplF6j/ucj5yTWBUKg8LOPfCQgiGkdiJyYjaMkIETyp0PXIVNTEHaod6a1edZouYQRCghyh2ZyPU798Bnt6HfJNAi1YPp39sRfMp4MW4QTqG/nEJpQDaPMXh1998g4KDRUaI8F sAgmDBKGI0 F5w2IcNFO/udWc4bAo0SmQXhr8YAgEN60E9T9MEkAUFQ0fk65oKyiKHT3M8n64MmggBCL7Adsg2MVUQWuFPjzly58uX8PR Xx8487QRpqVvk69uuRLYNgCAncU7c5Mq7zQgtbPi/WXRACQGBvjR074Jyk8Q5wNdGEoQhNknRwGKEDkiS ZjxFaD4LKHTKeF4QBqw6C/rjDRBFDa8 dfxha9O5swV2V6Y7VQ9LVwU6DtVXNTYHAOPcPgyr0QBE55NunnnpiE0IUChrT2H7zeVloWOQ9S632cRjuJKDQvaP364awQAFTY8a5O vJSRB0AnQ/3Oa0lwIKxZs7zjz8MUDsV8b6KfrjSQisUEJTs4oQVQAAseuR3 DKd09TGSLylpFX1Awkh1LVCojyfzrIsBCrIGXxcj hyH/T MKkRVkBwFRjcIIHTi/7msJIZEO3Ty679MQjQEE2bHZizQUJrvkghBQANBe9vV6avTmYpV8PP 75LnKmwbsA6z9 msFRJtA9LXj 8CgKNt4OnxjTFAu21u50A6Hz1Im0AsYDFKPUPbGpI3RuupTs536fV 2bfT3PTD1 s9WLjaoV6wxTiqJLCRWydveZAJVqlch3FzUwgIQrW62zpecvxOlCBRDqycf2qB0BQFou u2aeIwUQlLyV6J74yyUJAcA8FYM8qIrUNB1v7emWrU0HQB0DoX9cHL5cfyDAEQIUeTeVR1EHZQuuWP/ADIJQR4AIZfx6kCnw44SGAeBqh0Q7dtZp4KmsqwnBr6wtRJA4BVCvOnCBNIBKo7Pf98VO5BYIiRE52dHKtABCIuBTjR947GmIpdMm55PXAEZVSUVHsL6ZskyIDd7VPX71MuI2kgPJUg359souXJIZy/2YEIBg7RnDro6GWmiQ47n17TFz0weTA5/Dh3aq9s7Yehlg QGei8YfABoI09x6OCoRIJWdeXrcdhdAqJze6d8OihkGwJZBuQ5iwHXfS84PiEFEHrOLgcVTrsuUYIIpqWTKZMgV4U1/nIcBILOrwfeJmu/1iVEQgAbXN9EFnYIfbnDA9HkV 3AJhYPIiz3n6 mW7UGBTEOrj6znHsdNgrwL0vHTBw2NBM/XWMgFACjNKPJc2x7A6Cggox9T1wiAgmwU5by/wAZXbmsIvkcaV0mlL0acexnKhSrivVxOoudYGB7OHi56Lnp 89T4wjPY 2exwbaM1h3aCq9l6emJ0RosR1GdZ1ffWMBnZxSonkna83DpQNoXl5V83FuhYNh4Hzhke3bKsxQHQ6RfGsCdoQhgb3O8 8NEEEudta8XH1GejG4gA7kA9WfeM1XsUJob2T7xdKDt1AfzgSBEyqAk9MJ4oqVlI8vW4mC2UIgdQ49sU6GAgWpO96  TbbOuS8xOyXBcAemPvji9D1y4dcLg5fnLh1y5cfdiyNYapNa6Oz/Ob diHZvrwM7mWdKw1gdOz7OAhAqIG hcF3TmqgRQBT1uCiHwogp7PjA8IuAAeEA2ut98YBWoqLyLwE8/yIkoNNabzl4Fype2MSBBJUbsOtMf4sqoHb4S92NiStJQZcPq4OdYDA/BPwuDXTPdgwMHpx5mT0wffBwG PnNZDeIzZoXyYLgMZNB9sNkB6GQHZwtqghXbgfGJOsCFHJHnnNkTbgwOXoX9/ORhGJttxZxjohojQdg8GVMuMbotAKPfeJskkCQLWhzx3OMQE9gFNENzR3wxOcH1/E84mRMGP5g55xTzi5cMGP91jh7MHnF6awduExcGnDUKVNC1UeNY2roE2ACTfGnpg1AhJR17uVuSURosp15zVHBxk 2QyZMDnL VwWXHFzq8Yu8qdfwnL cuXB5z0GX0y D4/Fy4vofj498J6XJ3J756R9snOTLi5cuX8ri4/gcLi5z2Z/9k=', '{"info":[{"constellation":"??? (Virgo)","birth":"2018-09-14","country":"NOpe","city":"NOPE"}]}', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user_movie`
--

CREATE TABLE `user_movie` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `moid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user_music`
--

CREATE TABLE `user_music` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `muid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `vender`
--

CREATE TABLE `vender` (
  `vid` int(11) NOT NULL,
  `account` varchar(14) NOT NULL,
  `password` varchar(14) NOT NULL,
  `address` text NOT NULL,
  `phone` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`cid`);

--
-- 資料表索引 `gift`
--
ALTER TABLE `gift`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`gdid`);

--
-- 資料表索引 `grop`
--
ALTER TABLE `grop`
  ADD PRIMARY KEY (`gid`);

--
-- 資料表索引 `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`mid`);

--
-- 資料表索引 `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`moid`);

--
-- 資料表索引 `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`muid`);

--
-- 資料表索引 `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- 資料表索引 `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_movie`
--
ALTER TABLE `user_movie`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_music`
--
ALTER TABLE `user_music`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `vender`
--
ALTER TABLE `vender`
  ADD PRIMARY KEY (`vid`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `coupon`
--
ALTER TABLE `coupon`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `gift`
--
ALTER TABLE `gift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `gdid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `grop`
--
ALTER TABLE `grop`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `message`
--
ALTER TABLE `message`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `music`
--
ALTER TABLE `music`
  MODIFY `muid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用資料表 AUTO_INCREMENT `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user_movie`
--
ALTER TABLE `user_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user_music`
--
ALTER TABLE `user_music`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `vender`
--
ALTER TABLE `vender`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
