unit Database.Entities;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy;

type
  TCustomer = class;
  TOrderItems = class;
  TOrders = class;
  
  [Entity]
  [Table('Customer')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  [FilterDef('customer', '{CustomerID} = :customer-id')]
  [FilterDefParam('customer', 'customer-id', TypeInfo(integer))]
  [FilterDef('order', '{OrderID} = :order-id')]
  [FilterDefParam('order', 'order-id', TypeInfo(integer))]
  TCustomer = class
  private
    [Column('ID', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FID: Integer;
    
    [Column('Name', [], 65535)]
    FName: Nullable<string>;
  public
    property ID: Integer read FID write FID;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('OrderItems')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  [Filter('order')]
  TOrderItems = class
  private
    [Column('ID', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FID: Integer;
    
    [Column('Description', [], 65535)]
    FDescription: Nullable<string>;
    
    [Column('Amount', [])]
    FAmount: Nullable<Double>;
    
    [Column('OrderID', [TColumnProp.Required])]
    FOrderID: Integer;
  public
    property ID: Integer read FID write FID;
    property Description: Nullable<string> read FDescription write FDescription;
    property Amount: Nullable<Double> read FAmount write FAmount;
    property OrderID: Integer read FOrderID write FOrderID;
  end;
  
  [Entity]
  [Table('Orders')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  [Filter('customer')]
  TOrders = class
  private
    [Column('ID', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FID: Integer;
    
    [Column('Description', [], 65535)]
    FDescription: Nullable<string>;
    
    [Column('CustomerID', [TColumnProp.Required])]
    FCustomerID: Integer;
  public
    property ID: Integer read FID write FID;
    property Description: Nullable<string> read FDescription write FDescription;
    property CustomerID: Integer read FCustomerID write FCustomerID;
  end;
  

implementation

initialization
  RegisterEntity(TCustomer);
  RegisterEntity(TOrders);
  RegisterEntity(TOrderItems);

finalization

end.
