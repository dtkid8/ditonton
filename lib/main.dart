import 'dart:async';
import 'dart:ui';

import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/presentation/bloc/airing_tv_series_cubit.dart';
import 'package:ditonton/presentation/bloc/now_playing_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/popular_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/popular_tv_series_cubit.dart';
import 'package:ditonton/presentation/bloc/top_rated_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/top_rated_tv_series_cubit.dart';
import 'package:ditonton/presentation/bloc/watchlist_movies_cubit.dart';
import 'package:ditonton/presentation/bloc/watchlist_series_cubit.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_series_airing_page.dart';
import 'package:ditonton/presentation/pages/tv_series_detail_page.dart';
import 'package:ditonton/presentation/pages/tv_series_popular_page.dart';
import 'package:ditonton/presentation/pages/tv_series_top_rated_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/watchlist_series_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await di.init();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // runApp(MyApp());
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    const fatalError = true;
    // Non-async exceptions
    FlutterError.onError = (errorDetails) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      }
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return true;
    };
    runApp(MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<AiringTvSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case TvSeriesPopularPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TvSeriesPopularPage());
            case TvSeriesAiringPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TvSeriesAiringPage());
            case TvSeriesTopRatedPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TvSeriesTopRatedPage());
            case TvSeriesDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case WatchlistSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistSeriesPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
