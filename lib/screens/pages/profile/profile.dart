//
//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../resources/bottom_navigation_bar/botton_navigation.dart';
// import '../../../resources/routes/routes_names.dart';
// import '../../../../controller/firebase_services/firebase_services.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   final FirebaseServices _userService = Get.find<FirebaseServices>();
//
//
//
//
//   Future<void> _logout() async {
//     final theme = Theme.of(context);
//
//     final confirm = await showDialog<bool>(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         title: Text("Logout", style: theme.textTheme.headlineSmall),
//         content: Text(
//           "Are you sure you want to log out?",
//           style: theme.textTheme.bodyMedium,
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context, false),
//             child: Text("Cancel",
//                 style: TextStyle(color: theme.colorScheme.primary)),
//           ),
//           FilledButton(
//             style: FilledButton.styleFrom(
//               backgroundColor: Colors.red,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             onPressed: () => Navigator.pop(context, true),
//             child: const Text("Logout"),
//           ),
//         ],
//       ),
//     ) ?? false;
//
//     if (confirm) {
//       await _userService.signOut();
//       Get.offAllNamed(RoutesName.login);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//
//       appBar: AppBar(
//         title: Text(
//           "Profile",
//           style: theme.textTheme.headlineSmall?.copyWith(
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//
//       bottomNavigationBar: BottomNavigation(index: 3),
//
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         child: Column(
//           children: [
//             const SizedBox(height: 8),
//
//             /// --------------------------
//             /// USER CARD
//             /// --------------------------
//             Container(
//               padding: const EdgeInsets.all(18),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(18),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.06),
//                     blurRadius: 10,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 34,
//                     backgroundColor: Colors.blue.shade100,
//                     foregroundImage: _userService.user?.photoURL != null
//                         ? NetworkImage(_userService.user!.photoURL!)
//                         : null,
//                     child: _userService.user?.photoURL == null
//                         ? Icon(Icons.person,
//                         size: 36, color: theme.colorScheme.primary)
//                         : null,
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           _userService.user?.displayName ?? "User",
//                           style: theme.textTheme.titleMedium?.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           _userService.user?.email ?? "",
//                           style: theme.textTheme.bodyMedium?.copyWith(
//                             color: Colors.black54,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 28),
//
//             /// --------------------------
//             /// SETTINGS CARD
//             /// --------------------------
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(18),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.06),
//                     blurRadius: 10,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   _settingsTile(
//                     icon: Icons.person_outline,
//                     label: "Account Details",
//                     onTap: () {},
//                   ),
//                   _divider(),
//                   _settingsTile(
//                     icon: Icons.language,
//                     label: "Change Language",
//                     onTap: () {},
//                   ),
//                   _divider(),
//                   _settingsTile(
//                     icon: Icons.help_outline_rounded,
//                     label: "Help & Support",
//                     onTap: () {},
//                   ),
//                   _divider(),
//                   _settingsTile(
//                     icon: Icons.privacy_tip_outlined,
//                     label: "Privacy Policy",
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 28),
//
//             /// --------------------------
//             /// LOGOUT BUTTON
//             /// --------------------------
//             GestureDetector(
//               onTap: _logout,
//               child: Container(
//                 padding:
//                 const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
//                 decoration: BoxDecoration(
//                   color: Colors.red.withOpacity(0.12),
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.logout, color: Colors.red),
//                     const SizedBox(width: 12),
//                     Text(
//                       "Logout",
//                       style: theme.textTheme.titleMedium?.copyWith(
//                         color: Colors.red,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _settingsTile({
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     final theme = Theme.of(context);
//
//     return ListTile(
//       onTap: onTap,
//       leading: Icon(icon, color: theme.colorScheme.primary),
//       title: Text(
//         label,
//         style: theme.textTheme.bodyLarge?.copyWith(
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       trailing: Icon(Icons.arrow_forward_ios,
//           size: 16, color: Colors.grey.shade400),
//     );
//   }
//
//   Widget _divider() => Divider(
//     height: 1,
//     color: Colors.grey.shade200,
//     indent: 16,
//     endIndent: 16,
//   );
// }
//


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/firebase_services/firebase_services.dart';
import '../../../../resources/bottom_navigation_bar/botton_navigation.dart';
import '../../../../resources/routes/routes_names.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseServices services = Get.find<FirebaseServices>();

  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();

  bool isEditing = false;
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    services.loadUserProfile().then((_) => _fillFields());
  }

  void _fillFields() {
    final data = services.userData;

    nameC.text = data['name'] ?? '';
    emailC.text = data['email'] ?? '';
    phoneC.text = data['phone'] ?? '';

    setState(() {});
  }

  Future<void> _saveChanges() async {
    setState(() => isSaving = true);

    await services.updateFirestoreProfile(
      name: nameC.text.trim(),
      phone: phoneC.text.trim(),
    );

    await services.loadUserProfile();

    Get.snackbar(
      "Profile Updated",
      "Your changes have been successfully saved.",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    setState(() {
      isSaving = false;
      isEditing = false;
    });
  }

  Future<void> _logout() async {
    await services.signOut();
    Get.offAllNamed(RoutesName.login);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Obx(() {
      final data = services.userData;

      return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            isEditing ? "Edit Profile" : "Profile",
            style: theme.textTheme.headlineSmall,
          ),
          centerTitle: true,
        ),

        bottomNavigationBar: const BottomNavigation(index: 4),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              /// -------------------------
              /// PROFILE CARD (IELTS STYLE)
              /// -------------------------
              Card(
                elevation: 2,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: (data['profileImage'] != null &&
                            data['profileImage'].toString().isNotEmpty)
                            ? NetworkImage(data['profileImage'])
                            : const NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/149/149071.png",
                        ),
                      ),

                      const SizedBox(height: 20),

                      _buildField(
                        controller: nameC,
                        label: "Full Name",
                        enabled: isEditing,
                      ),

                      const SizedBox(height: 16),

                      _buildField(
                        controller: emailC,
                        label: "Email",
                        enabled: false,
                      ),

                      const SizedBox(height: 16),

                      _buildField(
                        controller: phoneC,
                        label: "Phone Number",
                        enabled: isEditing,
                        keyboardType: TextInputType.phone,
                      ),

                      const SizedBox(height: 22),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: isEditing
                            ? FilledButton(
                          key: const ValueKey("saveBtn"),
                          onPressed: isSaving ? null : _saveChanges,
                          child: isSaving
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                              : const Text("Save Changes"),
                        )
                            : OutlinedButton(
                          key: const ValueKey("editBtn"),
                          onPressed: () =>
                              setState(() => isEditing = true),
                          child: const Text("Edit Profile"),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// -------------------------
              /// LOGOUT
              /// -------------------------
              ListTile(
                onTap: _logout,
                leading: Icon(Icons.logout,
                    color: theme.colorScheme.error, size: 28),
                title: Text(
                  "Logout",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  /// ---------------------------------------------
  /// SINGLE INPUT FIELD (Auto matches AppTheme)
  /// ---------------------------------------------
  Widget _buildField({
    required TextEditingController controller,
    required String label,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
