// SPDX-License-Identifier: CC-BY-4.0

pragma solidity 0.8.4;

    contract ConsultaCadastroNacionalDaServentia {
        
        mapping (string => string) public localidadesEstadoDeSaoPaulo;
        
        mapping (uint256 => uint256) public cadastroVinculadoCartorio;
        
        
        
        function adicionarLocalidade (string memory _municipio, string memory _cartorio) public {
            localidadesEstadoDeSaoPaulo [_municipio] = _cartorio;
            
            }
        
        function consultaCadastro (string memory _municipio) public view returns (string memory) {
            return localidadesEstadoDeSaoPaulo [_municipio];
        }
        
    
        
    }
