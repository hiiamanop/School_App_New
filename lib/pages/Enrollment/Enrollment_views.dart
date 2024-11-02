import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_super_app/controllers/enroll_controller.dart';
import 'package:school_super_app/themes/theme.dart';

class EnrollmentView extends StatelessWidget {
  final String userId;
  late final EnrollController controller;

  EnrollmentView({required this.userId, Key? key}) : super(key: key) {
    controller = Get.put(EnrollController(userId: userId));
  }

  void _showEnrollDialog() {
    final TextEditingController codeController = TextEditingController();
    
    Get.dialog(
      AlertDialog(
        title: Text('Enroll Kelas', style: blackTextStyle),
        content: TextField(
          controller: codeController,
          decoration: InputDecoration(
            hintText: 'Masukkan kode enroll',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              if (codeController.text.isNotEmpty) {
                controller.enrollToClass(codeController.text);
                Get.back();
              }
            },
            child: Text('Enroll'),
          ),
        ],
      ),
    );
  }

  void _showClassOptionsDialog(Map classData) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          'Menu Kelas',
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mata Pelajaran:',
              style: greyTextStyle.copyWith(fontSize: 12),
            ),
            Text(
              classData['mata_pelajaran'] ?? 'Tidak ada nama',
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Pengajar:',
              style: greyTextStyle.copyWith(fontSize: 12),
            ),
            Text(
              classData['guru'] ?? 'Tidak ada guru',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Kode Enroll:',
              style: greyTextStyle.copyWith(fontSize: 12),
            ),
            Text(
              classData['code_enroll'] ?? 'Tidak ada kode',
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
        actions: [
          // Tombol Detail (bisa ditambahkan nanti)
          TextButton(
            onPressed: () {
              Get.back();
              // Navigate to detail page
              // Get.to(() => ClassDetailPage(classData: classData));
            },
            child: Text(
              'Detail',
              style: blackTextStyle.copyWith(
                color: primaryColor,
              ),
            ),
          ),
          // Tombol Un-enroll
          TextButton(
            onPressed: () {
              Get.back();
              _showUnEnrollConfirmation(classData);
            },
            child: Text(
              'Keluar Kelas',
              style: blackTextStyle.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showUnEnrollConfirmation(Map classData) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          'Konfirmasi',
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Apakah Anda yakin ingin keluar dari kelas ${classData['mata_pelajaran']}?',
          style: blackTextStyle,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Batal',
              style: blackTextStyle.copyWith(
                color: greyColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              // Panggil method un-enroll dari controller
              if (classData['id'] != null) {
                controller.unEnrollFromClass(classData['id'].toString());
              }
            },
            child: Text(
              'Ya, Keluar',
              style: blackTextStyle.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: _showEnrollDialog,
        backgroundColor: primaryColor,
        child: Icon(Icons.add, color: whiteColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar Kelas',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  
                  if (controller.enrolledClasses.isEmpty) {
                    return Center(
                      child: Text(
                        'Belum ada kelas yang diikuti',
                        style: greyTextStyle,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.enrolledClasses.length,
                    itemBuilder: (context, index) {
                      final classData = controller.enrolledClasses[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          onTap: () => _showClassOptionsDialog(classData),
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        classData['mata_pelajaran'] ?? 'Tidak ada nama',
                                        style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Pengajar: ${classData['guru'] ?? 'Tidak ada guru'}',
                                        style: greyTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(Icons.more_vert, size: 20, color: greyColor),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}