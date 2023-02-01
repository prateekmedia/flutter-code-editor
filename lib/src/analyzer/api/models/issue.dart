import 'dart:core';

import 'issue_type.dart';

class Issue {
  final int line;
  final String message;
  final IssueType type;
  final String? suggestion;
  final String? url;

  const Issue({
    required this.line,
    required this.message,
    required this.type,
    this.suggestion,
    this.url,
  });
}

Comparator<Issue> issueLineComparator = (issue1, issue2) {
  if (issue1.line > issue2.line) return 1;
  if (issue1.line == issue2.line) return 0;
  return -1;
};
