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
                        <p>{console.log(competition.participants)}</p>
                        <p>Cost: { competition.price }</p>
                        <h4>Prize: ${competition.award}</h4>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default Competition