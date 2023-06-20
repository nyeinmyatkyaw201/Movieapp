import 'package:flutter/material.dart';
import 'get_movie_list.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({super.key, required this.actorList});
  List actorList;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.actorList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Actors"),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.actorList.length,
          itemBuilder: ((context, index) {
            return Card(
              elevation: 10,
              child: ListTile(
                leading: widget.actorList[index]['profile_path'] == null
                    ? widget.actorList[index]['gender'] == 2
                        ? const Image(image: AssetImage("./images/male.png"))
                        : const Image(image: AssetImage("./images/female.png"))
                    : CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://image.tmdb.org/t/p/w500/${widget.actorList[index]['profile_path']}"),
                      ),
                title: Text("${widget.actorList[index]['original_name']}"),
                subtitle:
                    Text(" Acting as ${widget.actorList[index]['character']}"),
              ),
            );
          }),
        )
        //  ListView.builder(
        //   child: Card(
        //     elevation: 10,
        //     child: ListTile(
        //       leading: Image(
        //           image: NetworkImage(
        //               "https://image.tmdb.org/t/p/w500/${widget.actorList[0]['profile_path']}")),
        //       title: Text("${widget.actorList[0]['original_name']}"),
        //       subtitle: Text(" Acting as ${widget.actorList[0]['character']}"),
        //     ),
        //   ),
        // ),
        );
    // );
  }
}
