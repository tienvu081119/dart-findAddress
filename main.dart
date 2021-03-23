import 'dart:convert';

class Address {
  String? name;
  int? distance;

  Address({this.name, this.distance});
  Address.FromJson(Map<String, dynamic> data) {
    name = data['name'];
    distance = data['distance'];
  }

  Address.FindMin(var array) {
    int location = 0;
    int? min = Address.FromJson(array[0]).distance;
    for (int i = 1; i < array.length; i++) {
      if (min! > Address.FromJson(array[i]).distance!) {
        min = Address.FromJson(array[i]).distance;
        location = i;
      }
    }
    print(array[location]);
  }
}

main() {
  var jsonData =
      '[{ "name" : "Dane", "distance" : 2  },{"name" : "Dane1", "distance" : 1},{"name":"Dane3","distance":5}]';
  var array = json.decode(jsonData);
  Address.FindMin(array);
}
