import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future getMovie(String movieType) async {
  String popularmovieUrl =
      "https://api.themoviedb.org/3/movie/$movieType?language=en-US&page=1&api_key=4572bf887a55db16a73a46fd96b5d6fc";
  var url = Uri.parse(popularmovieUrl);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(">>>>>>>>> 200 <<<<<<<<");

    var jsonResponse =
        await convert.jsonDecode(response.body) as Map<String, dynamic>;

    // firstMovieName = jsonResponse['results'][0]['original_title'];
    // firstMoviePoster = jsonResponse['results'][0]['poster_path'];

    var movieList = jsonResponse["results"];
    

    print(">>>>>>>>> jsonDecoded <<<<<<<<");

    return movieList;
    
  }
}
