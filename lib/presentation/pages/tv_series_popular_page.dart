import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/popular_tv_series_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/tv_series_card.dart';

class TvSeriesPopularPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-series';

  @override
  _TvSeriesPopularPageState createState() => _TvSeriesPopularPageState();
}

class _TvSeriesPopularPageState extends State<TvSeriesPopularPage> {
  @override
  void initState() {
    super.initState();
    context.read<PopularTvSeriesCubit>().fetchPopularTvSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvSeriesCubit, GeneralState>(
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
