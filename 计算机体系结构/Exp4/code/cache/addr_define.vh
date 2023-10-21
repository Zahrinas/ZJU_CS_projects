localparam 
// | ----------- address 32 ----------- |
// | tag 23 | index 5 | word 2 | byte 2 |
    ADDR_BITS = 32,
    WORD_BYTES = 4,
    WORD_BYTES_WIDTH = 2,   // log2(4 (WORD_BYTES))
    WORD_BITS = (WORD_BYTES * 8),
    ELEMENT_WORDS = 4,
    ELEMENT_WORDS_WIDTH = 2,   // log2(4 (ELEMENT_WORDS))
    BLOCK_WIDTH = (ELEMENT_WORDS_WIDTH + WORD_BYTES_WIDTH),   // 4
    ELEMENT_NUM = 64,
    WAYS = 2,
    ELEMENT_INDEX_WIDTH = 6,   // log2(64)
    SET_INDEX_WIDTH = 5,   // log2(64 / 2 (WAYS))
    TAG_BITS = (ADDR_BITS - SET_INDEX_WIDTH - BLOCK_WIDTH);  // 32 - 5 - 4 = 23
    