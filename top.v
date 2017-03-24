module top(
	input wire clk, //Reloj de 50MHz
	
	input wire A,
	input wire B,
	
	input wire left_button,
	input wire right_button,
	
	output wire hsync,
	output wire vsync,
	
	output wire vga_clk,
	output wire vga_blank_n,
	
	output wire [7:0] VGA_R,
	output wire [7:0] VGA_G,
	output wire [7:0] VGA_B,
	
	output wire LED
);

wire p_tick;
wire video_on;
wire [9:0] pixel_x;
wire [9:0] pixel_y;

assign vga_clk = p_tick;
assign vga_blank_n = video_on;


reg [1:0] selectImage;

vga_sync Sync(
  .clk(clk),
  .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(p_tick),
  .pixel_x(pixel_x), .pixel_y(pixel_y)
);

pixel_Gen Pixels(	
	.pixel_tick(p_tick), .video_on(video_on),
	.pixel_x(pixel_x), .pixel_y(pixel_y),
	
	.data(data),
	.addr(addr),
	
	.selectImage(selectImage),
	.red_channel(VGA_R),
	.blue_channel(VGA_B),
	.green_channel(VGA_G)
);


wire [31:0] addr ;

wire [7:0] data;

	
RAM	RAM_inst (
	.address_a ( addr ),
	.clock ( clk ),
	.q_a ( data )
	);




assign LED = A && B;

//Usado para el control del Boton_Left
reg cambio_SolicitadoLeft = 0, cambio_RealizadoLeft = 0;
wire cambio_FinalizadoLeft;
assign cambio_FinalizadoLeft = ((cambio_RealizadoLeft & cambio_SolicitadoLeft) |  ((!cambio_RealizadoLeft) & (!cambio_SolicitadoLeft)));

//Usado para el control del Boton_Right
reg cambio_SolicitadoRight = 0, cambio_RealizadoRight = 0;
wire cambio_FinalizadoRight;
assign cambio_FinalizadoRight = ((cambio_RealizadoRight & cambio_SolicitadoRight) |  ((!cambio_RealizadoRight) & (!cambio_SolicitadoRight)));

always @(posedge left_button)
	cambio_SolicitadoLeft = ~cambio_SolicitadoLeft;
	
always @(posedge right_button)
	cambio_SolicitadoRight = ~cambio_SolicitadoRight;

always @(posedge clk) begin
	if (!cambio_FinalizadoLeft) begin
		selectImage = selectImage - 1;
		cambio_RealizadoLeft = ~cambio_RealizadoLeft;
	end
	if (!cambio_FinalizadoRight) begin
		selectImage = selectImage + 1;
		cambio_RealizadoRight = ~cambio_RealizadoRight;
	end
end


endmodule