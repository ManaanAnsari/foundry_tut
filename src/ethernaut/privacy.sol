// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Privacy {

    // slot 0
  bool public locked = true;
    // slot 1
  uint256 public ID = block.timestamp;
    //   slot 2
  uint8 private flattening = 10;
    // slot 2
  uint8 private denomination = 255;
    //   slot 2
  uint16 private awkwardness = uint16(block.timestamp);
  //   slot 3,4,5
  bytes32[3] private data;

  constructor(bytes32[3] memory _data) {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}

// we need slot 5 
// 0x0a6ecb6af0755de78096976427356ba90a34752d4605ff94367f5b5693d8cae5
// its 32 
// need to shorten it to 16
// data.slice(0,34) 34 cz first 2 is 0x
// 0x0a6ecb6af0755de78096976427356ba9
