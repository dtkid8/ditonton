import 'package:equatable/equatable.dart';

class TvSeriesDetail extends Equatable {
  final bool adult;
  final String backdropPath;
  // final List<CreatedBy> createdBy;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  // final LastEpisodeToAir lastEpisodeToAir;
  final String name;
  // final dynamic nextEpisodeToAir;
  final List<Network> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  // final List<Network> productionCompanies;
  // final List<ProductionCountry> productionCountries;
  // final List<Season> seasons;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  TvSeriesDetail({
    required this.adult,
    required this.backdropPath,
    // required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    // required this.lastEpisodeToAir,
    required this.name,
    // required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    // required this.productionCompanies,
    // required this.productionCountries,
    // required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  // factory TvSeriesDetail.fromJson(Map<String, dynamic> json) => TvSeriesDetail(
  //       adult: json["adult"],
  //       backdropPath: json["backdrop_path"],
  //       // createdBy: List<CreatedBy>.from(json["created_by"].map((x) => CreatedBy.fromJson(x))),
  //       episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
  //       firstAirDate: json["first_air_date"] ?? [],
  //       genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
  //       homepage: json["homepage"],
  //       id: json["id"],
  //       inProduction: json["in_production"],
  //       languages: List<String>.from(json["languages"].map((x) => x)),
  //       lastAirDate: json["last_air_date"] ?? [],
  //       // lastEpisodeToAir: LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
  //       name: json["name"],
  //       // nextEpisodeToAir: json["next_episode_to_air"],
  //       networks: List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
  //       numberOfEpisodes: json["number_of_episodes"],
  //       numberOfSeasons: json["number_of_seasons"],
  //       originCountry: List<String>.from(json["origin_country"].map((x) => x)),
  //       originalLanguage: json["original_language"],
  //       originalName: json["original_name"],
  //       overview: json["overview"],
  //       popularity: json["popularity"].toDouble(),
  //       posterPath: json["poster_path"],
  //       // productionCompanies: List<Network>.from(json["production_companies"].map((x) => Network.fromJson(x))),
  //       // productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
  //       seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
  //       spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
  //       status: json["status"],
  //       tagline: json["tagline"],
  //       type: json["type"],
  //       voteAverage: json["vote_average"].toDouble(),
  //       voteCount: json["vote_count"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "adult": adult,
  //       "backdrop_path": backdropPath,
  //       // "created_by": List<dynamic>.from(createdBy.map((x) => x.toJson())),
  //       "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
  //       "first_air_date": firstAirDate,
  //       "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
  //       "homepage": homepage,
  //       "id": id,
  //       "in_production": inProduction,
  //       "languages": List<dynamic>.from(languages.map((x) => x)),
  //       "last_air_date": lastAirDate,
  //       // "last_episode_to_air": lastEpisodeToAir.toJson(),
  //       "name": name,
  //       // "next_episode_to_air": nextEpisodeToAir,
  //       // "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
  //       "number_of_episodes": numberOfEpisodes,
  //       "number_of_seasons": numberOfSeasons,
  //       "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
  //       "original_language": originalLanguage,
  //       "original_name": originalName,
  //       "overview": overview,
  //       "popularity": popularity,
  //       "poster_path": posterPath,
  //       // "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
  //       // "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
  //       "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
  //       "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
  //       "status": status,
  //       "tagline": tagline,
  //       "type": type,
  //       "vote_average": voteAverage,
  //       "vote_count": voteCount,
  //     };

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        // createdBy,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        // lastEpisodeToAir,
        name,
        // nextEpisodeToAir,
        networks,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        // productionCompanies,
        // productionCountries,
        // seasons,
        spokenLanguages,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}

// class CreatedBy extends Equatable {
//   final int id;
//   final String creditId;
//   final String name;
//   final int gender;
//   final String profilePath;

//   CreatedBy({
//     required this.id,
//     required this.creditId,
//     required this.name,
//     required this.gender,
//     required this.profilePath,
//   });

//   // factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
//   //       id: json["id"],
//   //       creditId: json["credit_id"],
//   //       name: json["name"],
//   //       gender: json["gender"],
//   //       profilePath: json["profile_path"],
//   //     );

//   // Map<String, dynamic> toJson() => {
//   //       "id": id,
//   //       "credit_id": creditId,
//   //       "name": name,
//   //       "gender": gender,
//   //       "profile_path": profilePath,
//   //     };

//   @override
//   List<Object?> get props => [
//         id,
//         creditId,
//         name,
//         gender,
//         profilePath,
//       ];
// }

class Genre extends Equatable {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  // factory Genre.fromJson(Map<String, dynamic> json) => Genre(
  //       id: json["id"],
  //       name: json["name"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //     };

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

// class LastEpisodeToAir extends Equatable {
//   final int id;
//   final String name;
//   final String overview;
//   final double voteAverage;
//   final int voteCount;
//   final DateTime airDate;
//   final int episodeNumber;
//   final String productionCode;
//   final int runtime;
//   final int seasonNumber;
//   final int showId;
//   final String stillPath;

//   LastEpisodeToAir({
//     required this.id,
//     required this.name,
//     required this.overview,
//     required this.voteAverage,
//     required this.voteCount,
//     required this.airDate,
//     required this.episodeNumber,
//     required this.productionCode,
//     required this.runtime,
//     required this.seasonNumber,
//     required this.showId,
//     required this.stillPath,
//   });

//   // factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) => LastEpisodeToAir(
//   //       id: json["id"],
//   //       name: json["name"],
//   //       overview: json["overview"],
//   //       voteAverage: json["vote_average"].toDouble(),
//   //       voteCount: json["vote_count"],
//   //       airDate: DateTime.parse(json["air_date"]),
//   //       episodeNumber: json["episode_number"],
//   //       productionCode: json["production_code"],
//   //       runtime: json["runtime"],
//   //       seasonNumber: json["season_number"],
//   //       showId: json["show_id"],
//   //       stillPath: json["still_path"],
//   //     );

//   // Map<String, dynamic> toJson() => {
//   //       "id": id,
//   //       "name": name,
//   //       "overview": overview,
//   //       "vote_average": voteAverage,
//   //       "vote_count": voteCount,
//   //       "air_date":
//   //           "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
//   //       "episode_number": episodeNumber,
//   //       "production_code": productionCode,
//   //       "runtime": runtime,
//   //       "season_number": seasonNumber,
//   //       "show_id": showId,
//   //       "still_path": stillPath,
//   //     };

//   @override
//   List<Object?> get props => [
//         id,
//         name,
//         overview,
//         voteAverage,
//         voteCount,
//         airDate,
//         episodeNumber,
//         productionCode,
//         runtime,
//         seasonNumber,
//         showId,
//         stillPath,
//       ];
// }

class Network extends Equatable {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  // factory Network.fromJson(Map<String, dynamic> json) => Network(
  //       id: json["id"],
  //       logoPath: json["logo_path"],
  //       name: json["name"],
  //       originCountry: json["origin_country"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "logo_path": logoPath,
  //       "name": name,
  //       "origin_country": originCountry,
  //     };

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}

// class ProductionCountry extends Equatable {
//   final String iso31661;
//   final String name;

//   ProductionCountry({
//     required this.iso31661,
//     required this.name,
//   });

//   // factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
//   //       iso31661: json["iso_3166_1"],
//   //       name: json["name"],
//   //     );

//   // Map<String, dynamic> toJson() => {
//   //       "iso_3166_1": iso31661,
//   //       "name": name,
//   //     };

//   @override
//   List<Object?> get props => [
//         iso31661,
//         name,
//       ];
// }

class Season extends Equatable {
  final DateTime airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  final double voteAverage;

  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  // factory Season.fromJson(Map<String, dynamic> json) => Season(
  //       airDate: DateTime.parse(json["air_date"]),
  //       episodeCount: json["episode_count"],
  //       id: json["id"],
  //       name: json["name"],
  //       overview: json["overview"],
  //       posterPath: json["poster_path"],
  //       seasonNumber: json["season_number"],
  //       voteAverage: json["vote_average"].toDouble(),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "air_date":
  //           "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
  //       "episode_count": episodeCount,
  //       "id": id,
  //       "name": name,
  //       "overview": overview,
  //       "poster_path": posterPath,
  //       "season_number": seasonNumber,
  //       "vote_average": voteAverage,
  //     };

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        overview,
        posterPath,
        seasonNumber,
        voteAverage,
      ];
}

class SpokenLanguage extends Equatable {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  // factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
  //       englishName: json["english_name"],
  //       iso6391: json["iso_639_1"],
  //       name: json["name"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "english_name": englishName,
  //       "iso_639_1": iso6391,
  //       "name": name,
  //     };

  @override
  List<Object?> get props => [
        englishName,
        iso6391,
        name,
      ];
}
