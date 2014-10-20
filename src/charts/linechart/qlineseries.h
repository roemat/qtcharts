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

#ifndef QLINESERIES_H
#define QLINESERIES_H

#include <QtCharts/QChartGlobal>
#include <QtCharts/QXYSeries>
#include <QtGui/QPen>

QT_CHARTS_BEGIN_NAMESPACE

class QLineSeriesPrivate;

class QT_CHARTS_EXPORT QLineSeries : public QXYSeries
{
    Q_OBJECT

public:
    explicit QLineSeries(QObject *parent = 0);
    ~QLineSeries();
    QAbstractSeries::SeriesType type() const;

protected:
    QLineSeries(QLineSeriesPrivate &d, QObject *parent = 0);

private:
    Q_DECLARE_PRIVATE(QLineSeries)
    Q_DISABLE_COPY(QLineSeries)
    friend class LineChartItem;
};

QT_CHARTS_END_NAMESPACE

#endif // QLINESERIES_H