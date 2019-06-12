import React, { Component } from 'react'
import ReactDOM from 'react-dom'

class Welcome extends Component {
  constructor(props){
    super(props);

    this.state = {
      term: '',
      autoCompleteResults: [],
      itemSelected: {},
      showItemSelected: false
    };

    $.getJSON('/search?q=' + this.state.term)
      .then(response => this.setState({ autoCompleteResults: response.movies}))
  }

  getAutoCompleteResults(e){
    this.setState({
      term: e.target.value
    }, () => {
      $.getJSON('/search?q=' + this.state.term)
        .then(response => this.setState({ autoCompleteResults: response.movies }))
    });
  }

  removeMovie(id){
    fetch('/api/v1/movies/' + id, {
      method: 'DELETE',
    })
    $.getJSON('/search?q=' + this.state.term)
      .then(response => this.setState({ autoCompleteResults: response.movies}))
  }

  render(){
    let autoCompleteList = this.state.autoCompleteResults.map((response, index) => {
      return <div key={index} className="movie">
        <button onClick={() => {
          if (window.confirm('Are you sure you wish to delete this movie?')) 
            this.removeMovie(response.id)
          }} 
          type="button" className="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <div className="row">
          <div className="col-sm">
            <h5>{ response.title }</h5>
            <p>Rating: { response.rating }</p>
            <p>Year: { response.year }</p>
            <p>Genre: {response.genre.map((genre) => genre).reduce((prev, curr) => [prev, ', ', curr])}</p>
          </div>
          <div className="col-sm">
            <img src={ response.image} />
          </div>
        </div>
        
      </div>
    });

    return(
      <div className="container">
        <input className="form-control" ref={ (input) => { this.searchBar = input } } 
          value={ this.state.term } 
          onChange={ this.getAutoCompleteResults.bind(this) } 
          type='text' 
          placeholder='Search' />
          { autoCompleteList }
      </div>
    )
  }
}


document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Welcome />,
    document.body.appendChild(document.createElement('div')),
  )
});
