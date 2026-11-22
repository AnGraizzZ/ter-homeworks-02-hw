locals{
  organization = "netology"
  env          = "develop"
  project      = "platform"
  roles        = ["web", "db"]

    all_vms = [
    yandex_compute_instance.platform,
    yandex_compute_instance.netology-develop-platform-db,
  ]
}