// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  nameChanged(String name) {
    print(name);
  }

  pwdChanged(String pwd) {
    print(pwd);
  }

  //* 通过 controller 来控制输入框的值
  final TextEditingController _te1Controller = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  // ignore: unused_field
  FocusScopeNode? _focusScopeNode; //下面代码注释了

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //* 初始化时设置输入框的值
    _te1Controller.text = 'hello world';

    //* 监听输入框的值
    _te1Controller.addListener(() {
      print(_te1Controller.text);
    });

    //* 监听焦点
    _focusNode1.addListener(() {
      print('_focusNode1: ${_focusNode1.hasFocus}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          const Text("设置焦点"),
          TextField(
            autofocus: true,
            focusNode: _focusNode1,
            decoration: const InputDecoration(
              hintText: '设置焦点自动第一响应',
            ),
          ),
          TextField(
            cursorColor: Colors.red,
            onChanged: nameChanged,
            decoration: const InputDecoration(
              labelText: '用户名',
              hintText: '输入用户名',
              icon: Icon(Icons.face),
            ),
          ),
          TextField(
            onChanged: pwdChanged,
            decoration: const InputDecoration(
              labelText: '密码',
              hintText: '输入密码',
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          const Padding(padding: EdgeInsets.all(20)),
          const Text("通过 controller 获取输入状态，设置默认值"),
          TextField(
            controller: _te1Controller,
            focusNode: _focusNode2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '普通样式',
              //* 非焦点状态下颜色
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              //* 焦点状态下颜色
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                child: const Text('切换焦点'),
                onPressed: () {
                  // _focusScopeNode ??= FocusScope.of(context);
                  // if (_focusNode1.hasFocus) {
                  //   _focusScopeNode!.requestFocus(_focusNode2);
                  // } else {
                  //   _focusScopeNode!.requestFocus(_focusNode1);
                  // }
                  //两种方法都行
                  if (_focusNode1.hasFocus) {
                    _focusNode2.requestFocus();
                  } else {
                    _focusNode1.requestFocus();
                  }
                },
              ),
              ElevatedButton(
                child: const Text('隐藏键盘'),
                onPressed: () {
                  // _focusScopeNode ??= FocusScope.of(context);
                  // _focusScopeNode!.unfocus();
                  //两种方法都行
                  FocusScope.of(context).unfocus();
                },
              )
            ],
          ),
          const Text("Form 表单"),
          Form(
              key: _formKey, //设置 globalKey，用于获取 FormState
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '用户名',
                      hintText: '输入用户名',
                      icon: Icon(Icons.face),
                    ),
                    validator: (s) {
                      return s?.isEmpty ?? true ? '用户名不能为空' : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '密码',
                      hintText: '输入密码',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (s) {
                      return s?.isEmpty ?? true ? '密码不能为空' : null;
                    },
                  ),
                  ElevatedButton(
                    child: const Text('登录'),
                    onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        // 如果输入都检验通过，则进行登录操作
                        print('登录成功');
                      }
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
