# FixItNow

A portrait Flutter super-app prototype with 19 switchable verticals, built from
local Dart mock catalogs. Android and iOS are supported. The reference layouts
are interpreted with local icon illustrations, gradients, navy headers, pink
actions, cyan accents and a bundled Inter font.

## Run

```sh
flutter pub get
flutter run
```

The app itself is fully offline. There are no HTTP clients, remote images,
Firebase services, backend integrations or Android internet permissions.
Dependency resolution is a development-time operation, not an app feature.
Removing internet permission from debug builds can limit Android hot reload
and debugger connectivity; a regular offline install still works.

## Structure

- `lib/data/mock_*.dart`: one catalog per vertical, plus the catalog registry.
- `lib/models/`: typed products, categories, banners and vertical configuration.
- `lib/screens/`: one home entry point per vertical and shared rendering,
  detail, collection and placeholder screens.
- `lib/widgets/`: reusable header, switcher, search, banners, cards, categories,
  forms, mock map, sparklines, countdown, trust badges and bottom navigation.
- `lib/navigation/`: nested Navigator routes and one bottom-tab configuration.
- `lib/state/cart_provider.dart`: in-memory cart quantities and saved items.
- `lib/theme/app_theme.dart`: shared brand theme.

One Scaffold owns the header, horizontal vertical switcher and persistent
five-tab BottomNavigationBar. A nested Navigator handles detail/collection
pages, leaving the global shell visible. Vertical switching returns to that
vertical's home and updates its bottom tabs.

Search filters the local catalog. Plus buttons update a Provider-backed cart
badge. Favorites toggle locally. Forms accept sample details, validate required
fields and show mock result details. Auction countdowns run locally, and market
sparklines and ride maps are drawn on-device. Subscriptions includes wellness
and entertainment in a single merged screen.

All detail actions show a SnackBar. Purchases, bookings, bids, investments,
prescription uploads and job applications are illustrative only; nothing is
submitted, charged or processed. Cart and favorites reset when the app restarts.

Inter is bundled under its SIL Open Font License in `assets/fonts/OFL.txt`.
