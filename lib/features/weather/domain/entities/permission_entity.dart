enum PermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
}

class PermissionEntity {
  final PermissionStatus status;
  final String message;
  final bool canOpenSettings;

  const PermissionEntity({
    required this.status,
    required this.message,
    this.canOpenSettings = false,
  });

  bool get isGranted => status == PermissionStatus.granted;
  bool get isDenied => status == PermissionStatus.denied;
  bool get isDeniedForever => status == PermissionStatus.deniedForever;
  bool get isServiceDisabled => status == PermissionStatus.serviceDisabled;
  bool get requiresSettings => isDeniedForever || isServiceDisabled;
}
