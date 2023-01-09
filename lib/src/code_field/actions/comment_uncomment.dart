import 'package:flutter/cupertino.dart';

import '../../../flutter_code_editor.dart';

class CommentUncommentIntent extends Intent {
  const CommentUncommentIntent();
}

class CommentUncommentAction extends Action<CommentUncommentIntent> {
  final CodeController controller;

  CommentUncommentAction({
    required this.controller,
  });

  @override
  Object? invoke(CommentUncommentIntent intent) {
    controller.commentOrUncommentSelection();
    return null;
  }
}
