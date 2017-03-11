require 'rails_helper'

feature 'User view last recipes home at home' do
    scenario 'successfully' do
        kitchen = create(:kitchen)

        type_food = create(:type_food)

        recipe = build(:recipe, kitchen: kitchen, type_food: type_food)

        visit new_recipe_path
        # save_and_open_page

        fill_in 'Nome da Receita', with: recipe.name
        select kitchen.name,              from: 'Cozinha'
        select type_food.name,            from: 'Tipo de Comida'
        fill_in 'Quantas pessoas servem', with: recipe.numberPeopleServe
        fill_in 'Tempo de Preparo',       with: recipe.preparationTime
        fill_in 'Nivel de Dificuldade',   with: recipe.level
        fill_in 'Ingredientes',           with: recipe.ingredients
        fill_in 'Passo a passo',          with: recipe.steps

        click_on 'Criar Receita'

        expect(page).to have_content recipe.name
        expect(page).to have_content kitchen.name
        expect(page).to have_content recipe.type_food.name
        expect(page).to have_content recipe.numberPeopleServe
        expect(page).to have_content recipe.preparationTime
        expect(page).to have_content recipe.level
        expect(page).to have_content recipe.ingredients
        expect(page).to have_content recipe.steps
    end
end
