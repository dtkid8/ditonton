import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/presentation/bloc/detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../bloc/tv_series_detail_cubit.dart';
import 'package:ditonton/injection.dart' as di;

class TvSeriesDetailPage extends StatelessWidget {
  static const ROUTE_NAME = '/detail-series';

  final int id;
  const TvSeriesDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.locator<TvSeriesDetailCubit>(),
      child: TvSeriesDetailView(id: id),
    );
  }
}

class TvSeriesDetailView extends StatefulWidget {
  final int id;
  TvSeriesDetailView({required this.id});

  @override
  _TvSeriesDetailViewState createState() => _TvSeriesDetailViewState();
}

class _TvSeriesDetailViewState extends State<TvSeriesDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<TvSeriesDetailCubit>().fetchTvSeriesDetail(widget.id);
    context.read<TvSeriesDetailCubit>().loadWatchlistSeriesStatus(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvSeriesDetailCubit, DetailState>(
        builder: (context, state) {
          final cubit = context.read<TvSeriesDetailCubit>();
          if (state is DetailLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailErrorState) {
            return Text(cubit.message);
          } else {
            return SafeArea(
              child: DetailContent(
                cubit.tvSeries,
              ),
            );
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final TvSeriesDetail series;

  DetailContent(
    this.series,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<TvSeriesDetailCubit, DetailState>(
      listener: (context, state) {
        if (state is DetailWatchlistState) {
          final cubit = context.read<TvSeriesDetailCubit>();
          final message = cubit.watchlistMessage;
          if (message == TvSeriesDetailCubit.watchlistAddSuccessMessage || message == TvSeriesDetailCubit.watchlistRemoveSuccessMessage) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),
            duration: Duration(seconds: 1),
            ),);
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(message),
                  );
                });
          }
        }
      },
      child: Stack(
        children: [
          series.posterPath.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/w500${series.posterPath}',
                  width: screenWidth,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Center(child: CircularProgressIndicator()),
          Container(
            margin: const EdgeInsets.only(top: 48 + 8),
            child: DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: kRichBlack,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 16,
                    right: 16,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                series.name,
                                style: kHeading5,
                              ),
                              BlocBuilder<TvSeriesDetailCubit, DetailState>(
                                builder: (context, state) {
                                  final cubit = context.read<TvSeriesDetailCubit>();
                                  final isAddedWatchlist = cubit.isAddedToWatchlist;
                                  return ElevatedButton(
                                    onPressed: () async {
                                      if (!isAddedWatchlist) {
                                        cubit.addWatchlist(series);
                                      } else {
                                        cubit.removeFromWatchlist(series);
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        isAddedWatchlist ? Icon(Icons.check) : Icon(Icons.add),
                                        Text('Watchlist'),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Text(
                                _showGenres(series.genres),
                              ),
                              Text(
                                _showDuration(series.numberOfEpisodes),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: series.voteAverage / 2,
                                    itemCount: 5,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: kMikadoYellow,
                                    ),
                                    itemSize: 24,
                                  ),
                                  Text('${series.voteAverage}')
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Overview',
                                style: kHeading6,
                              ),
                              Text(
                                series.overview,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Recommendations',
                                style: kHeading6,
                              ),
                              BlocBuilder<TvSeriesDetailCubit, DetailState>(
                                builder: (context, state) {
                                  if (state is DetailLoadingState) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (state is DetailErrorState) {
                                    return Text(state.message);
                                  } else if (state is DetailLoadedState) {
                                    final cubit = context.read<TvSeriesDetailCubit>();
                                    return Container(
                                      height: 150,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          final movie = cubit.seriesRecommendations[index];
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  TvSeriesDetailPage.ROUTE_NAME,
                                                  arguments: movie.id,
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                                  placeholder: (context, url) => Center(
                                                    child: CircularProgressIndicator(),
                                                  ),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: cubit.seriesRecommendations.length,
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.white,
                          height: 4,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                );
              },
              // initialChildSize: 0.5,
              minChildSize: 0.25,
              // maxChildSize: 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: kRichBlack,
              foregroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
