import 'package:flutter/material.dart';
import 'scripts_data.dart'; // Make sure this path is correct
import 'dart:io';

class InstallationApp extends StatefulWidget {
  const InstallationApp({super.key});

  @override
  InstallationAppState createState() => InstallationAppState();
}

class InstallationAppState extends State<InstallationApp> {
  final greencs = const Color.fromARGB(255, 166, 193, 108);
  final redcs = const Color.fromARGB(255, 255, 142, 134);

  late List<bool> executedStatus;
  int currentScriptIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initially, no checkboxes should be checked
    executedStatus = List<bool>.filled(scripts.length, false);
  }

void handleNext() {
  if (currentScriptIndex < scripts.length - 1) {
    // Execute the corresponding script file
    final scriptFile = scripts[currentScriptIndex]['executed_file']!;
    executeScript(scriptFile);
    // Move to the next item and check it
    setState(() {
      executedStatus[currentScriptIndex] = true;
      currentScriptIndex++;
    });
  } else if (currentScriptIndex == scripts.length - 1) {
    // Execute the last script and don't increment currentScriptIndex
    final scriptFile = scripts[currentScriptIndex]['executed_file']!;
    executeScript(scriptFile);
    setState(() {
      executedStatus[currentScriptIndex] = true;
    });
  } else {
    print('No more scripts to execute.');
  }
}


  void executeScript(String scriptFile) async {
    try {
      print('Starting terminal for script: $scriptFile');
      await Process.start(
        'gnome-terminal',
        ['--', 'bash', '-c', 'bash $scriptFile'],
        mode: ProcessStartMode.detached, // Detached mode for independent execution
      );
      print('Terminal started for script: $scriptFile');

      // Introduce a small delay to allow the terminal to open and execute the script
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      print('Error: $e'); // Handle errors
    }
  }

  void handleCancel() {
    setState(() {
      currentScriptIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 2.0, color: Colors.grey),
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 200,
                height: 400,
                child: ListView.builder(
                  itemCount: scripts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        scripts[index]['name'],
                        style: TextStyle(
                          color: executedStatus[index]
                              ? greencs
                              : const Color.fromARGB(98, 255, 255, 255),
                          fontWeight: executedStatus[index]
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      leading: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: executedStatus[index]
                                  ? greencs
                                  : Colors.transparent,
                              border: Border.all(color: greencs),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          if (executedStatus[index])
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                border: Border.all(color: greencs),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  scripts[currentScriptIndex]['heading'],
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: greencs,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  scripts[currentScriptIndex]['context'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Key Points :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: redcs,
                  ),
                ),
                const SizedBox(height: 10),
                ...scripts[currentScriptIndex]['description']
                    .map<Widget>(
                      (point) => Text(
                        " -  $point",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(217, 255, 239, 209),
                        ),
                      ),
                    )
                    .toList(),
                const SizedBox(height: 20),
                const Spacer(), // Pushes the buttons to the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: handleCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: redcs,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      label: const Text('Cancel'),
                      icon: const Icon(Icons.close), // Times icon
                    ),
                    const SizedBox(width: 10),
                    if (currentScriptIndex < scripts.length) // Show Next button if there are scripts left
                      ElevatedButton.icon(
                        onPressed: handleNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greencs,
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        label: const Text('Next'),
                        icon: const Icon(Icons.arrow_forward), // Arrow forward icon
                      )
                    else // Show completion message when done
                      const Text(
                        "You are all set up, now you can start your development journey!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
