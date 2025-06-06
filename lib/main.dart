import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:park_app/core/common/nav_bar_widget.dart';
import 'package:park_app/core/constants/env_constants.dart';
import 'package:park_app/core/constants/hive_constants.dart';
import 'package:park_app/features/booking/views/booking_view.dart';
import 'package:park_app/features/user/views/profile_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/bindings/getx_bindings.dart';
import 'core/helpers/hive_registerer.dart';
import 'core/config/env/env.dart';
import 'core/routes/routes.dart';
import 'features/browse_parking/views/browse_parking_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: env);
  // Initialize Hive
  await Hive.initFlutter();
  registerHiveAdapters(); // Register adapter
  await Hive.openBox(localStorage);
  //Initialize Supabase
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Parking App',
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 112, 70, 1))),
      initialBinding: GetBindings(), // Set initial bindings
      getPages: AppPages.routes, // Define routes
      debugShowCheckedModeBanner: false,
      home: Base(),
    );
  }
}

class Base extends StatefulWidget {
  static const String name = '/base';

  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  var selectedIndex = 0;

  final screens = <Widget>[
    ProfileView(),
    BrowseParkingView(),
    BookingView(),
  ];

  switchBar(index) {
    if (selectedIndex != index) {
      if (mounted) {
        setState(() {
          selectedIndex = index;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          child: Icon(Icons.home_max_rounded)),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: NavBarWidget(
              onTap: (int index) {
                switchBar(index);
              },
              index: 0,
              selectedIndex: selectedIndex,
              icon: Icons.person_2_rounded,
              name: 'Profile',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: NavBarWidget(
              onTap: (int index) {
                switchBar(index);
              },
              index: 2,
              selectedIndex: selectedIndex,
              icon: Icons.car_rental,
              name: 'Bookings',
            ),
          ),
        ]),
      ),
    );
  }
}
