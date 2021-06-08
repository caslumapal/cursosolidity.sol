// SPDX-License-Identifier: CC-BY-4.0
// (c) Desenvolvido por Lucas Louvison Palma

pragma solidity 0.8.4;

contract SeguroBike {
    
    address public contaSeguradora;
    
    uint public valorContrato;
    uint public duracaoContrato;
    uint public pagamentoAVista;
    
    struct DadosSegurado {
        address payable contaSegurado;
        uint quantidadeSinistro;
    }
    
    bool public quitado;
    
    event contratoCumprido (uint valorContrato, uint pagamentoAVista, bool quitado);
    
    mapping(string => uint) public registroSinistro;
    string [] tiposDeSinistro; 
    
    
     modifier somenteSeguradora {
        require(msg.sender == contaSeguradora, "Somente Seguradora");
    _;
    }
    
    constructor () {
        valorContrato = 1000;
        contaSeguradora = msg.sender; 
    }
    
   
   
    
    function inserirPagamentoAVista (uint valorPago) payable public{
        pagamentoAVista = valorPago;
        }
    
        
    function verificarValor (uint verificarPagamento) public view returns (bool _quitado) { 
        
        if (verificarPagamento >= valorContrato) {
            return true;
        } else {
            return false;
        }    
    }
  
   function incluirSinistro(string memory _incluirSinistro) public {
        tiposDeSinistro.push(_incluirSinistro);}
    
    
    }
