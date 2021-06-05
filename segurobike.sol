// SPDX-License-Identifier: CC-BY-4.0
// (c) Desenvolvido por Lucas Palma

pragma solidity 0.8.4;

contract SeguroBike {
    
    address payable public contaSeguradora;
    
    struct DadosSegurado {
        uint numeroDoContrato;
        string nomeDoSegurado;
        address payable contaSegurado;
        uint valorBike;
        uint quantidadeSinistro;
    }
    
    uint public valorContrato;
    uint public duracaoContrato;
    
    constructor () {
        valorContrato = 100000;
        duracaoContrato = block.timestamp;
    }
   
    mapping(uint => DadosSegurado) public registroSinistro;
    DadosSegurado[] public contagemSinistro; 
    
    event contratoQuitado (bool quitado);
    
     
    modifier somenteSeguradora {
        require(msg.sender == contaSeguradora, "Somente Seguradora");
    _;
    }
}
