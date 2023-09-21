import 'package:flutter/material.dart';
import 'package:longboardapp/services/auth.dart';
import 'package:longboardapp/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:longboardapp/services/models.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text(user.displayName ?? 'Guest'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 50),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/avatar.png')))),
                Text(user.email ?? '',
                    style: Theme.of(context).textTheme.titleLarge),
                const Spacer(),
                Text('${report.total}',
                    style: Theme.of(context).textTheme.displayMedium),
                Text('Tricks Completed',
                    style: Theme.of(context).textTheme.titleSmall),
                const Spacer(),
                ElevatedButton(
                  child: const Text('logout'),
                  onPressed: () async {
                    await AuthService().signOut();
                    if (mounted) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    }
                  },
                ),
                const Spacer()
              ],
            ),
          ));
    } else {
      return const LoadingScreen();
    }
  }
}
