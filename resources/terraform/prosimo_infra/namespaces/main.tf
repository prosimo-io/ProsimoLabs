resource "prosimo_namespace" "eu_west_1" {
    name = var.eu_west_1_network_namespace
}

resource "prosimo_namespace" "us_east_1" {
    name = var.us_east_1_network_namespace
}

resource "prosimo_namespace" "northeurope" {
    name = var.northeurope_network_namespace
    export {
        source_network = var.source_network_name
        namespaces = [ prosimo_namespace.eu_west_1.name, prosimo_namespace.us_east_1.name ]
    }
}
