import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildSettingsSection(),
            const SizedBox(height: 20),
            _buildDeviceSection(),
            const SizedBox(height: 20),
            _buildCaretakersSection(),
            const SizedBox(height: 20),
            _buildDoctorSection(),
            const SizedBox(height: 20),
            _buildFooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Take Care!",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text("Shivam",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        _buildSettingsItem(Icons.notifications, "Notification",
            "Check your medicine notification"),
        _buildSettingsItem(Icons.volume_up, "Sound", "Ring, Silent, Vibrate"),
        _buildSettingsItem(Icons.person, "Manage Your Account",
            "Password, Email ID, Phone Number"),
      ],
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade700),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      onTap: () {},
    );
  }

  Widget _buildDeviceSection() {
    return _buildCard([
      _buildSettingsItem(Icons.wifi, "Connect", "Bluetooth, Wi-Fi"),
      _buildSettingsItem(
          Icons.volume_up, "Sound Option", "Ring, Silent, Vibrate"),
    ]);
  }

  Widget _buildCaretakersSection() {
    return Container(
      width: double.infinity, // Makes it take full screen width
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Caretakers: 03",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              _buildCaretakerAvatar('assets/images/profile.jpg'),
              _buildCaretakerAvatar('assets/images/profile.jpg'),
              _buildCaretakerAvatar('assets/images/profile.jpg'),
              _buildAddCaretakerButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCaretakerAvatar(String imagePath) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(imagePath),
    );
  }

  Widget _buildAddCaretakerButton() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey.shade300,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildDoctorSection() {
    return Container(
      width: double.infinity, // Expands the container width
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Icon(Icons.add_circle, color: Colors.blue, size: 40),
          const SizedBox(height: 5),
          const Text("Add Your Doctor",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text("Or use ", style: TextStyle(color: Colors.grey)),
          GestureDetector(
            onTap: () {},
            child: const Text("invite link",
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection() {
    return Column(
      children: [
        _buildFooterItem("Privacy Policy"),
        _buildFooterItem("Terms of Use"),
        _buildFooterItem("Rate Us"),
        _buildFooterItem("Share"),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity, // Expands the button width
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.black),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text("Log Out", style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
