resource "hcloud_placement_group" "default" {
  name = "Default-Placement-Group"
  type = "spread"
}
