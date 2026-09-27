enum ViewStates { initial, loading, empty, success, failure }

class ViewState<T> {
  const ViewState({
    this.viewState = ViewStates.initial,
    this.data,
    this.errorMessage,
  });

  final ViewStates viewState;
  final T? data;
  final String? errorMessage;

  ViewState<T> copyWith({
    ViewStates? status,
    T? data,
    String? errorMessage,
    bool clearData = false,
    bool clearError = false,
  }) {
    return ViewState<T>(
      viewState: status ?? viewState,
      data: clearData ? null : data ?? this.data,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}
