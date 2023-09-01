import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/bloc/airing_tv_series_cubit.dart';
import 'package:ditonton/presentation/bloc/popular_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/popular_tv_series_cubit.dart';
import 'package:ditonton/presentation/bloc/top_rated_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/top_rated_tv_series_cubit.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_series_airing_page.dart';
import 'package:ditonton/presentation/pages/tv_series_detail_page.dart';
import 'package:ditonton/presentation/pages/tv_series_popular_page.dart';
import 'package:ditonton/presentation/pages/tv_series_top_rated_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/watchlist_series_page.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/now_playing_movies_cubit.dart';

class HomeMoviePage extends StatefulWidget {
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    context.read<AiringTvSeriesCubit>().fetchAiringTvSeries();
    context.read<PopularTvSeriesCubit>().fetchPopularTvSeries();
    context.read<TopRatedTvSeriesCubit>().fetchTopRatedTvSeries();
    context.read<NowPlayingMoviesCubit>().fetchNowPlayingMovies();
    context.read<PopularMoviesCubit>().fetchPopularMovies();
    context.read<TopRatedMoviesCubit>().fetchTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist Series'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistSeriesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              //FirebaseCrashlytics.instance.crash();
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'Now Playing Tv Series',
                onTap: () => Navigator.pushNamed(context, TvSeriesAiringPage.ROUTE_NAME),
              ),
              BlocBuilder<AiringTvSeriesCubit, GeneralState>(
                builder: (context, state) {
                  if (state is GeneralLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeneralLoadedState) {
                    final List<TvSeries> tvSeriesList = state.data;
                    return TvSeriesList(tvSeriesList);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              _buildSubHeading(
                title: 'Popular Tv Series',
                onTap: () => Navigator.pushNamed(context, TvSeriesPopularPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularTvSeriesCubit, GeneralState>(
                builder: (context, state) {
                  if (state is GeneralLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeneralLoadedState) {
                    final List<TvSeries> tvSeriesList = state.data;
                    return TvSeriesList(tvSeriesList);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              _buildSubHeading(
                title: 'Top Rated Tv Series',
                onTap: () => Navigator.pushNamed(context, TvSeriesTopRatedPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRatedTvSeriesCubit, GeneralState>(
                builder: (context, state) {
                  if (state is GeneralLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeneralLoadedState) {
                    final List<TvSeries> tvSeriesList = state.data;
                    return TvSeriesList(tvSeriesList);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              BlocBuilder<NowPlayingMoviesCubit, GeneralState>(
                builder: (context, state) {
                  if (state is GeneralLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeneralLoadedState) {
                    final List<Movie> movieList = state.data;
                    return MovieList(movieList);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              _buildSubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularMoviesCubit, GeneralState>(
                builder: (context, state) {
                  if (state is GeneralLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeneralLoadedState) {
                    final List<Movie> movieList = state.data;
                    return MovieList(movieList);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRatedMoviesCubit, GeneralState>(
                builder: (context, state) {
                  if (state is GeneralLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeneralLoadedState) {
                    final List<Movie> movieList = state.data;
                    return MovieList(movieList);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> series;

  TvSeriesList(this.series);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = series[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: series.length,
      ),
    );
  }
}
