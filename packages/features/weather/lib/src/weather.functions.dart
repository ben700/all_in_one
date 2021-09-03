/// UVI(오존 층) index 에 따른 텍스트 출력.
String uviText(num? uvi) {
  if (uvi == null)
    return '...';
  else if (uvi < 3)
    return '낮음';
  else if (uvi < 6)
    return '보통';
  else if (uvi < 8)
    return '높음';
  else if (uvi < 11)
    return '매우높음';
  else
    return '위험';
}

/// UVI(오존 층) index 에 따른 아이콘 출력.
String uviIcon(num? uvi) {
  if (uvi == null)
    return 'face/smiling';
  else if (uvi < 3)
    return 'face/smiling';
  else if (uvi < 6)
    return 'face/fair';
  else if (uvi < 8)
    return 'face/angry';
  else if (uvi < 11)
    return 'face/devil';
  else
    return 'face/devil';
}
