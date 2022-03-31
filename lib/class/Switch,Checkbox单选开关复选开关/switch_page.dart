import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool _switchSelected = true;
  bool _checkBoxSelected = true;

  changeSwitchState(_) {
    setState(() {
      _switchSelected = !_switchSelected;
    });
  }

  changeCheckBoxState(_) {
    setState(() {
      _checkBoxSelected = !_checkBoxSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: [
                const Text(
                  "🐟",
                  textScaleFactor: 1.8,
                ),
                Switch(
                    value: _switchSelected,
                    activeColor: Colors.red,
                    onChanged: (_) {
                      setState(() {
                        _switchSelected = !_switchSelected;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                const Text(
                  "🐻",
                  textScaleFactor: 1.8,
                ),
                Switch(value: !_switchSelected, onChanged: changeSwitchState)
              ],
            ),
            SwitchListTile(
                value: _switchSelected,
                title: const Text("推送"),
                onChanged: changeSwitchState),
            //根据平台展示不同风格的开关
            Switch.adaptive(
                value: _switchSelected, onChanged: changeSwitchState),
            SwitchListTile.adaptive(
                value: _switchSelected,
                title: const Text("推送"),
                onChanged: changeSwitchState),
            Row(
              children: [
                const Text("🚗", textScaleFactor: 1.8),
                Checkbox(
                    value: _checkBoxSelected, onChanged: changeCheckBoxState)
              ],
            ),
            Row(
              children: [
                const Text("🏠", textScaleFactor: 1.8),
                Checkbox(
                    value: _checkBoxSelected, onChanged: changeCheckBoxState)
              ],
            ),
            CheckboxListTile(
                value: _checkBoxSelected,
                title: const Text("全要"),
                onChanged: changeCheckBoxState),
          ],
        ),
      ),
    );
  }
}
