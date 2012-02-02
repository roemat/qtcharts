#include "bar.h"
#include <QDebug>
#include <QPainter>

QTCOMMERCIALCHART_BEGIN_NAMESPACE

Bar::Bar(QGraphicsItem *parent)
    : ChartItem(parent)
{
}

void Bar::setSize(const QSizeF& size)
{
    mWidth = size.width();
    mHeight = size.height();
}

void Bar::setPlotDomain(const PlotDomain& data)
{
    mPlotDomain = data;
}

void Bar::resize( qreal w, qreal h )
{
//    qDebug() << "bar::resize" << w << h;
    mWidth = w;
    mHeight = h;
}

void Bar::setColor( QColor col )
{
    mColor = col;
}
void Bar::setPos(qreal x, qreal y)
{
 //   qDebug() << "Bar::setpos" << x << y;
    mXpos = x;
    mYpos = y;
}

void Bar::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    if (0 == mHeight) {
        return;
    }
    // TODO: accept brush instead of color
    QBrush brush(mColor);
    painter->setBrush(brush);

    // This compensates for rounding errors. drawRect takes ints and cumulative error of pos + size may be over 1.
    int x0 = mXpos;
    int x1 = (mXpos + mWidth);
    int w = x1-x0;
    int y0 = mYpos;
    int y1 = (mYpos + mHeight);
    int h = y1-y0;
    painter->drawRect(x0, y0 ,w ,h);
}

QRectF Bar::boundingRect() const
{
    QRectF r(mXpos, mYpos, mXpos + mWidth, mYpos + mHeight);
    return r;
}

QTCOMMERCIALCHART_END_NAMESPACE
