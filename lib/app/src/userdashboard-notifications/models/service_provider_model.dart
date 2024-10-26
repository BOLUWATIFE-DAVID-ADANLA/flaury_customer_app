import 'package:flaury_mobile/app/src/userdashboard-notifications/models/service_model.dart';

class ServiceProvider {
  String businessName;
  String address;
  String? profileImage;
  String? starReviews;
  String? totalReviews;
  String? distanceAway;
  String? businessAvailabilityTime;
  List<Service>? servicesProvided;
  List<ServiceSubCategories> subCategoriesServicesProvided;
  ServiceProvider(
      this.address,
      this.servicesProvided,
      this.businessName,
      this.starReviews,
      this.distanceAway,
      this.profileImage,
      this.totalReviews,
      this.subCategoriesServicesProvided,
      this.businessAvailabilityTime);
}
