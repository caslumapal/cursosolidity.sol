contract SeguroBike {
    
    address payable public contaSeguradora;
    
    struct DadosSegurado {
        uint numeroDoContrato;
        string nomeDoSegurado;
        address payable contaSegurado;
        uint valorBike;
        uint quantidadeSinistro;
    }
    
    uint private valorContrato;
    uint private valorParcelas;
    uint public mesesParaPagamento;
    uint public duracaoContrato;
   
    bool public quitado;
    
    mapping(uint => DadosSegurado) public registroSinistro;
    DadosSegurado[] public contagemSinistro; 
    
    event pagamentoNovaParcela (address contaSegurado, bool quitado);
    event contratoQuitado (bool quitado);
   
    
}
