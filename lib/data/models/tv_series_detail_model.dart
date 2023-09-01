import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetailModel extends Equatable {
  final bool adult;
  final String backdropPath;
  // final List<CreatedByModel> createdBy;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  // final LastEpisodeToAirModel lastEpisodeToAir;
  final String name;
  // final dynamic nextEpisodeToAir;
  final List<NetworkModel> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  // final List<NetworkModel> productionCompanies;
  // final List<ProductionCountryModel> productionCountries;
  // final List<SeasonModel> seasons;
  final List<SpokenLanguageModel> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  TvSeriesDetailModel({
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

  factory TvSeriesDetailModel.fromJson(Map<String, dynamic> json) => TvSeriesDetailModel(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? "",
        // createdBy: List<CreatedByModel>.from(json["created_by"]?.map((x) => CreatedByModel.fromJson(x)) ?? []),
        episodeRunTime: List<int>.from(json["episode_run_time"]?.map((x) => x) ?? []),
        firstAirDate: json["first_air_date"] ?? "",
        genres: List<GenreModel>.from(json["genres"]?.map((x) => GenreModel.fromJson(x)) ?? []),
        homepage: json["homepage"] ?? "",
        id: json["id"] ?? 0,
        inProduction: json["in_production"] ?? false,
        languages: List<String>.from(json["languages"]?.map((x) => x) ?? []),
        lastAirDate: json["last_air_date"] ?? "",
        // lastEpisodeToAir: LastEpisodeToAirModel.fromJson(json["last_episode_to_air"] ??
        //     LastEpisodeToAirModel(
        //       id: 0,
        //       name: "",
        //       overview: "",
        //       voteAverage: 0,
        //       voteCount: 0,
        //       airDate: DateTime.now(),
        //       episodeNumber: episodeNumber,
        //       productionCode: productionCode,
        //       runtime: runtime,
        //       seasonNumber: seasonNumber,
        //       showId: showId,
        //       stillPath: stillPath,
        //     )),
        name: json["name"] ?? "",
        // nextEpisodeToAir: json["next_episode_to_air"] ?? "",
        networks: List<NetworkModel>.from(json["networks"]?.map((x) => NetworkModel.fromJson(x)) ?? []),
        numberOfEpisodes: json["number_of_episodes"] ?? 0,
        numberOfSeasons: json["number_of_seasons"] ?? 0,
        originCountry: List<String>.from(json["origin_country"]?.map((x) => x) ?? []),
        originalLanguage: json["original_language"] ?? "",
        originalName: json["original_name"] ?? "",
        overview: json["overview"] ?? "",
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        posterPath: json["poster_path"] ?? "",
        // productionCompanies: List<NetworkModel>.from(json["production_companies"]?.map((x) => NetworkModel.fromJson(x)) ?? []),
        // productionCountries: List<ProductionCountryModel>.from(json["production_countries"]?.map((x) => ProductionCountryModel.fromJson(x)) ?? []),
        // seasons: List<SeasonModel>.from(json["seasons"]?.map((x) => SeasonModel.fromJson(x)) ?? []),
        spokenLanguages: List<SpokenLanguageModel>.from(json["spoken_languages"]?.map((x) => SpokenLanguageModel.fromJson(x)) ?? []),
        status: json["status"] ?? "",
        tagline: json["tagline"] ?? "",
        type: json["type"] ?? "",
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        // "created_by": List<dynamic>.from(createdBy.map((x) => x.toJson())),
        "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
        "first_air_date": firstAirDate,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "last_air_date": lastAirDate,
        // "last_episode_to_air": lastEpisodeToAir.toJson(),
        "name": name,
        // "next_episode_to_air": nextEpisodeToAir,
        "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        // "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        // "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        // "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  TvSeriesDetail toEntity() {
    return TvSeriesDetail(
      adult: adult,
      backdropPath: backdropPath,
      // createdBy: List<CreatedBy>.from(createdBy.map((x) => x.toEntity())),
      episodeRunTime: episodeRunTime,
      firstAirDate: firstAirDate,
      genres: List<Genre>.from(genres.map((x) => x.toEntity())),
      homepage: homepage,
      id: id,
      inProduction: inProduction,
      languages: languages,
      lastAirDate: lastAirDate,
      // lastEpisodeToAir: lastEpisodeToAir.toEntity(),
      name: name,
      // nextEpisodeToAir: nextEpisodeToAir,
      networks: List<Network>.from(networks.map((x) => x.toEntity())),
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      // productionCompanies: List<Network>.from(productionCompanies.map((x) => x.toEntity())),
      // productionCountries: List<ProductionCountry>.from(productionCountries.map((x) => x.toEntity())),
      // seasons: List<Season>.from(seasons.map((x) => x.toEntity())),
      spokenLanguages: List<SpokenLanguage>.from(spokenLanguages.map((x) => x.toEntity())),
      status: status,
      tagline: tagline,
      type: type,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

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

// class CreatedByModel extends Equatable {
//   final int id;
//   final String creditId;
//   final String name;
//   final int gender;
//   final String profilePath;

//   CreatedByModel({
//     required this.id,
//     required this.creditId,
//     required this.name,
//     required this.gender,
//     required this.profilePath,
//   });

//   factory CreatedByModel.fromJson(Map<String, dynamic> json) => CreatedByModel(
//         id: json["id"],
//         creditId: json["credit_id"],
//         name: json["name"],
//         gender: json["gender"],
//         profilePath: json["profile_path"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "credit_id": creditId,
//         "name": name,
//         "gender": gender,
//         "profile_path": profilePath,
//       };

//   CreatedBy toEntity() {
//     return CreatedBy(id: id, creditId: creditId, name: name, gender: gender, profilePath: profilePath);
//   }

//   @override
//   List<Object?> get props => [
//         id,
//         creditId,
//         name,
//         gender,
//         profilePath,
//       ];
// }

class GenreModel extends Equatable {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  Genre toEntity() {
    return Genre(id: id, name: name);
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

// class LastEpisodeToAirModel extends Equatable {
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

//   LastEpisodeToAirModel({
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

//   factory LastEpisodeToAirModel.fromJson(Map<String, dynamic> json) => LastEpisodeToAirModel(
//         id: json["id"],
//         name: json["name"],
//         overview: json["overview"],
//         voteAverage: json["vote_average"].toDouble(),
//         voteCount: json["vote_count"],
//         airDate: DateTime.parse(json["air_date"]),
//         episodeNumber: json["episode_number"],
//         productionCode: json["production_code"],
//         runtime: json["runtime"] ?? 0,
//         seasonNumber: json["season_number"],
//         showId: json["show_id"],
//         stillPath: json["still_path"] ?? "",
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "overview": overview,
//         "vote_average": voteAverage,
//         "vote_count": voteCount,
//         "air_date":
//             "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
//         "episode_number": episodeNumber,
//         "production_code": productionCode,
//         "runtime": runtime,
//         "season_number": seasonNumber,
//         "show_id": showId,
//         "still_path": stillPath,
//       };

//   LastEpisodeToAir toEntity() {
//     return LastEpisodeToAir(
//         id: id,
//         name: name,
//         overview: overview,
//         voteAverage: voteAverage,
//         voteCount: voteCount,
//         airDate: airDate,
//         episodeNumber: episodeNumber,
//         productionCode: productionCode,
//         runtime: runtime,
//         seasonNumber: seasonNumber,
//         showId: showId,
//         stillPath: stillPath);
//   }

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

class NetworkModel extends Equatable {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  NetworkModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> json) => NetworkModel(
        id: json["id"],
        logoPath: json["logo_path"] ?? "",
        name: json["name"] ?? "",
        originCountry: json["origin_country"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };

  toEntity() {
    return Network(
      id: id,
      logoPath: logoPath,
      name: name,
      originCountry: originCountry,
    );
  }

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}

// class ProductionCountryModel extends Equatable {
//   final String iso31661;
//   final String name;

//   ProductionCountryModel({
//     required this.iso31661,
//     required this.name,
//   });

//   factory ProductionCountryModel.fromJson(Map<String, dynamic> json) => ProductionCountryModel(
//         iso31661: json["iso_3166_1"] ?? "",
//         name: json["name"] ?? "",
//       );

//   Map<String, dynamic> toJson() => {
//         "iso_3166_1": iso31661,
//         "name": name,
//       };

//   ProductionCountry toEntity() {
//     return ProductionCountry(iso31661: iso31661, name: name);
//   }

//   @override
//   List<Object?> get props => [
//         iso31661,
//         name,
//       ];
// }

// class SeasonModel extends Equatable {
//   final DateTime airDate;
//   final int episodeCount;
//   final int id;
//   final String name;
//   final String overview;
//   final String posterPath;
//   final int seasonNumber;
//   final double voteAverage;

//   SeasonModel({
//     required this.airDate,
//     required this.episodeCount,
//     required this.id,
//     required this.name,
//     required this.overview,
//     required this.posterPath,
//     required this.seasonNumber,
//     required this.voteAverage,
//   });

//   factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
//         airDate: DateTime.tryParse(json["air_date"]) ?? DateTime(0),
//         episodeCount: json["episode_count"] ?? 0,
//         id: json["id"] ?? 0,
//         name: json["name"] ?? "",
//         overview: json["overview"] ?? "",
//         posterPath: json["poster_path"] ?? "",
//         seasonNumber: json["season_number"] ?? "",
//         voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
//       );

//   Map<String, dynamic> toJson() => {
//         "air_date":
//             "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
//         "episode_count": episodeCount,
//         "id": id,
//         "name": name,
//         "overview": overview,
//         "poster_path": posterPath,
//         "season_number": seasonNumber,
//         "vote_average": voteAverage,
//       };

//   Season toEntity() {
//     return Season(
//       airDate: airDate,
//       episodeCount: episodeCount,
//       id: id,
//       name: name,
//       overview: overview,
//       posterPath: posterPath,
//       seasonNumber: seasonNumber,
//       voteAverage: voteAverage,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         airDate,
//         episodeCount,
//         id,
//         name,
//         overview,
//         posterPath,
//         seasonNumber,
//         voteAverage,
//       ];
// }

class SpokenLanguageModel extends Equatable {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguageModel({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) => SpokenLanguageModel(
        englishName: json["english_name"] ?? "",
        iso6391: json["iso_639_1"] ?? "",
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };

  SpokenLanguage toEntity() {
    return SpokenLanguage(
      englishName: englishName,
      iso6391: iso6391,
      name: name,
    );
  }

  @override
  List<Object?> get props => [
        englishName,
        iso6391,
        name,
      ];
}
