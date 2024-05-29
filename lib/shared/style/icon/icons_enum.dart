enum IconsEnum {
  assests,
  components,
  location,
  network,
  ;

  const IconsEnum();

  String get path => 'assets/icons/$name.png';
}

const logoPath = 'assets/logo/tractian.png';
