import '../../../../../utils/icons.dart';

class CategoryHomeScreenModel {
  final String icon;
  final String categoryName;
  CategoryHomeScreenModel({
    required this.icon,
    required this.categoryName,
  });
}

List<CategoryHomeScreenModel> categories = [
  CategoryHomeScreenModel(icon: mensShoeIcon, categoryName: "Men"),
  CategoryHomeScreenModel(icon: womensShoeIcon, categoryName: "Women"),
  CategoryHomeScreenModel(icon: deviceIcon, categoryName: "Devices"),
  CategoryHomeScreenModel(icon: gadgetsIcon, categoryName: "Gadgets"),
  CategoryHomeScreenModel(icon: gamingIcon, categoryName: "Gaming"),

];
