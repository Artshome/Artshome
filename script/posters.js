(function (jq) {
    var posters = function (o, options, data) {
        this.parent = jq("#" + o);
        if (this.parent.length <= 0) {
            return false;
        }
        this.options = jq.extend({}, posters.options, options);
        if (typeof (data) !== 'object') return false;
        this.data = data || {};
        this.reset();
    };
    posters.options = {
        direct: "left", //滚动的方向
        initPage: 1, //默认当前显示第几条
        className: "posters", //最外层样式
        width: 0, //最外层宽
        height: 0, //最外层高  
        delay: 2000, //滚动间隔（毫秒）
        speed: 500 //滚动速度毫秒
    };
    posters.prototype = {
        reset: function (options) {
            if (typeof (options) == 'object') {
                jq.extend(this.options, options);
            }
            this.indentation = 10; //缩进宽
            this.opacity = 0.7; //不透明度
            this.total = this.data.length; //页数
            this.pageNow = this.options.initPage; //当前页
            this.pageNowWidth = 200; //当前页宽
            this.pageNowHeight = 200; //当前页高
            this.page2Width = this.pageNowWidth * 0.8; //页2宽
            this.page2Height = this.pageNowHeight * 0.8; //页2高
            this.page3Width = this.page2Width * 1; //页3宽
            this.page3Height = this.page2Height * 1; //页3高
            this.options.width = this.pageNowWidth + this.page2Width * 2 + this.page3Width * 2 - this.indentation * 4; //总宽
            this.options.height = this.pageNowHeight;
            this.pageNowLeft = this.page3Width + this.page2Width - this.indentation * 2; //当前页左边界
            this.preLeft = this.page3Width - this.indentation; ; //上一页左边界
            this.nextLeft = this.pageNowLeft + this.pageNowWidth - this.indentation; //下一页左边界
            this.pre2Left = 0; //上两页左边界
            this.next2Left = this.nextLeft + this.page2Width - this.indentation; //下两页左边界
            this.disappearLeft = 0 - this.page3Width; //左消失页左边界
            this.disappearRight = this.options.width; //右消失页左边界
            this.drawContent();
        },
        drawContent: function () {
            this.parent.empty();
            this.parent.css({ width: this.options.width + "px", height: this.options.height + "px", position: "relative" });
            this.content = document.createElement("DIV");
            this.content.className = this.options.className;
            this.content.cssText = "width:" + this.options.width + "px;height:" + this.options.height + "px;cursor:move;position:absolute;";
            this.contentHolder = document.createElement("DIV");
            this.contentHolder.style.width = this.options.width + 'px';
            this.contentHolder.style.height = this.options.height + 'px';
            for (var item = 0, i = 1, l = this.data.length; item < l; ++item, ++i) {
                var contentHolderUnit = document.createElement("DIV");
                contentHolderUnit.className = "contentHolderUnit";
                contentHolderUnit.setAttribute("ref", i);
                contentHolderUnit.setAttribute("id", 'contentHolderUnit' + (i));
                var unitItem = '<a href="' + this.data[item].url + '" target="_blank">';
                unitItem += '<img src="' + this.data[item].img + '" alt="' + this.data[item].title + '"/>';
                unitItem += '</a>';
                contentHolderUnit.innerHTML = unitItem;
                this.contentHolder.appendChild(contentHolderUnit);
            }
            this.content.appendChild(this.contentHolder);
            this.parent.append(this.content);
            this.parent.css({ overflow: 'hidden' });
            this.initContent();
            this.bind();
            this.start();
        },
        initContent: function () {
            contentHolderUnit = this.parent.find(".contentHolderUnit");
            contentHolderUnit.css({ width: '0px', height: '0px', opacity: 0, left: this.options.width / 2 + 'px', zIndex: 0 });
            this.parent.find(".contentHolderUnit:nth-child(" + this.pageNow + ")").css({ width: this.pageNowWidth + "px", height: this.pageNowHeight + "px", opacity: 1, left: this.pageNowLeft + 'px', zIndex: 3, marginTop: 0 });
            var pre = this.pageNow > 1 ? this.pageNow - 1 : this.total;
            var next = this.pageNow == this.total ? 1 : this.pageNow + 1;
            var pre2 = pre > 1 ? pre - 1 : this.total;
            var next2 = next == this.total ? 1 : next + 1;
            this.parent.find(".contentHolderUnit:nth-child(" + pre + ")").css({ opacity: this.opacity, left: this.preLeft + 'px', height: this.page2Height + "px", width: this.page2Width + "px", zIndex: 2,marginTop:'40px'});
            this.parent.find(".contentHolderUnit:nth-child(" + next + ")").css({ opacity: this.opacity, left: this.nextLeft + 'px', height: this.page2Height + "px", width: this.page2Width + "px", zIndex: 2, marginTop: '40px' });
            this.parent.find(".contentHolderUnit:nth-child(" + pre2 + ")").css({ opacity: this.opacity, left: this.pre2Left + 'px', height: this.page3Height + "px", width: this.page3Width + "px", zIndex: 1, marginTop: '40px' });
            this.parent.find(".contentHolderUnit:nth-child(" + next2 + ")").css({ opacity: this.opacity, left: this.next2Left + 'px', height: this.page3Height + "px", width: this.page3Width + "px", zIndex: 1, marginTop: '40px' });
        },
        bind: function () {
            this.lists = this.parent.find(".contentHolderUnit");
            var _this = this;
            this.parent.mouseover(function () {
                _this.stop();
            });
            this.parent.mouseout(function () {
                _this.start();
            });
            _this.lists.click(function (e) {
                var ref = parseInt(this.getAttribute("ref"));
                if (_this.pageNow == ref) {
                    return true;
                } else {
                    e.preventDefault();
                }
                if (_this.pageNow < ref) {
                    var rightAbs = ref - _this.pageNow;
                    var leftAbs = _this.pageNow + _this.total - ref;
                } else {
                    var rightAbs = _this.total - _this.pageNow + ref;
                    var leftAbs = _this.pageNow - ref;
                }
                if (leftAbs < rightAbs) {
                    dir = "right";
                } else {
                    dir = "left";
                }

                _this.turnpage(ref, dir);

            });
        },
        start: function () {
            var _this = this;
            if (_this.timerId) _this.stop();
            _this.timerId = setInterval(function () {
                if (_this.options.direct == "left") {
                    _this.turn("left");
                } else {
                    _this.turn("right");
                }
            }, _this.options.delay);
        },
        stop: function () {
            clearInterval(this.timerId);
        },
        turn: function (dir) {
            var _this = this;

            if (dir == "right") {
                var page = _this.pageNow - 1;
                if (page <= 0) page = _this.total;
            } else {
                var page = _this.pageNow + 1;
                if (page > _this.total) page = 1;
            }
            _this.turnpage(page, dir);
        },
        turnpage: function (page, dir) {
            var _this = this;
            if (_this.locked) return false;
            _this.locked = true;
            if (_this.pageNow == page) return false;
            var run = function (page, dir, t) {
                var pre = page > 1 ? page - 1 : _this.total;
                var next = page == _this.total ? 1 : page + 1;
                var pre2 = pre - 1 >= 1 ? pre - 1 : _this.total;
                var next2 = next + 1 > _this.total ? 1 : next + 1;
                var pre3 = pre2 - 1 >= 1 ? pre2 - 1 : _this.total;
                var next3 = next2 + 1 > _this.total ? 1 : next2 + 1;
                var pre4 = pre3 - 1 >= 1 ? pre3 - 1 : _this.total;
                var next4 = next3 + 1 > _this.total ? 1 : next3 + 1;


                if (dir == 'left') {
                    _this.parent.find(".contentHolderUnit:nth-child(" + page + ")").css({ zIndex: 4 });
                    if (page - _this.pageNow == 2) {
                        _this.parent.find(".contentHolderUnit:nth-child(" + pre3 + ")").css({ zIndex: 1 });
                        _this.parent.find(".contentHolderUnit:nth-child(" + pre2 + ")").css({ zIndex: 2 });
                        _this.parent.find(".contentHolderUnit:nth-child(" + pre + ")").css({ zIndex: 3 });
                    }
                    //alert(page+","+pre+","+pre2+","+pre3+","+pre4);
                    _this.parent.find(".contentHolderUnit:nth-child(" + pre3 + ")").animate({ opacity: 0, left: _this.disappearLeft + 'px', width: _this.page3Width + "px", height: _this.page3Height + "px", zIndex: 1, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + pre4 + ")").animate({ opacity: 0, left: _this.disappearLeft + 'px', width: _this.page3Width + "px", height: _this.page3Height + "px", zIndex: 0, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + page + ")").animate({ opacity: 1, left: _this.pageNowLeft + 'px', height: _this.pageNowHeight + "px", width: _this.pageNowWidth + "px", zIndex: 4, marginTop:'0px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + pre + ")").animate({ opacity: _this.opacity, left: _this.preLeft + "px", height: _this.page2Height + "px", width: _this.page2Width + "px", zIndex: 3, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + next + ")").animate({ opacity: _this.opacity, left: _this.nextLeft + "px", height: _this.page2Height + "px", width: _this.page2Width + "px", zIndex: 3, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + pre2 + ")").animate({ width: _this.page3Width + "px", height: _this.page3Height + "px", opacity: _this.opacity, left: _this.pre2Left + 'px', zIndex: 2, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + next2 + ")").animate({ width: _this.page3Width + "px", height: _this.page3Height + "px", opacity: _this.opacity, left: _this.next2Left + 'px', zIndex: 2, marginTop: '40px' }, t, "", function () { _this.locked = false; });

                } else {
                    _this.parent.find(".contentHolderUnit:nth-child(" + page + ")").css({ zIndex: 4 });
                    if (page - _this.pageNow == -2) {
                        _this.parent.find(".contentHolderUnit:nth-child(" + next3 + ")").css({ zIndex: 1 });
                        _this.parent.find(".contentHolderUnit:nth-child(" + next2 + ")").css({ zIndex: 2 });
                        _this.parent.find(".contentHolderUnit:nth-child(" + next + ")").css({ zIndex: 3 });
                    }
                    _this.parent.find(".contentHolderUnit:nth-child(" + next3 + ")").animate({ width: _this.page3Width + "px", height: _this.page3Height + "px", opacity: 0, left: _this.disappearRight + 'px', zIndex: 1, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + next4 + ")").animate({ width: _this.page3Width + "px", height: _this.page3Height + "px", opacity: 0, left: _this.disappearRight + 'px', zIndex: 0, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + page + ")").animate({ opacity: 1, left: _this.pageNowLeft + 'px', height: _this.pageNowHeight + "px", width: _this.pageNowWidth + "px", zIndex: 4, marginTop: '0px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + next + ")").animate({ opacity: _this.opacity, left: _this.nextLeft + "px", height: _this.page2Height + "px", width: _this.page2Width + "px", zIndex: 3, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + pre + ")").animate({ opacity: _this.opacity, left: _this.preLeft + "px", height: _this.page2Height + "px", width: _this.page2Width + "px", zIndex: 3, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + next2 + ")").animate({ width: _this.page3Width + "px", height: _this.page3Height + "px", opacity: _this.opacity, left: _this.next2Left + 'px', zIndex: 2, marginTop: '40px' }, t);
                    _this.parent.find(".contentHolderUnit:nth-child(" + pre2 + ")").animate({ width: _this.page3Width + "px", height: _this.page3Height + "px", opacity: _this.opacity, left: _this.pre2Left + 'px', zIndex: 2, marginTop: '40px' }, t, "", function () { _this.locked = false; });

                }

                _this.pageNow = page;

            };
            run(page, dir, _this.options.speed);
        }

    };
    window.posters = posters;
})(jQuery);
