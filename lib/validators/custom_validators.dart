import 'package:form_field_validator/form_field_validator.dart';
import 'package:custom_validator/validators/instagram_url_validator.dart';
import 'package:custom_validator/validators/url_validator.dart';

final nameValidator = MultiValidator([
  // 必須入力チェック
  RequiredValidator(errorText: "名前を入力してください"),
  // 最大長チェック
  MaxLengthValidator(5,errorText: "名前は5文字以内で入力してください")
]);

final instagramValidator = MultiValidator([
  UrlValidator(errorText: "URLに無効な文字が含まれています"),
  InstagramUrlValidator(errorText: "Instagramの正しいURLを入力してください(https://www.instagram.com/ユーザー名)")
]);