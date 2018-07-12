require "Route_de_la_mairie"


describe "Mail OK" do

    it "#get_the_email_of_a_townhal_from_its_webpage" do
      expect(get_the_email_of_a_townhal_from_its_webpage(vaureal)).to eq("communication@mairie-vaureal.fr")
    end
end

