{% if item.example.length > 0 %}
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
