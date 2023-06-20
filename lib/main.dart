import 'package:flutter/material.dart';
import 'package:movie_app/details.dart';
import 'get_movie_list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'movie_card.dart';
import 'details.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

   


      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          scaffoldBackgroundColor: Color.fromARGB(255, 26, 126, 214)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String popularMovieUrl =
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=4572bf887a55db16a73a46fd96b5d6fc';
  String topRatedMovieUrl =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=4572bf887a55db16a73a46fd96b5d6fc';

  List popularMovieList = [];
  List topRatedMovieList = [];
  List actorList =[];
  

  var spinkit = SpinKitFadingCircle(
    color: Color.fromARGB(255, 164, 169, 232),
    size: 50,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App"),
        actions: [
          IconButton(
              onPressed: () async {
                popularMovieList = await getMovie('popular');
                topRatedMovieList = await getMovie('top_rated');
                setState(() {});
              },
              icon: const Icon(Icons.download))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Popular Movie",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                "see all",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          popularMovieList.isEmpty
              ? spinkit
              : MovieCard(movieList: popularMovieList),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Top Rated Movies",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                "see all",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          topRatedMovieList.isEmpty
              ? spinkit
              : MovieCard(movieList: topRatedMovieList)
        ],
      ),
    );
  }
}
