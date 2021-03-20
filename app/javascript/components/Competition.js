import React from "react"

const Competition = ({competition}) => {
    return(
        <div className="col-sm-12 col-lg-4 my-2">
            <div className="card">
                <div className="card-top" style={{backgroundImage: "url(" + competition.image + ")"}}>
                    <div className="badge badge-purple">
                        { competition.end_date}
                    </div>
                </div>
                <div className="card-bottom d-flex justify-content-between">
                    <div>
                        <h4><strong>{ competition.name }</strong></h4>
                        <p>Cost: { competition.price }</p>
                        <p>{competition.participations.length}/{competition.max_entries} Participants</p>
                        <h4>Prize: ${competition.award}</h4>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default Competition