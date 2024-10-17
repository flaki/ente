import "package:flutter/material.dart";
import "package:photos/models/file/file.dart";
import "package:photos/models/search/hierarchical/hierarchical_search_filter.dart";

class FaceFilter extends HierarchicalSearchFilter {
  final String? personId;
  final String? clusterId;
  final String? faceName;
  final EnteFile faceFile;
  final int occurrence;

  FaceFilter({
    required this.personId,
    required this.clusterId,
    required this.faceName,
    required this.faceFile,
    required this.occurrence,
    super.matchedUploadedIDs,
  }) : assert(
          personId != null || clusterId != null,
          "personId or clusterId must be provided",
        );

  @override
  String name() {
    return faceName ?? "";
  }

  @override
  int relevance() {
    return occurrence;
  }

  @override
  IconData? icon() {
    return Icons.face;
    // throw UnimplementedError(
    //   "FaceFilter does not need an icon, the face crop should be used instead",
    // );
  }

  @override
  bool isMatch(EnteFile file) {
    throw UnimplementedError();
  }

  @override
  Set<int> getMatchedUploadedIDs() {
    return matchedUploadedIDs;
  }

  @override
  bool isSameFilter(HierarchicalSearchFilter other) {
    if (other is FaceFilter) {
      return other.personId == personId && other.clusterId == clusterId;
    }
    return false;
  }
}
