enum SignatureStatusEnumModel {
  newSignature,
  partlySigned,
  fullySigned,
  approved
}
extension SelectedRequestNumber on SignatureStatusEnumModel {
  int get signatureStatus {
    switch (this) {
      case SignatureStatusEnumModel.newSignature:
        return 1;
      case SignatureStatusEnumModel.partlySigned:
        return 2;
      case SignatureStatusEnumModel.fullySigned:
        return 3;
      case SignatureStatusEnumModel.approved:
        return 4;

      default:
        return 0;
    }
  }
}