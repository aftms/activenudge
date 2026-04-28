import '../core_seed_imports.dart';

class ActivitySeedService {
  ActivitySeedService({
    required ActivityRepository activityRepository,
    required DateTimeProvider dateTimeProvider,
  }) : _activityRepository = activityRepository,
       _dateTimeProvider = dateTimeProvider;

  final ActivityRepository _activityRepository;
  final DateTimeProvider _dateTimeProvider;

  Future<void> seedDefaultsIfNeeded() async {
    if (await _activityRepository.countActivities() > 0) {
      return;
    }
    final now = _dateTimeProvider.now();
    await _activityRepository.upsertMany(defaultActivities(now));
  }

  static List<Activity> defaultActivities(DateTime now) {
    return <Activity>[
      Activity(
        stableId: 'neck_stretch',
        titleEn: 'Neck stretch',
        titlePt: 'Alongamento cervical',
        descriptionEn: 'A short neck mobility break to reduce stiffness.',
        descriptionPt:
            'Uma pausa curta de mobilidade cervical para reduzir rigidez.',
        instructionsEn:
            'Sit or stand tall. Slowly tilt your head to each side and hold gently.',
        instructionsPt:
            'Sente-se ou fique de pé com boa postura. Incline lentamente a cabeça para cada lado e mantenha suavemente.',
        suggestedDurationMinutes: 5,
        category: ActivityCategory.mobility,
        intensity: ActivityIntensity.low,
        contentType: ActivityContentType.text,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      ),
      Activity(
        stableId: 'light_squats',
        titleEn: 'Light squats',
        titlePt: 'Agachamentos leves',
        descriptionEn: 'Gentle lower-body movement to wake up your legs.',
        descriptionPt:
            'Movimento suave da parte inferior do corpo para ativar as pernas.',
        instructionsEn:
            'Stand with feet hip-width apart. Bend your knees slightly and return to standing.',
        instructionsPt:
            'Fique de pé com os pés à largura da anca. Dobre ligeiramente os joelhos e volte à posição inicial.',
        suggestedDurationMinutes: 5,
        category: ActivityCategory.strength,
        intensity: ActivityIntensity.low,
        contentType: ActivityContentType.text,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      ),
      Activity(
        stableId: 'walk_in_place',
        titleEn: 'Walk in place',
        titlePt: 'Caminhada no lugar',
        descriptionEn: 'A simple cardio break without leaving your space.',
        descriptionPt: 'Uma pausa simples de cardio sem sair do lugar.',
        instructionsEn:
            'March in place at a comfortable pace. Keep your shoulders relaxed.',
        instructionsPt:
            'Marche no lugar a um ritmo confortável. Mantenha os ombros relaxados.',
        suggestedDurationMinutes: 5,
        category: ActivityCategory.cardio,
        intensity: ActivityIntensity.medium,
        contentType: ActivityContentType.text,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      ),
      Activity(
        stableId: 'shoulder_mobility',
        titleEn: 'Shoulder mobility',
        titlePt: 'Mobilidade dos ombros',
        descriptionEn: 'Loosen tight shoulders with slow controlled circles.',
        descriptionPt: 'Solte ombros tensos com círculos lentos e controlados.',
        instructionsEn:
            'Roll your shoulders forward and backward. Move slowly and breathe evenly.',
        instructionsPt:
            'Rode os ombros para a frente e para trás. Mova-se devagar e respire de forma regular.',
        suggestedDurationMinutes: 4,
        category: ActivityCategory.mobility,
        intensity: ActivityIntensity.low,
        contentType: ActivityContentType.text,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      ),
      Activity(
        stableId: 'back_stretch',
        titleEn: 'Back stretch',
        titlePt: 'Alongamento das costas',
        descriptionEn: 'A short stretch for your upper and lower back.',
        descriptionPt:
            'Um alongamento curto para a parte superior e inferior das costas.',
        instructionsEn:
            'Reach both arms forward, round your back gently, then return to neutral.',
        instructionsPt:
            'Estique os braços para a frente, arredonde suavemente as costas e volte à posição neutra.',
        suggestedDurationMinutes: 5,
        category: ActivityCategory.mobility,
        intensity: ActivityIntensity.low,
        contentType: ActivityContentType.text,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      ),
      Activity(
        stableId: 'low_impact_jumping_jacks',
        titleEn: 'Low-impact jumping jacks',
        titlePt: 'Polichinelos leves',
        descriptionEn: 'A joint-friendly version of jumping jacks.',
        descriptionPt: 'Uma versão de polichinelos com menor impacto.',
        instructionsEn:
            'Step one foot out while raising your arms, then return and alternate sides.',
        instructionsPt:
            'Afaste um pé enquanto levanta os braços, volte ao centro e alterne os lados.',
        suggestedDurationMinutes: 4,
        category: ActivityCategory.cardio,
        intensity: ActivityIntensity.medium,
        contentType: ActivityContentType.text,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      ),
      Activity(
        stableId: 'breathing_and_posture',
        titleEn: 'Breathing and posture',
        titlePt: 'Respiração e postura',
        descriptionEn: 'Reset your posture with calm breathing.',
        descriptionPt: 'Reajuste a postura com respiração calma.',
        instructionsEn:
            'Sit tall, relax your shoulders, and take slow breaths in and out.',
        instructionsPt:
            'Sente-se com boa postura, relaxe os ombros e respire lentamente.',
        suggestedDurationMinutes: 3,
        category: ActivityCategory.breathing,
        intensity: ActivityIntensity.low,
        contentType: ActivityContentType.text,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      ),
      Activity(
        stableId: 'wrist_stretch',
        titleEn: 'Wrist stretch',
        titlePt: 'Alongamento dos punhos',
        descriptionEn: 'Ease wrist tension from typing or mouse use.',
        descriptionPt:
            'Alivie a tensão dos punhos causada por teclado ou rato.',
        instructionsEn:
            'Extend one arm and gently pull the fingers back, then switch sides.',
        instructionsPt:
            'Estenda um braço e puxe suavemente os dedos para trás, depois troque de lado.',
        suggestedDurationMinutes: 3,
        category: ActivityCategory.mobility,
        intensity: ActivityIntensity.low,
        contentType: ActivityContentType.text,
        isActive: true,
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }
}
