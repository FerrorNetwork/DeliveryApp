import UIKit

class LocalData {
    let arrayOfPromo: [ImageModel] = [  ImageModel(image: "firstBlock1", name: "Летний пикник", color: nil),
                                             ImageModel(image: "firstBlock2", name: "Летний обед", color: nil),
                                             ImageModel(image: "firstBlock3", name: "На завтрак", color: nil),
                                             ImageModel(image: "firstBlock4", name: "На ужин", color: nil),
                                             ImageModel(image: "firstBlock1", name: "Летний пикник", color: nil),
                                             ImageModel(image: "firstBlock2", name: "Летний обед", color: nil),
                                             ImageModel(image: "firstBlock3", name: "На завтрак", color: nil)]

    let arrayOfBanners: [String] = ["secondBlock1", "secondBlock2", "Banner", "Banner", "Banner", "Banner", "Banner"]

    let arrayOfStock: [ProductModel] = [
        ProductModel(image: "thirdBlock1", name: "Черные спагетти с морепродуктам (большая порция)", weight: "230 г", price: "360 ₽", salePrice: nil, sale: "-35%", new: .yes),
        ProductModel(image: "thirdBlock2", name: "Казаречче с индейкой и томатами", weight: "230 г", price: "360 ₽", salePrice: "200 ₽", sale: "-25%", new: .none),
        ProductModel(image: "thirdBlock3", name: "Равиоли с грибами", weight: "230 г", price: "1360 ₽", salePrice: "1200 ₽", sale: "-25%", new: .none),
        ProductModel(image: "thirdBlock3", name: "Равиоли с грибами", weight: "230 г", price: "1360 ₽", salePrice: "1200 ₽", sale: "-25%", new: .none),
        ProductModel(image: "Banner", name: "Что-то вкусное", weight: "230 г", price: "1360 ₽", salePrice: "1200 ₽", sale: "-25%", new: .none),
        ProductModel(image: "Banner", name: "Что-то вкусное", weight: "230 г", price: "1360 ₽", salePrice: "1200 ₽", sale: "-25%", new: .none),
        ProductModel(image: "Banner", name: "Что-то вкусное", weight: "230 г", price: "1360 ₽", salePrice: "1200 ₽", sale: "-25%", new: .none),
    ]

    let arrayOfCatalog: [ImageModel] = [
        ImageModel(image: "fourthBlock1", name: "Наборы", color: UIColor(red: 1, green: 0.757, blue: 0.714, alpha: 1)),
        ImageModel(image: "fourthBlock2", name: "Пицца", color: UIColor(red: 1, green: 0.882, blue: 0.678, alpha: 1)),
        ImageModel(image: "fourthBlock3", name: "Паста", color: UIColor(red: 0.729, green: 0.722, blue: 0.573, alpha: 1)),
        ImageModel(image: "fourthBlock4", name: "Ризотто", color: UIColor(red: 0.769, green: 0.827, blue: 0.808, alpha: 1)),
        ImageModel(image: "fourthBlock5", name: "Салаты", color: UIColor(red: 0.725, green: 0.769, blue: 0.784, alpha: 1)),
        ImageModel(image: "fourthBlock6", name: "Полу \nфабрикаты", color: UIColor(red: 0.639, green: 0.682, blue: 0.616, alpha: 1)),
        ImageModel(image: "fourthBlock7", name: "Десерты", color: UIColor(red: 1, green: 0.903, blue: 0.714, alpha: 1)),
        ImageModel(image: "fourthBlock8", name: "Добавки \nк блюдам", color: UIColor(red: 0.827, green: 0.769, blue: 0.769, alpha: 1)),
        ImageModel(image: "fourthBlock9", name: "Напитки", color: UIColor(red: 1, green: 0.833, blue: 0.678, alpha: 1))
    ]
}
