import React from "react"
import Competition from "./Competition"

const Competitions = ({competitions}) => {
    return(
        <div className="container">
            <div className="row">
                { competitions.map(competition => <Competition key={competition.id} competition={competition}/>)}
             </div>
        </div>
    )
}
export default Competitions
