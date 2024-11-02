import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:school_super_app/config/config.dart';

class ProfilePage extends StatefulWidget {
  final String userId;

  ProfilePage({required this.userId});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? _profileData;

  Future<void> _fetchProfile() async {
    final response = await http.get(
      Uri.parse(Config().profileUrl(widget.userId)), // Menggunakan Config untuk profil URL
    );

    if (response.statusCode == 200) {
      setState(() {
        _profileData = json.decode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load profile')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: _profileData == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${_profileData!['name']}'),
                  Text('Nomor Induk: ${_profileData!['nomor_induk']}'),
                  Text('Tahun Masuk: ${_profileData!['tahun_masuk']}'),
                  Text('Role: ${_profileData!['role']}'),
                ],
              ),
            ),
    );
  }
}
