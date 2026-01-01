enum TrackingStatus {
  planning('Planejo Assistir'),
  watching('Assistindo'),
  completed('Finalizado'),
  dropped('Dropado');

  final String label;
  const TrackingStatus(this.label);
}
