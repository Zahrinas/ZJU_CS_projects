`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/02/20 15:22:25
// Design Name: 
// Module Name: MC14495_ZJU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MC14495_ZJU(D0, 
                   D1, 
                   D2, 
                   D3, 
                   LE, 
                   point, 
                   a, 
                   b, 
                   c, 
                   d, 
                   e, 
                   f, 
                   g, 
                   p);

    input D0;
    input D1;
    input D2;
    input D3;
    input LE;
    input point;
   output a;
   output b;
   output c;
   output d;
   output e;
   output f;
   output g;
   output p;
   
   wire XLXN_14;
   wire XLXN_24;
   wire XLXN_26;
   wire XLXN_27;
   wire XLXN_28;
   wire XLXN_61;
   wire XLXN_62;
   wire XLXN_72;
   wire XLXN_73;
   wire XLXN_74;
   wire XLXN_75;
   wire XLXN_111;
   wire XLXN_115;
   wire XLXN_119;
   wire XLXN_140;
   wire XLXN_141;
   wire XLXN_170;
   wire XLXN_171;
   wire XLXN_172;
   wire XLXN_184;
   wire XLXN_185;
   wire XLXN_186;
   wire XLXN_200;
   wire XLXN_201;
   wire XLXN_202;
   wire XLXN_208;
   wire XLXN_209;
   wire XLXN_210;
   wire XLXN_211;
   wire XLXN_212;
   wire XLXN_213;
   wire XLXN_214;
   
   INV  XLXI_1 (.I(D3), 
               .O(XLXN_14));
   INV  XLXI_2 (.I(D2), 
               .O(XLXN_61));
   INV  XLXI_3 (.I(D1), 
               .O(XLXN_62));
   INV  XLXI_4 (.I(D0), 
               .O(XLXN_24));
   AND4  XLXI_5 (.I0(D0), 
                .I1(XLXN_61), 
                .I2(XLXN_62), 
                .I3(XLXN_14), 
                .O(XLXN_119));
   AND4  XLXI_6 (.I0(XLXN_24), 
                .I1(XLXN_62), 
                .I2(D2), 
                .I3(XLXN_14), 
                .O(XLXN_26));
   AND4  XLXI_7 (.I0(D0), 
                .I1(XLXN_62), 
                .I2(D2), 
                .I3(D3), 
                .O(XLXN_27));
   AND4  XLXI_8 (.I0(D0), 
                .I1(D1), 
                .I2(XLXN_61), 
                .I3(D3), 
                .O(XLXN_28));
   OR4  XLXI_17 (.I0(XLXN_28), 
                .I1(XLXN_27), 
                .I2(XLXN_26), 
                .I3(XLXN_119), 
                .O(XLXN_208));
   AND4  XLXI_18 (.I0(D0), 
                 .I1(XLXN_62), 
                 .I2(D2), 
                 .I3(XLXN_14), 
                 .O(XLXN_72));
   AND3  XLXI_19 (.I0(XLXN_24), 
                 .I1(D1), 
                 .I2(D2), 
                 .O(XLXN_73));
   AND3  XLXI_20 (.I0(XLXN_24), 
                 .I1(D2), 
                 .I2(D3), 
                 .O(XLXN_74));
   AND3  XLXI_21 (.I0(D0), 
                 .I1(D1), 
                 .I2(D3), 
                 .O(XLXN_75));
   OR4  XLXI_22 (.I0(XLXN_75), 
                .I1(XLXN_74), 
                .I2(XLXN_73), 
                .I3(XLXN_72), 
                .O(XLXN_209));
   AND4  XLXI_23 (.I0(XLXN_24), 
                 .I1(D1), 
                 .I2(XLXN_61), 
                 .I3(XLXN_14), 
                 .O(XLXN_111));
   AND3  XLXI_24 (.I0(D1), 
                 .I1(D2), 
                 .I2(D3), 
                 .O(XLXN_115));
   OR3  XLXI_26 (.I0(XLXN_115), 
                .I1(XLXN_111), 
                .I2(XLXN_74), 
                .O(XLXN_210));
   AND3  XLXI_27 (.I0(D0), 
                 .I1(D1), 
                 .I2(D2), 
                 .O(XLXN_140));
   AND4  XLXI_28 (.I0(XLXN_24), 
                 .I1(D1), 
                 .I2(XLXN_61), 
                 .I3(D3), 
                 .O(XLXN_141));
   OR4  XLXI_29 (.I0(XLXN_141), 
                .I1(XLXN_140), 
                .I2(XLXN_26), 
                .I3(XLXN_119), 
                .O(XLXN_211));
   AND3  XLXI_30 (.I0(XLXN_62), 
                 .I1(D2), 
                 .I2(XLXN_14), 
                 .O(XLXN_171));
   AND2  XLXI_32 (.I0(D0), 
                 .I1(XLXN_14), 
                 .O(XLXN_170));
   AND3  XLXI_35 (.I0(D0), 
                 .I1(XLXN_62), 
                 .I2(XLXN_61), 
                 .O(XLXN_172));
   OR3  XLXI_36 (.I0(XLXN_172), 
                .I1(XLXN_171), 
                .I2(XLXN_170), 
                .O(XLXN_212));
   AND3  XLXI_37 (.I0(D0), 
                 .I1(XLXN_61), 
                 .I2(XLXN_14), 
                 .O(XLXN_184));
   AND3  XLXI_38 (.I0(D1), 
                 .I1(XLXN_61), 
                 .I2(XLXN_14), 
                 .O(XLXN_185));
   AND3  XLXI_39 (.I0(D0), 
                 .I1(D1), 
                 .I2(XLXN_14), 
                 .O(XLXN_186));
   OR4  XLXI_41 (.I0(XLXN_186), 
                .I1(XLXN_185), 
                .I2(XLXN_184), 
                .I3(XLXN_27), 
                .O(XLXN_213));
   AND3  XLXI_42 (.I0(XLXN_62), 
                 .I1(XLXN_61), 
                 .I2(XLXN_14), 
                 .O(XLXN_200));
   AND4  XLXI_43 (.I0(D0), 
                 .I1(D1), 
                 .I2(D2), 
                 .I3(XLXN_14), 
                 .O(XLXN_201));
   AND4  XLXI_44 (.I0(XLXN_24), 
                 .I1(XLXN_62), 
                 .I2(D2), 
                 .I3(D3), 
                 .O(XLXN_202));
   OR3  XLXI_46 (.I0(XLXN_202), 
                .I1(XLXN_201), 
                .I2(XLXN_200), 
                .O(XLXN_214));
   OR2  XLXI_47 (.I0(LE), 
                .I1(XLXN_208), 
                .O(a));
   OR2  XLXI_48 (.I0(LE), 
                .I1(XLXN_209), 
                .O(b));
   OR2  XLXI_49 (.I0(LE), 
                .I1(XLXN_210), 
                .O(c));
   OR2  XLXI_50 (.I0(LE), 
                .I1(XLXN_211), 
                .O(d));
   OR2  XLXI_51 (.I0(LE), 
                .I1(XLXN_212), 
                .O(e));
   OR2  XLXI_52 (.I0(LE), 
                .I1(XLXN_213), 
                .O(f));
   OR2  XLXI_53 (.I0(LE), 
                .I1(XLXN_214), 
                .O(g));
   INV  XLXI_57 (.I(point), 
                .O(p));
endmodule

