class DateUtility {
  /*
  * ex: 21-Mar-2019
  * */
  static String dateToStringDdMmYyyy(DateTime? dateTime) {
    if (dateTime == null) {
      return '-';
    }
    String tanggal =
        '${dateTime.day < 10 ? '0' : ''}${dateTime.day}-${namaBulanPendek[dateTime.month]}-${dateTime.year}';
    return tanggal;
  }

  /*
  * ex: 2020-11-23
  * */
  static String dateToStringYYYYMMDD(DateTime dateTime) {
    if (dateTime == null) {
      return '';
    }
    String tanggal =
        '${dateTime.year}-${dateTime.month}-${dateTime.day < 10 ? '0' : ''}${dateTime.day}';
    return tanggal;
  }

  /*
  * ex: 09:12:13
  * */
  static String dateToStringjammenitsecond(DateTime dateTime) {
    if (dateTime == null) {
      return '';
    }
    String jam = '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
    return jam;
  }

  /*
  * ex: 09:12
  * */
  static String dateToStringjammenit(DateTime dateTime) {
    if (dateTime == null) {
      return '';
    }
    String jam = '${dateTime.hour}:${dateTime.minute}';
    return jam;
  }

  /*
  * ex: 20201123
  * */
  static String dateToStringParam(DateTime dateTime) {
    if (dateTime == null) {
      return '';
    }
    String bulan =
        dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    String tanggal =
        '${dateTime.year}$bulan${dateTime.day < 10 ? '0' : ''}${dateTime.day}';
    return tanggal;
  }

  /*
  * ex: Kamis, 10 Des 2020
  * */
  static String dateToStringPanjang(DateTime? dt) {
    if (dt == null) {
      return '';
    }
    return '${namaHariPanjang[dt.weekday]}, ${dt.day} ${namaBulanPendek[dt.month]} ${dt.year}';
  }

  /*
  * ex: Kamis, 10-12-2020 09:00:00
  * */
  static String dateToStringLengkap(DateTime dt) {
    if (dt == null) {
      return '';
    }
    return '${namaHariPanjang[dt.weekday]}, ${dt.day}-${dt.month}-${dt.year} ${dt.hour}:'
        '${dt.minute}:${dt.second}';
  }

  static final namaBulanPendek = const [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Ags',
    'Sept',
    'Okt',
    'Nov',
    'Des'
  ];

  static final namaHariPanjang = const [
    '',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jum\'at',
    'Sabtu',
    'Minggu'
  ];
}
