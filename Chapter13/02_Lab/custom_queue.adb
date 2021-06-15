-- -------------------------------------------
-- Beginning Ada Programming - Andrew T.Shvets
-- Chapter 13 - Exercise 02
-- Matheus Bortoloti Dias
-- 06.06.2021
-- Create a generic package to implement a 
-- queue by means of an array
-- -------------------------------------------

package body Custom_Queue is
   
   -- Insert an element at the back of the queue
   -- Return value True: element was inserted successfully 
   -- Return value False: element could NOT be inserted
   procedure Push (Element : in Custom_Type) is
   begin
      -- Check if the queue is not full
      if (Actual_Length < QUEUE_MAX_SIZE )
      then
         -- Insert the new element at the back
         Queue_Array(Actual_Length + 1) := Element;
         
         -- Update the actual queue size
         Actual_Length := Actual_Length + 1;         
      else
         Ada.Text_IO.Put_Line ("ERROR: It is not possible to insert a new " &
                                 "element. The queue is already full!");         
      end if;
   end Push;
   
   -- Return the element at the tail of the queue
   -- Return value True: element was inserted successfully 
   -- Return value False: element could NOT be inserted
   procedure Pop (Element : out Custom_Type) is       
   begin
      -- Check if queue is not empty 
      if (Actual_Length > 0)
      then         
         -- Push the first element
         Element := Queue_Array(1);
         
         -- Move the elements one position to the front
         for Iter in 1 .. Actual_Length-1 loop
            Queue_Array(Iter) := Queue_Array(Iter+1);
         end loop;   
         
         -- Update the actual queue size
         Actual_Length := Actual_Length - 1;       
      else
         Ada.Text_IO.Put_Line ("ERROR: Nothing to pop. The queue is empty!");         
      end if;
   end Pop;
   
   -- Return the actual length of the queue
   function Length return Natural is
   begin
      return Actual_Length;
   end Length;    

end Custom_Queue;
