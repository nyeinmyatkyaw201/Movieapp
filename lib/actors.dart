import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future getActors(String id) async {
  String actorsUrl =
      'https://api.themoviedb.org/3/movie/$id/credits?language=en-US&api_key=050c28541f900007285c3020069bfd62';
  var url = Uri.parse(actorsUrl);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(">>>>>>>>> 200 <<<<<<<<");

    var jsonResponse =
        await convert.jsonDecode(response.body) as Map<String, dynamic>;

   
    var actorList = jsonResponse["cast"];

    print(">>>>>>>>> jsonDecoded <<<<<<<<");

    return actorList;
  }
}
