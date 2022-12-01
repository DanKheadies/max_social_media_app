import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:max_social_media_app/models/models.dart';
import 'package:max_social_media_app/screens/screens.dart';
import 'package:max_social_media_app/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<User> users = User.users;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Discover',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
      body: MasonryGridView.count(
        shrinkWrap: true,
        itemCount: users.length,
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProfileScreen.routeName,
                arguments: users[index],
              );
            },
            child: Stack(
              children: [
                Container(
                  height: (index == 0) ? 250 : 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        users[index].imagePath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        stops: [0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          users[index].imagePath,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '2 min ago',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
