import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/section_title.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hey! Aman",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "7618447467",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.edit, color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Top Buttons
            Wrap(
              children: [
                _buildQuickButton(
                  Icons.shopping_bag_outlined,
                  "Orders",
                  context,
                ),
                _buildQuickButton(CupertinoIcons.heart, "Wishlist", context),
                _buildQuickButton(Icons.card_giftcard, "Coupons", context),
                _buildQuickButton(
                  Icons.emoji_emotions,
                  "Lulu happiness",
                  context,
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle(title: "Account settings", gradientWidth: 100),
                  const SizedBox(height: 8),
                  _buildListTile(CupertinoIcons.person, "Edit Profile"),
                  Divider(color: Colors.grey.shade100),
                  _buildListTile(Icons.location_on_outlined, "Saved Addresses"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle(title: "Help & Supports", gradientWidth: 100),
                  const SizedBox(height: 8),
                  _buildListTile(CupertinoIcons.person, "Contact Support"),
                  Divider(color: Colors.grey.shade100),
                  _buildListTile(Icons.location_on_outlined, "Privacy Policy"),
                  Divider(color: Colors.grey.shade100),
                  _buildListTile(CupertinoIcons.bell, "Return Policy"),
                  Divider(color: Colors.grey.shade100),
                  _buildListTile(
                    Icons.description_outlined,
                    "Terms & Conditions",
                  ),
                  Divider(color: Colors.grey.shade100),
                  _buildListTile(Icons.delete_outline, "Delete Account"),
                ],
              ),
            ),
            InkWell(
              radius: 12,
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.grey.shade100),
                ),
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.pink),
                    const SizedBox(width: 10),
                    Text(
                      "Sign Out",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickButton(IconData icon, String label, BuildContext context) {
    return Container(
      width: (MediaQuery.sizeOf(context).width / 2) - 16,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6E9),
        border: Border.all(color: Color(0xFFE0E0E0), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 5, right: 5),
        leading: Icon(icon, size: 25, color: Colors.black87),
        title: Text(
          label,
          softWrap: true,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontSize: 15),),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
