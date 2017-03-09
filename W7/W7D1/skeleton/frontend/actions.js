// Open frontend/actions.js. This is where our app's action creators will live.
//  Let's define and export a selectCurrency function that takes as arguments a
//  baseCurrency string and a rates object. It returns an action (i.e. a POJO)
//   with the following keys and values:
//
// type: "SWITCH_CURRENCY"
// baseCurrency
// rates
// Set it temporarily on the window (window.selectCurrency = selectCurrency)
//  and make sure it's working properly in the console before moving on.

// window.selectCurrency = selectCurrency;

const selectCurrency = (baseCurrency, rates) =>{
  return {
    type: "SWITCH_CURRENCY",
    baseCurrency,
    rates
  };
};

export default selectCurrency;
