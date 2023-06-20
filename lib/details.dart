// import 'package:flutter/material.dart';
// import 'actors.dart';
// import 'get_movie_list.dart';

// class movieDetails extends StatefulWidget {
//   movieDetails({
//     super.key,
//     required this.actorList,
//   });
//   List actorList;

//   @override
//   State<movieDetails> createState() => _movieDetailsState();
// }

// class _movieDetailsState extends State<movieDetails> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print(widget.actorList);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Movie Details'),
//         ),
//         body: const Center(
//           child: Text("Hello"),
//         )
//         //  ListView(
//         //   children: [
//         //     Card(
//         //       elevation: 10,
//         //       child: ListTile(
//         //         leading: Image(
//         //             image: NetworkImage(
//         //                 "https://image.tmdb.org/t/p/w500/${widget.actorList[0]["cast"]["profile_path"]}")),
//         //         title: Text("${widget.actorList[0]["cast"]["original_name"]}"),
//         //         subtitle: Text(
//         //             " Acting as ${widget.actorList[0]["cast"]["character"]}"),
//         //       ),
//         //     ),
//         //   ],
//         // ),
//         //  Container(
//         //   color: Colors.red,
//         //   height: 100,
//         //   width: 200,

//         //   child: Text("${widget.actorList[index]["cast"]["profile_path"]}"),
//         // )
//         //     ListView.builder(
//         //   scrollDirection: Axis.vertical,
//         //   itemCount: widget.actorList.length,
//         //   itemBuilder: ((context, index) {
//         //     return Card(
//         //       elevation: 10,
//         //       child: ListTile(
//         //         leading: Image(
//         //             image: NetworkImage(
//         //                 "https://image.tmdb.org/t/p/w500/${widget.actorList[0]["cast"]["profile_path"]}")),
//         //         title:
//         //             Text("${widget.actorList[0]["cast"]["original_name"]}"),
//         //         subtitle: Text(
//         //             " Acting as ${widget.actorList[0]["cast"]["character"]}"),
//         //       ),
//         //     );
//         //   }),
//         // ),
//         );
//   }
// }
