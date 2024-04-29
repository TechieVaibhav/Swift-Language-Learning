//
//  Created by Farukh IQBAL on 18/11/2019.
//  Copyright © 2019 Farukh IQBAL. All rights reserved.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var headline: String
    var bio: String
    
    var imageName: String { return name }
}

#if DEBUG
let testData = [
    Player(name: "Rafael Nadal", headline: "Spain", bio: "Spanish professional tennis player currently ranked world No. 1 in men's singles tennis by the Association of Tennis Professionals (ATP). Nadal has won 19 Grand Slam singles titles, the second-most in history for a male player, as well as a record 35 ATP Tour Masters 1000 titles, 20 ATP Tour 500 titles, and the 2008 Olympic gold medal in singles. In addition, Nadal has held the world No. 1 ranking for a total of 198 weeks, including being the year-end No. 1 five times."),
    Player(name: "Novak Djokovic", headline: "Serbia", bio: "Serbian professional tennis player who is currently ranked world No. 2 in men's singles tennis by the Association of Tennis Professionals (ATP). Djokovic has won 16 Grand Slam singles titles, five ATP Finals titles, 34 ATP Tour Masters 1000 titles, 13 ATP Tour 500 titles, and has held the No. 1 spot in the ATP rankings for 275 weeks. In majors, he has won a record seven Australian Open titles, five Wimbledon titles, three US Open titles, and one French Open title. By winning the 2016 French Open, he became the eighth player in history to achieve the Career Grand Slam and the third man to hold all four major titles at once, the first since Rod Laver in 1969 and the first ever to do so on three different surfaces. He is the only male player to have won all nine of the Masters 1000 tournaments."),
    Player(name: "Roger Federer", headline: "Switzerland", bio: "Swiss professional tennis player who is ranked world No. 3 in men's singles tennis by the Association of Tennis Professionals (ATP). He has won 20 Grand Slam singles titles—the most in history by a male player—and has held the world No. 1 spot in the ATP rankings for a record total of 310 weeks (including a record 237 consecutive weeks) and was the year-end No. 1 five times, including four consecutive. Federer, who turned professional in 1998, was continuously ranked in the top ten from October 2002 to November 2019.")
]
#endif
