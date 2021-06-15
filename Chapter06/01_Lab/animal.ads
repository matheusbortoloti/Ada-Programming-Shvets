


with Ada.Strings.Unbounded;
with Ada.Finalization;
with Ada.Text_IO;

package animal is
   
   type Creature is new Ada.Finalization.Controlled with private;
   
   -- This is the constructor where one can specify all inputs
   function Init ( Name          : in String;
                   Legs          : in Natural;
                   WeightInGrams : in Positive;
                   HeightInCm    : in Positive) return Creature;
   
   
   -- This the constructor where all of the inputs are default. Also known as the
   -- default constructor.
   function Init return Creature;
   
   --Print out the entire record
   procedure Print_Record (Creat : in out Creature);
   
   -- Setter and getter methods
   procedure Set_Legs ( Creat : in out Creature;
                        Legs  : in Natural );
   
   procedure Set_Weigth ( Creat         : in out Creature;
                          WeightInGrams : in Positive );
   
   procedure Set_Height ( Creat      : in out Creature;
                          HeightInCm : in Positive );
   
   function Get_Legs ( Creat : in out Creature ) return Natural;
   
   function Get_Weight ( Creat : in out Creature ) return Positive;
   
   function Get_Height ( Creat : in out Creature ) return Positive;
   
private
   use Ada.Strings.Unbounded;
   type Creature is new Ada.Finalization.Controlled with record
      
      Name          : Unbounded_String := Null_Unbounded_String;
      Legs          : Natural  := 0;
      WeightInGrams : Positive := 1;
      HeightInCm    : Positive := 1;
   end record;
   
   -- A private version of the procedure that will do the actual printing
   procedure Private_Print_Record ( Creat : in out Creature );
   
   overriding procedure Finalize ( Creat : in out Creature );   

end animal;
