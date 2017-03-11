FactoryGirl.define do
    factory :recipe do
        name 'Quadradinhos gostosos'
        kitchen
        type_food
        numberPeopleServe '5'
        preparationTime '30'
        level 'Facil'
        ingredients '1 colher (sopa) de de manteiga, 1 copo de farinha de trigo, 3 copos de açucar, 2 pires de queijo ralado, 1/2 litro de leite, 4 ovos (inteiros)'
        steps 'Bater tudo no liquidificador, levar para assar até ficar "amarelinho". Cortar em "quadradinhos" e servir.'
    end
end
