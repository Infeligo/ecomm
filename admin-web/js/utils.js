// Utility functions

function ensureArray(obj) {
    if (!obj) return [];
    else if (obj.length) return obj;
    else return [ obj ];
}

_.templateSettings = {
    evaluate    : /<@([\s\S]+?)@>/g,
    interpolate : /<@=([\s\S]+?)@>/g,
    escape      : /<@-([\s\S]+?)@>/g
};

$(function () {
    $('.date').datepicker();
    $('.date.today').datepicker('setValue', new Date());
});
