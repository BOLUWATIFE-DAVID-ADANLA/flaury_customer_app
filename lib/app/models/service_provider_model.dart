import 'package:flaury_mobile/app/models/service_model.dart';

class ServiceProvider {
  String businessName;
  String address;
  String? profileImage;
  String? starReviews;
  String? totalReviews;
  String? distanceAway;
  List<Service>? servicesProvided;
  ServiceProvider(
    this.address,
    this.servicesProvided,
    this.businessName,
    this.starReviews,
    this.distanceAway,
    this.profileImage,
    this.totalReviews,
  );
}
