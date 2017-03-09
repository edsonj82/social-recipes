require 'rails_helper'

feature 'User send picture recipe ' do
    scenario 'successfully' do
        kitchen = Kitchen.create(
            name: 'Brasileira'
        )

        recipe = Recipe.create(
            name: 'Feijao Tropeiro',
            kitchen: kitchen,
            typeFood: 'Comida Mineira',
            numberPeopleServe: '5',
            preparationTime: '90',
            level: 'Médio',
            ingredients: '1 kg feijão roxinho,
              500 gr farinha de mandioca crua, 10 unidades de ovo,
              1 unidade de cebola, 2 colheres (sopa) de tempero alho e sal,
              2 colheres (sopa) de banha de porco, 1 maço de cheiro-verde,
              4 dentes de alho e 500 gr bacon',
            steps: 'Cozinhe o feijão na panela de pressão
              (com uma colher de colorau, para "a cor ficar mais bonita")
              por 20 minutos. Escorra e lave. Em outra panela,
              coloque um pouco de óleo e acrescente o tempero, o bacon e a
               calabresa (ambos já fritos). Em seguida, adicione o feijão
               sem o caldo, a couve e a farinha de mandioca e misture.
               O prato está pronto. Um ovo cozido (ou frito, dependendo do
                 gosto) dá o toque final (coloque 1 em cada prato).'
        )
        # activity
        visit new_recipe_path
        fill_in 'Nome da Receita',        with: recipe.name
        select kitchen.name,              from: 'Cozinha'
        fill_in 'Tipo de Comida',         with: recipe.typeFood
        fill_in 'Quantas pessoas servem', with: recipe.numberPeopleServe
        fill_in 'Tempo de Preparo',       with: recipe.preparationTime
        fill_in 'Nivel de Dificuldade',   with: recipe.level
        fill_in 'Ingredientes',           with: recipe.ingredients
        fill_in 'Passo a passo',          with: recipe.steps
        # attach_file('Picture', '')

        click_on 'Criar Receita'

        # expected
        expect(page).not_to have_xpath("//img[contains(@src,'Feijao_tropeiro_mineiraaa')]")
        # expect(page).to have_content('FileNotFound')
        expect(page).to have_content(recipe.name)
        expect(page).to have_content(kitchen.name)
        expect(page).to have_content(recipe.typeFood)
        expect(page).to have_content(recipe.numberPeopleServe)
        expect(page).to have_content(recipe.preparationTime)
        expect(page).to have_content(recipe.level)
        expect(page).to have_content(recipe.ingredients)
        expect(page).to have_content(recipe.steps)
    end
end
