{% if page.comments %}
  {% if theme.disqus.enable %}
    {% include 'disqus.swig' %}
  {% elif theme.livere_uid %}
    {% include 'livere.swig' %}
  {% elif theme.changyan.enable and theme.changyan.appid and theme.changyan.appkey %}
    {% include 'changyan.swig' %}
  {% elif theme.gitment.enable and theme.gitment.client_id %}
    {% include 'gitment.swig' %}
  {% elif theme.gitalk.enable %}
    {% include 'gitalk.swig' %}
  {% endif %}
{% endif %}

{# Valine Comment Count #}
{% if theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
  {% include 'valine.swig' %}
{% endif %}
{% include 'gitalk.swig' %}
