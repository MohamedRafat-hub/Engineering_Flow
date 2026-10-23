
import 'package:bloc/bloc.dart';
import 'package:engineering_flow/core/services/internet_connection_service.dart';
import 'package:engineering_flow/features/users/domain/use_cases/update_profile_use_case.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UpdateProfileUseCase _updateProfileUseCase;
  final InternetConnectionService _internetConnectionService;

  EditProfileCubit(
      this._updateProfileUseCase,
      this._internetConnectionService,
      ) : super(EditProfileInitial());

  Future<void> updateProfile({
    required String userId,
    required String name,
    required String jobTitle,
    String? phoneNumber,
  }) async {
    emit(EditProfileLoading());

    // Check internet connection before sending the request.
    bool hasInternet;

    try {
      hasInternet =
      await _internetConnectionService.hasInternetAccess;
    } catch (_) {
      if (isClosed) return;

      emit(
        EditProfileFailure(
          'Unable to verify your internet connection. Please try again.',
        ),
      );
      return;
    }

    if (isClosed) return;

    if (!hasInternet) {
      emit(
        EditProfileFailure(
          'Check your internet connection and try again.',
        ),
      );
      return;
    }

    // Normalize input values.
    final normalizedPhone = phoneNumber?.trim();

    try {
      final result = await _updateProfileUseCase.call(
        UpdateProfileParams(
          userId: userId,
          data: {
            'name': name.trim(),
            'jobTitle': jobTitle.trim(),
            'phoneNumber':
            normalizedPhone == null || normalizedPhone.isEmpty
                ? null
                : normalizedPhone,
          },
        ),
      );

      if (isClosed) return;

      result.fold(
            (failure) => emit(EditProfileFailure(failure.message)),
            (_) => emit(EditProfileSuccess()),
      );
    } catch (_) {
      if (isClosed) return;

      emit(
        EditProfileFailure(
          'Unable to update your profile. Please try again.',
        ),
      );
    }
  }
}
