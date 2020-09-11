const pay = () => {
  Payjp.setPublicKey((process.env.PAYJP_PUBLIC_KEY));
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) =>{
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new Formdata(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_mouth: formData.get("exp_mouth"),
      exp_year: `20${formData.get("exp_year")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200 ) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form")
        const tokenObj = `<input value={token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_mouth").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
   });
  };

window.addEventListener("load", pay);