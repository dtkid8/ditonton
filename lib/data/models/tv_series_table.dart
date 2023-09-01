import 'package:equatable/equatable.dart';

import '../../domain/entities/tv_series.dart';
import '../../domain/entities/tv_series_detail.dart';

class TvSeriesTable extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  TvSeriesTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory TvSeriesTable.fromEntity(TvSeriesDetail tvSeries) => TvSeriesTable(
        id: tvSeries.id,
        title: tvSeries.name,
        posterPath: tvSeries.posterPath,
        overview: tvSeries.overview,
      );

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
      };

  TvSeries toEntity() => TvSeries(
        id: id,
        overview: overview,
        posterPath: posterPath,
        name: title,
        backdropPath: '',
        firstAirDate: '',
        genreIds: [],
        originCountry: [],
        originalLanguage: '',
        originalName: '',
        popularity: 0,
        voteAverage: 0,
        voteCount: 0,
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}
