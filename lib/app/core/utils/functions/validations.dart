class Validations {
  String? value;
  Validations(this.value);

  bool get isNotEmpty => value!.isNotEmpty;

  bool get isEmail => (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!));

  bool get isPassword => value!.length > 6;

  bool equatablePassword(String pwConfime) => value == pwConfime;
}
