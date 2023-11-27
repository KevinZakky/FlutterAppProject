import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:modul2/app/modules/home/models/list_item.dart';

class HttpController extends GetxController {
  final String baseUrl = "https://api.sampleapis.com";

  // RxList to hold the list of items
  RxList<ListItem> listItems = <ListItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch the list items when the controller is initialized
    fetchListItems();
  }

  Future<List<ListItem>> fetchListItems() async {
    try {
      final response =
          await http.get(Uri.parse("https://api.sampleapis.com/coffee/hot"));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        // Update the listItems with the fetched data
        listItems
            .assignAll(data.map((item) => ListItem.fromJson(item)).toList());
        return listItems.toList();
      } else {
        throw Exception("Failed to fetch list items");
      }
    } catch (e) {
      throw e;
    }
  }
}
