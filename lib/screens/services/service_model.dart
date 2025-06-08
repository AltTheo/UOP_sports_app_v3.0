import 'package:uop_sports_v3/common/app_features/images.dart';

class SportsType {
  final String name;
  final String imageUrl;

  SportsType({required this.name, required this.imageUrl});
}

List<SportsType> sportsGrid = [
  SportsType(name: 'Basketball', imageUrl: UopImages.swimImage),
  SportsType(name: 'Dodgeball', imageUrl: UopImages.swimImage),
  SportsType(name: 'Football', imageUrl: UopImages.swimImage),
  SportsType(name: 'Netball', imageUrl: UopImages.swimImage),
  SportsType(name: 'Scholar Activities', imageUrl: UopImages.swimImage),
  SportsType(name: 'TASS Athletes', imageUrl: UopImages.swimImage),
  SportsType(name: 'Volleyball', imageUrl: UopImages.swimImage),
];
