// generated code

module Hex2Ascii(
    input wire [3:0] hex,
    output reg [7:0] ascii
);

    always @* begin
        case (hex)
            4'h0: ascii = 48;
            4'h1: ascii = 49;
            4'h2: ascii = 50;
            4'h3: ascii = 51;
            4'h4: ascii = 52;
            4'h5: ascii = 53;
            4'h6: ascii = 54;
            4'h7: ascii = 55;
            4'h8: ascii = 56;
            4'h9: ascii = 57;
            4'ha: ascii = 97;
            4'hb: ascii = 98;
            4'hc: ascii = 99;
            4'hd: ascii = 100;
            4'he: ascii = 101;
            4'hf: ascii = 102;
        endcase
    end

endmodule

module VgaDebugger(
    input wire [31:0] pc,
    input wire [31:0] inst,
    input wire [31:0] IfId_pc,
    input wire [31:0] IfId_inst,
    input wire IfId_valid,
    input wire [31:0] IdEx_pc,
    input wire [31:0] IdEx_inst,
    input wire IdEx_valid,
    input wire [4:0] IdEx_rd,
    input wire [4:0] IdEx_rs1,
    input wire [4:0] IdEx_rs2,
    input wire [31:0] IdEx_rs1_val,
    input wire [31:0] IdEx_rs2_val,
    input wire IdEx_reg_wen,
    input wire IdEx_is_imm,
    input wire [31:0] IdEx_imm,
    input wire IdEx_mem_wen,
    input wire IdEx_mem_ren,
    input wire IdEx_is_branch,
    input wire IdEx_is_jal,
    input wire IdEx_is_jalr,
    input wire IdEx_is_auipc,
    input wire IdEx_is_lui,
    input wire [3:0] IdEx_alu_ctrl,
    input wire [2:0] IdEx_cmp_ctrl,
    input wire [31:0] ExMa_pc,
    input wire [31:0] ExMa_inst,
    input wire ExMa_valid,
    input wire [4:0] ExMa_rd,
    input wire ExMa_reg_wen,
    input wire [31:0] ExMa_mem_w_data,
    input wire [31:0] ExMa_alu_res,
    input wire ExMa_mem_wen,
    input wire ExMa_mem_ren,
    input wire ExMa_is_jal,
    input wire ExMa_is_jalr,
    input wire [31:0] MaWb_pc,
    input wire [31:0] MaWb_inst,
    input wire MaWb_valid,
    input wire [4:0] MaWb_rd,
    input wire MaWb_reg_wen,
    input wire [31:0] MaWb_reg_w_data,
    input wire [31:0] x0,
    input wire [31:0] ra,
    input wire [31:0] sp,
    input wire [31:0] gp,
    input wire [31:0] tp,
    input wire [31:0] t0,
    input wire [31:0] t1,
    input wire [31:0] t2,
    input wire [31:0] s0,
    input wire [31:0] s1,
    input wire [31:0] a0,
    input wire [31:0] a1,
    input wire [31:0] a2,
    input wire [31:0] a3,
    input wire [31:0] a4,
    input wire [31:0] a5,
    input wire [31:0] a6,
    input wire [31:0] a7,
    input wire [31:0] s2,
    input wire [31:0] s3,
    input wire [31:0] s4,
    input wire [31:0] s5,
    input wire [31:0] s6,
    input wire [31:0] s7,
    input wire [31:0] s8,
    input wire [31:0] s9,
    input wire [31:0] s10,
    input wire [31:0] s11,
    input wire [31:0] t3,
    input wire [31:0] t4,
    input wire [31:0] t5,
    input wire [31:0] t6,
    input wire clk,
    output reg display_wen,
    output wire [11:0] display_w_addr,
    output wire [7:0] display_w_data
);

    reg [11:0] display_addr = 0;
    assign display_w_addr = display_addr;
    always @(posedge clk) begin
        display_addr <= display_addr == 2399 ? 0 : display_addr + 1;
    end

    reg [3:0] dynamic_hex = 0;
    Hex2Ascii hex2ascii(dynamic_hex, display_w_data);
    always @* begin
        case (display_addr)
            244: begin dynamic_hex = pc[31:28]; display_wen = 1; end
            245: begin dynamic_hex = pc[27:24]; display_wen = 1; end
            246: begin dynamic_hex = pc[23:20]; display_wen = 1; end
            247: begin dynamic_hex = pc[19:16]; display_wen = 1; end
            248: begin dynamic_hex = pc[15:12]; display_wen = 1; end
            249: begin dynamic_hex = pc[11:8]; display_wen = 1; end
            250: begin dynamic_hex = pc[7:4]; display_wen = 1; end
            251: begin dynamic_hex = pc[3:0]; display_wen = 1; end
            261: begin dynamic_hex = inst[31:28]; display_wen = 1; end
            262: begin dynamic_hex = inst[27:24]; display_wen = 1; end
            263: begin dynamic_hex = inst[23:20]; display_wen = 1; end
            264: begin dynamic_hex = inst[19:16]; display_wen = 1; end
            265: begin dynamic_hex = inst[15:12]; display_wen = 1; end
            266: begin dynamic_hex = inst[11:8]; display_wen = 1; end
            267: begin dynamic_hex = inst[7:4]; display_wen = 1; end
            268: begin dynamic_hex = inst[3:0]; display_wen = 1; end
            404: begin dynamic_hex = IfId_pc[31:28]; display_wen = 1; end
            405: begin dynamic_hex = IfId_pc[27:24]; display_wen = 1; end
            406: begin dynamic_hex = IfId_pc[23:20]; display_wen = 1; end
            407: begin dynamic_hex = IfId_pc[19:16]; display_wen = 1; end
            408: begin dynamic_hex = IfId_pc[15:12]; display_wen = 1; end
            409: begin dynamic_hex = IfId_pc[11:8]; display_wen = 1; end
            410: begin dynamic_hex = IfId_pc[7:4]; display_wen = 1; end
            411: begin dynamic_hex = IfId_pc[3:0]; display_wen = 1; end
            421: begin dynamic_hex = IfId_inst[31:28]; display_wen = 1; end
            422: begin dynamic_hex = IfId_inst[27:24]; display_wen = 1; end
            423: begin dynamic_hex = IfId_inst[23:20]; display_wen = 1; end
            424: begin dynamic_hex = IfId_inst[19:16]; display_wen = 1; end
            425: begin dynamic_hex = IfId_inst[15:12]; display_wen = 1; end
            426: begin dynamic_hex = IfId_inst[11:8]; display_wen = 1; end
            427: begin dynamic_hex = IfId_inst[7:4]; display_wen = 1; end
            428: begin dynamic_hex = IfId_inst[3:0]; display_wen = 1; end
            439: begin dynamic_hex = IfId_valid; display_wen = 1; end
            1124: begin dynamic_hex = IdEx_pc[31:28]; display_wen = 1; end
            1125: begin dynamic_hex = IdEx_pc[27:24]; display_wen = 1; end
            1126: begin dynamic_hex = IdEx_pc[23:20]; display_wen = 1; end
            1127: begin dynamic_hex = IdEx_pc[19:16]; display_wen = 1; end
            1128: begin dynamic_hex = IdEx_pc[15:12]; display_wen = 1; end
            1129: begin dynamic_hex = IdEx_pc[11:8]; display_wen = 1; end
            1130: begin dynamic_hex = IdEx_pc[7:4]; display_wen = 1; end
            1131: begin dynamic_hex = IdEx_pc[3:0]; display_wen = 1; end
            1141: begin dynamic_hex = IdEx_inst[31:28]; display_wen = 1; end
            1142: begin dynamic_hex = IdEx_inst[27:24]; display_wen = 1; end
            1143: begin dynamic_hex = IdEx_inst[23:20]; display_wen = 1; end
            1144: begin dynamic_hex = IdEx_inst[19:16]; display_wen = 1; end
            1145: begin dynamic_hex = IdEx_inst[15:12]; display_wen = 1; end
            1146: begin dynamic_hex = IdEx_inst[11:8]; display_wen = 1; end
            1147: begin dynamic_hex = IdEx_inst[7:4]; display_wen = 1; end
            1148: begin dynamic_hex = IdEx_inst[3:0]; display_wen = 1; end
            1159: begin dynamic_hex = IdEx_valid; display_wen = 1; end
            1204: begin dynamic_hex = IdEx_rd[4:4]; display_wen = 1; end
            1205: begin dynamic_hex = IdEx_rd[3:0]; display_wen = 1; end
            1214: begin dynamic_hex = IdEx_rs1[4:4]; display_wen = 1; end
            1215: begin dynamic_hex = IdEx_rs1[3:0]; display_wen = 1; end
            1224: begin dynamic_hex = IdEx_rs2[4:4]; display_wen = 1; end
            1225: begin dynamic_hex = IdEx_rs2[3:0]; display_wen = 1; end
            1238: begin dynamic_hex = IdEx_rs1_val[31:28]; display_wen = 1; end
            1239: begin dynamic_hex = IdEx_rs1_val[27:24]; display_wen = 1; end
            1240: begin dynamic_hex = IdEx_rs1_val[23:20]; display_wen = 1; end
            1241: begin dynamic_hex = IdEx_rs1_val[19:16]; display_wen = 1; end
            1242: begin dynamic_hex = IdEx_rs1_val[15:12]; display_wen = 1; end
            1243: begin dynamic_hex = IdEx_rs1_val[11:8]; display_wen = 1; end
            1244: begin dynamic_hex = IdEx_rs1_val[7:4]; display_wen = 1; end
            1245: begin dynamic_hex = IdEx_rs1_val[3:0]; display_wen = 1; end
            1258: begin dynamic_hex = IdEx_rs2_val[31:28]; display_wen = 1; end
            1259: begin dynamic_hex = IdEx_rs2_val[27:24]; display_wen = 1; end
            1260: begin dynamic_hex = IdEx_rs2_val[23:20]; display_wen = 1; end
            1261: begin dynamic_hex = IdEx_rs2_val[19:16]; display_wen = 1; end
            1262: begin dynamic_hex = IdEx_rs2_val[15:12]; display_wen = 1; end
            1263: begin dynamic_hex = IdEx_rs2_val[11:8]; display_wen = 1; end
            1264: begin dynamic_hex = IdEx_rs2_val[7:4]; display_wen = 1; end
            1265: begin dynamic_hex = IdEx_rs2_val[3:0]; display_wen = 1; end
            1278: begin dynamic_hex = IdEx_reg_wen; display_wen = 1; end
            1288: begin dynamic_hex = IdEx_is_imm; display_wen = 1; end
            1297: begin dynamic_hex = IdEx_imm[31:28]; display_wen = 1; end
            1298: begin dynamic_hex = IdEx_imm[27:24]; display_wen = 1; end
            1299: begin dynamic_hex = IdEx_imm[23:20]; display_wen = 1; end
            1300: begin dynamic_hex = IdEx_imm[19:16]; display_wen = 1; end
            1301: begin dynamic_hex = IdEx_imm[15:12]; display_wen = 1; end
            1302: begin dynamic_hex = IdEx_imm[11:8]; display_wen = 1; end
            1303: begin dynamic_hex = IdEx_imm[7:4]; display_wen = 1; end
            1304: begin dynamic_hex = IdEx_imm[3:0]; display_wen = 1; end
            1369: begin dynamic_hex = IdEx_mem_wen; display_wen = 1; end
            1382: begin dynamic_hex = IdEx_mem_ren; display_wen = 1; end
            1397: begin dynamic_hex = IdEx_is_branch; display_wen = 1; end
            1409: begin dynamic_hex = IdEx_is_jal; display_wen = 1; end
            1422: begin dynamic_hex = IdEx_is_jalr; display_wen = 1; end
            1450: begin dynamic_hex = IdEx_is_auipc; display_wen = 1; end
            1462: begin dynamic_hex = IdEx_is_lui; display_wen = 1; end
            1476: begin dynamic_hex = IdEx_alu_ctrl[3:0]; display_wen = 1; end
            1490: begin dynamic_hex = IdEx_cmp_ctrl[2:0]; display_wen = 1; end
            1604: begin dynamic_hex = ExMa_pc[31:28]; display_wen = 1; end
            1605: begin dynamic_hex = ExMa_pc[27:24]; display_wen = 1; end
            1606: begin dynamic_hex = ExMa_pc[23:20]; display_wen = 1; end
            1607: begin dynamic_hex = ExMa_pc[19:16]; display_wen = 1; end
            1608: begin dynamic_hex = ExMa_pc[15:12]; display_wen = 1; end
            1609: begin dynamic_hex = ExMa_pc[11:8]; display_wen = 1; end
            1610: begin dynamic_hex = ExMa_pc[7:4]; display_wen = 1; end
            1611: begin dynamic_hex = ExMa_pc[3:0]; display_wen = 1; end
            1621: begin dynamic_hex = ExMa_inst[31:28]; display_wen = 1; end
            1622: begin dynamic_hex = ExMa_inst[27:24]; display_wen = 1; end
            1623: begin dynamic_hex = ExMa_inst[23:20]; display_wen = 1; end
            1624: begin dynamic_hex = ExMa_inst[19:16]; display_wen = 1; end
            1625: begin dynamic_hex = ExMa_inst[15:12]; display_wen = 1; end
            1626: begin dynamic_hex = ExMa_inst[11:8]; display_wen = 1; end
            1627: begin dynamic_hex = ExMa_inst[7:4]; display_wen = 1; end
            1628: begin dynamic_hex = ExMa_inst[3:0]; display_wen = 1; end
            1639: begin dynamic_hex = ExMa_valid; display_wen = 1; end
            1684: begin dynamic_hex = ExMa_rd[4:4]; display_wen = 1; end
            1685: begin dynamic_hex = ExMa_rd[3:0]; display_wen = 1; end
            1698: begin dynamic_hex = ExMa_reg_wen; display_wen = 1; end
            1714: begin dynamic_hex = ExMa_mem_w_data[31:28]; display_wen = 1; end
            1715: begin dynamic_hex = ExMa_mem_w_data[27:24]; display_wen = 1; end
            1716: begin dynamic_hex = ExMa_mem_w_data[23:20]; display_wen = 1; end
            1717: begin dynamic_hex = ExMa_mem_w_data[19:16]; display_wen = 1; end
            1718: begin dynamic_hex = ExMa_mem_w_data[15:12]; display_wen = 1; end
            1719: begin dynamic_hex = ExMa_mem_w_data[11:8]; display_wen = 1; end
            1720: begin dynamic_hex = ExMa_mem_w_data[7:4]; display_wen = 1; end
            1721: begin dynamic_hex = ExMa_mem_w_data[3:0]; display_wen = 1; end
            1734: begin dynamic_hex = ExMa_alu_res[31:28]; display_wen = 1; end
            1735: begin dynamic_hex = ExMa_alu_res[27:24]; display_wen = 1; end
            1736: begin dynamic_hex = ExMa_alu_res[23:20]; display_wen = 1; end
            1737: begin dynamic_hex = ExMa_alu_res[19:16]; display_wen = 1; end
            1738: begin dynamic_hex = ExMa_alu_res[15:12]; display_wen = 1; end
            1739: begin dynamic_hex = ExMa_alu_res[11:8]; display_wen = 1; end
            1740: begin dynamic_hex = ExMa_alu_res[7:4]; display_wen = 1; end
            1741: begin dynamic_hex = ExMa_alu_res[3:0]; display_wen = 1; end
            1769: begin dynamic_hex = ExMa_mem_wen; display_wen = 1; end
            1782: begin dynamic_hex = ExMa_mem_ren; display_wen = 1; end
            1794: begin dynamic_hex = ExMa_is_jal; display_wen = 1; end
            1807: begin dynamic_hex = ExMa_is_jalr; display_wen = 1; end
            1924: begin dynamic_hex = MaWb_pc[31:28]; display_wen = 1; end
            1925: begin dynamic_hex = MaWb_pc[27:24]; display_wen = 1; end
            1926: begin dynamic_hex = MaWb_pc[23:20]; display_wen = 1; end
            1927: begin dynamic_hex = MaWb_pc[19:16]; display_wen = 1; end
            1928: begin dynamic_hex = MaWb_pc[15:12]; display_wen = 1; end
            1929: begin dynamic_hex = MaWb_pc[11:8]; display_wen = 1; end
            1930: begin dynamic_hex = MaWb_pc[7:4]; display_wen = 1; end
            1931: begin dynamic_hex = MaWb_pc[3:0]; display_wen = 1; end
            1941: begin dynamic_hex = MaWb_inst[31:28]; display_wen = 1; end
            1942: begin dynamic_hex = MaWb_inst[27:24]; display_wen = 1; end
            1943: begin dynamic_hex = MaWb_inst[23:20]; display_wen = 1; end
            1944: begin dynamic_hex = MaWb_inst[19:16]; display_wen = 1; end
            1945: begin dynamic_hex = MaWb_inst[15:12]; display_wen = 1; end
            1946: begin dynamic_hex = MaWb_inst[11:8]; display_wen = 1; end
            1947: begin dynamic_hex = MaWb_inst[7:4]; display_wen = 1; end
            1948: begin dynamic_hex = MaWb_inst[3:0]; display_wen = 1; end
            1959: begin dynamic_hex = MaWb_valid; display_wen = 1; end
            2004: begin dynamic_hex = MaWb_rd[4:4]; display_wen = 1; end
            2005: begin dynamic_hex = MaWb_rd[3:0]; display_wen = 1; end
            2018: begin dynamic_hex = MaWb_reg_wen; display_wen = 1; end
            2034: begin dynamic_hex = MaWb_reg_w_data[31:28]; display_wen = 1; end
            2035: begin dynamic_hex = MaWb_reg_w_data[27:24]; display_wen = 1; end
            2036: begin dynamic_hex = MaWb_reg_w_data[23:20]; display_wen = 1; end
            2037: begin dynamic_hex = MaWb_reg_w_data[19:16]; display_wen = 1; end
            2038: begin dynamic_hex = MaWb_reg_w_data[15:12]; display_wen = 1; end
            2039: begin dynamic_hex = MaWb_reg_w_data[11:8]; display_wen = 1; end
            2040: begin dynamic_hex = MaWb_reg_w_data[7:4]; display_wen = 1; end
            2041: begin dynamic_hex = MaWb_reg_w_data[3:0]; display_wen = 1; end
            484: begin dynamic_hex = x0[31:28]; display_wen = 1; end
            485: begin dynamic_hex = x0[27:24]; display_wen = 1; end
            486: begin dynamic_hex = x0[23:20]; display_wen = 1; end
            487: begin dynamic_hex = x0[19:16]; display_wen = 1; end
            488: begin dynamic_hex = x0[15:12]; display_wen = 1; end
            489: begin dynamic_hex = x0[11:8]; display_wen = 1; end
            490: begin dynamic_hex = x0[7:4]; display_wen = 1; end
            491: begin dynamic_hex = x0[3:0]; display_wen = 1; end
            499: begin dynamic_hex = ra[31:28]; display_wen = 1; end
            500: begin dynamic_hex = ra[27:24]; display_wen = 1; end
            501: begin dynamic_hex = ra[23:20]; display_wen = 1; end
            502: begin dynamic_hex = ra[19:16]; display_wen = 1; end
            503: begin dynamic_hex = ra[15:12]; display_wen = 1; end
            504: begin dynamic_hex = ra[11:8]; display_wen = 1; end
            505: begin dynamic_hex = ra[7:4]; display_wen = 1; end
            506: begin dynamic_hex = ra[3:0]; display_wen = 1; end
            514: begin dynamic_hex = sp[31:28]; display_wen = 1; end
            515: begin dynamic_hex = sp[27:24]; display_wen = 1; end
            516: begin dynamic_hex = sp[23:20]; display_wen = 1; end
            517: begin dynamic_hex = sp[19:16]; display_wen = 1; end
            518: begin dynamic_hex = sp[15:12]; display_wen = 1; end
            519: begin dynamic_hex = sp[11:8]; display_wen = 1; end
            520: begin dynamic_hex = sp[7:4]; display_wen = 1; end
            521: begin dynamic_hex = sp[3:0]; display_wen = 1; end
            529: begin dynamic_hex = gp[31:28]; display_wen = 1; end
            530: begin dynamic_hex = gp[27:24]; display_wen = 1; end
            531: begin dynamic_hex = gp[23:20]; display_wen = 1; end
            532: begin dynamic_hex = gp[19:16]; display_wen = 1; end
            533: begin dynamic_hex = gp[15:12]; display_wen = 1; end
            534: begin dynamic_hex = gp[11:8]; display_wen = 1; end
            535: begin dynamic_hex = gp[7:4]; display_wen = 1; end
            536: begin dynamic_hex = gp[3:0]; display_wen = 1; end
            544: begin dynamic_hex = tp[31:28]; display_wen = 1; end
            545: begin dynamic_hex = tp[27:24]; display_wen = 1; end
            546: begin dynamic_hex = tp[23:20]; display_wen = 1; end
            547: begin dynamic_hex = tp[19:16]; display_wen = 1; end
            548: begin dynamic_hex = tp[15:12]; display_wen = 1; end
            549: begin dynamic_hex = tp[11:8]; display_wen = 1; end
            550: begin dynamic_hex = tp[7:4]; display_wen = 1; end
            551: begin dynamic_hex = tp[3:0]; display_wen = 1; end
            564: begin dynamic_hex = t0[31:28]; display_wen = 1; end
            565: begin dynamic_hex = t0[27:24]; display_wen = 1; end
            566: begin dynamic_hex = t0[23:20]; display_wen = 1; end
            567: begin dynamic_hex = t0[19:16]; display_wen = 1; end
            568: begin dynamic_hex = t0[15:12]; display_wen = 1; end
            569: begin dynamic_hex = t0[11:8]; display_wen = 1; end
            570: begin dynamic_hex = t0[7:4]; display_wen = 1; end
            571: begin dynamic_hex = t0[3:0]; display_wen = 1; end
            579: begin dynamic_hex = t1[31:28]; display_wen = 1; end
            580: begin dynamic_hex = t1[27:24]; display_wen = 1; end
            581: begin dynamic_hex = t1[23:20]; display_wen = 1; end
            582: begin dynamic_hex = t1[19:16]; display_wen = 1; end
            583: begin dynamic_hex = t1[15:12]; display_wen = 1; end
            584: begin dynamic_hex = t1[11:8]; display_wen = 1; end
            585: begin dynamic_hex = t1[7:4]; display_wen = 1; end
            586: begin dynamic_hex = t1[3:0]; display_wen = 1; end
            594: begin dynamic_hex = t2[31:28]; display_wen = 1; end
            595: begin dynamic_hex = t2[27:24]; display_wen = 1; end
            596: begin dynamic_hex = t2[23:20]; display_wen = 1; end
            597: begin dynamic_hex = t2[19:16]; display_wen = 1; end
            598: begin dynamic_hex = t2[15:12]; display_wen = 1; end
            599: begin dynamic_hex = t2[11:8]; display_wen = 1; end
            600: begin dynamic_hex = t2[7:4]; display_wen = 1; end
            601: begin dynamic_hex = t2[3:0]; display_wen = 1; end
            609: begin dynamic_hex = s0[31:28]; display_wen = 1; end
            610: begin dynamic_hex = s0[27:24]; display_wen = 1; end
            611: begin dynamic_hex = s0[23:20]; display_wen = 1; end
            612: begin dynamic_hex = s0[19:16]; display_wen = 1; end
            613: begin dynamic_hex = s0[15:12]; display_wen = 1; end
            614: begin dynamic_hex = s0[11:8]; display_wen = 1; end
            615: begin dynamic_hex = s0[7:4]; display_wen = 1; end
            616: begin dynamic_hex = s0[3:0]; display_wen = 1; end
            624: begin dynamic_hex = s1[31:28]; display_wen = 1; end
            625: begin dynamic_hex = s1[27:24]; display_wen = 1; end
            626: begin dynamic_hex = s1[23:20]; display_wen = 1; end
            627: begin dynamic_hex = s1[19:16]; display_wen = 1; end
            628: begin dynamic_hex = s1[15:12]; display_wen = 1; end
            629: begin dynamic_hex = s1[11:8]; display_wen = 1; end
            630: begin dynamic_hex = s1[7:4]; display_wen = 1; end
            631: begin dynamic_hex = s1[3:0]; display_wen = 1; end
            644: begin dynamic_hex = a0[31:28]; display_wen = 1; end
            645: begin dynamic_hex = a0[27:24]; display_wen = 1; end
            646: begin dynamic_hex = a0[23:20]; display_wen = 1; end
            647: begin dynamic_hex = a0[19:16]; display_wen = 1; end
            648: begin dynamic_hex = a0[15:12]; display_wen = 1; end
            649: begin dynamic_hex = a0[11:8]; display_wen = 1; end
            650: begin dynamic_hex = a0[7:4]; display_wen = 1; end
            651: begin dynamic_hex = a0[3:0]; display_wen = 1; end
            659: begin dynamic_hex = a1[31:28]; display_wen = 1; end
            660: begin dynamic_hex = a1[27:24]; display_wen = 1; end
            661: begin dynamic_hex = a1[23:20]; display_wen = 1; end
            662: begin dynamic_hex = a1[19:16]; display_wen = 1; end
            663: begin dynamic_hex = a1[15:12]; display_wen = 1; end
            664: begin dynamic_hex = a1[11:8]; display_wen = 1; end
            665: begin dynamic_hex = a1[7:4]; display_wen = 1; end
            666: begin dynamic_hex = a1[3:0]; display_wen = 1; end
            674: begin dynamic_hex = a2[31:28]; display_wen = 1; end
            675: begin dynamic_hex = a2[27:24]; display_wen = 1; end
            676: begin dynamic_hex = a2[23:20]; display_wen = 1; end
            677: begin dynamic_hex = a2[19:16]; display_wen = 1; end
            678: begin dynamic_hex = a2[15:12]; display_wen = 1; end
            679: begin dynamic_hex = a2[11:8]; display_wen = 1; end
            680: begin dynamic_hex = a2[7:4]; display_wen = 1; end
            681: begin dynamic_hex = a2[3:0]; display_wen = 1; end
            689: begin dynamic_hex = a3[31:28]; display_wen = 1; end
            690: begin dynamic_hex = a3[27:24]; display_wen = 1; end
            691: begin dynamic_hex = a3[23:20]; display_wen = 1; end
            692: begin dynamic_hex = a3[19:16]; display_wen = 1; end
            693: begin dynamic_hex = a3[15:12]; display_wen = 1; end
            694: begin dynamic_hex = a3[11:8]; display_wen = 1; end
            695: begin dynamic_hex = a3[7:4]; display_wen = 1; end
            696: begin dynamic_hex = a3[3:0]; display_wen = 1; end
            704: begin dynamic_hex = a4[31:28]; display_wen = 1; end
            705: begin dynamic_hex = a4[27:24]; display_wen = 1; end
            706: begin dynamic_hex = a4[23:20]; display_wen = 1; end
            707: begin dynamic_hex = a4[19:16]; display_wen = 1; end
            708: begin dynamic_hex = a4[15:12]; display_wen = 1; end
            709: begin dynamic_hex = a4[11:8]; display_wen = 1; end
            710: begin dynamic_hex = a4[7:4]; display_wen = 1; end
            711: begin dynamic_hex = a4[3:0]; display_wen = 1; end
            724: begin dynamic_hex = a5[31:28]; display_wen = 1; end
            725: begin dynamic_hex = a5[27:24]; display_wen = 1; end
            726: begin dynamic_hex = a5[23:20]; display_wen = 1; end
            727: begin dynamic_hex = a5[19:16]; display_wen = 1; end
            728: begin dynamic_hex = a5[15:12]; display_wen = 1; end
            729: begin dynamic_hex = a5[11:8]; display_wen = 1; end
            730: begin dynamic_hex = a5[7:4]; display_wen = 1; end
            731: begin dynamic_hex = a5[3:0]; display_wen = 1; end
            739: begin dynamic_hex = a6[31:28]; display_wen = 1; end
            740: begin dynamic_hex = a6[27:24]; display_wen = 1; end
            741: begin dynamic_hex = a6[23:20]; display_wen = 1; end
            742: begin dynamic_hex = a6[19:16]; display_wen = 1; end
            743: begin dynamic_hex = a6[15:12]; display_wen = 1; end
            744: begin dynamic_hex = a6[11:8]; display_wen = 1; end
            745: begin dynamic_hex = a6[7:4]; display_wen = 1; end
            746: begin dynamic_hex = a6[3:0]; display_wen = 1; end
            754: begin dynamic_hex = a7[31:28]; display_wen = 1; end
            755: begin dynamic_hex = a7[27:24]; display_wen = 1; end
            756: begin dynamic_hex = a7[23:20]; display_wen = 1; end
            757: begin dynamic_hex = a7[19:16]; display_wen = 1; end
            758: begin dynamic_hex = a7[15:12]; display_wen = 1; end
            759: begin dynamic_hex = a7[11:8]; display_wen = 1; end
            760: begin dynamic_hex = a7[7:4]; display_wen = 1; end
            761: begin dynamic_hex = a7[3:0]; display_wen = 1; end
            769: begin dynamic_hex = s2[31:28]; display_wen = 1; end
            770: begin dynamic_hex = s2[27:24]; display_wen = 1; end
            771: begin dynamic_hex = s2[23:20]; display_wen = 1; end
            772: begin dynamic_hex = s2[19:16]; display_wen = 1; end
            773: begin dynamic_hex = s2[15:12]; display_wen = 1; end
            774: begin dynamic_hex = s2[11:8]; display_wen = 1; end
            775: begin dynamic_hex = s2[7:4]; display_wen = 1; end
            776: begin dynamic_hex = s2[3:0]; display_wen = 1; end
            784: begin dynamic_hex = s3[31:28]; display_wen = 1; end
            785: begin dynamic_hex = s3[27:24]; display_wen = 1; end
            786: begin dynamic_hex = s3[23:20]; display_wen = 1; end
            787: begin dynamic_hex = s3[19:16]; display_wen = 1; end
            788: begin dynamic_hex = s3[15:12]; display_wen = 1; end
            789: begin dynamic_hex = s3[11:8]; display_wen = 1; end
            790: begin dynamic_hex = s3[7:4]; display_wen = 1; end
            791: begin dynamic_hex = s3[3:0]; display_wen = 1; end
            804: begin dynamic_hex = s4[31:28]; display_wen = 1; end
            805: begin dynamic_hex = s4[27:24]; display_wen = 1; end
            806: begin dynamic_hex = s4[23:20]; display_wen = 1; end
            807: begin dynamic_hex = s4[19:16]; display_wen = 1; end
            808: begin dynamic_hex = s4[15:12]; display_wen = 1; end
            809: begin dynamic_hex = s4[11:8]; display_wen = 1; end
            810: begin dynamic_hex = s4[7:4]; display_wen = 1; end
            811: begin dynamic_hex = s4[3:0]; display_wen = 1; end
            819: begin dynamic_hex = s5[31:28]; display_wen = 1; end
            820: begin dynamic_hex = s5[27:24]; display_wen = 1; end
            821: begin dynamic_hex = s5[23:20]; display_wen = 1; end
            822: begin dynamic_hex = s5[19:16]; display_wen = 1; end
            823: begin dynamic_hex = s5[15:12]; display_wen = 1; end
            824: begin dynamic_hex = s5[11:8]; display_wen = 1; end
            825: begin dynamic_hex = s5[7:4]; display_wen = 1; end
            826: begin dynamic_hex = s5[3:0]; display_wen = 1; end
            834: begin dynamic_hex = s6[31:28]; display_wen = 1; end
            835: begin dynamic_hex = s6[27:24]; display_wen = 1; end
            836: begin dynamic_hex = s6[23:20]; display_wen = 1; end
            837: begin dynamic_hex = s6[19:16]; display_wen = 1; end
            838: begin dynamic_hex = s6[15:12]; display_wen = 1; end
            839: begin dynamic_hex = s6[11:8]; display_wen = 1; end
            840: begin dynamic_hex = s6[7:4]; display_wen = 1; end
            841: begin dynamic_hex = s6[3:0]; display_wen = 1; end
            849: begin dynamic_hex = s7[31:28]; display_wen = 1; end
            850: begin dynamic_hex = s7[27:24]; display_wen = 1; end
            851: begin dynamic_hex = s7[23:20]; display_wen = 1; end
            852: begin dynamic_hex = s7[19:16]; display_wen = 1; end
            853: begin dynamic_hex = s7[15:12]; display_wen = 1; end
            854: begin dynamic_hex = s7[11:8]; display_wen = 1; end
            855: begin dynamic_hex = s7[7:4]; display_wen = 1; end
            856: begin dynamic_hex = s7[3:0]; display_wen = 1; end
            864: begin dynamic_hex = s8[31:28]; display_wen = 1; end
            865: begin dynamic_hex = s8[27:24]; display_wen = 1; end
            866: begin dynamic_hex = s8[23:20]; display_wen = 1; end
            867: begin dynamic_hex = s8[19:16]; display_wen = 1; end
            868: begin dynamic_hex = s8[15:12]; display_wen = 1; end
            869: begin dynamic_hex = s8[11:8]; display_wen = 1; end
            870: begin dynamic_hex = s8[7:4]; display_wen = 1; end
            871: begin dynamic_hex = s8[3:0]; display_wen = 1; end
            884: begin dynamic_hex = s9[31:28]; display_wen = 1; end
            885: begin dynamic_hex = s9[27:24]; display_wen = 1; end
            886: begin dynamic_hex = s9[23:20]; display_wen = 1; end
            887: begin dynamic_hex = s9[19:16]; display_wen = 1; end
            888: begin dynamic_hex = s9[15:12]; display_wen = 1; end
            889: begin dynamic_hex = s9[11:8]; display_wen = 1; end
            890: begin dynamic_hex = s9[7:4]; display_wen = 1; end
            891: begin dynamic_hex = s9[3:0]; display_wen = 1; end
            899: begin dynamic_hex = s10[31:28]; display_wen = 1; end
            900: begin dynamic_hex = s10[27:24]; display_wen = 1; end
            901: begin dynamic_hex = s10[23:20]; display_wen = 1; end
            902: begin dynamic_hex = s10[19:16]; display_wen = 1; end
            903: begin dynamic_hex = s10[15:12]; display_wen = 1; end
            904: begin dynamic_hex = s10[11:8]; display_wen = 1; end
            905: begin dynamic_hex = s10[7:4]; display_wen = 1; end
            906: begin dynamic_hex = s10[3:0]; display_wen = 1; end
            914: begin dynamic_hex = s11[31:28]; display_wen = 1; end
            915: begin dynamic_hex = s11[27:24]; display_wen = 1; end
            916: begin dynamic_hex = s11[23:20]; display_wen = 1; end
            917: begin dynamic_hex = s11[19:16]; display_wen = 1; end
            918: begin dynamic_hex = s11[15:12]; display_wen = 1; end
            919: begin dynamic_hex = s11[11:8]; display_wen = 1; end
            920: begin dynamic_hex = s11[7:4]; display_wen = 1; end
            921: begin dynamic_hex = s11[3:0]; display_wen = 1; end
            929: begin dynamic_hex = t3[31:28]; display_wen = 1; end
            930: begin dynamic_hex = t3[27:24]; display_wen = 1; end
            931: begin dynamic_hex = t3[23:20]; display_wen = 1; end
            932: begin dynamic_hex = t3[19:16]; display_wen = 1; end
            933: begin dynamic_hex = t3[15:12]; display_wen = 1; end
            934: begin dynamic_hex = t3[11:8]; display_wen = 1; end
            935: begin dynamic_hex = t3[7:4]; display_wen = 1; end
            936: begin dynamic_hex = t3[3:0]; display_wen = 1; end
            944: begin dynamic_hex = t4[31:28]; display_wen = 1; end
            945: begin dynamic_hex = t4[27:24]; display_wen = 1; end
            946: begin dynamic_hex = t4[23:20]; display_wen = 1; end
            947: begin dynamic_hex = t4[19:16]; display_wen = 1; end
            948: begin dynamic_hex = t4[15:12]; display_wen = 1; end
            949: begin dynamic_hex = t4[11:8]; display_wen = 1; end
            950: begin dynamic_hex = t4[7:4]; display_wen = 1; end
            951: begin dynamic_hex = t4[3:0]; display_wen = 1; end
            964: begin dynamic_hex = t5[31:28]; display_wen = 1; end
            965: begin dynamic_hex = t5[27:24]; display_wen = 1; end
            966: begin dynamic_hex = t5[23:20]; display_wen = 1; end
            967: begin dynamic_hex = t5[19:16]; display_wen = 1; end
            968: begin dynamic_hex = t5[15:12]; display_wen = 1; end
            969: begin dynamic_hex = t5[11:8]; display_wen = 1; end
            970: begin dynamic_hex = t5[7:4]; display_wen = 1; end
            971: begin dynamic_hex = t5[3:0]; display_wen = 1; end
            979: begin dynamic_hex = t6[31:28]; display_wen = 1; end
            980: begin dynamic_hex = t6[27:24]; display_wen = 1; end
            981: begin dynamic_hex = t6[23:20]; display_wen = 1; end
            982: begin dynamic_hex = t6[19:16]; display_wen = 1; end
            983: begin dynamic_hex = t6[15:12]; display_wen = 1; end
            984: begin dynamic_hex = t6[11:8]; display_wen = 1; end
            985: begin dynamic_hex = t6[7:4]; display_wen = 1; end
            986: begin dynamic_hex = t6[3:0]; display_wen = 1; end
            default: begin dynamic_hex = 0; display_wen = 0; end
        endcase
    end

endmodule
