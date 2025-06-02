pkgload::load_all(".")
cnf <- yaml::read_yaml("config.yml")
main(cnf)
