import 'package:flutter/material.dart';
import 'dart:math';

class UserTile extends StatelessWidget {
  final String name;
  final String email;
  final Color avatarColor;
  final String avatarText;
  final String status;
  final bool isOnline;

  const UserTile({
    Key? key,
    required this.name,
    required this.email,
    required this.avatarColor,
    required this.avatarText,
    required this.status,
    required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              email,
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isOnline ? Colors.green : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  status,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        leading: CircleAvatar(
          backgroundColor: avatarColor,
          radius: 25,
          child: Text(
            avatarText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder:
                (context) => _buildUserDetailsSheet(
                  context,
                  name,
                  email,
                  avatarColor,
                  avatarText,
                ),
          );
        },
      ),
    );
  }
}

Widget _buildUserDetailsSheet(
  BuildContext context,
  String name,
  String email,
  Color avatarColor,
  String avatarText,
) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: avatarColor,
          radius: 40,
          child: Text(
            avatarText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          email,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(Icons.email, 'Email', Colors.blue),
            const SizedBox(width: 16),
            _buildActionButton(Icons.phone, 'Call', Colors.green),
            const SizedBox(width: 16),
            _buildActionButton(Icons.chat_bubble, 'Chat', Colors.orange),
          ],
        ),
      ],
    ),
  );
}

Widget _buildActionButton(IconData icon, String label, Color color) {
  return Column(
    children: [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 24),
      ),
      const SizedBox(height: 8),
      Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
    ],
  );
}

class UserDirectoryScreen extends StatelessWidget {
  UserDirectoryScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _users = [
    {
      'name': 'Alan Walker',
      'email': 'alan@gmail.com',
      'color': Colors.blue[300],
      'avatar': 'A',
    },
    {
      'name': 'Emma Johnson',
      'email': 'emma.j@outlook.com',
      'color': Colors.pink[300],
      'avatar': 'E',
    },
    {
      'name': 'Michael Chen',
      'email': 'mchen@company.co',
      'color': Colors.green[300],
      'avatar': 'M',
    },
    {
      'name': 'Sofia Rodriguez',
      'email': 'sofia.r@gmail.com',
      'color': Colors.purple[300],
      'avatar': 'S',
    },
    {
      'name': 'James Wilson',
      'email': 'jwilson@mail.org',
      'color': Colors.amber[300],
      'avatar': 'J',
    },
    {
      'name': 'Olivia Parker',
      'email': 'oparker@example.com',
      'color': Colors.teal[300],
      'avatar': 'O',
    },
    {
      'name': 'Liam Thompson',
      'email': 'liam.t@domain.net',
      'color': Colors.red[300],
      'avatar': 'L',
    },
  ];

  final List<String> _statusMessages = [
    'Online',
    'Busy',
    'Away',
    'In a meeting',
    'Do not disturb',
    'Available',
  ];

  String _getRandomStatus() {
    final random = Random();
    return _statusMessages[random.nextInt(_statusMessages.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'User Directory',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo.withOpacity(0.2), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Team Members',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    final user = _users[index];
                    final status = _getRandomStatus();
                    final isOnline = status == 'Online';

                    return UserTile(
                      name: user['name'],
                      email: user['email'],
                      avatarColor: user['color']!,
                      avatarText: user['avatar'],
                      status: status,
                      isOnline: isOnline,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
