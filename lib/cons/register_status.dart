enum RegisterStatus {
  isRegister,
  unRegister,
}


extension ParseToString on RegisterStatus {
  String toShortUpperString() {
    return toString().split('.').last.toUpperCase();
  }
}
