import SwiftUI
import Combine

public struct ActionItemList: View {
    
    let items: [HorizontalCard]
    let cellHeight: CGFloat = 50
    
    public init(items: [HorizontalCard]) {
        self.items = items
    }

    var itemsView: some View {
        VStack {
            ForEach(0..<items.count) { index in
                if index > 0 {
                    Divider()
                }
                items[index]
                    .frame(height: cellHeight)
            }
        }
        .padding()
    }
    
    public var body: some View {
        itemsView
    }
}

struct ActionItemList_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ActionItemList(
                items: [
                    HorizontalCard(cardData: HorizontalCardData(title: "Edit")),
                    HorizontalCard(cardData: HorizontalCardData(title: "Delete")),
                    HorizontalCard(cardData: HorizontalCardData(title: "Report"))
                ])
        }
    }
}
