//user defined data type for storing info of every listItem
class Webtoon {
  final String title;
  final String thumbnail;
  final String description;
  bool isFavorite; // Allows updates to the favorite status
  double rating;

  Webtoon({
    required this.title,
    required this.thumbnail,
    required this.description,
    this.isFavorite = false,
    this.rating = 0.0,
  });
}

final List<Webtoon> webtoons = [
  Webtoon(
    title: 'Hello Baby',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123040-750x375.webp',
    description: 'A romance about fate, love, and a secret child.',
  ),
  Webtoon(
    title: 'The Alpha King\'s Claim',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123400-750x375.webp',
    description: 'Supernatural romance with werewolves.',
  ),
  Webtoon(
    title: 'Bitten Contract',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123842-750x375.webp',
    description:
        'A top actor and vampire forms an unusual relationship with an actress.',
  ),
  Webtoon(
    title: 'Tricked into Becoming the Heroine’s Stepmother',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-125252-750x375.webp',
    description:
        'A woman wakes up in a novel she wrote after dying in the real world.',
  ),
  Webtoon(
    title: 'The Guy Upstairs',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/08/Screenshot-2024-05-28-192655-e1723318535608-750x375.png',
    description:
        'A thriller about a girl uncovering dark secrets from her neighbor.',
  ),
  Webtoon(
    title: 'The Runaway',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/08/Screenshot-2024-08-11-011235-750x375.png',
    description: 'A fashion worker reconnects with her old flame in Paris.',
  ),
  Webtoon(
    title: 'Your Smile Is A Trap',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-132459-750x375.webp',
    description: 'Two misunderstood individuals form an unlikely bond.',
  ),
  Webtoon(
    title: 'There Must Be Happy Endings',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-133040-1024x512.webp',
    description:
        'A woman tries to save her husband after being given a second chance at life.',
  ),
  Webtoon(
    title: 'Seasons of Blossom',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-133857-750x375.webp',
    description: 'Four interconnected stories across different seasons.',
  ),
  Webtoon(
    title: 'Romance 101',
    thumbnail:
        'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-134227-750x375.webp',
    description: 'A well-organized girl joins a club to find love.',
  ),
];
