module SaleNote exposing (..)

import Time
import Dict


type alias Selectable =
    Dict.Dict String Bool


type Page
    = SaleNoteInputPage
    | SaleNoteDisplayPage
    | SettingsPage
    | ClientListPage
    | HomePage


type alias Settings =
    { agentName : String
    , agentCode : String
    , agentEmail : String
    , agentMobilePhone : String
    , agentPassword : String
    , agentLocation : String
    , nextSaleNoteNumber : String
    , customerIdentifaction : String
    }


type alias Model =
    { saleNotes : List SaleNote
    , clients : List Client
    , settings : Settings
    , currentPage : Page
    }


type alias Client =
    { name : String
    , address : String
    }


type alias SaleNoteInput =
    { saleNoteNumber : String
    , createdAt : Time.Time
    , vendor : Vendor
    , purchaser : Purchaser
    , lots : List Lot
    , productList : List String
    , vendorHerdPTPTCode : String
    , purchaserHerdPTPTCode : String
    , retentionToBeHeld : Selectable
    , deliveryDate : String
    , commissionRate : String
    , commissionOverride : Selectable
    , commissionPayable : Selectable
    , workflow : Workflow
    , audit : List Audit
    , internalNotes : String
    }


type alias Audit =
    { time : Time.Time
    , message : String
    }


type alias SaleNote =
    { saleNoteNumber : String
    , createdAt : Time.Time
    , vendor : Vendor
    , purchaser : Purchaser
    , lots : List Lot
    , vendorHerdPTPTCode : String
    , purchaserHerdPTPTCode : String
    , retentionToBeHeld : Selectable
    , deliveryDate : String
    , commissionRate : String
    , commissionOverride : Selectable
    , commissionPayable : Selectable
    , workflow : Workflow
    , audit : List Audit
    , internalNotes : String
    }


type alias Lot =
    { tally : Int
    , product : String
    , description : String
    , price : String
    , commisionOverride : String
    }


type alias Workflow =
    { naitTransfer : Selectable
    , animalRecordTransfer : Selectable
    , emailedToVendor : Selectable
    , emailedToPurchaser : Selectable
    , sentToServer : Selectable
    , methodOfPayment : Selectable
    }


type alias Vendor =
    { entityName : String
    , entityType : Selectable
    , account : String
    , phoneNumber : String
    , mobileNumber : String
    , agentName : String
    , agentCode : String
    , rebateRate : String
    , fullName : String
    , dateOfBirth : String
    , postalAddress : String
    , email : String
    , gstNumber : String
    , naitNumber : String
    , stockSecured : Selectable
    , security : String
    }


type alias Purchaser =
    { entityName : String
    , entityType : Selectable
    , account : String
    , phoneNumber : String
    , mobileNumber : String
    , agentName : String
    , agentCode : String
    , rebateRate : String
    , fullName : String
    , dateOfBirth : String
    , postalAddress : String
    , email : String
    , gstNumber : String
    , naitNumber : String
    }
