import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/product_list_screen.dart';
import 'package:chat_app/screens/usertile.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()),
                );
              },

              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 100),
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                elevation: 5,
                shadowColor: Colors.blue.withValues(alpha: 0.3),
              ),
              child: Text(
                "Language page",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDirectoryScreen(),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 100),
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.white,
                elevation: 5,
                shadowColor: Colors.blue.withValues(alpha: 0.3),
              ),
              child: Text(
                "Usertile",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },

              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 100),
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white,
                elevation: 5,
                shadowColor: Colors.blue.withValues(alpha: 0.3),
              ),
              child: Text(
                "Chat Sreen",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
