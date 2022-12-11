import 'package:custom_validator/success.dart';
import 'package:custom_validator/validators/custom_validators.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({Key? key}) : super(key: key);

  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    const key = GlobalObjectKey<FormState>('FORM_KEY');

    /// ユーザー名のTextEditingController
    TextEditingController userNameController = TextEditingController();

    /// インスタグラムURLのTextEditingController
    TextEditingController instagramUrlController = TextEditingController();
    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            /// 名前のテキストフォーム
            const Text('ユーザー名 '),
            TextFormField(
              controller: userNameController,
              validator: nameValidator,
              decoration: const InputDecoration(
                errorMaxLines: 3,
              ),
            ),
            const SizedBox(height: 30),

            /// インスタグラムURLの入力フォーム
            const Text('インスタグラムのURL'),
            TextFormField(
              controller: instagramUrlController,
              validator: instagramValidator,
              decoration: const InputDecoration(
                errorMaxLines: 3,
              ),
            ),
            const SizedBox(height: 30),

            /// 決定ボタン
            MaterialButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  // フォームの入力値が正しかった場合成功画面に遷移する。
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SuccessScreen())
                  );
                }
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
