//
//  AstronautView.swift
//  Moonshot
//
//  Created by Lucas Parreira on 15/04/21.
//

import SwiftUI

struct Crew {
    let role:String
    let astronautCrew:Astronaut
}

struct AstronautView: View {
    let astronaut:Astronaut
    
    var body: some View {
        GeometryReader{view in
            
            ScrollView(.vertical){
                VStack{
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width:view.size.width)
                    
                    Text(astronaut.description)
                        .padding()
                    
                }
            }.navigationBarTitle(Text(astronaut.name),displayMode:.inline)
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
   
    static let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")

   
   
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
