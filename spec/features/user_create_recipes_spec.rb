require 'rails_helper'

feature 'User create recipes' do
    scenario 'successfully' do
        # setup
        kitchen = Kitchen.create(name: 'Brasileira')

        type_food = TypeFood.create(name: 'Comida Mineira')

        recipe = Recipe.new(
            name: 'Feijao Tropeiro',
            kitchen: kitchen,
            type_food: type_food,
            numberPeopleServe: '5',
            preparationTime: '90',
            level: 'Médio',
            ingredients: '1 kg feijão roxinho,500 gr farinha de mandioca crua, 10 unidades de ovo, 1 unidade de cebola, 2 colheres (sopa) de tempero alho e sal, 2 colheres (sopa) de banha de porco, 1 maço de cheiro-verde, 4 dentes de alho e 500 gr bacon',
            steps: 'Cozinhe o feijão na panela de pressão (com uma colher de colorau, para "a cor ficar mais bonita") por 20 minutos. Escorra e lave. Em outra panela, coloque um pouco de óleo e acrescente o tempero, o bacon e a calabresa (ambos já fritos). Em seguida, adicione o feijão sem o caldo, a couve e a farinha de mandioca e misture. O prato está pronto. Um ovo cozido (ou frito, dependendo do gosto) dá o toque final (coloque 1 em cada prato).'
        )
        # activity
        visit new_recipe_path

        fill_in 'Nome da Receita',        with: recipe.name
        select kitchen.name,              from: 'Cozinha'
        select type_food.name,            from: 'Tipo de Comida'
        fill_in 'Quantas pessoas servem', with: recipe.numberPeopleServe
        fill_in 'Tempo de Preparo',       with: recipe.preparationTime
        fill_in 'Nivel de Dificuldade',   with: recipe.level
        fill_in 'Ingredientes',           with: recipe.ingredients
        fill_in 'Passo a passo',          with: recipe.steps

        click_on 'Criar Receita'

        # expected
        expect(page).to have_content(recipe.name)
        expect(page).to have_content(kitchen.name)
        expect(page).to have_content(type_food.name)
        expect(page).to have_content(recipe.numberPeopleServe)
        expect(page).to have_content(recipe.preparationTime)
        expect(page).to have_content(recipe.level)
        expect(page).to have_content(recipe.ingredients)
        expect(page).to have_content(recipe.steps)
    end
end
