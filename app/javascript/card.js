const pay = () => {
  Payjp.setPublicKey("pk_test_8173e60efb66812062b26d2a");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("product_order[number]"),
      cvc: formData.get("product_order[cvc]"),
      exp_month: formData.get("product_order[exp_month]"),
      exp_year: `20${formData.get("product_order[exp_year]")}`,
    };


    Payjp.createToken(card, (status, response) => {
      console.log(response)
      if (status == 200) {
        const token = response.id;
        console.log(token);
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};
window.addEventListener("load", pay);