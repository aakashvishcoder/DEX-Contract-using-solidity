// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SimpleDEX {
    IERC20 public tokenA;
    IERC20 public tokenB;

    constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
    }

    function getReserves() public view returns (uint256, uint256) {
        return (tokenA.balanceOf(address(this)), tokenB.balanceOf(address(this)));
    }

    function addLiquidity(uint256 amountA, uint256 amountB) public {
        require(tokenA.transferFrom(msg.sender, address(this), amountA), "TokenA transfer failed");
        require(tokenB.transferFrom(msg.sender, address(this), amountB), "TokenB transfer failed");
    }

    function swapAforB(uint256 amountAIn) public {
        (uint256 reserveA, uint256 reserveB) = getReserves();

        require(amountAIn > 0, "Amount must be > 0");
        require(reserveA > 0 && reserveB > 0, "Insufficient reserves");

        uint256 amountAInWithFee = amountAIn * 997 / 1000;
        uint256 amountBOut = (amountAInWithFee * reserveB) / (reserveA + amountAInWithFee);

        require(tokenA.transferFrom(msg.sender, address(this), amountAIn), "TokenA transfer failed");
        require(tokenB.transfer(msg.sender, amountBOut), "TokenB transfer failed");
    }

    function swapBforA(uint256 amountBIn) public {
        (uint256 reserveA, uint256 reserveB) = getReserves();

        require(amountBIn > 0, "Amount must be > 0");
        require(reserveA > 0 && reserveB > 0, "Insufficient reserves");

        uint256 amountBInWithFee = amountBIn * 997 / 1000;
        uint256 amountAOut = (amountBInWithFee * reserveA) / (reserveB + amountBInWithFee);

        require(tokenB.transferFrom(msg.sender, address(this), amountBIn), "TokenB transfer failed");
        require(tokenA.transfer(msg.sender, amountAOut), "TokenA transfer failed");
    }
}
