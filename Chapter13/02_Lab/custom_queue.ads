-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 13 - Exercise 02
-- Matheus Bortoloti Dias
-- 06.06.2021
-- Create a generic package to implement a 
-- queue by means of an array
-- -------------------------------------------

with Ada.Text_IO;

generic 
   type Custom_Type is private;

package Custom_Queue is
   
   -- Insert an element at the back of the queue
   -- Return value True: element was inserted successfully 
   -- Return value False: element could NOT be inserted
   procedure Push (Element : in Custom_Type);
   
   -- Return the element at the tail of the queue
   -- Return value True: element was inserted successfully 
   -- Return value False: element could NOT be inserted
   procedure Pop (Element : out Custom_Type);
   
   -- Return the actual length of the queue
   function Length return Natural;  
   
private   
   -- The array size is fixed with 30 elements
   QUEUE_MAX_SIZE : constant := 30;
   Queue_Array    : array (1 .. QUEUE_MAX_SIZE) of Custom_Type;
   
   -- Current lenght of the queue. This value is updated at runtime
   Actual_Length : Natural := 0;

end Custom_Queue;
