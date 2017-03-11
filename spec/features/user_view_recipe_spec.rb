require 'rails_helper'

feature 'Visitor views recipes on home page' do
    # setup
    scenario 'sucessfully' do
        kitchen = Kitchen.create(name: 'Brasileira')

        type_food = TypeFood.create(name: 'Comida Mineira')

        recipe = Recipe.create(
            name: 'Feijao Tropeiro',
            kitchen: kitchen,
            type_food: type_food,
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
        visit recipes_path

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

    scenario 'and view a list of recipes' do
        kitchen = Kitchen.create(name: 'Americana')

        type_food = TypeFood.create(name: 'Cafe da Manha')

        recipe = Recipe.create(
            name: 'Panqueca grossa',
            kitchen: kitchen,
            type_food: type_food,
            numberPeopleServe: '12',
            preparationTime: '60',
            level: 'Fácil',
            ingredients: '3 colheres (sopa) de manteiga sem sal derretida,
            1 xícara (chá) de farinha de trigo, 2 ovos médios,
            2 colheres (sopa) de mel, 1/2 xícara (chá) de leite integral',
            steps: 'ata no liquidificador a manteiga com a farinha de trigo,
             os ovos, o mel e o leite. Despeje um pouco da massa numa frigideira
              anti aderente aquecida. Forme uma panqueca. Doure dos dois lados.
              Deve ficar um pouco grossa. Repita a operação até terminar a massa.
              Sirva com mel.'
        )

        another_kitchen = Kitchen.create(name: 'Italiana')

        another_type_food = TypeFood.create(name: 'Comida Italiana')

        another_recipe = Recipe.create(
            name: 'Nhoque Simples',

            kitchen: another_kitchen,
            type_food: type_food,
            numberPeopleServe: '4',
            preparationTime: '120',
            level: 'Difícil',
            ingredients: 'Molho: 520g de polpa de tomate de boa qualidade,
            3 cubos de caldo de galinha, 2 colheres (sopa)de óleo,
            1 cebola grande picadinha.
            Massa: 2 xícaras (chá) de purê de batata instantâneo (flocos de
            batata desidratada), 2 xícaras (chá) de água morna, 1 xicara (chá)
            de farinha de trigo, 2 gemas, Sal a gosto, 1 saco de leite vazio.',
            steps: 'Lave e enxugue bem um saco de leite ou outro saco de
            plástico bem resistente. Corte a beirada de uma das extremidades
            (para introduzir a massa que será espremida dentro de uma panela com
             água fervente), e corte uma ponta na extremidade oposta (para a
             massa sair). Tome cuidado para que o buraco cortado não fique
             grande demais. Reserve. Ponha uma panela grande com bastante água
             ligeiramente salgada para ferver. Em outra panela frite a cebola
             picadinha no óleo até começar a dourar, junte a polpa, um pouquinho
              de açúcar (se o tomate for muito ácido) os cubos de caldo e deixe
              ferver enquanto prepara o nhoque (alguns minutos). O molho fica
              bem leve, com sabor delicado. Misture os flocos de batatas com a
              água morna e misture bem. Junte a farinha e os demais
              ingredientes. Coloque no saco preparado e vá espremendo
              diretamente na água fervente. Retire com uma escumadeira aqueles
              que vão subindo e coloque para escorrer num escorredor de macarrão
              (mexa o mínimo possível, porque a massa fica bem delicada). Passe
              para uma travessa, cubra com o molho pronto e parmesão, se gostar.'
        )

        visit recipes_path

        # expected - recipe
        expect(page).to have_content(recipe.name)
        expect(page).to have_content(kitchen.name)
        expect(page).to have_content(type_food.name)
        expect(page).to have_content(recipe.numberPeopleServe)
        expect(page).to have_content(recipe.preparationTime)
        expect(page).to have_content(recipe.level)
        expect(page).to have_content(recipe.ingredients)
        expect(page).to have_content(recipe.steps)
        # expected - another_recipe
        expect(page).to have_content(another_recipe.name)
        expect(page).to have_content(another_kitchen.name)
        expect(page).to have_content(another_type_food.name)
        expect(page).to have_content(another_recipe.numberPeopleServe)
        expect(page).to have_content(another_recipe.preparationTime)
        expect(page).to have_content(another_recipe.level)
        expect(page).to have_content(another_recipe.ingredients)
        expect(page).to have_content(another_recipe.steps)
    end
end
