require 'rails_helper'

feature 'User create kitchens' do
    scenario 'successfully' do
        kitchen = Kitchen.new(
            name: 'Brasileira'
        )
        visit new_kitchen_path

        fill_in 'Comida', with: kitchen.name

        click_on 'Criar Tipo de Cozinha'

        expect(page).to have_content(kitchen.name)
    end
end
