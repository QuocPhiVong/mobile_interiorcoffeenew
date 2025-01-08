class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required!';
    }

    //dinh dang email
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'Password is required';
    }

    //kiem tra do dai mat khau
    if(value.length < 6){
      return 'Password must be at leastt 6 characters long';
    }

    //kiem tra ki tu in hoa
    if(!value.contains(RegExp(r'[A-Z]'))){
      return 'Password must be contain at least one uppercase letter';
    }

    //kiem tra ki tu dac biet
    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return 'Password must be contain at least one special character';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value){
    if(value == null || value.isEmpty){
      return 'Phone number is required';
    }

    //dinh dang so dien thoai (10 so)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)){
      return 'Invalid phone number format (10 digits)';
    }

    return null;
  }


}
