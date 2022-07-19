import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:ota_update/ota_update.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late OtaEvent currentEvent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const FlutterLogo(
              size: 100,
            ),

            const SizedBox(height: 20,),

            DropdownSearch<String>(
              popupProps: const PopupProps.menu(
                showSelectedItems: true,
                showSearchBox: true,
              ),
              enabled: true,
              items: const ["Brazil", "Italy", "Tunisia", 'Canada'],

              onChanged: (value) {
                print(value);
              },
              selectedItem: "Brazil",
            ),

            const SizedBox(height: 20,),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  try {
                    OtaUpdate().execute(
                      'https://internal1.4q.sk/flutter_hello_world.apk', //APK Download Link
                    ).listen(
                          (OtaEvent event) {
                        setState(() => currentEvent = event);
                      },
                    );
                  } catch (e) {
                    print('Failed to make OTA update. Details: $e');
                  }
                  },
                  child: const Text(
                    'UPDATE'
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
