class Quiz {
  int? id;
  String? name; // Changed Null? to String?
  String? title;
  String? description;
  String? difficultyLevel; // Changed Null? to String?
  String? topic;
  String? time;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;
  int? duration;
  String? endTime;
  String? negativeMarks;
  String? correctAnswerMarks;
  bool? shuffle;
  bool? showAnswers;
  bool? lockSolutions;
  bool? isForm;
  bool? showMasteryOption;
  String? readingMaterial; // Changed Null? to String?
  String? quizType; // Changed Null? to String?
  bool? isCustom;
  String? bannerId; // Changed Null? to String?
  String? examId; // Changed Null? to String?
  bool? showUnanswered;
  String? endsAt;
  int? lives; // Changed Null? to int?
  String? liveCount;
  int? coinCount;
  int? questionsCount;
  String? dailyDate;
  int? maxMistakeCount;
  List<dynamic>? readingMaterials; // Updated to dynamic or a specific type
  List<Questions>? questions;
  int? progress;

  Quiz(
      {this.id,
      this.name,
      this.title,
      this.description,
      this.difficultyLevel,
      this.topic,
      this.time,
      this.isPublished,
      this.createdAt,
      this.updatedAt,
      this.duration,
      this.endTime,
      this.negativeMarks,
      this.correctAnswerMarks,
      this.shuffle,
      this.showAnswers,
      this.lockSolutions,
      this.isForm,
      this.showMasteryOption,
      this.readingMaterial,
      this.quizType,
      this.isCustom,
      this.bannerId,
      this.examId,
      this.showUnanswered,
      this.endsAt,
      this.lives,
      this.liveCount,
      this.coinCount,
      this.questionsCount,
      this.dailyDate,
      this.maxMistakeCount,
      this.readingMaterials,
      this.questions,
      this.progress});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    description = json['description'];
    difficultyLevel = json['difficulty_level'];
    topic = json['topic'];
    time = json['time'];
    isPublished = json['is_published'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    duration = json['duration'];
    endTime = json['end_time'];
    negativeMarks = json['negative_marks'];
    correctAnswerMarks = json['correct_answer_marks'];
    shuffle = json['shuffle'];
    showAnswers = json['show_answers'];
    lockSolutions = json['lock_solutions'];
    isForm = json['is_form'];
    showMasteryOption = json['show_mastery_option'];
    readingMaterial = json['reading_material'];
    quizType = json['quiz_type'];
    isCustom = json['is_custom'];
    bannerId = json['banner_id'];
    examId = json['exam_id'];
    showUnanswered = json['show_unanswered'];
    endsAt = json['ends_at'];
    lives = json['lives'];
    liveCount = json['live_count'];
    coinCount = json['coin_count'];
    questionsCount = json['questions_count'];
    dailyDate = json['daily_date'];
    maxMistakeCount = json['max_mistake_count'];
    readingMaterials = json['reading_materials'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['description'] = description;
    data['difficulty_level'] = difficultyLevel;
    data['topic'] = topic;
    data['time'] = time;
    data['is_published'] = isPublished;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['duration'] = duration;
    data['end_time'] = endTime;
    data['negative_marks'] = negativeMarks;
    data['correct_answer_marks'] = correctAnswerMarks;
    data['shuffle'] = shuffle;
    data['show_answers'] = showAnswers;
    data['lock_solutions'] = lockSolutions;
    data['is_form'] = isForm;
    data['show_mastery_option'] = showMasteryOption;
    data['reading_material'] = readingMaterial;
    data['quiz_type'] = quizType;
    data['is_custom'] = isCustom;
    data['banner_id'] = bannerId;
    data['exam_id'] = examId;
    data['show_unanswered'] = showUnanswered;
    data['ends_at'] = endsAt;
    data['lives'] = lives;
    data['live_count'] = liveCount;
    data['coin_count'] = coinCount;
    data['questions_count'] = questionsCount;
    data['daily_date'] = dailyDate;
    data['max_mistake_count'] = maxMistakeCount;
    if (readingMaterials != null) {
      data['reading_materials'] =
          readingMaterials!.map((v) => v.toJson()).toList();
    }
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    data['progress'] = progress;
    return data;
  }
}

class Questions {
  int? id;
  String? description;
  Null? difficultyLevel;
  String? topic;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;
  String? detailedSolution;
  String? type;
  bool? isMandatory;
  bool? showInFeed;
  String? pyqLabel;
  int? topicId;
  int? readingMaterialId;
  String? fixedAt;
  String? fixSummary;
  Null? createdBy;
  String? updatedBy;
  Null? quizLevel;
  String? questionFrom;
  Null? language;
  Null? photoUrl;
  Null? photoSolutionUrl;
  bool? isSaved;
  String? tag;
  List<Options>? options;
  ReadingMaterial? readingMaterial;

  Questions(
      {this.id,
      this.description,
      this.difficultyLevel,
      this.topic,
      this.isPublished,
      this.createdAt,
      this.updatedAt,
      this.detailedSolution,
      this.type,
      this.isMandatory,
      this.showInFeed,
      this.pyqLabel,
      this.topicId,
      this.readingMaterialId,
      this.fixedAt,
      this.fixSummary,
      this.createdBy,
      this.updatedBy,
      this.quizLevel,
      this.questionFrom,
      this.language,
      this.photoUrl,
      this.photoSolutionUrl,
      this.isSaved,
      this.tag,
      this.options,
      this.readingMaterial});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    difficultyLevel = json['difficulty_level'];
    topic = json['topic'];
    isPublished = json['is_published'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    detailedSolution = json['detailed_solution'];
    type = json['type'];
    isMandatory = json['is_mandatory'];
    showInFeed = json['show_in_feed'];
    pyqLabel = json['pyq_label'];
    topicId = json['topic_id'];
    readingMaterialId = json['reading_material_id'];
    fixedAt = json['fixed_at'];
    fixSummary = json['fix_summary'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    quizLevel = json['quiz_level'];
    questionFrom = json['question_from'];
    language = json['language'];
    photoUrl = json['photo_url'];
    photoSolutionUrl = json['photo_solution_url'];
    isSaved = json['is_saved'];
    tag = json['tag'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    readingMaterial = json['reading_material'] != null
        ? new ReadingMaterial.fromJson(json['reading_material'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['difficulty_level'] = this.difficultyLevel;
    data['topic'] = this.topic;
    data['is_published'] = this.isPublished;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['detailed_solution'] = this.detailedSolution;
    data['type'] = this.type;
    data['is_mandatory'] = this.isMandatory;
    data['show_in_feed'] = this.showInFeed;
    data['pyq_label'] = this.pyqLabel;
    data['topic_id'] = this.topicId;
    data['reading_material_id'] = this.readingMaterialId;
    data['fixed_at'] = this.fixedAt;
    data['fix_summary'] = this.fixSummary;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['quiz_level'] = this.quizLevel;
    data['question_from'] = this.questionFrom;
    data['language'] = this.language;
    data['photo_url'] = this.photoUrl;
    data['photo_solution_url'] = this.photoSolutionUrl;
    data['is_saved'] = this.isSaved;
    data['tag'] = this.tag;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    if (this.readingMaterial != null) {
      data['reading_material'] = this.readingMaterial!.toJson();
    }
    return data;
  }
}

class Options {
  int? id;
  String? description;
  int? questionId;
  bool? isCorrect;
  String? createdAt;
  String? updatedAt;
  bool? unanswered;
  Null? photoUrl;

  Options(
      {this.id,
      this.description,
      this.questionId,
      this.isCorrect,
      this.createdAt,
      this.updatedAt,
      this.unanswered,
      this.photoUrl});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    questionId = json['question_id'];
    isCorrect = json['is_correct'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unanswered = json['unanswered'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['question_id'] = this.questionId;
    data['is_correct'] = this.isCorrect;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['unanswered'] = this.unanswered;
    data['photo_url'] = this.photoUrl;
    return data;
  }
}

class ReadingMaterial {
  int? id;
  String? keywords;
  Null? content;
  String? createdAt;
  String? updatedAt;
  List<String>? contentSections;
  PracticeMaterial? practiceMaterial;

  ReadingMaterial(
      {this.id,
      this.keywords,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.contentSections,
      this.practiceMaterial});

  ReadingMaterial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keywords = json['keywords'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    contentSections = json['content_sections'].cast<String>();
    practiceMaterial = json['practice_material'] != null
        ? new PracticeMaterial.fromJson(json['practice_material'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['keywords'] = this.keywords;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['content_sections'] = this.contentSections;
    if (this.practiceMaterial != null) {
      data['practice_material'] = this.practiceMaterial!.toJson();
    }
    return data;
  }
}

class PracticeMaterial {
  List<String>? content;
  List<String>? keywords;

  PracticeMaterial({this.content, this.keywords});

  PracticeMaterial.fromJson(Map<String, dynamic> json) {
    content = json['content'].cast<String>();
    keywords = json['keywords'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['keywords'] = this.keywords;
    return data;
  }
}
