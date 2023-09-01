import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/top_rated_tv_series_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/tv_series_card.dart';

class TvSeriesTopRatedPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-series';

  @override
  _TvSeriesTopRatedPageState createState() => _TvSeriesTopRatedPageState();
}

class _TvSeriesTopRatedPageState extends State<TvSeriesTopRatedPage> {
  @override
  void initState() {
    super.initState();
    context.read<TopRatedTvSeriesCubit>().fetchTopRatedTvSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
        BlocBuilder<TopRatedTvSeriesCubit, GeneralState>(
          builder: (context, state) {
            if (state is GeneralLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GeneralLoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final series = state.data[index];
                  return TvSeriesCard(series);
                },
                itemCount: state.data.length,
              );
            } else if (state is GeneralErrorState) {
              return Center(
                key: Key('error_message'),
                child: Text(state.message),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
