module comparator_8bit (EQ,
    GT,
    LT,
    A,
    B);
 output EQ;
 output GT;
 output LT;
 input [7:0] A;
 input [7:0] B;

 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire _29_;
 wire _30_;
 wire _31_;
 wire _32_;
 wire _33_;
 wire _34_;
 wire _35_;

 INVx1_ASAP7_75t_R _36_ (.A(net14),
    .Y(_08_));
 NOR2x1_ASAP7_75t_R _37_ (.A(net6),
    .B(_08_),
    .Y(_09_));
 OR3x1_ASAP7_75t_R _38_ (.A(_15_),
    .B(_16_),
    .C(_17_),
    .Y(_18_));
 OR2x2_ASAP7_75t_R _39_ (.A(_14_),
    .B(_18_),
    .Y(_19_));
 INVx1_ASAP7_75t_R _40_ (.A(_19_),
    .Y(net17));
 INVx1_ASAP7_75t_R _41_ (.A(net16),
    .Y(_20_));
 AND2x2_ASAP7_75t_R _42_ (.A(net8),
    .B(_20_),
    .Y(_21_));
 INVx1_ASAP7_75t_R _43_ (.A(net13),
    .Y(_22_));
 OA211x2_ASAP7_75t_R _44_ (.A1(net6),
    .A2(_08_),
    .B(net5),
    .C(_22_),
    .Y(_23_));
 OA21x2_ASAP7_75t_R _45_ (.A1(_10_),
    .A2(_23_),
    .B(net7),
    .Y(_24_));
 INVx1_ASAP7_75t_R _46_ (.A(net15),
    .Y(_25_));
 OA31x2_ASAP7_75t_R _47_ (.A1(net7),
    .A2(_10_),
    .A3(_23_),
    .B1(_25_),
    .Y(_26_));
 AND2x2_ASAP7_75t_R _48_ (.A(net6),
    .B(_08_),
    .Y(_10_));
 OA22x2_ASAP7_75t_R _49_ (.A1(net8),
    .A2(_20_),
    .B1(_24_),
    .B2(_26_),
    .Y(_27_));
 INVx1_ASAP7_75t_R _50_ (.A(net1),
    .Y(_28_));
 INVx1_ASAP7_75t_R _51_ (.A(net2),
    .Y(_29_));
 AO221x2_ASAP7_75t_R _52_ (.A1(net9),
    .A2(_28_),
    .B1(net10),
    .B2(_29_),
    .C(_16_),
    .Y(_30_));
 INVx1_ASAP7_75t_R _53_ (.A(_01_),
    .Y(_31_));
 OR3x1_ASAP7_75t_R _54_ (.A(net10),
    .B(_29_),
    .C(_16_),
    .Y(_32_));
 OA211x2_ASAP7_75t_R _55_ (.A1(_31_),
    .A2(_06_),
    .B(_32_),
    .C(_04_),
    .Y(_33_));
 AOI21x1_ASAP7_75t_R _56_ (.A1(_30_),
    .A2(_33_),
    .B(_14_),
    .Y(_34_));
 NOR3x1_ASAP7_75t_R _57_ (.A(_21_),
    .B(_27_),
    .C(_34_),
    .Y(net19));
 OA31x2_ASAP7_75t_R _58_ (.A1(_21_),
    .A2(_27_),
    .A3(_34_),
    .B1(_19_),
    .Y(net18));
 XOR2x2_ASAP7_75t_R _59_ (.A(net15),
    .B(net7),
    .Y(_11_));
 INVx1_ASAP7_75t_R _60_ (.A(net12),
    .Y(_03_));
 INVx1_ASAP7_75t_R _61_ (.A(net11),
    .Y(_05_));
 INVx1_ASAP7_75t_R _62_ (.A(net4),
    .Y(_00_));
 XOR2x2_ASAP7_75t_R _63_ (.A(net5),
    .B(net13),
    .Y(_12_));
 XOR2x2_ASAP7_75t_R _64_ (.A(net8),
    .B(net16),
    .Y(_13_));
 OR5x1_ASAP7_75t_R _65_ (.A(_09_),
    .B(_10_),
    .C(_11_),
    .D(_12_),
    .E(_13_),
    .Y(_14_));
 XOR2x2_ASAP7_75t_R _66_ (.A(net9),
    .B(net1),
    .Y(_15_));
 OR2x2_ASAP7_75t_R _67_ (.A(_02_),
    .B(_07_),
    .Y(_16_));
 XOR2x2_ASAP7_75t_R _68_ (.A(net10),
    .B(net2),
    .Y(_17_));
 HAxp5_ASAP7_75t_R _69_ (.A(_00_),
    .B(net12),
    .CON(_01_),
    .SN(_02_));
 HAxp5_ASAP7_75t_R _70_ (.A(net4),
    .B(_03_),
    .CON(_04_),
    .SN(_35_));
 HAxp5_ASAP7_75t_R _71_ (.A(net3),
    .B(_05_),
    .CON(_06_),
    .SN(_07_));
 BUFx2_ASAP7_75t_R input1 (.A(A[0]),
    .Y(net1));
 BUFx2_ASAP7_75t_R input10 (.A(B[1]),
    .Y(net10));
 BUFx2_ASAP7_75t_R input11 (.A(B[2]),
    .Y(net11));
 BUFx2_ASAP7_75t_R input12 (.A(B[3]),
    .Y(net12));
 BUFx2_ASAP7_75t_R input13 (.A(B[4]),
    .Y(net13));
 BUFx2_ASAP7_75t_R input14 (.A(B[5]),
    .Y(net14));
 BUFx2_ASAP7_75t_R input15 (.A(B[6]),
    .Y(net15));
 BUFx2_ASAP7_75t_R input16 (.A(B[7]),
    .Y(net16));
 BUFx2_ASAP7_75t_R input2 (.A(A[1]),
    .Y(net2));
 BUFx2_ASAP7_75t_R input3 (.A(A[2]),
    .Y(net3));
 BUFx2_ASAP7_75t_R input4 (.A(A[3]),
    .Y(net4));
 BUFx2_ASAP7_75t_R input5 (.A(A[4]),
    .Y(net5));
 BUFx2_ASAP7_75t_R input6 (.A(A[5]),
    .Y(net6));
 BUFx2_ASAP7_75t_R input7 (.A(A[6]),
    .Y(net7));
 BUFx2_ASAP7_75t_R input8 (.A(A[7]),
    .Y(net8));
 BUFx2_ASAP7_75t_R input9 (.A(B[0]),
    .Y(net9));
 BUFx2_ASAP7_75t_R output17 (.A(net17),
    .Y(EQ));
 BUFx2_ASAP7_75t_R output18 (.A(net18),
    .Y(GT));
 BUFx2_ASAP7_75t_R output19 (.A(net19),
    .Y(LT));
endmodule
