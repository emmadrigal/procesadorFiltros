module pixel_Gen(	
	//Inputs from the sincronizer
	input pixel_tick,
	input wire [9:0] pixel_x, pixel_y,
	input wire video_on,
	
	input wire center_button,
	input wire [1:0] selectImage,
	
	//Displays a number, used for a test
	input wire [7:0] dataLD1,
	input wire [7:0] dataLD2,
	input wire [7:0] dataLD3,
	
	
	//Conexiones a la memoria
	input wire [7:0] data,
	
	output wire [31:0] addr,
	
	//Salida de color segun el bit correspondiente
    output reg [7:0] red_channel,
	output reg [7:0] blue_channel,
	output reg [7:0] green_channel
   );
   

// constant declaration
localparam SymbolSize = 16 ; //Lenght of the side of the digit
localparam expansionSize =  1;//Denotes log2(SymbolSize/8) it denotes how much bigger does the digit is on screen compared with the template, 1 is 1:1, 2 is 1:4, 3 is 1:16. From Verilog 2005 and on this can implemented as a function
	

//Current character to be drawn
reg [7:0] Character;
//Used to determine the height of the current pixel in the caracter
reg [2:0] columnY;
//Used to read the current row of pixels in the character
wire [7:0] row;

//Module instatiation
Chars_rom CharacterRom(.character(Character),  .columnaY(columnY),   .data(row));

reg [1:0] current_image;
reg [1:0] filtered_image;

always @(negedge center_button) begin	
	current_image <= selectImage;
	
	if(current_image == 2'b11) begin
			filtered_image <= filtered_image;
	end
	else begin
		filtered_image <= current_image;
	end
	
end

assign addr = (pixel_y - 24)*imageSide + (pixel_x - 160) + imageOffset;
//Calculates the current pixel to be displayed

reg [9:0] imageSide;

reg [19:0] imageOffset;


always @* begin
	case(current_image)
		0: begin
			imageSide = 400;
			imageOffset = 1000;
		end
		1: begin
			imageSide = 350;
			imageOffset = 161000;
		end
		2: begin
			imageSide = 300;
			imageOffset = 283500;
		end
		default: begin
			imageOffset = 373500;
			case(filtered_image)
				0: imageSide = 400;
				1: imageSide = 350;
				default: imageSide = 300;
			endcase
			end
	endcase
end


//Checks that for a given pixel in the screen if it should be written
always @(posedge pixel_tick) begin
	//LENNA option
	if ((pixel_x >= 24) && (pixel_x <= 120) && (pixel_y >= 24) && (pixel_y <= 40)) begin
		columnY = (pixel_y - 24) >> expansionSize;
		if (pixel_x <= 40) begin// 
			Character = "L";
			if(row[7-((pixel_x - 24) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 56) begin// 
			Character = "E";
			if(row[7-((pixel_x - 40) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 72) begin// 
			Character = "N";
			if(row[7-((pixel_x - 56) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 88) begin// 
			Character = "N";
			if(row[7-((pixel_x - 72) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 104) begin// 
			Character = "A";
			if(row[7-((pixel_x - 88) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else begin// 
			Character = 95;
			if(row[7-((pixel_x - 104) >> expansionSize)]   && (selectImage == 0)) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
	end
	
	//BOATS option
	else if ((pixel_x >= 24) && (pixel_x <= 120) && (pixel_y >= 48) && (pixel_y <= 64)) begin
		columnY = (pixel_y - 48) >> expansionSize;
		if (pixel_x <= 40) begin// 
			Character = "B";
			if(row[7-((pixel_x - 24) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 56) begin// 
			Character = "O";
			if(row[7-((pixel_x - 40) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 72) begin// 
			Character = "A";
			if(row[7-((pixel_x - 56) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 88) begin// 
			Character = "T";
			if(row[7-((pixel_x - 72) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 104) begin// 
			Character = "S";
			if(row[7-((pixel_x - 88) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		
		else begin// 
			Character = 95;
			if(row[7-((pixel_x - 104) >> expansionSize)]   && (selectImage == 1)) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
	end
	
	//BARBARA option
	else if ((pixel_x >= 24) && (pixel_x <= 152) && (pixel_y >= 72) && (pixel_y <= 88)) begin
		columnY = (pixel_y - 72) >> expansionSize;
		if (pixel_x <= 40) begin// 
			Character = "B";
			if(row[7-((pixel_x - 24) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 56) begin// 
			Character = "A";
			if(row[7-((pixel_x - 40) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 72) begin// 
			Character = "R";
			if(row[7-((pixel_x - 56) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 88) begin// 
			Character = "B";
			if(row[7-((pixel_x - 72) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 104) begin// 
			Character = "A";
			if(row[7-((pixel_x - 88) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 120) begin// 
			Character = "R";
			if(row[7-((pixel_x - 104) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 136) begin// 
			Character = "A";
			if(row[7-((pixel_x - 120) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else begin// 
			Character = 95;
			if(row[7-((pixel_x - 136) >> expansionSize)]   && (selectImage == 2)) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		
	end
	
	//FILTER option
	else if ((pixel_x >= 24) && (pixel_x <= 136) && (pixel_y >= 96) && (pixel_y <= 112)) begin
		columnY = (pixel_y - 96) >> expansionSize;
		if (pixel_x <= 40) begin// 
			Character = "F";
			if(row[7-((pixel_x - 24) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 56) begin// 
			Character = "I";
			if(row[7-((pixel_x - 40) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 72) begin// 
			Character = "L";
			if(row[7-((pixel_x - 56) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 88) begin// 
			Character = "T";
			if(row[7-((pixel_x - 72) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 104) begin// 
			Character = "E";
			if(row[7-((pixel_x - 88) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 120) begin// 
			Character = "R";
			if(row[7-((pixel_x - 104) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else begin// 
			Character = 95;
			if(row[7-((pixel_x - 120) >> expansionSize)]   && (selectImage == 3)) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		
	end
	
	//Display Number 1
	else if ((pixel_x >= 24) && (pixel_x <= 88) && (pixel_y >= 130) && (pixel_y <= 146)) begin
		columnY = (pixel_y - 130) >> expansionSize;
		if (pixel_x <= 40) begin// 
			Character = (dataLD1 /1000);
			if(row[7-((pixel_x - 24) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 56) begin// 
			Character = ((dataLD1 /100) % 10);
			if(row[7-((pixel_x - 40) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 72) begin// 
			Character = ((dataLD1 /10) % 10);
			if(row[7-((pixel_x - 56) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else begin// 
			Character = (dataLD1 % 10);
			if(row[7-((pixel_x - 72) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
	end
	
	//Display Number 2
	else if ((pixel_x >= 24) && (pixel_x <= 88) && (pixel_y >= 160) && (pixel_y <= 176)) begin
		columnY = (pixel_y - 160) >> expansionSize;
		if (pixel_x <= 40) begin// 
			Character = (dataLD2 /1000);
			if(row[7-((pixel_x - 24) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 56) begin// 
			Character = ((dataLD2 /100) % 10);
			if(row[7-((pixel_x - 40) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 72) begin// 
			Character = ((dataLD2 /10) % 10);
			if(row[7-((pixel_x - 56) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else begin// 
			Character = (dataLD2 % 10);
			if(row[7-((pixel_x - 72) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
	end
	
	//Display Number 3
	else if ((pixel_x >= 24) && (pixel_x <= 88) && (pixel_y >= 180) && (pixel_y <= 196)) begin
		columnY = (pixel_y - 180) >> expansionSize;
		if (pixel_x <= 40) begin// 
			Character = (dataLD3 /1000);
			if(row[7-((pixel_x - 24) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 56) begin// 
			Character = ((dataLD3 /100) % 10);
			if(row[7-((pixel_x - 40) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else if (pixel_x <= 72) begin// 
			Character = ((dataLD3 /10) % 10);
			if(row[7-((pixel_x - 56) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
		else begin// 
			Character = (dataLD3 % 10);
			if(row[7-((pixel_x - 72) >> expansionSize)]) begin
				red_channel = -1;
				blue_channel = -1;
				green_channel = -1;
			end
			else begin
				red_channel = 0;
				blue_channel = 0;
				green_channel = 0;
			end
		end
	end
	
	//Display Image
	else if ((pixel_x >= 160) && (pixel_x <= (160 + imageSide)) && (pixel_y >= 24) && (pixel_y <= (24 + imageSide))) begin
		red_channel = data;
		blue_channel = data;
		green_channel = data;
	end
	
	else begin
		red_channel = 0;
		blue_channel = 0;
		green_channel = 0;
	end
end 

endmodule