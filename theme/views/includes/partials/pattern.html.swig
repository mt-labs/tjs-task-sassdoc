{# #}
{% include '../annotations/name.html.swig' %}
{# #}

{#
<h3 class="item__heading">
  <a class="item__name" href="#{{ item.context.type }}-{{ item.context.name }}">
    {{- item.context.name | replace('-', ' ', 'g') | capitalize -}}
  </a>
</h3>
{# #}

{#
<h3 class="item__heading">
  <a class="item__name" href="#{{ item.context.type }}-{{ item.context.name }}">
    {{- item.description | striptags -}}
  </a>
</h3>
{# #}

{% if item.since.length == 1 %}
  <span class="item__since">Since {{ item.since[0].version }}{% if item.since[0].description %} &mdash; {{ item.since[0].description }}{% endif %}</span>
{% endif %}

{# #}
{% include '../annotations/description.html.swig' %}
{# #}

{# }
{% if item.description %}
  <div class="item__description">{{ item.description|safe }}</div>
{% endif %}
{# #}

{% if item.example.length > 0 %}
  {#
  <h3 class="item__sub-heading">Example</h3>
  {# #}

  <div class="item__pattern-preview">
    {% for example in item.example %}
      {{ example.code|raw }}
    {% endfor %}
  </div>

  <div class="item__pattern-code  pattern-grid">
    <div class="pattern-grid__group">
      {% for example in item.example %}
      <div class="item__example  pattern-grid__item  example">
        {% if example.description %}
        <div class="example__description">{{ example.description|safe }}</div>
        {% endif %}
        <pre class="example__code  language-{{ example.type }}"><code>{{ example.code|escape|safe }}</code></pre>
      </div>
      {% endfor %}
    </div>
    <div class="pattern-grid__group">
      <div class="item__example  pattern-grid__item  example">
        <pre class="example__code  language-scss"><code>.{{ item.context.name }} { {{- item.context.code -}} }</code></pre>
      </div>
    </div>
  </div>
{% endif %}

