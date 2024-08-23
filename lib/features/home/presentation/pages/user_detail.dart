import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_list/features/home/presentation/logic/user.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = Get.arguments;

    return Scaffold(
      appBar: AppBar(
          title:
              Text("${user.result!.name!.first} ${user.result!.name!.last}")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información del usuario
            ListTile(
              title: Text(
                  "${user.result!.name!.first} ${user.result!.name!.last}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              subtitle:
                  Text(user.result!.email!, style: TextStyle(fontSize: 16)),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.result!.picture!.large!),
                radius: 30,
              ),
            ),
            const SizedBox(height: 20),

            // Información adicional

            _buildInfoTile("Gender", user.result!.gender!),
            _buildInfoTile("Date of Birth",
                user.result!.dob!.date!.toLocal().toString().split(' ')[0]),
            _buildInfoTile("Phone", user.result!.phone!),
            _buildInfoTile("Cell", user.result!.cell!),
            _buildInfoTile("Nationality", user.result!.nat!),

            _buildInfoTile("ID", user.result!.id!.value! ?? "N/A"),
            const SizedBox(height: 20),

            // Dirección
            Text("Location",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
                "${user.result!.location!.street!.number!} ${user.result!.location!.street!.name}, ${user.result!.location!.city!}, ${user.result!.location!.state}, ${user.result!.location!.country}"),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    double.parse(user.result!.location!.coordinates!.latitude!),
                    double.parse(
                        user.result!.location!.coordinates!.longitude!),
                  ),
                  zoom: 12,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId("userLocation"),
                    position: LatLng(
                      double.parse(
                          user.result!.location!.coordinates!.latitude!),
                      double.parse(
                          user.result!.location!.coordinates!.longitude!),
                    ),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text("$title: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(data),
        ],
      ),
    );
  }
}
