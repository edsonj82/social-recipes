require 'rails_helper'
feature 'User create types food' do
    scenario 'successfully' do
        type_food = TypeFood.new(
            name: 'Cafe da Manha'
        )

        visit new_type_food_path

        fill_in 'Tipo de Comida', with: type_food.name

        click_on 'Criar Tipo Comida'

        expect(page).to have_content(type_food.name)
    end
end
