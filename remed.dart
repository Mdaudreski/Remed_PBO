import 'dart:math';

// Fungsi utama untuk menghitung titik tengah dari daftar koordinat
Map<String, double> calculateGeographicCenter(List<Map<String, double>> coordinates) {
  double sumLatitude = 0;
  double sumLongitude = 0;
  int count = coordinates.length;

  // Perulangan untuk menjumlahkan semua latitude dan longitude
  for (var coordinate in coordinates) {
    sumLatitude += coordinate['latitude']!;
    sumLongitude += coordinate['longitude']!;
  }

  // Menghitung rata-rata latitude dan longitude
  double centerLatitude = sumLatitude / count;
  double centerLongitude = sumLongitude / count;

  return {
    'latitude': centerLatitude,
    'longitude': centerLongitude
  };
}

// Fungsi opsional untuk mencetak hasil dengan format yang spesifik
void printCenter({required Map<String, double> center, String? countryName}) {
  if (countryName != null) {
    print('Titik tengah dari $countryName:');
  }
  print('Latitude: ${center['latitude']}');
  print('Longitude: ${center['longitude']}');
}

// Fungsi inner untuk menghasilkan daftar koordinat contoh
List<Map<String, double>> generateCoordinates() {
  // Koordinat lokasi contoh
  return [
    {'latitude': -6.2088, 'longitude': 106.8456}, // Jakarta
    {'latitude': -7.2575, 'longitude': 112.7521}, // Surabaya
    {'latitude': -6.9147, 'longitude': 107.6098}, // Bandung
    {'latitude': -0.7893, 'longitude': 113.9213}, // Kalimantan
    {'latitude': 1.3521, 'longitude': 103.8198}, // Singapura (contoh negara tetangga)
  ];
}

// Fungsi utama
void main() {
  // Menggunakan fungsi inner untuk mendapatkan daftar koordinat
  List<Map<String, double>> coordinates = generateCoordinates();

  // Menggunakan fungsi untuk menghitung titik tengah
  Map<String, double> center = calculateGeographicCenter(coordinates);

  // Menggunakan fungsi opsional untuk mencetak hasil
  printCenter(center: center, countryName: 'Indonesia');

  // Contoh penggunaan anonymous function
  coordinates.forEach((coordinate) {
    print('Latitude: ${coordinate['latitude']}, Longitude: ${coordinate['longitude']}');
  });

  // Contoh closure
  Function generateCoordinateFunction(double latitude, double longitude) {
    return () => {'latitude': latitude, 'longitude': longitude};
  }

  var newCoordinate = generateCoordinateFunction(-8.4095, 115.1889);
  print('Koordinat baru: Latitude: ${newCoordinate()['latitude']}, Longitude: ${newCoordinate()['longitude']}');
}
