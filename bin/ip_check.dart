import 'package:ip_check/ip_check.dart' as ip_check;

//dobbiamo mettere anche il main asincrono, perchè deve prima arrivare la risposta di getIp
void main(List<String> arguments) async {
  final ip = await ip_check.getIp();
  print(ip);
}
