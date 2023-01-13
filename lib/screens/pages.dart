import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enum_to_string/enum_to_string.dart';

enum Progress { pageOne, pageTwo, pageThree }

Progress? getProgress() {
  //TODO: will get progress from Shared Preference and return
//  SharedPreferences.getInstance().getString("item");
}

void saveProgress(Progress progress) async {
  //TODO:will save progress in Shared preference

  final prefs = await SharedPreferences.getInstance();

  // await prefs.setString("items", progress);
}

class ParentPage extends StatelessWidget {
  const ParentPage({super.key});

  void _performNavigation(BuildContext context) {
    switch (getProgress()) {
      case null:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const PageOne()));
        break;
      case Progress.pageOne:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const PageTwo()));
        break;
      case Progress.pageTwo:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const PageThree()));
        break;
      case Progress.pageThree:
        // TODO: Show that process is already completed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _performNavigation(context),
          child: const Text('Continue'),
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  void _performNavigation(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    saveProgress(Progress.pageOne);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _performNavigation(context),
          child: const Text('Continue'),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  void _performNavigation(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PageThree()));
  }

  @override
  Widget build(BuildContext context) {
    saveProgress(Progress.pageTwo);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _performNavigation(context),
          child: const Text('Continue'),
        ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    saveProgress(Progress.pageThree);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Three'),
      ),
      body: const Center(
        child: Text('Thanks'),
      ),
    );
  }
}
