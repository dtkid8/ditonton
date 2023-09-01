import 'package:ditonton/data/models/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series_response.dart';
import 'package:ditonton/data/models/tv_series_table.dart';

final testTvSeriesResponse = {
  "backdrop_path": "/mAJ84W6I8I272Da87qplS2Dp9ST.jpg",
  "first_air_date": "2023-01-23",
  "genre_ids": [9648, 18],
  "id": 202250,
  "name": "Dirty Linen",
  "origin_country": ["PH"],
  "original_language": "tl",
  "original_name": "Dirty Linen",
  "overview":
      "To exact vengeance, a young woman infiltrates the household of an influential family as a housemaid to expose their dirty secrets. However, love will get in the way of her revenge plot.",
  "popularity": 2797.914,
  "poster_path": "/aoAZgnmMzY9vVy9VWnO3U5PZENh.jpg",
  "vote_average": 5,
  "vote_count": 13
};

final testTvSeriesListResponse = const {
  "page": 1,
  "results": [
    {
      "backdrop_path": "/mAJ84W6I8I272Da87qplS2Dp9ST.jpg",
      "first_air_date": "2023-01-23",
      "genre_ids": [9648, 18],
      "id": 202250,
      "name": "Dirty Linen",
      "origin_country": ["PH"],
      "original_language": "tl",
      "original_name": "Dirty Linen",
      "overview":
          "To exact vengeance, a young woman infiltrates the household of an influential family as a housemaid to expose their dirty secrets. However, love will get in the way of her revenge plot.",
      "popularity": 2797.914,
      "poster_path": "/aoAZgnmMzY9vVy9VWnO3U5PZENh.jpg",
      "vote_average": 5,
      "vote_count": 13
    },
    {
      "backdrop_path": "/wJmcuxa0C4AERmA9mejxm9qRYDj.jpg",
      "first_air_date": "2022-06-06",
      "genre_ids": [80, 9648],
      "id": 203504,
      "name": "Aashiqana",
      "origin_country": ["IN"],
      "original_language": "hi",
      "original_name": "आशिकाना",
      "overview":
          "A serial killer sparks the story of uptight Yashvardhan and feisty Chikki. Plagued by misunderstandings, how far do they have to go to nab the murderer?",
      "popularity": 2732.908,
      "poster_path": "/a4Z6Uohb6Ln5vcPvMUzwyn3WBjP.jpg",
      "vote_average": 6.1,
      "vote_count": 10
    },
    {
      "backdrop_path": "/xGKTgJlqCkq6tAK2sOTdULh7YaX.jpg",
      "first_air_date": "2022-10-10",
      "genre_ids": [10766, 18, 35],
      "id": 204370,
      "name": "The Path",
      "origin_country": ["BR"],
      "original_language": "pt",
      "original_name": "Travessia",
      "overview":
          "After having her life course changed by a fake image and losing her childhood sweetheart to greed and power, Brisa, a strong woman, will struggle to rebuild her journey, raise her son, rediscover true love, and discover the truth about her origin.",
      "popularity": 2658.721,
      "poster_path": "/raDj1xSVzBenwI87arenZY6eHmz.jpg",
      "vote_average": 4.7,
      "vote_count": 16
    },
    {
      "backdrop_path": null,
      "first_air_date": "2005-09-05",
      "genre_ids": [18, 35],
      "id": 36361,
      "name": "Ulice",
      "origin_country": ["CZ"],
      "original_language": "cs",
      "original_name": "Ulice",
      "overview":
          "Ulice is a Czech soap opera produced and broadcast by Nova. In the Czech language Ulice means street.\n\nThe show describes the lives of the Farský, Jordán, Boháč, Nikl, and Liška families and many other people that live in Prague. Their daily battle against real problems of living in a modern world like divorce, love, betrayal and illness or disease. Ulice often shows crime.",
      "popularity": 2539.81,
      "poster_path": "/3ayWL13P1HeRnyVL9lU9flOdZjq.jpg",
      "vote_average": 2.2,
      "vote_count": 10
    },
    {
      "backdrop_path": "/azWBrlovNOOdy0eQYEe9BoiROoN.jpg",
      "first_air_date": "2023-03-20",
      "genre_ids": [18, 10766],
      "id": 209085,
      "name": "Amor Perfeito",
      "origin_country": ["BR"],
      "original_language": "pt",
      "original_name": "Amor Perfeito",
      "overview": "",
      "popularity": 2366.021,
      "poster_path": "/aOPhyvHDauWFuc3rthpHArCNyrm.jpg",
      "vote_average": 3.5,
      "vote_count": 4
    },
    {
      "backdrop_path": "/69Jblm3seQgiPuPQMrJqg9Nxhaz.jpg",
      "first_air_date": "2011-01-10",
      "genre_ids": [10763, 10767],
      "id": 101463,
      "name": "Al rojo vivo",
      "origin_country": ["ES"],
      "original_language": "es",
      "original_name": "Al rojo vivo",
      "overview": "",
      "popularity": 2184.062,
      "poster_path": "/ag6PmoBxkF2s1uY3An618NCEt3g.jpg",
      "vote_average": 1.5,
      "vote_count": 4
    },
    {
      "backdrop_path": "/t2rAdgjSh0WYbXzdOB5zTDqzdCI.jpg",
      "first_air_date": "2022-11-02",
      "genre_ids": [18],
      "id": 213713,
      "name": "Faltu",
      "origin_country": ["IN"],
      "original_language": "hi",
      "original_name": "Faltu",
      "overview": "What's in a name? Amidst the arid landscape of Rajasthan, a young woman with dreamy eyes struggles to prove her worth.",
      "popularity": 2148.313,
      "poster_path": "/lgyFuoXs7GvKJN0mNm7z7OMOFuZ.jpg",
      "vote_average": 4.7,
      "vote_count": 15
    },
    {
      "backdrop_path": "/3n2TjKw3HrwDqgVgcynvantOfS3.jpg",
      "first_air_date": "2023-01-04",
      "genre_ids": [18, 10751],
      "id": 215103,
      "name": "Teri Meri Doriyaann",
      "origin_country": ["IN"],
      "original_language": "hi",
      "original_name": "Teri Meri Doriyaan",
      "overview":
          "It’s hate at first sight for Sahiba and Angad! But destined to be together, their lives get intertwined by a marriage alliance, and a love-hate story ensues.",
      "popularity": 2092.051,
      "poster_path": "/4BHDmYiuSnNL3nqKIOzLJKYX4AN.jpg",
      "vote_average": 4.9,
      "vote_count": 7
    },
    {
      "backdrop_path": "/1Xm0WqoT0DjZm5JdG2V6YFabrOz.jpg",
      "first_air_date": "2023-02-13",
      "genre_ids": [10759, 35, 18],
      "id": 215803,
      "name": "Batang Quiapo",
      "origin_country": ["PH"],
      "original_language": "tl",
      "original_name": "Batang Quiapo",
      "overview":
          "A young man rises to be one of the biggest outlaws in the neighborhood while he navigates his way in life to survive in Quiapo. Hoping to earn the affection of his parents, his feat draws him closer to the truth about his identity.",
      "popularity": 2087.665,
      "poster_path": "/9McqS8mgMf5NJCAKZIY6J1oOl8y.jpg",
      "vote_average": 5.6,
      "vote_count": 8
    },
    {
      "backdrop_path": null,
      "first_air_date": "2022-11-28",
      "genre_ids": [18],
      "id": 215315,
      "name": "Rabb Se Hai Dua",
      "origin_country": ["IN"],
      "original_language": "hi",
      "original_name": "रब्ब से है दुआ",
      "overview":
          "Dua and her husband are a perfect married couple in the eyes of their family. However, Dua’s life turns upside down when her husband seeks her permission to marry another woman.",
      "popularity": 2073.144,
      "poster_path": "/6ikbefd7VeopbBuGgioYMNU5bQj.jpg",
      "vote_average": 6,
      "vote_count": 2
    },
    {
      "backdrop_path": "/lcSvkJ2Rob3ICIOCUJahw3kgSYZ.jpg",
      "first_air_date": "2023-03-14",
      "genre_ids": [18],
      "id": 216390,
      "name": "Woman in a Veil",
      "origin_country": ["KR"],
      "original_language": "ko",
      "original_name": "비밀의 여자",
      "overview":
          "Jung Gyul Wool loses her vision and ability to walk because of her materialistic husband and his mistress. Despite her shortcomings, she hatches a plot to seek revenge.",
      "popularity": 2067.687,
      "poster_path": "/5ERr09UrnVm0hdXBeefNVtQMxI.jpg",
      "vote_average": 4.5,
      "vote_count": 2
    },
    {
      "backdrop_path": "/aqJPC5GXuiVbedajRmdOVMCb7mC.jpg",
      "first_air_date": "2022-12-05",
      "genre_ids": [18, 10751, 10766],
      "id": 215902,
      "name": "Katha Ankahee",
      "origin_country": ["IN"],
      "original_language": "hi",
      "original_name": "कथा अनकही",
      "overview":
          "Katha, a single parent, is in need of funds for her son's medical treatment. She comes across Viaan, who offers help but his conditions put her in an awkward situation.",
      "popularity": 2062.237,
      "poster_path": "/uhXU0SMPMlemKGHmwbldM60qqmW.jpg",
      "vote_average": 10,
      "vote_count": 1
    },
    {
      "backdrop_path": "/peqIR6V2zZdzp3MEZBCwtqw1Bf2.jpg",
      "first_air_date": "2022-11-28",
      "genre_ids": [18],
      "id": 215426,
      "name": "Pyaar Ke Saat Vachan - Dharam Patni",
      "origin_country": ["IN"],
      "original_language": "hi",
      "original_name": "Pyaar Ke Saat Vachan - Dharam Patni",
      "overview":
          "What will happen when Ravi Randhawa, a business tycoon, meets Pratiksha Parekh, a simple school teacher? Will sparks fly? Or is there no happy-ever-after for the opposite personalities?",
      "popularity": 2012.157,
      "poster_path": "/fMR23wg4yNsTEhqyYIfvzDAOEae.jpg",
      "vote_average": 6,
      "vote_count": 1
    },
    {
      "backdrop_path": "/vW16JyrWiB1cW9wWzxhmjVHoqwJ.jpg",
      "first_air_date": "2023-03-13",
      "genre_ids": [10766],
      "id": 217510,
      "name": "Queridos Papás",
      "origin_country": ["PT"],
      "original_language": "pt",
      "original_name": "Queridos Papás",
      "overview": "",
      "popularity": 1993.477,
      "poster_path": "/m1aGGAPvLpWF5cGhkQeZjbpu2nr.jpg",
      "vote_average": 6,
      "vote_count": 2
    },
    {
      "backdrop_path": "/l7LRGYJY3NzIGBlpvHpMsNXHbm5.jpg",
      "first_air_date": "2023-01-09",
      "genre_ids": [10751, 35],
      "id": 218145,
      "name": "Mama na prenájom",
      "origin_country": ["SK"],
      "original_language": "sk",
      "original_name": "Mama na prenájom",
      "overview": "",
      "popularity": 1964.048,
      "poster_path": "/fH7PP2Rkdlo414IHvZABBHhtoqd.jpg",
      "vote_average": 8.5,
      "vote_count": 2
    },
    {
      "backdrop_path": "/w9uM2biYWGqwEpvIYs8CXRoAdVB.jpg",
      "first_air_date": "2023-02-26",
      "genre_ids": [10764, 10767],
      "id": 221249,
      "name": "O Triângulo",
      "origin_country": ["PT"],
      "original_language": "pt",
      "original_name": "O Triângulo",
      "overview":
          "A series of physical, intellectual, emotional or psychological tests will test anonymous competitors, 24/7. In the end, only one will be victorious. Everything can change... At any time... When you least expect it!",
      "popularity": 1854.07,
      "poster_path": "/A2LE5B1IInR5h98OUNzyj9aQiIS.jpg",
      "vote_average": 2,
      "vote_count": 1
    },
    {
      "backdrop_path": "/xkiv3e1daoqil5MRJitCJcwUgk2.jpg",
      "first_air_date": "2021-10-31",
      "genre_ids": [10764],
      "id": 114294,
      "name": "Judy Justice",
      "origin_country": ["US"],
      "original_language": "en",
      "original_name": "Judy Justice",
      "overview":
          "The Honorable Judy Sheindlin, retired Judge of the Manhattan family Court, brings her signature blend of sharp wit and wisdom, hilarious candor and unwavering honesty that has made her America’s favorite judge for over 25 years, as she presides over real cases, arbitrates binding decisions and delivers what only she can: “Judy Justice.”",
      "popularity": 1723.765,
      "poster_path": "/4E8Rb9vPbixxC0ZdzSkvE5fpeQa.jpg",
      "vote_average": 4.1,
      "vote_count": 7
    },
    {
      "backdrop_path": "/xYiI6QEZvx8Z4La1oHvApyZHpOU.jpg",
      "first_air_date": "2023-01-16",
      "genre_ids": [10766, 35],
      "id": 209117,
      "name": "Never Give Up",
      "origin_country": ["BR"],
      "original_language": "pt",
      "original_name": "Vai na Fé",
      "overview":
          "Sol is a hardworking woman who has the chance to work as a backing vocalist for a funk singer and return to dancing, as she did in her youth. Torn between family pressure and passion for the stage, she must face the judgment of her church's members and conflicts with her family. The new chance will make her reconnect with her past in many ways, leading her to find her great youth love.",
      "popularity": 1574.388,
      "poster_path": "/6QNohzb7YUJ6eWZkXAYU8KGIq.jpg",
      "vote_average": 8.2,
      "vote_count": 6
    },
    {
      "backdrop_path": "/3FLHePl9Y3n4BidLVjIA9qSRDOE.jpg",
      "first_air_date": "2021-08-03",
      "genre_ids": [10766],
      "id": 130542,
      "name": "Bhagya Lakshmi",
      "origin_country": ["IN"],
      "original_language": "hi",
      "original_name": "Bhagya Lakshmi",
      "overview":
          "Hailing from a middle-class family, Lakshmi’s life is upended when she realises that her marriage to Rishi Oberoi, an industrialist’s son, is a sham to keep his death at bay.",
      "popularity": 1530.422,
      "poster_path": "/7wuKrFvbX7kAIF0ctotARsqayPo.jpg",
      "vote_average": 5,
      "vote_count": 33
    },
    {
      "backdrop_path": "/4NcAz1QIqYnhe3u2pnVEVNwfTZf.jpg",
      "first_air_date": "2020-10-05",
      "genre_ids": [18, 10766, 10751],
      "id": 111453,
      "name": "Ghum Hai Kisi Ke Pyaar Mein",
      "origin_country": ["IN"],
      "original_language": "hi",
      "original_name": "घुम है किसिकी प्यार में",
      "overview":
          "Virat sacrifices his love to honour the promise he made to a dying man. Trapped between the past and the present, will he find love beyond the chains of duty?",
      "popularity": 1214.89,
      "poster_path": "/uNjnoT3RChs2r7O9pDyx7TNBvIj.jpg",
      "vote_average": 5.6,
      "vote_count": 38
    }
  ],
  "total_pages": 14,
  "total_results": 265
};

final testTvSeriesModel = TvSeriesResponse.fromJson(testTvSeriesListResponse);
final testTvSeriesModelMap = testTvSeriesModel.toJson();
final testTvSeriesListModel = testTvSeriesModel.tvSeriesList;
final testTvSeries = testTvSeriesListModel.first.toEntity();
final testTvSeriesList = testTvSeriesListModel.map((e) => e.toEntity()).toList();

final testTvSeriesDetailResponse = {
  "adult": false,
  "backdrop_path": "/6LWy0jvMpmjoS9fojNgHIKoWL05.jpg",
  // "created_by": [
  //   {"id": 9813, "credit_id": "5256c8c219c2956ff604858a", "name": "David Benioff", "gender": 2, "profile_path": "/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg"},
  //   {"id": 228068, "credit_id": "552e611e9251413fea000901", "name": "D.B. Weiss", "gender": 2, "profile_path": "/2RMejaT793U9KRk2IEbFfteQntE.jpg"}
  // ],
  "episode_run_time": [60],
  "first_air_date": "2011-04-17",
  "genres": [
    {"id": 10765, "name": "Sci-Fi & Fantasy"},
    {"id": 18, "name": "Drama"},
    {"id": 10759, "name": "Action & Adventure"}
  ],
  "homepage": "http://www.hbo.com/game-of-thrones",
  "id": 1399,
  "in_production": false,
  "languages": ["en"],
  "last_air_date": "2019-05-19",
  // "last_episode_to_air": {
  //   "id": 1551830,
  //   "name": "The Iron Throne",
  //   "overview": "In the aftermath of the devastating attack on King's Landing, Daenerys must face the survivors.",
  //   "vote_average": 4.809,
  //   "vote_count": 241,
  //   "air_date": "2019-05-19",
  //   "episode_number": 6,
  //   "production_code": "806",
  //   "runtime": 80,
  //   "season_number": 8,
  //   "show_id": 1399,
  //   "still_path": "/zBi2O5EJfgTS6Ae0HdAYLm9o2nf.jpg"
  // },
  "name": "Game of Thrones",
  // "next_episode_to_air": null,
  "networks": [
    {"id": 49, "logo_path": "/tuomPhY2UtuPTqqFnKMVHvSb724.png", "name": "HBO", "origin_country": "US"}
  ],
  "number_of_episodes": 73,
  "number_of_seasons": 8,
  "origin_country": ["US"],
  "original_language": "en",
  "original_name": "Game of Thrones",
  "overview":
      "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
  "popularity": 346.098,
  "poster_path": "/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg",
  // "production_companies": [
  //   {"id": 76043, "logo_path": "/9RO2vbQ67otPrBLXCaC8UMp3Qat.png", "name": "Revolution Sun Studios", "origin_country": "US"},
  //   {"id": 12525, "logo_path": null, "name": "Television 360", "origin_country": ""},
  //   {"id": 5820, "logo_path": null, "name": "Generator Entertainment", "origin_country": "GB"},
  //   {"id": 12526, "logo_path": null, "name": "Bighead Littlehead", "origin_country": ""}
  // ],
  // "production_countries": [
  //   {"iso_3166_1": "GB", "name": "United Kingdom"},
  //   {"iso_3166_1": "US", "name": "United States of America"}
  // ],
  "seasons": [
    {
      "air_date": "2010-12-05",
      "episode_count": 272,
      "id": 3627,
      "name": "Specials",
      "overview": "",
      "poster_path": "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg",
      "season_number": 0,
      "vote_average": 0
    },
    {
      "air_date": "2011-04-17",
      "episode_count": 10,
      "id": 3624,
      "name": "Season 1",
      "overview":
          "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.",
      "poster_path": "/wgfKiqzuMrFIkU1M68DDDY8kGC1.jpg",
      "season_number": 1,
      "vote_average": 8.3
    },
    {
      "air_date": "2012-04-01",
      "episode_count": 10,
      "id": 3625,
      "name": "Season 2",
      "overview":
          "The cold winds of winter are rising in Westeros...war is coming...and five kings continue their savage quest for control of the all-powerful Iron Throne. With winter fast approaching, the coveted Iron Throne is occupied by the cruel Joffrey, counseled by his conniving mother Cersei and uncle Tyrion. But the Lannister hold on the Throne is under assault on many fronts. Meanwhile, a new leader is rising among the wildings outside the Great Wall, adding new perils for Jon Snow and the order of the Night's Watch.",
      "poster_path": "/9xfNkPwDOqyeUvfNhs1XlWA0esP.jpg",
      "season_number": 2,
      "vote_average": 8.2
    },
    {
      "air_date": "2013-03-31",
      "episode_count": 10,
      "id": 3626,
      "name": "Season 3",
      "overview":
          "Duplicity and treachery...nobility and honor...conquest and triumph...and, of course, dragons. In Season 3, family and loyalty are the overarching themes as many critical storylines from the first two seasons come to a brutal head. Meanwhile, the Lannisters maintain their hold on King's Landing, though stirrings in the North threaten to alter the balance of power; Robb Stark, King of the North, faces a major calamity as he tries to build on his victories; a massive army of wildlings led by Mance Rayder march for the Wall; and Daenerys Targaryen--reunited with her dragons--attempts to raise an army in her quest for the Iron Throne.",
      "poster_path": "/5MkZjRnCKiIGn3bkXrXfndEzqOU.jpg",
      "season_number": 3,
      "vote_average": 8.2
    },
    {
      "air_date": "2014-04-06",
      "episode_count": 10,
      "id": 3628,
      "name": "Season 4",
      "overview":
          "The War of the Five Kings is drawing to a close, but new intrigues and plots are in motion, and the surviving factions must contend with enemies not only outside their ranks, but within.",
      "poster_path": "/jXIMScXE4J4EVHUba1JgxZnWbo4.jpg",
      "season_number": 4,
      "vote_average": 8.4
    },
    {
      "air_date": "2015-04-12",
      "episode_count": 10,
      "id": 62090,
      "name": "Season 5",
      "overview":
          "The War of the Five Kings, once thought to be drawing to a close, is instead entering a new and more chaotic phase. Westeros is on the brink of collapse, and many are seizing what they can while the realm implodes, like a corpse making a feast for crows.",
      "poster_path": "/7Q1Hy1AHxAzA2lsmzEMBvuWTX0x.jpg",
      "season_number": 5,
      "vote_average": 8.2
    },
    {
      "air_date": "2016-04-24",
      "episode_count": 10,
      "id": 71881,
      "name": "Season 6",
      "overview":
          "Following the shocking developments at the conclusion of season five, survivors from all parts of Westeros and Essos regroup to press forward, inexorably, towards their uncertain individual fates. Familiar faces will forge new alliances to bolster their strategic chances at survival, while new characters will emerge to challenge the balance of power in the east, west, north and south.",
      "poster_path": "/p1udLh0gfqyZFmXBGa393gk8go5.jpg",
      "season_number": 6,
      "vote_average": 8.3
    },
    {
      "air_date": "2017-07-16",
      "episode_count": 7,
      "id": 81266,
      "name": "Season 7",
      "overview": "The long winter is here. And with it comes a convergence of armies and attitudes that have been brewing for years.",
      "poster_path": "/oX51n32QyHeFP5kErksemJsJljL.jpg",
      "season_number": 7,
      "vote_average": 8.2
    },
    {
      "air_date": "2019-04-14",
      "episode_count": 6,
      "id": 107971,
      "name": "Season 8",
      "overview":
          "The Great War has come, the Wall has fallen and the Night King's army of the dead marches towards Westeros. The end is here, but who will take the Iron Throne?",
      "poster_path": "/3OcQhbrecf4F4pYss2gSirTGPvD.jpg",
      "season_number": 8,
      "vote_average": 6.5
    }
  ],
  "spoken_languages": [
    {"english_name": "English", "iso_639_1": "en", "name": "English"}
  ],
  "status": "Ended",
  "tagline": "Winter Is Coming",
  "type": "Scripted",
  "vote_average": 8.438,
  "vote_count": 21390
};

final testTvSeriesDetailModel = TvSeriesDetailModel.fromJson(testTvSeriesDetailResponse);
final testTvSeriesDetail = testTvSeriesDetailModel.toEntity();

final testTvSeriesTable = TvSeriesTable.fromEntity(testTvSeriesDetail);
final testTvSeriesTableToEntity = testTvSeriesTable.toEntity();
final testTvSeriesMap = testTvSeriesTable.toJson();
