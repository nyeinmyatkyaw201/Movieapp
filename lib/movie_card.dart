import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/actors.dart';
import 'get_movie_list.dart';
import 'movie_details.dart';

class MovieCard extends StatefulWidget {
  MovieCard({
    super.key,
    required this.movieList,
  });
  List movieList;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  ScrollController userCtrl = ScrollController();
  List actorList = [];
  List movieList = [];
  var spinkit = SpinKitCircle(
    color: Color.fromARGB(255, 164, 169, 232),
    size: 50,
  );

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getDetails();
  // }

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF292B37),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF292B37).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.35,
      child: Scrollbar(
        controller: userCtrl,
        
        
        child: ListView.builder(
          controller: userCtrl,
            scrollDirection: Axis.horizontal,
            itemCount: widget.movieList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () async {
                    print('${widget.movieList[index]['id']}');
                    // setState(() async {
                    actorList =
                        await getActors('${widget.movieList[index]['id']}');

                    print(">>>>>>>>>>>>> Actor list ");

                    // print(actorList);
                    // });
                    // actorList.isEmpty
                    //     ? spinkit
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) => Dialog(
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: <Widget>[
                    //             const Text('This is a typical dialog.'),
                    //             const SizedBox(height: 15),
                    //             TextButton(
                    //               onPressed: () {
                    //                 Navigator.pop(context);
                    //               },
                    //               child: const Text('Close'),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   )
                    // :
                    // movieList = await getMovie('');

                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return MovieDetails(
                        actorList: actorList,
                      );
                    })));
                  },
                  child: SizedBox(
                    width: 150,
                    child: Card(
                      child: Column(
                        children: [
                          Image(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/${widget.movieList[index]['poster_path']}"),
                            width: 150,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "${widget.movieList[index]['original_title']}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${widget.movieList[index]["vote_average"]}",
                                softWrap: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
