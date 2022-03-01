// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;
import "./ProtoBufRuntime.sol";
import "./GoogleProtobufAny.sol";

library SmartmeshRadiopRadioReq {


  //struct definition
  struct Data {
    uint32 id;
    SmartmeshRadiopRadioTxReq.Data tx;
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
        pointer += _read_id(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_tx(pointer, bs, r);
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
  function _read_id(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.id = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_tx(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (SmartmeshRadiopRadioTxReq.Data memory x, uint256 sz) = _decode_SmartmeshRadiopRadioTxReq(p, bs);
    r.tx = x;
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
  function _decode_SmartmeshRadiopRadioTxReq(uint256 p, bytes memory bs)
    internal
    pure
    returns (SmartmeshRadiopRadioTxReq.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (SmartmeshRadiopRadioTxReq.Data memory r, ) = SmartmeshRadiopRadioTxReq._decode(pointer, bs, sz);
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
    
    if (r.id != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.id, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += SmartmeshRadiopRadioTxReq._encode_nested(r.tx, pointer, bs);
    
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
    e += 1 + ProtoBufRuntime._sz_uint32(r.id);
    e += 1 + ProtoBufRuntime._sz_lendelim(SmartmeshRadiopRadioTxReq._estimate(r.tx));
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.id != 0) {
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
    output.id = input.id;
    SmartmeshRadiopRadioTxReq.store(input.tx, output.tx);

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
//library SmartmeshRadiopRadioReq

library SmartmeshRadiopRadioTxResp {


  //struct definition
  struct Data {
    bool success;
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
        pointer += _read_success(pointer, bs, r);
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
  function _read_success(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bool x, uint256 sz) = ProtoBufRuntime._decode_bool(p, bs);
    r.success = x;
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
    
    if (r.success != false) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bool(r.success, pointer, bs);
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
   * @return The number of bytes encoded in estimation
   */
  function _estimate(
    Data memory /* r */
  ) internal pure returns (uint) {
    uint256 e;
    e += 1 + 1;
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.success != false) {
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
    output.success = input.success;

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
//library SmartmeshRadiopRadioTxResp

library SmartmeshRadiopRadioTxReq {


  //struct definition
  struct Data {
    uint32 freq;
    RADIOP_PROTO_GLOBAL_ENUMS.Radio radio;
    int32 power;
    RADIOP_PROTO_GLOBAL_ENUMS.Bandwidth bandwidth;
    RADIOP_PROTO_GLOBAL_ENUMS.Spreading spreading;
    RADIOP_PROTO_GLOBAL_ENUMS.Coderate coderate;
    bool invert_polarity;
    bool omit_crc;
    bool implicit_header;
    bytes payload;
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
        pointer += _read_freq(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_radio(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_power(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_bandwidth(pointer, bs, r);
      } else
      if (fieldId == 5) {
        pointer += _read_spreading(pointer, bs, r);
      } else
      if (fieldId == 6) {
        pointer += _read_coderate(pointer, bs, r);
      } else
      if (fieldId == 7) {
        pointer += _read_invert_polarity(pointer, bs, r);
      } else
      if (fieldId == 8) {
        pointer += _read_omit_crc(pointer, bs, r);
      } else
      if (fieldId == 9) {
        pointer += _read_implicit_header(pointer, bs, r);
      } else
      if (fieldId == 10) {
        pointer += _read_payload(pointer, bs, r);
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
  function _read_freq(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.freq = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_radio(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    RADIOP_PROTO_GLOBAL_ENUMS.Radio x = RADIOP_PROTO_GLOBAL_ENUMS.decode_Radio(tmp);
    r.radio = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_power(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int32 x, uint256 sz) = ProtoBufRuntime._decode_int32(p, bs);
    r.power = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_bandwidth(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    RADIOP_PROTO_GLOBAL_ENUMS.Bandwidth x = RADIOP_PROTO_GLOBAL_ENUMS.decode_Bandwidth(tmp);
    r.bandwidth = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_spreading(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    RADIOP_PROTO_GLOBAL_ENUMS.Spreading x = RADIOP_PROTO_GLOBAL_ENUMS.decode_Spreading(tmp);
    r.spreading = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_coderate(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    RADIOP_PROTO_GLOBAL_ENUMS.Coderate x = RADIOP_PROTO_GLOBAL_ENUMS.decode_Coderate(tmp);
    r.coderate = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_invert_polarity(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bool x, uint256 sz) = ProtoBufRuntime._decode_bool(p, bs);
    r.invert_polarity = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_omit_crc(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bool x, uint256 sz) = ProtoBufRuntime._decode_bool(p, bs);
    r.omit_crc = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_implicit_header(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bool x, uint256 sz) = ProtoBufRuntime._decode_bool(p, bs);
    r.implicit_header = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_payload(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.payload = x;
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
    
    if (r.freq != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.freq, pointer, bs);
    }
    if (uint(r.radio) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_radio = RADIOP_PROTO_GLOBAL_ENUMS.encode_Radio(r.radio);
    pointer += ProtoBufRuntime._encode_enum(_enum_radio, pointer, bs);
    }
    if (r.power != 0) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_int32(r.power, pointer, bs);
    }
    if (uint(r.bandwidth) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_bandwidth = RADIOP_PROTO_GLOBAL_ENUMS.encode_Bandwidth(r.bandwidth);
    pointer += ProtoBufRuntime._encode_enum(_enum_bandwidth, pointer, bs);
    }
    if (uint(r.spreading) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      5,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_spreading = RADIOP_PROTO_GLOBAL_ENUMS.encode_Spreading(r.spreading);
    pointer += ProtoBufRuntime._encode_enum(_enum_spreading, pointer, bs);
    }
    if (uint(r.coderate) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      6,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_coderate = RADIOP_PROTO_GLOBAL_ENUMS.encode_Coderate(r.coderate);
    pointer += ProtoBufRuntime._encode_enum(_enum_coderate, pointer, bs);
    }
    if (r.invert_polarity != false) {
    pointer += ProtoBufRuntime._encode_key(
      7,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bool(r.invert_polarity, pointer, bs);
    }
    if (r.omit_crc != false) {
    pointer += ProtoBufRuntime._encode_key(
      8,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bool(r.omit_crc, pointer, bs);
    }
    if (r.implicit_header != false) {
    pointer += ProtoBufRuntime._encode_key(
      9,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bool(r.implicit_header, pointer, bs);
    }
    if (r.payload.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      10,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.payload, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint32(r.freq);
    e += 1 + ProtoBufRuntime._sz_enum(RADIOP_PROTO_GLOBAL_ENUMS.encode_Radio(r.radio));
    e += 1 + ProtoBufRuntime._sz_int32(r.power);
    e += 1 + ProtoBufRuntime._sz_enum(RADIOP_PROTO_GLOBAL_ENUMS.encode_Bandwidth(r.bandwidth));
    e += 1 + ProtoBufRuntime._sz_enum(RADIOP_PROTO_GLOBAL_ENUMS.encode_Spreading(r.spreading));
    e += 1 + ProtoBufRuntime._sz_enum(RADIOP_PROTO_GLOBAL_ENUMS.encode_Coderate(r.coderate));
    e += 1 + 1;
    e += 1 + 1;
    e += 1 + 1;
    e += 1 + ProtoBufRuntime._sz_lendelim(r.payload.length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.freq != 0) {
    return false;
  }

  if (uint(r.radio) != 0) {
    return false;
  }

  if (r.power != 0) {
    return false;
  }

  if (uint(r.bandwidth) != 0) {
    return false;
  }

  if (uint(r.spreading) != 0) {
    return false;
  }

  if (uint(r.coderate) != 0) {
    return false;
  }

  if (r.invert_polarity != false) {
    return false;
  }

  if (r.omit_crc != false) {
    return false;
  }

  if (r.implicit_header != false) {
    return false;
  }

  if (r.payload.length != 0) {
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
    output.freq = input.freq;
    output.radio = input.radio;
    output.power = input.power;
    output.bandwidth = input.bandwidth;
    output.spreading = input.spreading;
    output.coderate = input.coderate;
    output.invert_polarity = input.invert_polarity;
    output.omit_crc = input.omit_crc;
    output.implicit_header = input.implicit_header;
    output.payload = input.payload;

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
//library SmartmeshRadiopRadioTxReq

library SmartmeshRadiopRadioResp {


  //struct definition
  struct Data {
    uint32 id;
    SmartmeshRadiopRadioTxResp.Data tx;
    SmartmeshRadiopRadioRxPacket.Data rx_packet;
    bytes parse_err;
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
        pointer += _read_id(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_tx(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_rx_packet(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_parse_err(pointer, bs, r);
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
  function _read_id(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.id = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_tx(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (SmartmeshRadiopRadioTxResp.Data memory x, uint256 sz) = _decode_SmartmeshRadiopRadioTxResp(p, bs);
    r.tx = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_rx_packet(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (SmartmeshRadiopRadioRxPacket.Data memory x, uint256 sz) = _decode_SmartmeshRadiopRadioRxPacket(p, bs);
    r.rx_packet = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_parse_err(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.parse_err = x;
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
  function _decode_SmartmeshRadiopRadioTxResp(uint256 p, bytes memory bs)
    internal
    pure
    returns (SmartmeshRadiopRadioTxResp.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (SmartmeshRadiopRadioTxResp.Data memory r, ) = SmartmeshRadiopRadioTxResp._decode(pointer, bs, sz);
    return (r, sz + bytesRead);
  }

  /**
   * @dev The decoder for reading a inner struct field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @return The decoded inner-struct
   * @return The number of bytes used to decode
   */
  function _decode_SmartmeshRadiopRadioRxPacket(uint256 p, bytes memory bs)
    internal
    pure
    returns (SmartmeshRadiopRadioRxPacket.Data memory, uint)
  {
    uint256 pointer = p;
    (uint256 sz, uint256 bytesRead) = ProtoBufRuntime._decode_varint(pointer, bs);
    pointer += bytesRead;
    (SmartmeshRadiopRadioRxPacket.Data memory r, ) = SmartmeshRadiopRadioRxPacket._decode(pointer, bs, sz);
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
    
    if (r.id != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.id, pointer, bs);
    }
    
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += SmartmeshRadiopRadioTxResp._encode_nested(r.tx, pointer, bs);
    
    
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += SmartmeshRadiopRadioRxPacket._encode_nested(r.rx_packet, pointer, bs);
    
    if (r.parse_err.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.parse_err, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint32(r.id);
    e += 1 + ProtoBufRuntime._sz_lendelim(SmartmeshRadiopRadioTxResp._estimate(r.tx));
    e += 1 + ProtoBufRuntime._sz_lendelim(SmartmeshRadiopRadioRxPacket._estimate(r.rx_packet));
    e += 1 + ProtoBufRuntime._sz_lendelim(r.parse_err.length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.id != 0) {
    return false;
  }

  if (r.parse_err.length != 0) {
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
    output.id = input.id;
    SmartmeshRadiopRadioTxResp.store(input.tx, output.tx);
    SmartmeshRadiopRadioRxPacket.store(input.rx_packet, output.rx_packet);
    output.parse_err = input.parse_err;

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
//library SmartmeshRadiopRadioResp

library SmartmeshRadiopRadioRxPacket {


  //struct definition
  struct Data {
    uint32 freq;
    uint32 if_chain;
    bool crc_check;
    uint64 timestamp;
    RADIOP_PROTO_GLOBAL_ENUMS.Radio radio;
    RADIOP_PROTO_GLOBAL_ENUMS.Bandwidth bandwidth;
    RADIOP_PROTO_GLOBAL_ENUMS.Spreading spreading;
    RADIOP_PROTO_GLOBAL_ENUMS.Coderate coderate;
    string rssi;
    string snr;
    bytes payload;
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
        pointer += _read_freq(pointer, bs, r);
      } else
      if (fieldId == 2) {
        pointer += _read_if_chain(pointer, bs, r);
      } else
      if (fieldId == 3) {
        pointer += _read_crc_check(pointer, bs, r);
      } else
      if (fieldId == 4) {
        pointer += _read_timestamp(pointer, bs, r);
      } else
      if (fieldId == 5) {
        pointer += _read_radio(pointer, bs, r);
      } else
      if (fieldId == 6) {
        pointer += _read_bandwidth(pointer, bs, r);
      } else
      if (fieldId == 7) {
        pointer += _read_spreading(pointer, bs, r);
      } else
      if (fieldId == 8) {
        pointer += _read_coderate(pointer, bs, r);
      } else
      if (fieldId == 9) {
        pointer += _read_rssi(pointer, bs, r);
      } else
      if (fieldId == 10) {
        pointer += _read_snr(pointer, bs, r);
      } else
      if (fieldId == 11) {
        pointer += _read_payload(pointer, bs, r);
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
  function _read_freq(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.freq = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_if_chain(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint32 x, uint256 sz) = ProtoBufRuntime._decode_uint32(p, bs);
    r.if_chain = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_crc_check(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bool x, uint256 sz) = ProtoBufRuntime._decode_bool(p, bs);
    r.crc_check = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_timestamp(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (uint64 x, uint256 sz) = ProtoBufRuntime._decode_uint64(p, bs);
    r.timestamp = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_radio(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    RADIOP_PROTO_GLOBAL_ENUMS.Radio x = RADIOP_PROTO_GLOBAL_ENUMS.decode_Radio(tmp);
    r.radio = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_bandwidth(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    RADIOP_PROTO_GLOBAL_ENUMS.Bandwidth x = RADIOP_PROTO_GLOBAL_ENUMS.decode_Bandwidth(tmp);
    r.bandwidth = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_spreading(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    RADIOP_PROTO_GLOBAL_ENUMS.Spreading x = RADIOP_PROTO_GLOBAL_ENUMS.decode_Spreading(tmp);
    r.spreading = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_coderate(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (int64 tmp, uint256 sz) = ProtoBufRuntime._decode_enum(p, bs);
    RADIOP_PROTO_GLOBAL_ENUMS.Coderate x = RADIOP_PROTO_GLOBAL_ENUMS.decode_Coderate(tmp);
    r.coderate = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_rssi(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.rssi = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_snr(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (string memory x, uint256 sz) = ProtoBufRuntime._decode_string(p, bs);
    r.snr = x;
    return sz;
  }

  /**
   * @dev The decoder for reading a field
   * @param p The offset of bytes array to start decode
   * @param bs The bytes array to be decoded
   * @param r The in-memory struct
   * @return The number of bytes decoded
   */
  function _read_payload(
    uint256 p,
    bytes memory bs,
    Data memory r
  ) internal pure returns (uint) {
    (bytes memory x, uint256 sz) = ProtoBufRuntime._decode_bytes(p, bs);
    r.payload = x;
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
    
    if (r.freq != 0) {
    pointer += ProtoBufRuntime._encode_key(
      1,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.freq, pointer, bs);
    }
    if (r.if_chain != 0) {
    pointer += ProtoBufRuntime._encode_key(
      2,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint32(r.if_chain, pointer, bs);
    }
    if (r.crc_check != false) {
    pointer += ProtoBufRuntime._encode_key(
      3,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bool(r.crc_check, pointer, bs);
    }
    if (r.timestamp != 0) {
    pointer += ProtoBufRuntime._encode_key(
      4,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_uint64(r.timestamp, pointer, bs);
    }
    if (uint(r.radio) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      5,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_radio = RADIOP_PROTO_GLOBAL_ENUMS.encode_Radio(r.radio);
    pointer += ProtoBufRuntime._encode_enum(_enum_radio, pointer, bs);
    }
    if (uint(r.bandwidth) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      6,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_bandwidth = RADIOP_PROTO_GLOBAL_ENUMS.encode_Bandwidth(r.bandwidth);
    pointer += ProtoBufRuntime._encode_enum(_enum_bandwidth, pointer, bs);
    }
    if (uint(r.spreading) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      7,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_spreading = RADIOP_PROTO_GLOBAL_ENUMS.encode_Spreading(r.spreading);
    pointer += ProtoBufRuntime._encode_enum(_enum_spreading, pointer, bs);
    }
    if (uint(r.coderate) != 0) {
    pointer += ProtoBufRuntime._encode_key(
      8,
      ProtoBufRuntime.WireType.Varint,
      pointer,
      bs
    );
    int32 _enum_coderate = RADIOP_PROTO_GLOBAL_ENUMS.encode_Coderate(r.coderate);
    pointer += ProtoBufRuntime._encode_enum(_enum_coderate, pointer, bs);
    }
    if (bytes(r.rssi).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      9,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.rssi, pointer, bs);
    }
    if (bytes(r.snr).length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      10,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_string(r.snr, pointer, bs);
    }
    if (r.payload.length != 0) {
    pointer += ProtoBufRuntime._encode_key(
      11,
      ProtoBufRuntime.WireType.LengthDelim,
      pointer,
      bs
    );
    pointer += ProtoBufRuntime._encode_bytes(r.payload, pointer, bs);
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
    e += 1 + ProtoBufRuntime._sz_uint32(r.freq);
    e += 1 + ProtoBufRuntime._sz_uint32(r.if_chain);
    e += 1 + 1;
    e += 1 + ProtoBufRuntime._sz_uint64(r.timestamp);
    e += 1 + ProtoBufRuntime._sz_enum(RADIOP_PROTO_GLOBAL_ENUMS.encode_Radio(r.radio));
    e += 1 + ProtoBufRuntime._sz_enum(RADIOP_PROTO_GLOBAL_ENUMS.encode_Bandwidth(r.bandwidth));
    e += 1 + ProtoBufRuntime._sz_enum(RADIOP_PROTO_GLOBAL_ENUMS.encode_Spreading(r.spreading));
    e += 1 + ProtoBufRuntime._sz_enum(RADIOP_PROTO_GLOBAL_ENUMS.encode_Coderate(r.coderate));
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.rssi).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(bytes(r.snr).length);
    e += 1 + ProtoBufRuntime._sz_lendelim(r.payload.length);
    return e;
  }
  // empty checker

  function _empty(
    Data memory r
  ) internal pure returns (bool) {
    
  if (r.freq != 0) {
    return false;
  }

  if (r.if_chain != 0) {
    return false;
  }

  if (r.crc_check != false) {
    return false;
  }

  if (r.timestamp != 0) {
    return false;
  }

  if (uint(r.radio) != 0) {
    return false;
  }

  if (uint(r.bandwidth) != 0) {
    return false;
  }

  if (uint(r.spreading) != 0) {
    return false;
  }

  if (uint(r.coderate) != 0) {
    return false;
  }

  if (bytes(r.rssi).length != 0) {
    return false;
  }

  if (bytes(r.snr).length != 0) {
    return false;
  }

  if (r.payload.length != 0) {
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
    output.freq = input.freq;
    output.if_chain = input.if_chain;
    output.crc_check = input.crc_check;
    output.timestamp = input.timestamp;
    output.radio = input.radio;
    output.bandwidth = input.bandwidth;
    output.spreading = input.spreading;
    output.coderate = input.coderate;
    output.rssi = input.rssi;
    output.snr = input.snr;
    output.payload = input.payload;

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
//library SmartmeshRadiopRadioRxPacket

library RADIOP_PROTO_GLOBAL_ENUMS {

  //enum definition
  // Solidity enum definitions
  enum Bandwidth {
    BW_UNDEFINED,
    BW7_8kHz,
    BW15_6kHz,
    BW31_2kHz,
    BW62_5kHz,
    BW125kHz,
    BW250kHz,
    BW500kHz
  }


  // Solidity enum encoder
  function encode_Bandwidth(Bandwidth x) internal pure returns (int32) {
    
    if (x == Bandwidth.BW_UNDEFINED) {
      return 0;
    }

    if (x == Bandwidth.BW7_8kHz) {
      return 1;
    }

    if (x == Bandwidth.BW15_6kHz) {
      return 2;
    }

    if (x == Bandwidth.BW31_2kHz) {
      return 3;
    }

    if (x == Bandwidth.BW62_5kHz) {
      return 4;
    }

    if (x == Bandwidth.BW125kHz) {
      return 5;
    }

    if (x == Bandwidth.BW250kHz) {
      return 6;
    }

    if (x == Bandwidth.BW500kHz) {
      return 7;
    }
    revert();
  }


  // Solidity enum decoder
  function decode_Bandwidth(int64 x) internal pure returns (Bandwidth) {
    
    if (x == 0) {
      return Bandwidth.BW_UNDEFINED;
    }

    if (x == 1) {
      return Bandwidth.BW7_8kHz;
    }

    if (x == 2) {
      return Bandwidth.BW15_6kHz;
    }

    if (x == 3) {
      return Bandwidth.BW31_2kHz;
    }

    if (x == 4) {
      return Bandwidth.BW62_5kHz;
    }

    if (x == 5) {
      return Bandwidth.BW125kHz;
    }

    if (x == 6) {
      return Bandwidth.BW250kHz;
    }

    if (x == 7) {
      return Bandwidth.BW500kHz;
    }
    revert();
  }


  /**
   * @dev The estimator for an packed enum array
   * @return The number of bytes encoded
   */
  function estimate_packed_repeated_Bandwidth(
    Bandwidth[] memory a
  ) internal pure returns (uint256) {
    uint256 e = 0;
    for (uint i = 0; i < a.length; i++) {
      e += ProtoBufRuntime._sz_enum(encode_Bandwidth(a[i]));
    }
    return e;
  }

  // Solidity enum definitions
  enum Coderate {
    CR_UNDEFINED,
    CR4_5,
    CR4_6,
    CR4_7,
    CR4_8
  }


  // Solidity enum encoder
  function encode_Coderate(Coderate x) internal pure returns (int32) {
    
    if (x == Coderate.CR_UNDEFINED) {
      return 0;
    }

    if (x == Coderate.CR4_5) {
      return 1;
    }

    if (x == Coderate.CR4_6) {
      return 2;
    }

    if (x == Coderate.CR4_7) {
      return 3;
    }

    if (x == Coderate.CR4_8) {
      return 4;
    }
    revert();
  }


  // Solidity enum decoder
  function decode_Coderate(int64 x) internal pure returns (Coderate) {
    
    if (x == 0) {
      return Coderate.CR_UNDEFINED;
    }

    if (x == 1) {
      return Coderate.CR4_5;
    }

    if (x == 2) {
      return Coderate.CR4_6;
    }

    if (x == 3) {
      return Coderate.CR4_7;
    }

    if (x == 4) {
      return Coderate.CR4_8;
    }
    revert();
  }


  /**
   * @dev The estimator for an packed enum array
   * @return The number of bytes encoded
   */
  function estimate_packed_repeated_Coderate(
    Coderate[] memory a
  ) internal pure returns (uint256) {
    uint256 e = 0;
    for (uint i = 0; i < a.length; i++) {
      e += ProtoBufRuntime._sz_enum(encode_Coderate(a[i]));
    }
    return e;
  }

  // Solidity enum definitions
  enum Radio {
    R0,
    R1
  }


  // Solidity enum encoder
  function encode_Radio(Radio x) internal pure returns (int32) {
    
    if (x == Radio.R0) {
      return 0;
    }

    if (x == Radio.R1) {
      return 1;
    }
    revert();
  }


  // Solidity enum decoder
  function decode_Radio(int64 x) internal pure returns (Radio) {
    
    if (x == 0) {
      return Radio.R0;
    }

    if (x == 1) {
      return Radio.R1;
    }
    revert();
  }


  /**
   * @dev The estimator for an packed enum array
   * @return The number of bytes encoded
   */
  function estimate_packed_repeated_Radio(
    Radio[] memory a
  ) internal pure returns (uint256) {
    uint256 e = 0;
    for (uint i = 0; i < a.length; i++) {
      e += ProtoBufRuntime._sz_enum(encode_Radio(a[i]));
    }
    return e;
  }

  // Solidity enum definitions
  enum Spreading {
    SF_UNDEFINED,
    SF7,
    SF8,
    SF9,
    SF10,
    SF11,
    SF12
  }


  // Solidity enum encoder
  function encode_Spreading(Spreading x) internal pure returns (int32) {
    
    if (x == Spreading.SF_UNDEFINED) {
      return 0;
    }

    if (x == Spreading.SF7) {
      return 1;
    }

    if (x == Spreading.SF8) {
      return 2;
    }

    if (x == Spreading.SF9) {
      return 3;
    }

    if (x == Spreading.SF10) {
      return 4;
    }

    if (x == Spreading.SF11) {
      return 5;
    }

    if (x == Spreading.SF12) {
      return 6;
    }
    revert();
  }


  // Solidity enum decoder
  function decode_Spreading(int64 x) internal pure returns (Spreading) {
    
    if (x == 0) {
      return Spreading.SF_UNDEFINED;
    }

    if (x == 1) {
      return Spreading.SF7;
    }

    if (x == 2) {
      return Spreading.SF8;
    }

    if (x == 3) {
      return Spreading.SF9;
    }

    if (x == 4) {
      return Spreading.SF10;
    }

    if (x == 5) {
      return Spreading.SF11;
    }

    if (x == 6) {
      return Spreading.SF12;
    }
    revert();
  }


  /**
   * @dev The estimator for an packed enum array
   * @return The number of bytes encoded
   */
  function estimate_packed_repeated_Spreading(
    Spreading[] memory a
  ) internal pure returns (uint256) {
    uint256 e = 0;
    for (uint i = 0; i < a.length; i++) {
      e += ProtoBufRuntime._sz_enum(encode_Spreading(a[i]));
    }
    return e;
  }
}
//library RADIOP_PROTO_GLOBAL_ENUMS