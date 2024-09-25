part of 'helper.dart';

class Validator {
  static String? validateEmail(String? email) {
    if (email == null || email.trim() == "") return "Validate.Email_Invalid".tr;
    var isValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if (!isValid) return "Validate.Email_Invalid".tr;
    return null;
  }

  static String? validatePassword(String? pass) {
    if (pass == null || pass.trim() == "") {
      return "Validate.Pass_required".tr;
    } else if (pass.length < 6) return "Validate.Pass_require_length".tr;
    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.trim() == "") {
      return "Validate.Phone_required".tr;
    } else if (phone.isEmpty) return "Validate.Phone_invalid".tr;
    return null;
  }

//
  static String? validateName(String? name) {
    if (name == null || name == "") {
      return "Validate.Name_required".tr;
    } else if (name.isEmpty) return "Validate.Name_Invalid".tr;
    return null;
  }

  static String? validateAddress(String? name) {
    if (name == null || name == "") {
      return "Validate.Address_Required".tr;
    } else if (name.isEmpty) return "Validate.Address_Invalid".tr;
    return null;
  }

  static String? validatePasswordConfirm(String? pass, String? passConfirm) {
    if (pass == null || pass.trim() == "") {
      return "Validate.Pass_required".tr;
    } else if (pass.length < 6)
      return "Validate.Pass_require_length".tr;
    else if (pass != passConfirm) return "Validate.Pass_Confirm".tr;
    return null;
  }
}
