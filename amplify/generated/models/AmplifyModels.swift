// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "c71a779ddb1c3a5da0ce292810cd1efa"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Task.self)
    ModelRegistry.register(modelType: Users.self)
  }
}