bool hasNumber(String value){
  bool tag = false;
  value.runes.forEach((element) {
    int ascii = element;
    if(ascii >= 48 && ascii <= 57)
      tag = true;
  });
  return tag;
}


bool hasUpperCase(String value){
  bool tag = false;
  value.runes.forEach((element) {
    int ascii = element;
    if(ascii >= 65 && ascii <= 90)
      tag = true;
  });
  return tag;
}

bool hasLowerCase(String value){
  bool tag = false;
  value.runes.forEach((element) {
    int ascii = element;
    if(ascii >= 97 && ascii <= 122)
      tag = true;
  });
  return tag;
}

bool validatePasswordLength(value){
  return value.length >= 8 && value.length <= 16;
}

bool inputValidator(value){
  if(hasNumber(value) &&
      hasUpperCase(value) &&
      hasLowerCase(value) &&
      validatePasswordLength(value)
  )
    return true;
  return false;
}