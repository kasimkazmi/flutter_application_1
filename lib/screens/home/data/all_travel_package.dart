import 'package:flutter_application_1/base/res/media.dart';

// List of destinations
final List<Map<String, dynamic>> destinations = [
  {
    "id": 1,
    "destination": "New York, USA",
  },
  {
    "id": 2,
    "destination": "Los Angeles, USA",
  },
  {
    "id": 3,
    "destination": "Paris, France",
  },
  {
    "id": 4,
    "destination": "Rome, Italy",
  },
  {
    "id": 5,
    "destination": "Tokyo, Japan",
  },
  {
    "id": 6,
    "destination": "Bali, Indonesia",
  },
  {
    "id": 7,
    "destination": "Sydney, Australia",
  },
];

// List of packages, each referencing a destination by ID
final List<Map<String, dynamic>> packages = [
  {
    "id": 101,
    "destinationId": 1,
    "image": AppMedia.hotelRoomView2,
    "duration": "5 Nights / 6 Days",
    "rating": 4.5,
    "reviews": 5002,
    "flights": "3 Flights",
    "hotel": "1 Hotel",
    "transfers": "2 Transfers",
    "price": 1499,
    "description":
        "Experience the vibrant culture of New York City, including visits to Times Square, Central Park, and the Statue of Liberty.",
    "discounts": ["Limited Time", "30% Off"]
  },
  {
    "id": 102,
    "destinationId": 1,
    "image": AppMedia.hotelRoomView2,
    "duration": "4 Nights / 5 Days",
    "rating": 4.7,
    "reviews": 4500,
    "flights": "2 Flights",
    "hotel": "1 Hotel",
    "transfers": "1 Transfer",
    "price": 1299,
    "description":
        "Enjoy a short getaway in New York with a focus on art and culture, including Broadway shows and museum visits.",
    "discounts": ["Early Bird", "20% Off"]
  },
  {
    "id": 103,
    "destinationId": 2,
    "image": AppMedia.hotelRoomView2,
    "duration": "6 Nights / 7 Days",
    "rating": 4.6,
    "reviews": 3200,
    "flights": "3 Flights",
    "hotel": "2 Hotels",
    "transfers": "3 Transfers",
    "price": 1599,
    "description":
        "Explore the entertainment capital of the world, including Hollywood, Santa Monica Pier, and Universal Studios.",
    "discounts": ["Summer Special", "15% Off"]
  },
  {
    "id": 201,
    "destinationId": 3,
    "image": AppMedia.hotelRoomView2,
    "duration": "5 Nights / 6 Days",
    "rating": 4.5,
    "reviews": 5002,
    "flights": "3 Flights",
    "hotel": "1 Hotel",
    "transfers": "2 Transfers",
    "price": 1499,
    "description":
        "Experience the romance and history of Paris with visits to iconic landmarks like the Eiffel Tower and Louvre Museum.",
    "discounts": ["Limited Time", "30% Off"]
  },
  {
    "id": 202,
    "destinationId": 3,
    "image": AppMedia.hotelRoomView2,
    "duration": "4 Nights / 5 Days",
    "rating": 4.7,
    "reviews": 4500,
    "flights": "2 Flights",
    "hotel": "1 Hotel",
    "transfers": "1 Transfer",
    "price": 1299,
    "description":
        "Enjoy a short getaway in Paris with a focus on art and culture.",
    "discounts": ["Early Bird", "20% Off"]
  },
  {
    "id": 301,
    "destinationId": 5,
    "image": AppMedia.hotelRoomView2,
    "duration": "6 Nights / 7 Days",
    "rating": 4.8,
    "reviews": 3200,
    "flights": "2 Flights",
    "hotel": "2 Hotels",
    "transfers": "4 Transfers",
    "price": 1999,
    "description":
        "Explore the vibrant streets of Tokyo, from traditional temples to modern skyscrapers, and indulge in authentic Japanese cuisine.",
    "discounts": ["Special Deal", "25% Off"]
  },
  {
    "id": 302,
    "destinationId": 5,
    "image": AppMedia.hotelRoomView2,
    "duration": "5 Nights / 6 Days",
    "rating": 4.6,
    "reviews": 2800,
    "flights": "3 Flights",
    "hotel": "1 Hotel",
    "transfers": "2 Transfers",
    "price": 1799,
    "description":
        "Experience the best of Tokyo with guided tours and local experiences.",
    "discounts": ["Limited Offer", "15% Off"]
  },
  {
    "id": 401,
    "destinationId": 6,
    "image": AppMedia.hotelRoomView2,
    "duration": "7 Nights / 8 Days",
    "rating": 4.9,
    "reviews": 6000,
    "flights": "4 Flights",
    "hotel": "2 Hotels",
    "transfers": "3 Transfers",
    "price": 2199,
    "description":
        "Relax on the beautiful beaches of Bali, explore lush rice terraces, and enjoy traditional Balinese culture.",
    "discounts": ["Last Minute Deal", "10% Off"]
  },
  {
    "id": 402,
    "destinationId": 6,
    "image": AppMedia.hotelRoomView2,
    "duration": "5 Nights / 6 Days",
    "rating": 4.8,
    "reviews": 4500,
    "flights": "3 Flights",
    "hotel": "1 Hotel",
    "transfers": "2 Transfers",
    "price": 1799,
    "description":
        "A cultural journey through Bali, including visits to temples and local markets.",
    "discounts": ["Early Bird", "15% Off"]
  },
  {
    "id": 601,
    "destinationId": 7,
    "image": AppMedia.hotelRoomView2,
    "duration": "6 Nights / 7 Days",
    "rating": 4.7,
    "reviews": 2900,
    "flights": "2 Flights",
    "hotel": "1 Hotel",
    "transfers": "2 Transfers",
    "price": 1799,
    "description":
        "Discover the stunning sights of Sydney, including the Sydney Opera House, Bondi Beach, and the Blue Mountains.",
    "discounts": ["Seasonal Offer", "15% Off"]
  }
];
