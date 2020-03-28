import 'package:http/http.dart' as http;

void main() async {
  var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php';
  var body = '{"user": "<username>", "pin": "<pin>", "quiz": "quiz01" }';
  var response = await http.post(url, body: body);
  print(response.body);
}

Future<bool> login(username, pin) async {
  // http.post('http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php')
  var response = await http.post(
      'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php',
      body: '{"user": "kmamamori", "pin": "8704", "quiz":"quiz01"}');
  // if(response.body)
  return true;
}
