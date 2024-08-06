class Generator {
  static String link(name) {
    String link = 'linkNotFound';
    switch (name) {
      case 'facebook':
        link = 'https://www.facebook.com';
      case 'youtube':
        link = 'https://www.youtube.com';
      case 'gmail':
        link = 'https://www.gmail.com';
      case 'Adobe':
        link = 'https://www.Adobe.com';
      case 'microsoft':
        link = 'https://www.microsoft.com';
      case 'netflix':
        link = 'https://www.netflix.com';
      case 'instagram':
        link = 'https://www.instagram.com';
      case 'spotify':
        link = 'https://open.spotify.com';
      case 'x':
        link = 'https://x.com/';
      case 'tiktok':
        link = 'https://www.tiktok.com';
    }
    return link;
  }

  static String logo(name) {
    String logo = 'assets/icons/logo.png';
    name.toString().toLowerCase();
    switch (name) {
      case 'facebook':
        logo = 'assets/logos/facebook.png';
      case 'youtube':
        logo = 'assets/logos/youtube.png';
      case 'gmail':
        logo = 'assets/logos/gmail.png';
      case 'adobe':
        logo = 'assets/logos/Adobe.png';
      case 'microsoft':
        logo = 'assets/logos/microsoft.png';
      case 'netflix':
        logo = 'assets/logos/netflix.png';
      case 'instagram':
        logo = 'assets/logos/instagram.png';
      case 'spotify':
        logo = 'assets/logos/spotify.png';
      case 'x':
        logo = 'assets/logos/twitter.png';
      case 'tiktok':
        logo = 'assets/logos/tiktok.png';
    }
    return logo;
  }
}
