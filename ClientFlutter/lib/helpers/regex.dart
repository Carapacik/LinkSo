final passwordRegex = RegExp(r"^(?=.*[0-9]).{5,30}$");
final emailRegex = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
);
final linkRegex = RegExp(
  r"^(http(s)?:\/\/.)?(www\.)?[-0-9\p{L}@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-0-9\p{L}@:%_\+.~#?&//=]*)$",
  unicode: true,
);
