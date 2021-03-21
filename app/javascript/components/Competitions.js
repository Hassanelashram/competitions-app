import React from "react"
import Competition from "./Competition"
import { useState, useEffect } from "react"

const Competitions = () => {
    const [competitions, setCompetitions] = useState([])
    const [categories, setCategories] = useState([])
    useEffect(() => {
        fetchAllCompetitions("")
      }, []);

    const fetchAllCompetitions = (params) => {
        console.log(params)
        fetch(`http://localhost:3000/competitions.json?${params}`)
          .then(response => response.json())
          .then((res) => {
            setCompetitions(res)
            
          })
      }

    return(
        <div className="container">
            <div className="row filter-box">
                <div className="col-1">
                    <i className="fas fa-filter"></i>
                </div>
                <div className="col-3">
                    <p onClick={fetchAllCompetitions.bind(this, "award=highest")}>Highest Award</p>
                </div>
                <div className="col-3">
                    <p onClick={fetchAllCompetitions.bind(this, "entrance=lowest")}>Lowest Entrance</p>
                </div>
                <div className="col-3">
                    <p onClick={fetchAllCompetitions.bind(this, "entrance=lowest")}>Ending Soon</p>
                </div>
            </div>
            <div className="row">
                { competitions.map(competition => <Competition key={competition.id} competition={competition}/>)}
             </div>
        </div>
    )
}
export default Competitions