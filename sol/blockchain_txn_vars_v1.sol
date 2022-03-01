// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;
import "./ProtoBufRuntime.sol";
import "./GoogleProtobufAny.sol";

library SmartmeshBlockchain_txn_vars_v1 {


  //struct definition
  struct Data {
    SmartmeshBlockchain_var_v1.Data[] vars;
    uint32 version_predicate;
    bytes proof;
    bytes master_key;
    bytes key_proof;
    bytes[] cancels;
    bytes[] unsets;
    uint32 nonce;
    bytes[] multi_keys;
    bytes[] multi_proofs;
    bytes[] multi_key_proofs;
  }

  // Decoder section

  /**
   * @dev The main decoder for memory
   * @param bs The bytes array to be decoded
   * @return The decoded struct
   */
  function decode(bytes memory bs) internal pure returns (Data memory) {
    (Data memory x, ) = _decode(32, bs, bs.length);
    return x;
  }

  /**
   * @dev The main decoder for storage
   * @param self The in-storage struct
   * @param bs The bytes array to be decoded
   */
  function decode(Data storage self, bytes memory bs) internal {
    (Data memory x, ) = _decode(32, bs, bs.length);
    store(x, self);
  }
  // inner decoder

  /**
   * @dev The decoder for internal usage
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param sz The number of bytes expected
   * @return The decoded struct
   * @return The number of bytes decoded
   */
  function _decode(uint256 p, bytes memory bs, uint256 sz)
    internal
    pure
    returns (Data memory, uint)
  {
    Data memory r;
    uint[12] memory counters;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_unpacked_repeated_vars(pointer, bs, nil(), counters);
      } else
      if (fieldId == 2) {
        pointer += _read_version_predicate(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_proof(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_master_key(pointer, bs, r);
      } else
      if (fieldId == 5) {
        pointer += _read_key_proof(pointer, bs, r);
      } else
      if (fieldId == 6) {
        pointer += _read_unpacked_repeated_cancels(pointer, bs, nil(), counters);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_unsets(pointer, bs, nil(), counters);
      } else
      if (fieldId == 8) {
        pointer += _read_nonce(pointer, bs, r);
      } else
      if (fieldId == 9) {
        pointer += _read_unpacked_repeated_multi_keys(pointer, bs, nil(), counters);
      } else
      if (fieldId == 10) {
        pointer += _read_unpacked_repeated_multi_proofs(pointer, bs, nil(), counters);
      } else
      if (fieldId == 11) {
        pointer += _read_unpacked_repeated_multi_key_proofs(pointer, bs, nil(), counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    pointer = offset;
    if (counters[1] > 0) {
      require(r.vars.length == 0);
      r.vars = new SmartmeshBlockchain_var_v1.Data[](counters[1]);
    }
    if (counters[6] > 0) {
      require(r.cancels.length == 0);
      r.cancels = new bytes[](counters[6]);
    }
    if (counters[7] > 0) {
      require(r.unsets.length == 0);
      r.unsets = new bytes[](counters[7]);
    }
    if (counters[9] > 0) {
      require(r.multi_keys.length == 0);
      r.multi_keys = new bytes[](counters[9]);
    }
    if (counters[10] > 0) {
      require(r.multi_proofs.length == 0);
      r.multi_proofs = new bytes[](counters[10]);
    }
    if (counters[11] > 0) {
      require(r.multi_key_proofs.length == 0);
      r.multi_key_proofs = new bytes[](counters[11]);
    }

    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_unpacked_repeated_vars(pointer, bs, r, counters);
      } else
      if (fieldId == 6) {
        pointer += _read_unpacked_repeated_cancels(pointer, bs, r, counters);
      } else
      if (fieldId == 7) {
        pointer += _read_unpacked_repeated_unsets(pointer, bs, r, counters);
      } else
      if (fieldId == 9) {
        pointer += _read_unpacked_repeated_multi_keys(pointer, bs, r, counters);
      } else
      if (fieldId == 10) {
        pointer += _read_unpacked_repeated_multi_proofs(pointer, bs, r, counters);
      } else
      if (fieldId == 11) {
        pointer += _read_unpacked_repeated_multi_key_proofs(pointer, bs, r, counters);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }
    }
    return (r, sz);
  }

  // field readers

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_vars(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[12] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (SmartmeshBlockchain_var_v1.Data memory x, uint256 sz) = _decode_SmartmeshBlockchain_var_v1(p, bs);
    if (isNil(r)) {
      counters[1] += 1;
    } else {
      r.vars[r.vars.length - counters[1]] = x;
      counters[1] -= 1;
    }
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_version_predicate(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.version_predicate = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_proof(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.proof = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_master_key(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.master_key = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_key_proof(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.key_proof = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_cancels(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[12] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    if (isNil(r)) {
      counters[6] += 1;
    } else {
      r.cancels[r.cancels.length - counters[6]] = x;
      counters[6] -= 1;
    }
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_unsets(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[12] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    if (isNil(r)) {
      counters[7] += 1;
    } else {
      r.unsets[r.unsets.length - counters[7]] = x;
      counters[7] -= 1;
    }
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_nonce(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.nonce = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_multi_keys(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[12] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    if (isNil(r)) {
      counters[9] += 1;
    } else {
      r.multi_keys[r.multi_keys.length - counters[9]] = x;
      counters[9] -= 1;
    }
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_multi_proofs(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[12] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    if (isNil(r)) {
      counters[10] += 1;
    } else {
      r.multi_proofs[r.multi_proofs.length - counters[10]] = x;
      counters[10] -= 1;
    }
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @param counters The counters for repeated fields
   * @return The number of bytes decoded
   */
  function _read_unpacked_repeated_multi_key_proofs(
    uint256 p,
    bytes memory bs,
    Data memory r,
    uint[12] memory counters
  ) internal pure returns (uint) {
    /**
     * if `r` is NULL, then only counting the number of fields.
     */
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    if (isNil(r)) {
      counters[11] += 1;
    } else {
      r.multi_key_proofs[r.multi_key_proofs.length - counters[11]] = x;
      counters[11] -= 1;
    }
    return sz;
  }

  // struct decoder
  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_SmartmeshBlockchain_var_v1(uint256 p, bytes memory bs)
    internal
    pure
    returns (SmartmeshBlockchain_var_v1.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (SmartmeshBlockchain_var_v1.Data memory r, ) = SmartmeshBlockchain_var_v1._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }


  // Encoder section

  /**
   * @dev The main encoder for memory
   * @param r The struct to be encoded
   * @return The encoded byte array
   */
  function encode(Data memory r) internal pure returns (bytes memory) {
    bytes memory bs = new bytes(_estimate(r));
    uint256 sz = _encode(r, 32, bs);
    assembly {
      mstore(bs, sz)
    }
    return bs;
  }
  // inner encoder

  /**
   * @dev The encoder for internal usage
   * @param r The struct to be encoded
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The number of bytes encoded
   */
  function _encode(Data memory r, uint256 p, bytes memory bs)
    internal
    pure
    returns (uint)
  {
    uint256 offset = p;
    uint256 pointer = p;
    uint256 i;
    if (r.vars.length != 0) {
    for(i = 0; i < r.vars.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        1,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += SmartmeshBlockchain_var_v1._encode_nested(r.vars[i], pointer, bs);
    }
    }
    if (r.version_predicate != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.version_predicate, pointer, bs);
    }
    if (r.proof.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.proof, pointer, bs);
    }
    if (r.master_key.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.master_key, pointer, bs);
    }
    if (r.key_proof.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      5,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.key_proof, pointer, bs);
    }
    if (r.cancels.length != 0) {
    for(i = 0; i < r.cancels.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        6,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += ProtoBufRuntime._encode_bytes(r.cancels[i], pointer, bs);
    }
    }
    if (r.unsets.length != 0) {
    for(i = 0; i < r.unsets.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        7,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += ProtoBufRuntime._encode_bytes(r.unsets[i], pointer, bs);
    }
    }
    if (r.nonce != 0) {
    pointer += ProtoBufRuntime._encode_key(
      8,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.nonce, pointer, bs);
    }
    if (r.multi_keys.length != 0) {
    for(i = 0; i < r.multi_keys.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        9,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += ProtoBufRuntime._encode_bytes(r.multi_keys[i], pointer, bs);
    }
    }
    if (r.multi_proofs.length != 0) {
    for(i = 0; i < r.multi_proofs.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        10,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += ProtoBufRuntime._encode_bytes(r.multi_proofs[i], pointer, bs);
    }
    }
    if (r.multi_key_proofs.length != 0) {
    for(i = 0; i < r.multi_key_proofs.length; i++) {
      pointer += ProtoBufRuntime._encode_key(
        11,
        ProtoBufRuntime.WireType.LengthDelim,
        pointer,
        bs)
      ;
      pointer += ProtoBufRuntime._encode_bytes(r.multi_key_proofs[i], pointer, bs);
    }
    }
    return pointer - offset;
  }
  // nested encoder

  /**
   * @dev The encoder for inner struct
   * @param r The struct to be encoded
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The number of bytes encoded
   */
  function _encode_nested(Data memory r, uint256 p, bytes memory bs)
    internal
    pure
    returns (uint)
  {
    /**
     * First encoded `r` into a temporary array, and encode the actual size used.
     * Then copy the temporary array into `bs`.
     */
    uint256 offset = p;
    uint256 pointer = p;
    bytes memory tmp = new bytes(_estimate(r));
    uint256 tmpAddr = ProtoBufRuntime.getMemoryAddress(tmp);
    uint256 bsAddr = ProtoBufRuntime.getMemoryAddress(bs);
    uint256 size = _encode(r, 32, tmp);
    pointer += ProtoBufRuntime._encode_varint(size, pointer, bs);
    ProtoBufRuntime.copyBytes(tmpAddr + 32, bsAddr + pointer, size);
    pointer += size;
    delete tmp;
    return pointer - offset;
  }
  // estimator

  /**
   * @dev The estimator for a struct
   * @param r The struct to be encoded
   * @return The number of bytes encoded in estimation
   */
  function _estimate(
    Data memory r
  ) internal pure returns (uint) {
    uint256 e;uint256 i;
    for(i = 0; i < r.vars.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(SmartmeshBlockchain_var_v1._estimate(r.vars[i]));
    }
    e += 1 + ProtoBufRuntime._sz_uint32(r.version_predicate);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.proof.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.master_key.length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.key_proof.length);
    for(i = 0; i < r.cancels.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(r.cancels[i].length);
    }
    for(i = 0; i < r.unsets.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(r.unsets[i].length);
    }
    e += 1 + ProtoBufRuntime._sz_uint32(r.nonce);
    for(i = 0; i < r.multi_keys.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(r.multi_keys[i].length);
    }
    for(i = 0; i < r.multi_proofs.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(r.multi_proofs[i].length);
    }
    for(i = 0; i < r.multi_key_proofs.length; i++) {
      e += 1 + ProtoBufRuntime._sz_lendelim(r.multi_key_proofs[i].length);
    }
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.vars.length != 0) {
    return false;
  }

  if (r.version_predicate != 0) {
    return false;
  }

  if (r.proof.length != 0) {
    return false;
  }

  if (r.master_key.length != 0) {
    return false;
  }

  if (r.key_proof.length != 0) {
    return false;
  }

  if (r.cancels.length != 0) {
    return false;
  }

  if (r.unsets.length != 0) {
    return false;
  }

  if (r.nonce != 0) {
    return false;
  }

  if (r.multi_keys.length != 0) {
    return false;
  }

  if (r.multi_proofs.length != 0) {
    return false;
  }

  if (r.multi_key_proofs.length != 0) {
    return false;
  }

    return true;
  }


  //store function
  /**
   * @dev Store in-memory struct to storage
   * @param input The in-memory struct
   * @param output The in-storage struct
   */
  function store(Data memory input, Data storage output) internal {

    for(uint256 i1 = 0; i1 < input.vars.length; i1++) {
      output.vars.push(input.vars[i1]);
    }
    
    output.version_predicate = input.version_predicate;
    output.proof = input.proof;
    output.master_key = input.master_key;
    output.key_proof = input.key_proof;
    output.cancels = input.cancels;
    output.unsets = input.unsets;
    output.nonce = input.nonce;
    output.multi_keys = input.multi_keys;
    output.multi_proofs = input.multi_proofs;
    output.multi_key_proofs = input.multi_key_proofs;

  }


  //array helpers for Vars
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addVars(Data memory self, SmartmeshBlockchain_var_v1.Data memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    SmartmeshBlockchain_var_v1.Data[] memory tmp = new SmartmeshBlockchain_var_v1.Data[](self.vars.length + 1);
    for (uint256 i = 0; i < self.vars.length; i++) {
      tmp[i] = self.vars[i];
    }
    tmp[self.vars.length] = value;
    self.vars = tmp;
  }

  //array helpers for Cancels
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addCancels(Data memory self, bytes memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    bytes[] memory tmp = new bytes[](self.cancels.length + 1);
    for (uint256 i = 0; i < self.cancels.length; i++) {
      tmp[i] = self.cancels[i];
    }
    tmp[self.cancels.length] = value;
    self.cancels = tmp;
  }

  //array helpers for Unsets
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addUnsets(Data memory self, bytes memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    bytes[] memory tmp = new bytes[](self.unsets.length + 1);
    for (uint256 i = 0; i < self.unsets.length; i++) {
      tmp[i] = self.unsets[i];
    }
    tmp[self.unsets.length] = value;
    self.unsets = tmp;
  }

  //array helpers for MultiKeys
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addMultiKeys(Data memory self, bytes memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    bytes[] memory tmp = new bytes[](self.multi_keys.length + 1);
    for (uint256 i = 0; i < self.multi_keys.length; i++) {
      tmp[i] = self.multi_keys[i];
    }
    tmp[self.multi_keys.length] = value;
    self.multi_keys = tmp;
  }

  //array helpers for MultiProofs
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addMultiProofs(Data memory self, bytes memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    bytes[] memory tmp = new bytes[](self.multi_proofs.length + 1);
    for (uint256 i = 0; i < self.multi_proofs.length; i++) {
      tmp[i] = self.multi_proofs[i];
    }
    tmp[self.multi_proofs.length] = value;
    self.multi_proofs = tmp;
  }

  //array helpers for MultiKeyProofs
  /**
   * @dev Add value to an array
   * @param self The in-memory struct
   * @param value The value to add
   */
  function addMultiKeyProofs(Data memory self, bytes memory value) internal pure {
    /**
     * First resize the array. Then add the new element to the end.
     */
    bytes[] memory tmp = new bytes[](self.multi_key_proofs.length + 1);
    for (uint256 i = 0; i < self.multi_key_proofs.length; i++) {
      tmp[i] = self.multi_key_proofs[i];
    }
    tmp[self.multi_key_proofs.length] = value;
    self.multi_key_proofs = tmp;
  }


  //utility functions
  /**
   * @dev Return an empty struct
   * @return r The empty struct
   */
  function nil() internal pure returns (Data memory r) {
    assembly {
      r := 0
    }
  }

  /**
   * @dev Test whether a struct is empty
   * @param x The struct to be tested
   * @return r True if it is empty
   */
  function isNil(Data memory x) internal pure returns (bool r) {
    assembly {
      r := iszero(x)
    }
  }
}
//library SmartmeshBlockchain_txn_vars_v1

library SmartmeshBlockchain_var_v1 {


  //struct definition
  struct Data {
    string name;
    string type;
    bytes value;
  }

  // Decoder section

  /**
   * @dev The main decoder for memory
   * @param bs The bytes array to be decoded
   * @return The decoded struct
   */
  function decode(bytes memory bs) internal pure returns (Data memory) {
    (Data memory x, ) = _decode(32, bs, bs.length);
    return x;
  }

  /**
   * @dev The main decoder for storage
   * @param self The in-storage struct
   * @param bs The bytes array to be decoded
   */
  function decode(Data storage self, bytes memory bs) internal {
    (Data memory x, ) = _decode(32, bs, bs.length);
    store(x, self);
  }
  // inner decoder

  /**
   * @dev The decoder for internal usage
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param sz The number of bytes expected
   * @return The decoded struct
   * @return The number of bytes decoded
   */
  function _decode(uint256 p, bytes memory bs, uint256 sz)
    internal
    pure
    returns (Data memory, uint)
  {
    Data memory r;
    uint256 fieldId;
    ProtoBufRuntime.WireType wireType;
    uint256 bytesRead;
    uint256 offset = p;
    uint256 pointer = p;
    while (pointer < offset + sz) {
      (fieldId, wireType, bytesRead) = ProtoBufRuntime._decode_key(pointer, bs);
      pointer += bytesRead;
      if (fieldId == 1) {
        pointer += _read_name(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_type(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_value(pointer, bs, r);
      } else
      {
        pointer += ProtoBufRuntime._skip_field_decode(wireType, pointer, bs);
      }

    }
    return (r, sz);
  }

  // field readers

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_name(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.name = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_type(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.type = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_value(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.value = x;
    return sz;
  }


  // Encoder section

  /**
   * @dev The main encoder for memory
   * @param r The struct to be encoded
   * @return The encoded byte array
   */
  function encode(Data memory r) internal pure returns (bytes memory) {
    bytes memory bs = new bytes(_estimate(r));
    uint256 sz = _encode(r, 32, bs);
    assembly {
      mstore(bs, sz)
    }
    return bs;
  }
  // inner encoder

  /**
   * @dev The encoder for internal usage
   * @param r The struct to be encoded
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The number of bytes encoded
   */
  function _encode(Data memory r, uint256 p, bytes memory bs)
    internal
    pure
    returns (uint)
  {
    uint256 offset = p;
    uint256 pointer = p;
    
    if (bytes(r.name).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.name, pointer, bs);
    }
    if (bytes(r.type).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.type, pointer, bs);
    }
    if (r.value.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.value, pointer, bs);
    }
    return pointer - offset;
  }
  // nested encoder

  /**
   * @dev The encoder for inner struct
   * @param r The struct to be encoded
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The number of bytes encoded
   */
  function _encode_nested(Data memory r, uint256 p, bytes memory bs)
    internal
    pure
    returns (uint)
  {
    /**
     * First encoded `r` into a temporary array, and encode the actual size used.
     * Then copy the temporary array into `bs`.
     */
    uint256 offset = p;
    uint256 pointer = p;
    bytes memory tmp = new bytes(_estimate(r));
    uint256 tmpAddr = ProtoBufRuntime.getMemoryAddress(tmp);
    uint256 bsAddr = ProtoBufRuntime.getMemoryAddress(bs);
    uint256 size = _encode(r, 32, tmp);
    pointer += ProtoBufRuntime._encode_varint(size, pointer, bs);
    ProtoBufRuntime.copyBytes(tmpAddr + 32, bsAddr + pointer, size);
    pointer += size;
    delete tmp;
    return pointer - offset;
  }
  // estimator

  /**
   * @dev The estimator for a struct
   * @param r The struct to be encoded
   * @return The number of bytes encoded in estimation
   */
  function _estimate(
    Data memory r
  ) internal pure returns (uint) {
    uint256 e;
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.name).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.type).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.value.length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (bytes(r.name).length != 0) {
    return false;
  }

  if (bytes(r.type).length != 0) {
    return false;
  }

  if (r.value.length != 0) {
    return false;
  }

    return true;
  }


  //store function
  /**
   * @dev Store in-memory struct to storage
   * @param input The in-memory struct
   * @param output The in-storage struct
   */
  function store(Data memory input, Data storage output) internal {
    output.name = input.name;
    output.type = input.type;
    output.value = input.value;

  }



  //utility functions
  /**
   * @dev Return an empty struct
   * @return r The empty struct
   */
  function nil() internal pure returns (Data memory r) {
    assembly {
      r := 0
    }
  }

  /**
   * @dev Test whether a struct is empty
   * @param x The struct to be tested
   * @return r True if it is empty
   */
  function isNil(Data memory x) internal pure returns (bool r) {
    assembly {
      r := iszero(x)
    }
  }
}
//library SmartmeshBlockchain_var_v1