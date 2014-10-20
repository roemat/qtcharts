/****************************************************************************
**
** Copyright (C) 2014 Digia Plc
** All rights reserved.
** For any questions to Digia, please use contact form at http://qt.digia.com
**
** This file is part of the Qt Enterprise Charts Add-on.
**
** $QT_BEGIN_LICENSE$
** Licensees holding valid Qt Enterprise licenses may use this file in
** accordance with the Qt Enterprise License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.
**
** If you have questions regarding the use of this file, please use
** contact form at http://qt.digia.com
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import QtTest 1.0
import QtCharts 1.3

Rectangle {
    width: 400
    height: 300

    TestCase {
        id: tc1
        name: "tst_qml-qtquicktest BarCategoryAxis 1.3"
        when: windowShown

        function test_minMax() {
            compare(barSeries1.axisX.min, "Jan", "AxisX min");
            compare(barSeries1.axisX.max, "Jun", "AxisX max");
            compare(barSeries1.axisY.min, 0, "AxisY min");
            compare(barSeries1.axisY.max, 10, "AxisY max");
        }

        function test_categories() {
            compare(barSeries1.axisX.count, 6, "AxisX count");
            categoriesCountChangedSpy.clear();
            categoriesChangedSpy.clear();

            // Replace categories
            barSeries1.axisX.categories = ["Tam", "Hel", "Maa", "Huh"];
            compare(barSeries1.axisX.count, 4, "AxisX count");
            compare(categoriesCountChangedSpy.count, 1, "onCountChanged");
            compare(categoriesChangedSpy.count, 1, "onCategoriesChanged");

            // Reset the original categories
            barSeries1.axisX.categories = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
            compare(barSeries1.axisX.count, 6, "AxisX count");
            compare(categoriesCountChangedSpy.count, 2, "onCountChanged");
            compare(categoriesChangedSpy.count, 2, "onCategoriesChanged");
        }

        function test_minMaxChanged() {
            axisY.min = -1;
            compare(minChangedSpy.count, 1, "onMinChanged");
            compare(maxChangedSpy.count, 0, "onMaxChanged");
            axisY.max = 12;
            compare(minChangedSpy.count, 1, "onMinChanged");
            compare(maxChangedSpy.count, 1, "onMaxChanged");
        }
    }

    ChartView {
        id: chartView
        anchors.fill: parent

        BarSeries {
            id: barSeries1
            axisX: BarCategoryAxis {
                id: axisX
                categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun" ]
            }
            axisY: ValuesAxis {
                id: axisY
                min: 0
                max: 10
            }
        }

        SignalSpy {
            id: categoriesCountChangedSpy
            target: axisX
            signalName: "countChanged"
        }
        SignalSpy {
            id: categoriesChangedSpy
            target: axisX
            signalName: "categoriesChanged"
        }
        SignalSpy {
            id: minChangedSpy
            target: axisY
            signalName: "minChanged"
        }
        SignalSpy {
            id: maxChangedSpy
            target: axisY
            signalName: "maxChanged"
        }
    }
}