resource "prosimo_namespace" "northeurope" {
    name = var.northeurope_network_namespace
    export {
        source_network = var.source_network_name
        namespaces = [ var.eu_west_1_network_namespace, var.us_east_1_network_namespace ]
    }
}
