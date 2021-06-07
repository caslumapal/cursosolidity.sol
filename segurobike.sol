// SPDX-License-Identifier: CC-BY-4.0
// (c) Desenvolvido por Lucas Louvison Palma

pragma solidity 0.8.4;

contract SeguroBike {
    
    address payable public contaSeguradora;
    
    struct DadosSegurado {
        string nomeDoSegurado;
        address payable contaSegurado;
        uint quantidadeSinistro;
    }
    
    uint public valorContrato;
    uint public duracaoContrato;
    uint public pagamentoAVista;
    
    event contratoQuitado (bool quitado);
    
    constructor () {
        valorContrato = 100000;
        }
   
    mapping(uint => DadosSegurado) public registroSinistro;
    DadosSegurado[] public contagemSinistro; 
    
    
    modifier somenteSeguradora {
        require(msg.sender == contaSeguradora, "Somente Seguradora");
    _;
    }
    
    function inserirPagamentoAVista (uint valorPago) public {
        pagamentoAVista = valorPago;    
    }
        
    function verificarValor (uint verificarPagamento) public view returns (bool quitado) {         
        if (verificarPagamento == valorContrato) {
            return true;
        } else {
            return false;
        }    
                    }
                    
                       
    }
    
