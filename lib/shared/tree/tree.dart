class TreeNode<T> {
  TreeNode(this.value);
  T value;
  List<TreeNode<T>> children = [];

  void add(TreeNode<T> child) {
    children.add(child);
  }

  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (final child in children) {
      child.forEachDepthFirst(performAction);
    }
  }

  // TreeNode? search(T value) {
  //   TreeNode? result;
  //   forEachLevelOrder((node) {
  //     if (node.value == value) {
  //       result = node;
  //     }
  //   });
  //   return result;
  // }
}
