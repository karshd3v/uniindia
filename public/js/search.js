/**
 *  jQuery List Searcher - v1.0
 *  A jQuery plugin to search through an HTML list using a form input - an alternative to autocomplete, especially
 *  useful where the only function of the page is to select from the list.
 *
 *  Plugin page: https://github.com/HeatherEvens/list-searcher
 *  Author page: http://heatherevens.me.uk
 *
 *  Made by Heather Evens
 *  Under MIT License
 *
 *  Thanks to:
 *  *  jQuery Boilerplate - v3.3.1
 *  *  A jump-start for jQuery plugins development.
 *  *  http://jqueryboilerplate.com
 *  *
 *  *  Made by Zeno Rocha
 *  *  Under MIT License
 */
;
(function ($, window, document, undefined) {

  // Create the defaults
  var pluginName = "listSearcher",
      initialized = false,
      defaults = {
        search_input: ".search",
        list_element: "> li",
        search_element_text: true,
        search_data: "name",
        visibility_data: "he_list_vis",
        animate: false,
        delay: 0.01,
        before_update: function() { return true; },
        after_update: function() { return true; },
        debug: false
      };

  function Plugin(element, options) {
    this.element = element;
    this.settings = $.extend({}, defaults, options);
    this._defaults = defaults;
    this._name = pluginName;
    this.init();
  }

  Plugin.prototype = {
    init: function () {
      // find the elements used by this plugin
      // the outer list wrapper
      var $list = $(this.element);
      // the search input
      var $search = $('' + this.settings['search_input']);
      // the inner list items (children of the outer list wrapper)
      var $elems = $list.find(''+ this.settings['list_element']);

      // if all these elements exist, initialize the plugin
      if ($list.length > 0 && $search.length > 0 && $elems.length > 0) {
        this.initialized = true;

        // add a holder for the current visibility data to each list item
        $elems.attr('data-'+this.settings['visibility_data'],'visible');
        var $parent = this;

        // when the user enters data in the search box, update the list as they type
        $search.keyup(function() { $parent.updateList($parent.element,$parent.settings) });
        if (this.settings['debug']) {
          console.log('init list searcher: ok');
        }
      }
      else if (this.settings['debug']) {
        if ($list.length <= 0)
          console.log('failed to init list searcher: verify list element exists');
        else if ($search.length <= 0)
          console.log('failed to init list searcher: verify search input element exists');
        else
          console.log('failed to init list searcher: list contains no items');
      }
    },
    updateList: function () {
      // call the callback function for before an update - if it returns false do not update
      if (this.initialized && this.settings['before_update'].call())
      {
        // for ease of reference, grab some elements:
        // the outer list element
        var $list = $(this.element);
        // the search box input
        var $search = $('' + this.settings['search_input']);
        // the inner list item element (must be located within outer)
        var $elems = $list.find(''+ this.settings['list_element']);

        // grab some other settings: 1 are we searching the element text or a data-attribute on the element tag?
        var search_element_text = this.settings['search_element_text'];
        // if above is false, what data-attribute do we look for?
        var data_selector = this.settings['search_data'];

        // escape any special characters for regular expression (we assume the user searches with plain text)
        var plain_search_text = $search.val().replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
        // create a regular expression to search elements - case insensitive
        var search_val = new RegExp(plain_search_text, "gi");

        // the data-attribute to use to store visibility data. Where animate is true, this is more reliable than
        // checking for visibility, as depending on the stage of the animation it may appear to be visible when it
        // is not.
        var visibility_data = this.settings['visibility_data'];

        // animation settings: current animation delay
        var delay = 0;
        // the amount to increase delay for each animation - especially useful for large lists
        var delayStep = this.settings['delay'] * 1000;
        // do we animate anyway? true = yes, false = no
        var animate = this.settings['animate'];

        // loop through list elements
        $elems.each(function() {
          // do we want to show this? default yes
          var showthis = true;
          if ( ! search_element_text && ! $(this).data(data_selector).match(search_val))
          {
            // if not searching by element text and the data-selector doesn't match the search regexp, do not show
            showthis = false;
          }
          else if (search_element_text && ! $(this).text().match(search_val))
          {
            // if searching by element text and the element text doesn't match the search regexp, do not show
            showthis = false;
          }
          // if the element is not currently visible and should be shown, make it visible
          if ($(this).data(visibility_data) != 'visible' && showthis)
          {
            $(this).data(visibility_data,'visible');
            if (animate)
            {
              $(this).delay(delay).show('blind');
              delay += delayStep;
            }
            else
            {
              $(this).css('display','');
            }
          }
          // if the element is currently visible and should not be shown, hide it
          else if ( $(this).data(visibility_data) === 'visible' && !showthis)
          {
            $(this).data(visibility_data,'hidden');
            if (animate)
            {
              $(this).delay(delay).hide('blind');
              delay += delayStep;
            }
            else
            {
              $(this).css('display','none');
            }
          }
        });
        // call the callback function for after updating the list
        this.settings['after_update'].call(this);
      }
    }
  };
  $.fn[ pluginName ] = function (options) {
    return this.each(function () {
      if (!$.data(this, "plugin_" + pluginName)) {
        $.data(this, "plugin_" + pluginName, new Plugin(this, options));
      }
    });
  };

})(jQuery, window, document);
