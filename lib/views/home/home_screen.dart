import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:v15/bloc/movies_bloc/movis_bloc.dart';
// import 'package:v15/services/storage/local_storage.dart';
import '../../bloc/movies_bloc/movis_bloc.dart';
import '../../bloc/movies_bloc/movis_event.dart';
import '../../bloc/movies_bloc/movis_state.dart';
import '../../config/components/internet_exception_widget.dart';
import '../../config/routes/routes_name.dart';
import '../../main.dart';
import '../../services/storage/local_storage.dart';
import '../../utils/enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    moviesBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              LocalStorage localStorage = LocalStorage();
              localStorage.clearValue('token').then((value) {
                localStorage.clearValue('isLogin').then((value) {
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                });
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: BlocProvider(
        // create: (_) => moviesBloc,
        create: (_) => moviesBloc..add(MoviesFetched()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (BuildContext context, state) {
            switch (state.moviesList.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.error:
                if (state.moviesList.message == 'No Internet Connection') {
                  return InternetExceptionWidget(
                    onPress: () {
                      moviesBloc.add(MoviesFetched());
                    },
                  );
                }
                return Center(
                  child: Text(state.moviesList.message ?? 'Unknown Error'),
                );
              case Status.completed:
                if (state.moviesList.data == null) {
                  return Center(child: Text('No Data Found'));
                }
                final movieList = state.moviesList.data!;
                return ListView.builder(
                  itemCount: movieList.tvShow.length,
                  itemBuilder: (context, index) {
                    final tvShow = movieList.tvShow[index];

                    return ListTile(
                      // leading: Image(image: NetworkImage(tvShow.imageThumbnailPath),) ,
                      title: Text(tvShow.name.toString()),
                      subtitle: Text(tvShow.network.toString()),
                      trailing: Text(tvShow.status.toString()),
                    );
                  },
                );

              default:
                return SizedBox();
            }

            // return SizedBox();
          },
        ),
      ),
    );
  }
}
