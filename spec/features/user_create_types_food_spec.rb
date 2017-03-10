require 'rails_helper'
feature 'User create types food' do
    scenario 'successfully' do
        typeFood = TypeFood.new(
            name: 'Cafe da Manha'
        )

        visit new_type_food_path

        fill_in 'Tipo de Comida', with: typeFood.name

        click_on 'Criar Tipo Comida'

        expect(page).to have_content(typeFood.name)
    end
end
