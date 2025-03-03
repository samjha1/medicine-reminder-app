import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            SizedBox(height: 20),
            _buildSettingsSection(),
            SizedBox(height: 20),
            _buildDeviceSection(),
            SizedBox(height: 20),
            _buildCaretakersSection(),
            SizedBox(height: 20),
            _buildDoctorSection(),
            SizedBox(height: 20),
            _buildFooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        Text("Settings",
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
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
      onTap: () {},
    );
  }

  Widget _buildDeviceSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSettingsItem(Icons.wifi, "Connect", "Bluetooth, Wi-Fi"),
          SizedBox(height: 10),
          _buildSettingsItem(
              Icons.volume_up, "Sound Option", "Ring, Silent, Vibrate"),
        ],
      ),
    );
  }

  Widget _buildCaretakersSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Caretakers: 03", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            children: [
              _buildCaretakerAvatar('assets/images/profile.jpg'),
              _buildCaretakerAvatar('assets/images/profile.jpg'),
              _buildCaretakerAvatar('assets/images/profile.jpg'),
              _buildAddCaretakerButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCaretakerAvatar(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }

  Widget _buildAddCaretakerButton() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey.shade300,
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildDoctorSection() {
    return Container(
      padding: EdgeInsets.fromLTRB(120, 16, 120, 16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(Icons.add_circle, color: Colors.blue, size: 40),
          SizedBox(height: 5),
          Text("Add Your Doctor",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Or use ", style: TextStyle(color: Colors.grey)),
          GestureDetector(
            onTap: () {},
            child: Text("invite link",
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
        SizedBox(height: 20),
        Center(
          child: OutlinedButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 120),
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
      child: Text(title, style: TextStyle(fontSize: 16)),
    );
  }
}
