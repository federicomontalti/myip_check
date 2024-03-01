//https://api.ipify.org
//https://ipapi.co/json -> region, city e postal

import "dart:convert";
import "package:http/http.dart" as http;
//import "models/ip.dart";

const stringUrl = "https://ipapi.co/json?format=json";

//da mettere asincrono perchè all'interno abbiamo del codice che deve aspettare un risultato
Future<Ip> getIp() async {
  //Uri.parse() -> trasforma in un oggetto Uri(url)
  final url = Uri.parse(stringUrl);
  
  //res contiene una future response: valore non ancora disponibile che non può dare subito, ma lo darà in futuro
  //una volta reso il metodo asincrono possiamo aggiungere "await" per far andare avanti getIp solo quando arriveranno i dati
  final res = await http.get(url);

  //mappiamo un dizionario con chiave stringa e valore dinamico
  final Map<String, dynamic> data = json.decode(res.body);

  return Ip(
    ip: data['ip'],
    region: data['region'],
    postal: data['postal'], 
    city: data['city'], 
  );
}

class Ip {
  String ip;
  String region;
  String postal;
  String city;

  Ip({
    required this.ip,
    required this.region,
    required this.postal,
    required this.city,
  });

  @override
  String toString() {
    return "My ip is: $ip region: $region, postal $postal, city: $city";
  }
}