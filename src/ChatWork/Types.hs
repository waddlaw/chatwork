{-# LANGUAGE DeriveGeneric #-}

module ChatWork.Types
    ( Token
    , GetMeResponse(..)
    , GetMyStatusResponse(..)
    , GetMyTasksResponse
    , GetContactsResponse
    , GetRoomsResponse
    , PostRoomResponse(..)
    , GetRoomResponse
    , GetIncomingRequestsResponse
    , PutIncomingRequestsResponse(..)
    , CreateRoomParams(..)
    , IconPreset(..)
    , Task(..)
    , Room(..)
    , Account(..)
    , Contact(..)
    , IncomingRequest(..)
    ) where

import Data.Aeson
import Data.Aeson.Types
import Data.Aeson.Casing
import Data.Text (Text)
import Data.ByteString (ByteString)
import GHC.Generics

type Token = ByteString

data GetMeResponse = GetMeResponse
                   { meAccountId :: Int
                   , meRoomId :: Int
                   , meName :: Text
                   , meChatworkId :: Text
                   , meOrganizationId :: Int
                   , meOrganizationName :: Text
                   , meDepartment :: Text
                   , meTitle :: Text
                   , meUrl :: Text
                   , meIntroduction :: Text
                   , meMail :: Text
                   , meTelOrganization :: Text
                   , meTelExtension :: Text
                   , meTelMobile :: Text
                   , meSkype :: Text
                   , meFacebook :: Text
                   , meTwitter :: Text
                   , meAvatarImageUrl :: Text
                   } deriving (Show, Generic)

instance ToJSON GetMeResponse where
  toJSON = genericToJSON $ aesonDrop (strLength "me") snakeCase
instance FromJSON GetMeResponse where
  parseJSON = genericParseJSON $ aesonDrop (strLength "me") snakeCase

data GetMyStatusResponse = GetMyStatusResponse
                         { myStatusUnreadRoomNum :: Int
                         , myStatusMentionRoomNum :: Int
                         , myStatusMytaskRoomNum :: Int
                         , myStatusUnreadNum :: Int
                         , myStatusMentionNum :: Int
                         , myStatusMytaskNum :: Int
                         } deriving (Show, Generic)

instance ToJSON GetMyStatusResponse where
  toJSON = genericToJSON $ aesonDrop (strLength "myStatus") snakeCase
instance FromJSON GetMyStatusResponse where
  parseJSON = genericParseJSON $ aesonDrop (strLength "myStatus") snakeCase

type GetMyTasksResponse = [Task]

data Task = Task
          { taskToTaskId :: Int
          , taskToRoom :: Room
          , taskToAssignedByAccount :: Account
          , taskToMessageId :: Text
          , taskToBody :: Text
          , taskToLimitTime :: Int
          , taskToStatus :: Text
          } deriving (Show, Generic)

instance ToJSON Task where
  toJSON = genericToJSON $ aesonDrop (strLength "taskTo") snakeCase
instance FromJSON Task where
  parseJSON = genericParseJSON $ aesonDrop (strLength "taskTo") snakeCase

data Room = Room
          { roomToRoomId :: Int
          , roomToName :: Text
          , roomToType :: Maybe Text
          , roomToRool :: Maybe Text
          , roomToSticky :: Maybe Bool
          , roomToUnreadNum :: Maybe Int
          , roomToMentionNum :: Maybe Int
          , roomToMytaskNum :: Maybe Int
          , roomToMessageNum :: Maybe Int
          , roomToFileNum :: Maybe Int
          , roomToTaskNum :: Maybe Int
          , roomToIconPath :: Text
          , roomToLastUpdateTime :: Maybe Int
          , roomToDescription :: Maybe Text
          } deriving (Show, Generic)

instance ToJSON Room where
  toJSON = genericToJSON $ aesonDrop (strLength "roomTo") snakeCase
instance FromJSON Room where
  parseJSON = genericParseJSON $ aesonDrop (strLength "roomTo") snakeCase

data Account = Account
             { accountToAccountId :: Int
             , accountToName :: Text
             , accountToAvatarImageUrl :: Text
             } deriving (Show, Generic)

instance ToJSON Account where
  toJSON = genericToJSON $ aesonDrop (strLength "accountTo") snakeCase
instance FromJSON Account where
  parseJSON = genericParseJSON $ aesonDrop (strLength "accountTo") snakeCase

type GetContactsResponse = [Contact]

data Contact = Contact
             { contactToAccountId :: Int
             , contactToRoomId :: Int
             , contactToName :: Text
             , contactToChatworkId :: Text
             , contactToOrganizationId :: Int
             , contactToOrganizationName :: Text
             , contactToDepartment :: Text
             , contactToAvatarImageUrl :: Text
             } deriving (Show, Generic)

instance ToJSON Contact where
  toJSON = genericToJSON $ aesonDrop (strLength "contactTo") snakeCase
instance FromJSON Contact where
  parseJSON = genericParseJSON $ aesonDrop (strLength "contactTo") snakeCase

type GetRoomsResponse = [Room]

type GetRoomResponse = Room

data CreateRoomParams = CreateRoomParams
                      { cRoomDescription :: Maybe Text
                      , cIconPreset :: Maybe IconPreset
                      , cMembersAdminIds :: [Int]
                      , cMembersMemberIds :: Maybe [Int]
                      , cMembersReadonlyIds :: Maybe [Int]
                      , cRoomName :: Text
                      } deriving (Show)

data IconPreset = Group
                | Check
                | Document
                | Meeting
                | Event
                | Project
                | Business
                | Study
                | Security
                | Star
                | Idea
                | Heart
                | Magcup
                | Beer
                | Music
                | Sports
                | Travel
                deriving (Eq)

instance Show IconPreset where
  show Group = "group"
  show Check = "check"
  show Document = "document"
  show Meeting = "meeting"
  show Event = "event"
  show Project = "project"
  show Business = "business"
  show Study = "study"
  show Security = "security"
  show Star = "star"
  show Idea = "idea"
  show Heart = "heart"
  show Magcup = "magcup"
  show Beer = "beer"
  show Music = "music"
  show Sports = "sports"
  show Travel = "travel"

data PostRoomResponse = PostRoomResponse { postRoomToRoomId :: Int } deriving (Show, Generic)

instance ToJSON PostRoomResponse where
  toJSON = genericToJSON $ aesonDrop (strLength "postRoomTo") snakeCase
instance FromJSON PostRoomResponse where
  parseJSON = genericParseJSON $ aesonDrop (strLength "postRoomTo") snakeCase

type GetIncomingRequestsResponse = [IncomingRequest]

data IncomingRequest = IncomingRequest
                     { incomingRequestToRequestId :: Int
                     , incomingRequestToAccountId :: Int
                     , incomingRequestToMessage :: Text
                     , incomingRequestToName :: Text
                     , incomingRequestToChatworkId :: Text
                     , incomingRequestToOrganizationId :: Int
                     , incomingRequestToOrganizationName :: Text
                     , incomingRequestToDepartment :: Text
                     , incomingRequestToAvatarImageUrl :: Text
                     } deriving (Show, Generic)

instance ToJSON IncomingRequest where
  toJSON = genericToJSON $ aesonDrop (strLength "incomingRequestTo") snakeCase
instance FromJSON IncomingRequest where
  parseJSON = genericParseJSON $ aesonDrop (strLength "incomingRequestTo") snakeCase

data PutIncomingRequestsResponse = IncomingRequestsResponse
                                 { acceptIncomingRequestAccountId :: Int
                                 , acceptIncomingRequestRoomId :: Int
                                 , acceptIncomingRequestName :: Text
                                 , acceptIncomingRequestChatworkId :: Text
                                 , acceptIncomingRequestOrganizationId :: Int
                                 , acceptIncomingRequestOrganizationName :: Text
                                 , acceptIncomingRequestDepartment :: Text
                                 , acceptIncomingRequestAvatarImageUrl :: Text
                                 } deriving (Show, Generic)

instance ToJSON PutIncomingRequestsResponse where
  toJSON = genericToJSON $ aesonDrop (strLength "acceptIncomingRequest") snakeCase
instance FromJSON PutIncomingRequestsResponse where
  parseJSON = genericParseJSON $ aesonDrop (strLength "acceptIncomingRequest") snakeCase

strLength :: String -> Int
strLength = length
