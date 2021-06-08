// SPDX-License-Identifier: CC-BY-4.0
// (c) Desenvolvido por Lucas Louvison Palma

pragma solidity 0.8.4;

contract SeguroBike {
    
    address public contaSeguradora;
    
    uint public valorContrato;
    uint public duracaoContrato; //xxxxxxxxxxxxxxxxx
    uint public pagamentoAVista;
    
    struct DadosSegurado { //xxxxxxxxxxxxxxxxx
        address payable contaSegurado;
        string nomeSegurado;
    }
    
    bool public quitado;
    
    event contratoCumprido (uint valorContrato, uint pagamentoAVista, bool quitado); // xxxxxxxxxxxxx
    
    //vincula um tipo de sinistro à quantidade
    mapping(string => uint) public registroSinistro;
    string [] Sinistros; 
    
    
     modifier somenteSeguradora { //xxxxxxxxxxxxxxxxxxxxx
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
  
   function quantidadeSinistro(string memory _incluirQuantidadeSinistro) public {
        Sinistros.push(_incluirQuantidadeSinistro);
       
   }
   
   function incluirTipoSinistro(string memory _tipoSinistro, uint _quantificacao) public {
        registroSinistro[_tipoSinistro] = _quantificacao;
       
   }
   
   
    }
