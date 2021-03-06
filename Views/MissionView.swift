//
//  MissionView.swift
//  Moonshot
//
//  Created by Lucas Parreira on 14/04/21.
//

import SwiftUI
struct CrewMember {
    let role:String
    let astronaut:Astronaut

}
struct MissionView: View {
    let mission:Mission
    let astronauts:[CrewMember]
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission

        var matches = [CrewMember]()

        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }

        self.astronauts = matches
    }
    
    var body: some View {
        NavigationView{
            
        GeometryReader{ view in
            ScrollView(.vertical){
                VStack{
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth:view.size.width * 0.7)
                        .padding(.top)
                    
                    ForEach(self.astronauts, id: \.role){crewMember in
                        HStack{
                            NavigationLink(
                                destination: AstronautView(astronaut: crewMember.astronaut)){
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Rectangle())
                                    .overlay(Rectangle().stroke(Color.primary,lineWidth: 1))
                                
                                VStack(alignment:.leading){
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        Spacer(minLength: 25)
                }
             }
            }
        }.navigationBarTitle(Text(mission.displayName),displayMode: .inline)
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions:[Mission] = Bundle.main.decode("missions.json")
    static let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0],astronauts: astronauts)
    }
}
