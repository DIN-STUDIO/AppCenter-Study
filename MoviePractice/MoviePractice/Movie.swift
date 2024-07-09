import Foundation

struct Movie {
    let title: String
    let release: String
    let img: String
}

extension Movie {
    static let movieList: [Movie] = [
        Movie(title: "Zootopia", release: "2020", img: "zoozoo"),
        Movie(title: "InsideOut", release: "2015", img: "inside"),
        Movie(title: "MonsterInc", release: "2008", img: "monster")
    ]
}

