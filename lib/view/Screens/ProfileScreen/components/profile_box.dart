import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/providers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';

class ProfileBox extends StatelessWidget {
  Logger logger = Logger('ProfileBox');

  @override
  Widget build(BuildContext context) {
    final controllerL = Provider.of<UserDetailProvider>(context);
    final controller = Provider.of<UserDetailProvider>(context);
    return Container(
      height: displayHeight(context) * 0.35,
      width: displayWidth(context),
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: "Mukta"),
              ),
              Container(
                alignment: Alignment.center,
                width: displayWidth(context) * 0.1,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white)),
                child: IconButton(
                    icon: const Icon(Icons.logout),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {
                      logger.info('Logout');
                    }),
              )
            ],
          ),
          Stack(
            children: [
              CircleAvatar(
                radius: displayWidth(context) * 0.15,
                backgroundImage: const NetworkImage(
                    'https://i.pinimg.com/236x/5a/0c/7b/5a0c7b76e2a8bcdbe571c5ba916f93fe.jpg'),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: displayWidth(context) * 0.044,
                    child: IconButton(
                      iconSize: 18,
                      onPressed: () {
                        logger.info('Edit');
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 8),
          Text(
            controllerL.user!.name!,
            style: const TextStyle(
                color: Colors.white,
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: "PTSerif"),
          ),
          Text(
            '+91${controllerL.user!.phone!}',
            style: const TextStyle(
                color: Colors.white70, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
