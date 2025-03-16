// TODO Implement this library.
class DrugReport {
  final String id;
  final String encryptedUsername;
  final String location;
  final String description;
  final DateTime reportDate;
  final String status;
  final double latitude;
  final double longitude;

  DrugReport({
    required this.id,
    required this.encryptedUsername,
    required this.location,
    required this.description,
    required this.reportDate,
    required this.status,
    required this.latitude,
    required this.longitude,
  });
}