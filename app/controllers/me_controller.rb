class MeController < ApplicationController

  def index
    @current_user = {
      name: 'Abian',
      surname: 'Marrero',
      secondSurname: 'Montesdeoca',
      contactInfo: {
        email: 'abian.marrero@the-coctail.com',
        phone: '999888932'
      },
      address:{
        additionalData: "2 I",
        door: "A",
        floor: "2",
        location: "MADRID",
        stairwell: "left",
        state: "MADRID",
        streetName: "Serrano",
        streetNumber: "0012",
        streetType: "CL",
        zipcode: "28025"
      }
    }
  end

end