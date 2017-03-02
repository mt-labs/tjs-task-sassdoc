<section class="main__item  container  item{% if item.alias %}  item--alias{% endif %}{% if 'deprecated'|in(item) %}  item--deprecated{% endif %}" id="{{ group_name }}-{{ item.context.type }}-{{ item.context.name }}">

{% include '../annotations/name.html.swig' %}

{% include '../annotations/deprecated.html.swig' %}

{% include '../annotations/description.html.swig' %}

{% include '../annotations/preview.html.swig' %}

{% if not item.alias and item.context.type !== 'placeholder' %}

  {% for annotation in display.annotations[item.context.type] %}
    {% if annotation !== 'description' %}
    {% set path = '../annotations/' + annotation + '.html.swig' %}
    {% include path %}
    {% endif %}
  {% endfor %}

{% elseif item.context.type === 'placeholder' %}

  {% include '../annotations/pattern.html.swig' %}

{% else %}

  <p>Refer to <a href="#{{ item.context.type }}-{{ item.alias }}">{{ item.alias }}</a>.</p>

{% endif %}

</section>
