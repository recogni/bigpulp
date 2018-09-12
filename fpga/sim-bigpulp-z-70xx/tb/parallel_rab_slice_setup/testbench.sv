time clk_period = 10ns;    // clock generated by ARM

task tb_wait(input int cycles);
   #(clk_period*cycles);
endtask

module testbench;

  timeunit      1ps;
  timeprecision 1ps;

  logic FCLK_CLK0;      // input
  logic FCLK_RESET0_N;  // input
  logic FCLK_RESET1_N;  // input

  logic [31:0] m_axi_sim_araddr  ;
  logic [1:0]  m_axi_sim_arburst ;
  logic [3:0]  m_axi_sim_arcache ;
  logic [5:0]  m_axi_sim_arid    ;
  logic [3:0]  m_axi_sim_arlen   ;
  logic [1:0]  m_axi_sim_arlock  ;
  logic [2:0]  m_axi_sim_arprot  ;
  logic [3:0]  m_axi_sim_arqos   ;
  logic        m_axi_sim_arready ;
  logic [2:0]  m_axi_sim_arsize  ;
  logic [5:0]  m_axi_sim_aruser  ;
  logic        m_axi_sim_arvalid ;
  logic [31:0] m_axi_sim_awaddr  ;
  logic [1:0]  m_axi_sim_awburst ;
  logic [3:0]  m_axi_sim_awcache ;
  logic [5:0]  m_axi_sim_awid    ;
  logic [3:0]  m_axi_sim_awlen   ;
  logic [1:0]  m_axi_sim_awlock  ;
  logic [2:0]  m_axi_sim_awprot  ;
  logic [3:0]  m_axi_sim_awqos   ;
  logic        m_axi_sim_awready ;
  logic [2:0]  m_axi_sim_awsize  ;
  logic [5:0]  m_axi_sim_awuser  ;
  logic        m_axi_sim_awvalid ;
  logic [5:0]  m_axi_sim_bid     ;
  logic        m_axi_sim_bready  ;
  logic [1:0]  m_axi_sim_bresp   ;
  logic [5:0]  m_axi_sim_buser   ;
  logic        m_axi_sim_bvalid  ;
  logic [31:0] m_axi_sim_rdata   ;
  logic [5:0]  m_axi_sim_rid     ;
  logic        m_axi_sim_rlast   ;
  logic        m_axi_sim_rready  ;
  logic [1:0]  m_axi_sim_rresp   ;
  logic [5:0]  m_axi_sim_ruser   ;
  logic        m_axi_sim_rvalid  ;
  logic [31:0] m_axi_sim_wdata   ;
  logic [5:0]  m_axi_sim_wid     ;
  logic        m_axi_sim_wlast   ;
  logic        m_axi_sim_wready  ;
  logic [3:0]  m_axi_sim_wstrb   ;
  logic [5:0]  m_axi_sim_wuser   ;
  logic        m_axi_sim_wvalid  ;

  logic        pulp2host_intr;

  // bigPULP SoC
  bigpulp_z_70xx_top DUT (
    .FCLK_CLK0            ( FCLK_CLK0            ),
    .FCLK_RESET0_N        ( FCLK_RESET0_N        ),
    .FCLK_RESET1_N        ( FCLK_RESET1_N        ),

    .m_axi_sim_araddr     ( m_axi_sim_araddr     ),
    .m_axi_sim_arburst    ( m_axi_sim_arburst    ),
    .m_axi_sim_arcache    ( m_axi_sim_arcache    ),
    .m_axi_sim_arid       ( m_axi_sim_arid       ),
    .m_axi_sim_arlen      ( m_axi_sim_arlen      ),
    .m_axi_sim_arlock     ( m_axi_sim_arlock     ),
    .m_axi_sim_arprot     ( m_axi_sim_arprot     ),
    .m_axi_sim_arqos      ( m_axi_sim_arqos      ),
    .m_axi_sim_arready    ( m_axi_sim_arready    ),
    .m_axi_sim_arsize     ( m_axi_sim_arsize     ),
    .m_axi_sim_arvalid    ( m_axi_sim_arvalid    ),
    .m_axi_sim_awaddr     ( m_axi_sim_awaddr     ),
    .m_axi_sim_awburst    ( m_axi_sim_awburst    ),
    .m_axi_sim_awcache    ( m_axi_sim_awcache    ),
    .m_axi_sim_awid       ( m_axi_sim_awid       ),
    .m_axi_sim_awlen      ( m_axi_sim_awlen      ),
    .m_axi_sim_awlock     ( m_axi_sim_awlock     ),
    .m_axi_sim_awprot     ( m_axi_sim_awprot     ),
    .m_axi_sim_awqos      ( m_axi_sim_awqos      ),
    .m_axi_sim_awready    ( m_axi_sim_awready    ),
    .m_axi_sim_awsize     ( m_axi_sim_awsize     ),
    .m_axi_sim_awvalid    ( m_axi_sim_awvalid    ),
    .m_axi_sim_bid        ( m_axi_sim_bid        ),
    .m_axi_sim_bready     ( m_axi_sim_bready     ),
    .m_axi_sim_bresp      ( m_axi_sim_bresp      ),
    .m_axi_sim_bvalid     ( m_axi_sim_bvalid     ),
    .m_axi_sim_rdata      ( m_axi_sim_rdata      ),
    .m_axi_sim_rid        ( m_axi_sim_rid        ),
    .m_axi_sim_rlast      ( m_axi_sim_rlast      ),
    .m_axi_sim_rready     ( m_axi_sim_rready     ),
    .m_axi_sim_rresp      ( m_axi_sim_rresp      ),
    .m_axi_sim_rvalid     ( m_axi_sim_rvalid     ),
    .m_axi_sim_wdata      ( m_axi_sim_wdata      ),
    .m_axi_sim_wid        ( m_axi_sim_wid        ),
    .m_axi_sim_wlast      ( m_axi_sim_wlast      ),
    .m_axi_sim_wready     ( m_axi_sim_wready     ),
    .m_axi_sim_wstrb      ( m_axi_sim_wstrb      ),
    .m_axi_sim_wvalid     ( m_axi_sim_wvalid     ),

    .pulp2host_intr_o     ( pulp2host_intr       ),

    .uart_tx              (                      ),
    .uart_rx              ( 1'b1                 )
  );

   ///////////////////////////
   //
   // axi4lite verification ip
   //
   ///////////////////////////
   axi4lite_m_if axi_m_if_0(FCLK_CLK0);

   // Master write address channel
   assign m_axi_sim_awaddr   = axi_m_if_0.awaddr ;
   assign m_axi_sim_awvalid  = axi_m_if_0.awvalid;
   assign axi_m_if_0.awready = m_axi_sim_awready ;
   // Master write data channel
   assign m_axi_sim_wdata    = axi_m_if_0.wdata  ;
   assign m_axi_sim_wstrb    = axi_m_if_0.wstrb  ;
   assign m_axi_sim_wvalid   = axi_m_if_0.wvalid ;
   assign axi_m_if_0.wready  = m_axi_sim_wready  ;
   // Master write response channel
   assign axi_m_if_0.bresp   = m_axi_sim_bresp   ;
   assign axi_m_if_0.bvalid  = m_axi_sim_bvalid  ;
   assign m_axi_sim_bready   = axi_m_if_0.bready ;
   // Master read address channel
   assign m_axi_sim_araddr   = axi_m_if_0.araddr ;
   assign m_axi_sim_arvalid  = axi_m_if_0.arvalid;
   assign axi_m_if_0.arready = m_axi_sim_arready ;
   // Master read data channel
   assign axi_m_if_0.rdata   = m_axi_sim_rdata   ;
   assign axi_m_if_0.rresp   = m_axi_sim_rresp   ;
   assign axi_m_if_0.rvalid  = m_axi_sim_rvalid  ;
   assign m_axi_sim_rready   = axi_m_if_0.rready ;

   // Master write address channel
   assign m_axi_sim_awid    = 6'h00;
   assign m_axi_sim_awlen   = 4'b0000; // 1 beat
   assign m_axi_sim_awsize  = 3'b010;  // 4 bytes
   assign m_axi_sim_awburst = 2'b00;   // fixed
   assign m_axi_sim_awlock  = 2'b00;   // normal
   assign m_axi_sim_awcache = 4'b0010; // normal non-cacheable non-bufferable
   assign m_axi_sim_awprot  = 3'b010;  // unpriviledged, non-secure, data
   assign m_axi_sim_awqos   = 4'h0;    // no QoS scheme, actually not supported in AXI3
   assign m_axi_sim_awuser  = 6'h00;
   // Master write data channel
   assign m_axi_sim_wid     = 6'h00;
   assign m_axi_sim_wlast   = 1'b1;
   assign m_axi_sim_wuser   = 6'h00;
   // Master write response channel
   //m_axi_sim_bid
   //m_axi_sim_buser
   // Master read address channel
   assign m_axi_sim_arid    = 6'h00;
   assign m_axi_sim_arlen   = 4'b0000; // 1 beat
   assign m_axi_sim_arsize  = 3'b010;  // 4 bytes
   assign m_axi_sim_arburst = 2'b00;   // fixed
   assign m_axi_sim_arlock  = 2'b00;   // normal
   assign m_axi_sim_arcache = 4'b0010; // normal non-cacheable non-bufferable
   assign m_axi_sim_arprot  = 3'b010;  // unpriviledged, non-secure, data
   assign m_axi_sim_arqos   = 4'h0;    // no QoS scheme, actually not supported in AXI3
   assign m_axi_sim_aruser  = 6'h00;
   // Master read data channel
   //m_axi_sim_rid
   //m_axi_sim_rlast
   //m_axi_sim_ruser

   import AXI4LITE_M::*;
   typedef bit [7:0] bit8;

   task DataPack(input int data, output bit8 pkt[]);
      pkt = new[4];
      pkt[0] = data[7:0];
      pkt[1] = data[15:8];
      pkt[2] = data[23:16];
      pkt[3] = data[31:24];
   endtask // DataPack

   task DataUnpack(output int data, input bit8 pkt[]);
      data[7:0]   = pkt[0];
      data[15:8]  = pkt[1];
      data[23:16] = pkt[2];
      data[31:24] = pkt[3];
   endtask // DataUnpack

   task pulp_write32(AXI4Lite_m_env axi_m, input int address, input int data);
      bit8 dataIn[], wrRespOut[];
      int unsigned wrRespPtr;

      DataPack(data,dataIn);
      axi_m.writeData(wrRespPtr, address, dataIn);
      axi_m.getWrResp(wrRespPtr, wrRespOut);
   endtask // pulp_write32

   task pulp_read32(AXI4Lite_m_env axi_m, input int address, output int data);
      bit8 dataOut[], rdRespOut[];
      int unsigned rdPtr;

      axi_m.readData(address,4,rdPtr);
      axi_m.getData(rdPtr, dataOut, rdRespOut);
      DataUnpack(data,dataOut);
   endtask // pulp_read32

      int j = 0;

  initial
    begin
      bit8 dataIn[], dataOut[], wrRespOut[], wrRespExp[], rdRespOut[], rdRespExp[];
      int unsigned rdPtr, address, wrRespPtr;
      AXI4Lite_m_env axi_m;

      int unsigned status;

      // Create AXI master
      axi_m    = new("AXI master", testbench.axi_m_if_0, 4);
      // Start master vip
      axi_m.startEnv();
      axi_m.setRndDelay(0, 0, 0, 0);
      axi_m.setTimeOut(10000, 100000);
      axi_m.respReportMode(1);

      FCLK_RESET1_N = 1'b1; // PULP
      FCLK_RESET0_N = 1'b1; // interfaces, clking
      tb_wait(1);
      FCLK_RESET1_N = 1'b0;
      FCLK_RESET0_N = 1'b0;
      tb_wait(50);
      FCLK_RESET0_N = 1'b1; // release reset for interfaces, clking
      tb_wait(100);

      // // setup clking @ 50 MHz
      // // write configuration: 50 MHz
      // pulp_write32(axi_m, 32'h51010000 + 12'h200, 32'h04000A01);
      // pulp_write32(axi_m, 32'h51010000 + 12'h208, 32'h00040014); // 50 MHz
      //
      // // read status
      // pulp_read32(axi_m, 32'h51010000 + 4'h4, status);
      //
      // // confirm config
      // pulp_write32(axi_m, 32'h51010000 + 12'h25c,4'h7);
      // pulp_write32(axi_m, 32'h51010000 + 12'h25c,4'h2);

  // wait for lock of clocking_wizard
  wait (DUT.clk_rst_gen_i.clk_manager_i.locked == 1'b1);

  // release PULP resets
  FCLK_RESET1_N = 1'b1; // release reset for PULP interconnect
  tb_wait(100);
  pulp_write32(axi_m, 32'h51000000 + 4'h8, 32'hC0000000); // release GPIO reset for PULP
  tb_wait(100);

  // preload L2 memory
  $readmemh("../../../../slm_files/l2_ram_cut0_lo.slm", DUT.ulpsoc_i.l2_ram_i.l2_mem_i.cut_lo.MEM);
  $readmemh("../../../../slm_files/l2_ram_cut0_hi.slm", DUT.ulpsoc_i.l2_ram_i.l2_mem_i.cut_hi.MEM);

  // preload TCDM
  $readmemh("../../../../slm_files/tcdm_bank0.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 0].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank1.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 1].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank2.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 2].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank3.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 3].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank4.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 4].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank5.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 5].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank6.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 6].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank7.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 7].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank8.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 8].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank9.slm",  DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[ 9].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank10.slm", DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[10].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank11.slm", DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[11].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank12.slm", DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[12].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank13.slm", DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[13].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank14.slm", DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[14].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);
  $readmemh("../../../../slm_files/tcdm_bank15.slm", DUT.ulpsoc_i.CLUSTER[0].cluster_i.ulpcluster_i.tcdm_sram_island.banks_gen[15].sram_bank_gen.SyncSpRamBeNx32_i.Mem_DP);

  // setup a RAB slice for the mailbox
  pulp_write32(axi_m, 32'h51030000 + 8'h20, 32'h4A120000);
  pulp_write32(axi_m, 32'h51030000 + 8'h28, 32'h4A122000);
  pulp_write32(axi_m, 32'h51030000 + 8'h30, 32'h1A120000);
  pulp_write32(axi_m, 32'h51030000 + 8'h38, 32'h7);

  // mailbox config, interrupt enable
  pulp_write32(axi_m, 32'h4A120000 + 8'h24, 4'h6);

//// setup a RAB slice for the L2
  pulp_write32(axi_m, 32'h51030000 + 8'h40, 32'h4C000000);
  pulp_write32(axi_m, 32'h51030000 + 8'h48, 32'h4C010000);
  pulp_write32(axi_m, 32'h51030000 + 8'h50, 32'h1C000000);
  pulp_write32(axi_m, 32'h51030000 + 8'h58, 32'h7);

  // setup a RAB slice for the L1
  pulp_write32(axi_m, 32'h51030000 + 8'h60, 32'h40000000);
  pulp_write32(axi_m, 32'h51030000 + 8'h68, 32'h41000000);
  pulp_write32(axi_m, 32'h51030000 + 8'h70, 32'h10000000);
  pulp_write32(axi_m, 32'h51030000 + 8'h78, 32'h7);

  // setup a RAB slice for the L3
  pulp_write32(axi_m, 32'h510300A0 + 8'h00, 32'h80000000);
  pulp_write32(axi_m, 32'h510300A0 + 8'h08, 32'h88000000);
  pulp_write32(axi_m, 32'h510300A0 + 8'h10, 32'h78000000);
  pulp_write32(axi_m, 32'h510300A0 + 8'h18, 32'h7);

  // setup a RAB slice
  pulp_write32(axi_m, 32'h510300A0 + 8'h20, 32'hA0000000);
  pulp_write32(axi_m, 32'h510300A0 + 8'h28, 32'hA0001000);
  pulp_write32(axi_m, 32'h510300A0 + 8'h30, 32'h78000000);
  pulp_write32(axi_m, 32'h510300A0 + 8'h38, 32'h7);


  // start program execution - also enable RAB miss interrupts
  pulp_write32(axi_m, 32'h51000000 + 4'h8, 32'hC0000001);

  // write something to mailbox  to start execution
  pulp_write32(axi_m, 32'h4A120000 + 4'h0, 32'hA0000011);


  // wait for mailbox not empty
  status = 1;
  while (status)
    begin
      pulp_read32(axi_m, 32'h4A120010, status);
      status = status & 32'h1; // empty
      tb_wait(500);
      $display("Waiting for Mailbox activity.\n");
    end

  // check mailbox content
  pulp_read32(axi_m, 32'h4A120008, status);

  if (status == 32'h00000004)// PULP_DONE
    begin
      $display("PULP_DONE received, finish simulation in an instant.\n");
      tb_wait(100);
      $stop;
    end
  else if (status == 32'h000000FF)
    begin
      $display("PULP Error reading back slice configuration, abort.\n");
      $stop;
    end
  else
    $display("Received %h, continue similutaion.\n", status);
end

  initial
    begin : clk_gen
      FCLK_CLK0 = 1'b1;
      #(clk_period/2-1);
      while(1) begin
        FCLK_CLK0 = 1'b0;
        #(clk_period/2);
        FCLK_CLK0 = 1'b1;
        #(clk_period/2);
      end
    end

endmodule
