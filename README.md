# Aplicação para consumo da via_cep_api

Projeto desenvolvido como atividade do Santander Bootcamp 2023 - Mobile Com Flutter.

## Getting Started
Este projeto consiste em uma aplicação simplificada para consumir uma API desenvolvida em Flutter e Dart. A interface do aplicativo oferece a funcionalidade de buscar endereços por meio de um CEP inserido pelo usuário. Quando o usuário digita os oito dígitos do CEP, um evento "onChanged" no campo de texto desencadeia uma solicitação HTTP GET à API Via Cep.

Se a API retornar um endereço correspondente, ele será exibido em um card na parte inferior da entrada de texto. Caso contrário, abaixo do card vazio, um botão estará disponível para direcionar o usuário para a tela de cadastro ou atualização de endereço.

Quando o usuário clica sobre o card com o endereço retornado, ele é direcionado automaticamente para a tela de cadastro ou atualização de endereço, onde os dados do endereço selecionado já estarão preenchidos. Nessa tela, ao pressionar o botão "Enviar", o endereço será registrado no serviço Back4App e o usuário será redirecionado para a tela inicial do aplicativo, denominada "Meus Endereços". Nessa tela, o usuário pode visualizar todos os seus endereços salvos, incluindo o mais recentemente adicionado.

Na tela "Meus Endereços", o usuário tem a opção de excluir um endereço arrastando-o para o lado, após a ação de delete, uma mensagem de confirmação é exibida na Snackbar, indicando "Endereço excluido com sucesso!", e em seguida a tela é recarregada. Se desejar atualizar um endereço, basta clicar sobre ele, e os dados serão enviados para a tela de cadastro ou atualização de endereços. Nessa tela, o usuário pode editar todos os campos e, ao clicar no botão "Enviar", o sistema verifica o identificador único (objectId) para determinar se deve executar o método de criação (create) ou de atualização (update). Em seguida, uma mensagem de confirmação é exibida na Snackbar, indicando "Endereço criado com sucesso!" no caso de criação e "Endereço atualizado com sucesso!" no caso de atualização.

## Resultado





https://github.com/marconys/App_viaCep/assets/90052315/77d953ce-1b83-4f07-a663-409531e679ea

