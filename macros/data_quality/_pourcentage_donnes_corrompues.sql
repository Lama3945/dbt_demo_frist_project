{% test _pourcentage_donnes_corrompues(model, column_name,seuil_montant_valide) %}

{{ config(severity = 'warn') }}

select *
from {{ model }} 
WHERE IFNULL({{ column_name }},0) >= {{ seuil_montant_valide}}

{% endtest %}