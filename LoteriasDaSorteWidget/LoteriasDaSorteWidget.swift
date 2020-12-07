//
//  LoteriasDaSorteWidget.swift
//  LoteriasDaSorteWidget
//
//  Created by Gabriel Soria Souza on 06/12/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import Lottery
import WidgetKit
import SwiftUI
import Intents

let snapshotEntry = GameDetailModel(gameData: LotteryMock().mockData(fileName: .megasena))

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetContent {
        WidgetContent(date: Date(), model: snapshotEntry)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WidgetContent) -> Void) {
        let entry = WidgetContent(date: Date(), model: snapshotEntry)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetContent>) -> Void) {
        var entries: [WidgetContent] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = WidgetContent(date: entryDate, model: snapshotEntry)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct WidgetContent: TimelineEntry {
    let date: Date
    let model: GameDetailModel
}

struct LoteriasDaSorteWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

@main
struct LoteriasDaSorteWidget: Widget {
    let kind: String = "LoteriasDaSorteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), content: { entry in
            NextGameWidgetView(model: entry.model)
        })
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall])
    }
}

struct LoteriasDaSorteWidget_Previews: PreviewProvider {
    static var previews: some View {
        NextGameWidgetView(model: snapshotEntry)
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
