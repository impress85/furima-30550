const pay = () => {
  Payjp.setPublicKey("pk_test_3518904600917a149ee58bf2");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit",(e)=>{
    e.preventDefault();
    console.log("イベント発火 submit");

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    // debugger;
    const card = {
      number: formData.get("order_destination[number]"),
      cvc: formData.get("order_destination[cvc]"),
      exp_month: formData.get("order_destination[exp_month]"),
      exp_year: `20${formData.get("order_destination[exp_year]")}`,
    };
    console.log(card);

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
    console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend",tokenObj);
        // debugger;
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load",pay);