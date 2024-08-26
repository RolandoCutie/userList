import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:user_list/core/theme/app_colors.dart';
import 'package:user_list/features/home/presentation/logic/user.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = Get.arguments as User;
    final textTheme = Get.theme.textTheme;

    return Scaffold(
      appBar: AppBar(
          title:
              Text("${user.result!.name!.first} ${user.result!.name!.last}")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                  "${user.result!.name!.first} ${user.result!.name!.last}",
                  style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.blueNavy(),
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              subtitle: Text(user.result!.email!,
                  style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.blueNavy(),
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.result!.picture!.large!),
                radius: 30,
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoTile(
              "Gender",
              user.result!.gender!,
            ),
            _buildInfoTile("Date of Birth",
                user.result!.dob!.date!.toLocal().toString().split(' ')[0]),
            _buildInfoTile("Phone", user.result!.phone!),
            _buildInfoTile("Cell", user.result!.cell!),
            _buildInfoTile("Nationality", user.result!.nat!),
            _buildInfoTile("Location",
                "${user.result!.location!.street!.number!} ${user.result!.location!.street!.name}, ${user.result!.location!.city!}, ${user.result!.location!.state}, ${user.result!.location!.country}"),
            SizedBox(
              height: 400,
              width: 400,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(
                    double.parse(user.result!.location!.coordinates!.latitude!),
                    double.parse(
                        user.result!.location!.coordinates!.longitude!),
                  ),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: "com.example.user_list",
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(
                          double.parse(
                              user.result!.location!.coordinates!.latitude!),
                          double.parse(
                              user.result!.location!.coordinates!.longitude!),
                        ),
                        child: const Icon(Icons.location_pin),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String data) {
    final textTheme = Get.theme.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Row(
        children: [
          Text("$title: ",
              style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.blue(),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Flexible(
              child: Text(data,
                  style: textTheme.titleMedium?.copyWith(
                      color: AppColors.darkGrey(),
                      fontWeight: FontWeight.bold,
                      fontSize: 16))),
        ],
      ),
    );
  }
}
