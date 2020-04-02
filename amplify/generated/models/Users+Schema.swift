// swiftlint:disable all
import Amplify
import Foundation

extension Users {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let users = Users.keys
    
    model.pluralName = "Users"
    
    model.fields(
      .id(),
      .field(users.name, is: .required, ofType: .string)
    )
    }
}