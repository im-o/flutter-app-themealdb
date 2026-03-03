import '../models/recipe.dart';
import '../core/services/logger_service.dart';

class RecipeRepository {
  Future<List<Recipe>> getRecipes() async {
    // Simulasi delay network
    await Future.delayed(const Duration(seconds: 1));
    LoggerService.info(
        'MealsMaster: Fetching specific user-requested recipes...');

    return [
      Recipe(
        id: '125001',
        title: 'Resep Ayam Goreng Nasi Kuning',
        category: 'Ayam',
        duration: '20 mnt',
        difficulty: 'Sedang',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125001-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          'Ayam (dipotong)',
          '3 siung lengkuas (parut)',
          '1 Royco bumbu komplit ayam goreng',
          'Beras putih',
          '750 ml santan kelapa',
          'Kunyit segar (3 cm)',
          'Jeruk nipis (1 sdt)',
          'Daun pandan',
          '1 batang serai',
          '2 sdt garam',
          'Bawang merah goreng'
        ],
        steps: [
          'Didihkan ayam dengan air.',
          'Masukkan Royco & lengkuas, masak hingga air menyusut dan ayam lunak.',
          'Goreng ayam hingga kecokelatan.',
          'Masak santan bersama kunyit, pandan, salam, serai, dan garam (aduk agar tidak pecah).',
          'Masukkan beras ke santan, masak hingga menjadi aron.',
          'Kukus nasi selama 45 menit hingga matang.'
        ],
      ),
      Recipe(
        id: '125003',
        title: 'Resep Ayam Katsu Balado',
        category: 'Ayam',
        duration: '15 mnt',
        difficulty: 'Mudah',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125003-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          '5 cabai merah',
          '3 siung bawang merah',
          '3 siung bawang putih',
          '1/2 tomat (dadu)',
          '1/2 Royco kaldu ayam',
          '2 sdm minyak',
          '300g dada ayam',
          '2 telur (kocok)',
          '100g tepung roti Panko',
          '50g tepung terigu'
        ],
        steps: [
          'Blender kasar bawang merah, putih, cabe, dan tomat.',
          'Tumis bumbu halus dan Royco hingga harum.',
          'Siapkan telur dan tepung dalam wadah terpisah, masing-masing dicampur sedikit Royco.',
          'Balut ayam dengan terigu, telur, lalu tepung roti. Ulangi 2 kali.',
          'Goreng hingga kuning kecokelatan.',
          'Sajikan dengan irisan kol dan timun.'
        ],
      ),
      Recipe(
        id: '125004',
        title: 'Bakwan Oncom Renyah',
        category: 'Camilan',
        duration: '20 mnt',
        difficulty: 'Sedang',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125004-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          '250g oncom',
          '100g tepung terigu',
          '1 telur',
          '1 Royco ayam',
          '125ml air',
          '1 daun bawang',
          '2 sdm margarin',
          '4 cabai merah',
          '8 bawang merah',
          '2 bawang putih',
          '3 kemiri',
          '1/4 sdt terasi'
        ],
        steps: [
          'Tumis bumbu halus dengan margarin hingga matang.',
          'Campur bumbu tumis dengan oncom, tepung, telur, Royco, air, and daun bawang.',
          'Goreng adonan dalam minyak banyak hingga matang kecokelatan.'
        ],
      ),
      Recipe(
        id: '125005',
        title: 'Bayam Udang Kukus',
        category: 'Sayuran',
        duration: '15 mnt',
        difficulty: 'Sedang',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125005-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          '1 ikat bayam rebus',
          '350g udang cincang',
          '50g tepung bumbu Royco',
          '1 telur kocok',
          '150g wortel dadu',
          '2 daun bawang',
          '50g jagung muda',
          'Saus tomat'
        ],
        steps: [
          'Campur udang, tepung Royco, telur, dan wortel.',
          'Letakkan bayam di atas alas plastik.',
          'Olesi bayam dengan adonan udang.',
          'Letakkan jagung muda di atas adonan.',
          'Gulung bayam dan padatkan.',
          'Kukus selama 20 menit dan sajikan dengan saus tomat.'
        ],
      ),
      Recipe(
        id: '125007',
        title: 'Burger Nasi Sapi Lada Hitam',
        category: 'Daging',
        duration: '10 mnt',
        difficulty: 'Sedang',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125007-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          '200g daging sukiyaki',
          '2 cabai merah',
          '2 cabai hijau',
          '1 bawang bombay',
          '1 sdt lada hitam',
          '2 sdm Royco sapi',
          '50ml air',
          '1 sdm kecap manis',
          '1 sdt maizena'
        ],
        steps: [
          'Tumis bawang bombay dan cabai.',
          'Masukkan daging sukiyaki, masak hingga berubah warna.',
          'Tambahkan Royco, lada hitam, dan kecap manis.',
          'Masukkan larutan maizena dan air, aduk hingga rata.'
        ],
      ),
      Recipe(
        id: '125006',
        title: 'Bola Bola Makaroni',
        category: 'Camilan',
        duration: '20 mnt',
        difficulty: 'Sedang',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125006-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          '3 smoked beef',
          '1/2 bombay',
          '2 sdm terigu',
          '175ml susu cair',
          '100g makaroni',
          '1 Royco sapi',
          '1/4 lada & pala',
          '30g keju',
          '4 sdm Blue Band',
          '100g tepung roti',
          '2 telur'
        ],
        steps: [
          'Tumis bombay, masukkan daging asap dan terigu.',
          'Tambahkan susu cair sedikit demi sedikit sambil diaduk.',
          'Masukkan makaroni, Royco, merica, pala, dan keju.',
          'Bentuk adonan menjadi bola-bola.',
          'Balut dengan tepung roti, telur, lalu tepung roti lagi.',
          'Goreng hingga matang dan sajikan dengan mayones.'
        ],
      ),
      Recipe(
        id: '125008',
        title: 'Churros Keju',
        category: 'Camilan',
        duration: '25 mnt',
        difficulty: 'Sedang',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125008-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          '225g tepung protein tinggi',
          '1 sdt baking powder',
          '1 sdt Royco ayam',
          '20g mentega',
          '250ml air',
          '200ml susu',
          '2 telur',
          '75g keju cheddar',
          '1 sdt parsley',
          '50g cokelat cincang',
          '20ml susu (untuk saus)'
        ],
        steps: [
          'Panaskan air, susu, mentega, dan Royco sampai mendidih.',
          'Masukkan tepung, baking powder, parsley, dan keju, aduk rata.',
          'Masukkan telur satu persatu sambil diaduk cepat.',
          'Masukkan ke plastik spuit, goreng hingga kering.',
          'Sajikan dengan saus cokelat leleh.'
        ],
      ),
      Recipe(
        id: '125009',
        title: 'Dadar Sayur Keju',
        category: 'Sarapan',
        duration: '15 mnt',
        difficulty: 'Mudah',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125009-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          '8 telur',
          '4 sdm susu cair',
          '4 lembar keju cheddar',
          '10g jamur kancing',
          '10g bayam rebus',
          '10g wortel',
          '3 sdm minyak',
          '1 1/4 sdt Royco ayam'
        ],
        steps: [
          'Tumis jamur, bayam, dan wortel sebentar.',
          'Kocok telur bersama susu dan Royco, campurkan sayuran tumis.',
          'Tuang telur ke wajan, letakkan keju di tengah, lalu gulung perlahan hingga matang.'
        ],
      ),
      Recipe(
        id: '125010',
        title: 'Resep Dori Popcorn',
        category: 'Camilan',
        duration: '20 mnt',
        difficulty: 'Sedang',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125010-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          '200g fillet dori',
          '1 sdt jeruk nipis',
          '1/4 sdt Royco ayam',
          '150ml air es',
          '100g terigu (pencelup)',
          '1/8 sdt lada',
          '200g terigu (pelapis)',
          '25g tepung beras',
          '1/2 sdt Royco ayam',
          '1/4 sdt bawang putih bubuk',
          '1/2 sdt baking powder'
        ],
        steps: [
          'Lumuri dori dengan jeruk nipis dan Royco.',
          'Siapkan adonan pencelup (terigu dkk) and adonan pelapis kering.',
          'Celupkan dori ke pencelup, gulingkan di pelapis sambil ditekan/dicubit.',
          'Goreng hingga garing dan matang.'
        ],
      ),
      Recipe(
        id: '125011',
        title: 'Egg Benedict',
        category: 'Sarapan',
        duration: '25 mnt',
        difficulty: 'Sedang',
        imageUrl:
            'https://assets.unileversolutions.com/recipes-v3/125011-default.jpg?im=AspectCrop=(300,300);Resize=(300,300)',
        ingredients: [
          '1 Royco sup krim ayam',
          '400ml air',
          '150g keju leleh',
          '6 telur',
          '3 sdt cuka',
          '3 tomat',
          '150g jamur kancing',
          '3 bawang putih',
          '3 sdm minyak'
        ],
        steps: [
          'Masak sup krim Royco dan keju hingga meleleh untuk saus.',
          'Tumis tomat, bawang putih, dan jamur hingga kecokelatan.',
          'Buat poached egg dengan merebus telur dalam pusaran air cuka selama 2 menit.',
          'Susun tomat, jamur, and telur di piring, lalu siram dengan saus keju.'
        ],
      ),
    ];
  }
}
