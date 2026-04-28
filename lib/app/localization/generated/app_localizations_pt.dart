// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'ActiveNudge';

  @override
  String get reminders => 'Lembretes';

  @override
  String get active => 'Ativos';

  @override
  String get inactive => 'Inativos';

  @override
  String get nextReminder => 'Próximo lembrete';

  @override
  String get suggestedActivity => 'Atividade sugerida';

  @override
  String get startNow => 'Começar agora';

  @override
  String get settings => 'Configurações';

  @override
  String get history => 'Histórico';

  @override
  String get activities => 'Atividades';

  @override
  String get newActivity => 'Nova atividade';

  @override
  String get editActivity => 'Editar atividade';

  @override
  String get createActivity => 'Criar atividade';

  @override
  String get updateActivity => 'Atualizar atividade';

  @override
  String get titleEnglish => 'Título em inglês';

  @override
  String get titlePortuguese => 'Título em português';

  @override
  String get descriptionEnglish => 'Descrição em inglês';

  @override
  String get descriptionPortuguese => 'Descrição em português';

  @override
  String get instructionsEnglish => 'Instruções em inglês';

  @override
  String get instructionsPortuguese => 'Instruções em português';

  @override
  String get category => 'Categoria';

  @override
  String get intensity => 'Intensidade';

  @override
  String get contentType => 'Tipo de conteúdo';

  @override
  String get textContent => 'Texto';

  @override
  String get imageContent => 'Imagem';

  @override
  String get externalLinkContent => 'Link externo';

  @override
  String get externalVideoContent => 'Vídeo externo';

  @override
  String get urlOptional => 'URL, opcional';

  @override
  String get imageOptional => 'Imagem, opcional';

  @override
  String get chooseImage => 'Escolher imagem';

  @override
  String get removeImage => 'Remover imagem';

  @override
  String get isActive => 'Ativa';

  @override
  String get edit => 'Editar';

  @override
  String get titleEnRequired => 'O título em inglês é obrigatório.';

  @override
  String get titlePtRequired => 'O título em português é obrigatório.';

  @override
  String get urlInvalid => 'Introduza uma URL http ou https válida.';

  @override
  String get imageRequired => 'Escolha uma imagem para conteúdo de imagem.';

  @override
  String get language => 'Idioma';

  @override
  String get systemDefault => 'Predefinição do sistema';

  @override
  String get english => 'Inglês';

  @override
  String get portuguese => 'Português';

  @override
  String get reminderInterval => 'Intervalo entre lembretes';

  @override
  String get defaultActivityDuration => 'Duração padrão da atividade';

  @override
  String get activeHours => 'Horário ativo';

  @override
  String get startTime => 'Hora de início';

  @override
  String get endTime => 'Hora de fim';

  @override
  String get activeDays => 'Dias ativos';

  @override
  String get notifications => 'Notificações';

  @override
  String get sound => 'Som';

  @override
  String get vibration => 'Vibração';

  @override
  String get autoOpenExternalContent =>
      'Abrir conteúdo externo automaticamente';

  @override
  String get save => 'Guardar';

  @override
  String minutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String get intervalValidation =>
      'O intervalo entre lembretes deve ser maior que zero.';

  @override
  String get durationValidation =>
      'A duração da atividade deve ser maior que zero.';

  @override
  String get timeValidation => 'A hora de início e fim devem ser válidas.';

  @override
  String get activeDaysValidation =>
      'Selecione pelo menos um dia ativo quando os lembretes estiverem ligados.';

  @override
  String get completedToday => 'Concluídas hoje';

  @override
  String get activeMinutesToday => 'Minutos ativos hoje';

  @override
  String get completionRate => 'Taxa de conclusão';

  @override
  String get completed => 'Concluída';

  @override
  String get skipped => 'Saltada';

  @override
  String get expired => 'Expirada';

  @override
  String get manual => 'Manual';

  @override
  String get reminder => 'Lembrete';

  @override
  String get activityDuration => 'Duração';

  @override
  String get instructions => 'Instruções';

  @override
  String get start => 'Começar';

  @override
  String get pause => 'Pausar';

  @override
  String get resume => 'Retomar';

  @override
  String get complete => 'Concluir';

  @override
  String get skip => 'Saltar';

  @override
  String get openContent => 'Abrir conteúdo';

  @override
  String get noActivitySelected => 'Nenhuma atividade selecionada';

  @override
  String get noHistoryYet => 'Ainda não há sessões';

  @override
  String get noNextReminder => 'Nenhum lembrete programado';

  @override
  String get remindersEnabled => 'Lembretes ligados';

  @override
  String get remindersDisabled => 'Lembretes desligados';

  @override
  String get low => 'Baixa';

  @override
  String get medium => 'Média';

  @override
  String get high => 'Alta';

  @override
  String get mobility => 'Mobilidade';

  @override
  String get strength => 'Força';

  @override
  String get cardio => 'Cardio';

  @override
  String get breathing => 'Respiração';

  @override
  String get timerExpired => 'Temporizador terminado';

  @override
  String get settingsSaved => 'Configurações guardadas';

  @override
  String get monday => 'Seg';

  @override
  String get tuesday => 'Ter';

  @override
  String get wednesday => 'Qua';

  @override
  String get thursday => 'Qui';

  @override
  String get friday => 'Sex';

  @override
  String get saturday => 'Sáb';

  @override
  String get sunday => 'Dom';

  @override
  String get timeToMoveTitle => 'Hora de se mexer';

  @override
  String get movementRemindersChannelName => 'Lembretes de movimento';

  @override
  String get movementRemindersChannelDescription =>
      'Notificações de lembretes de movimento da ActiveNudge';

  @override
  String timeToMoveMessage(String activityTitle, int minutes) {
    return 'Sugestão: $activityTitle · $minutes min';
  }
}
