import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {result: 0 , num1: "" , num2: ""};

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.devide = this.devide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    const num1 = parseInt(e.currentTarget.value);
    this.setState({num1});
  }

  setNum2(e) {
    e.preventDefault();
    const num2 = parseInt(e.currentTarget.value);
    this.setState({num2});
  }

  add(e){
    e.preventDefault();
    this.setState({result: this.state.num1 + this.state.num2});
  }

  subtract(e){
    e.preventDefault();
    this.setState({result: this.state.num1 - this.state.num2});
  }

  multiply(e){
    e.preventDefault();
    this.setState({result: this.state.num1 * this.state.num2});
  }

  devide(e){
    e.preventDefault();
    this.setState({result: this.state.num1 / this.state.num2});
  }

  clear(e){
    e.preventDefault();
    const num1 = "";
    const num2 = "";
    this.setState({num1 , num2});
  }


  render() {

    const {result , num1 , num2}= this.state;

    return (
      <div>
        <h1>{result}</h1>
        <input onChange={this.setNum1} value={num1}></input>
        <input onChange={this.setNum2} value={num2}></input>
        <button onClick={this.clear}>Clear</button>
        <br />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.devide}>/</button>
      </div>
    );
  }
}

export default Calculator;
