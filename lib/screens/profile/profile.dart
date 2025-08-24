import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uop_sports_v3/common/app_features/images.dart';
import 'package:uop_sports_v3/common/widgets/setting_item.dart';
import 'package:uop_sports_v3/components/wrappers/default_wrapper.dart';
import 'package:uop_sports_v3/utils/provider/theme_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return DefaultWrapper(
        // appBar: AppBar(),
        child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(UopImages.profile),
            backgroundColor: Theme.of(context).colorScheme.primary,
            minRadius: 60,
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Text(
              'Creator  Profile',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.01),
            child: Text('SUPER',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w800)),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.01),
            child: Text(
              'Student Membership',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.06),
                  child: Text('Phone',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.06),
                  child: Text(
                    '07745962035',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.03, bottom: screenHeight * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.06),
                  child: Text('Email',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.06),
                  child: Text(
                    'creator@profile.com',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SettingItem(
                onTap: () {},
                icons: CupertinoIcons.gear,
                title: 'Settings',
                trailing: const Icon(CupertinoIcons.chevron_forward),
              ),
              SettingItem(
                  onTap: () {
                    themeProvider.toggleTheme();
                  },
                  title: 'Dark mode',
                  icons: CupertinoIcons.moon,
                  trailing: Switch.adaptive(
                      value: themeProvider.isDarkTheme,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      })),
              SettingItem(
                onTap: () {},
                title: 'Notifications',
                icons: CupertinoIcons.bell,
                trailing: const Icon(CupertinoIcons.chevron_forward),
              ),
              SettingItem(
                  onTap: () {},
                  title: 'Terms and conditions',
                  trailing: const Icon(CupertinoIcons.chevron_forward)),
              SettingItem(
                  onTap: () {},
                  icons: CupertinoIcons.lock,
                  title: 'Privacy and policy')
            ],
          ))
        ],
      ),
    ));
  }
}
