import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_coffee/features/authentication/controllers/auth_controller.dart';
import 'package:interior_coffee/features/chat/screens/chat_list_page.dart';
import 'package:interior_coffee/features/personalization/screens/settings/settings.dart';
import 'package:interior_coffee/features/shop/screens/home/home.dart';
import 'package:interior_coffee/features/shop/screens/store/store.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';
import 'package:badges/badges.dart' as badges;

Stream<int> countSentMessagesStream() async* {
  final currentUserEmail = AuthController.instance.userData.value.email;

  // Step 1: Check if any messages exist with email equal to currentUserEmail
  final querySnapshot = await FirebaseFirestore.instance
      .collectionGroup('messages')
      .where('email', isEqualTo: currentUserEmail)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    // Step 2: If data exists, return the count of messages with 'sent' status and not equal to currentUserEmail
    yield* FirebaseFirestore.instance
        .collectionGroup('messages')
        .where('email', isNotEqualTo: currentUserEmail)
        .where('status', isEqualTo: 'sent')
        .snapshots()
        .map((messagesSnapshot) {
      int totalCount = messagesSnapshot.docs.length;
      print("Unread message count: $totalCount");
      return totalCount;
    });
  } else {
    // If no messages match the first condition, return 0
    yield 0;
  }
}

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int unreadCount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();
    final darkMode = THelperFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.dark : Colors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(
              icon: StreamBuilder<int>(
                stream: countSentMessagesStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Icon(Iconsax.message);
                  }
                  unreadCount = snapshot.data ?? 0;

                  return unreadCount > 0
                      ? badges.Badge(
                          position:
                              badges.BadgePosition.topEnd(top: -12, end: -12),
                          badgeContent: Text(
                            unreadCount.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: const Icon(Iconsax.message),
                        )
                      : const Icon(Iconsax.message);
                },
              ),
              label: 'Message',
            ),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    StoreScreen(),
    ChatListScreen(),
    SettingsScreen(),
  ];
}
