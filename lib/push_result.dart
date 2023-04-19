import 'dart:convert';
import 'dart:js';

import 'package:http/http.dart' as http;

class PushResult {
  String id;
  String name;
  String job;
  String created;

  PushResult({this.id, this.name, this.job, this.created});

  factory PushResult.createdPushResult(Map<String, dynamic> objek) {
    return PushResult(
        id: objek["id"],
        name: objek["name"],
        job: objek["job"],
        created: objek["createdAt"]);
  }
  static Future<PushResult> koneksiApi(String name, job) async {
    String apiURL = "https://reqres.in/api/users";

    var apiReuslt = await http.post(apiURL, body: {"name": name, "job": job});

    var jsonObjek = json.decode(apiReuslt.body);
    return PushResult.createdPushResult(jsonObjek);
  }
}
