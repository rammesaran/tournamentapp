const EMAIL_REGEX =
    r"""^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$""";

bool isValidEmail(String email) {
  return RegExp(EMAIL_REGEX).hasMatch(email);
}
