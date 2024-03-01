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