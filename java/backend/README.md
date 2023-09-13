# Especificaciones para el campo `antibioticsInfoJson`

En el endpoint `POST /results/save` del backend, se espera que el campo `antibioticsInfoJson` siga el siguiente formato:

```json
{
	"id_antibiotico_1": {
		"quantity": ##,
		"operator": "<,>,="
	},
	"id_antibiotico_2": {
		"quantity": ##,
		"operator": "<,>,="
	},
	// ...
}
```

Donde:

- `id_antibiotico_1`, `id_antibiotico_2`, etc. deben ser los identificadores únicos de los antibióticos correspondientes en la base de datos.

- `quantity` es el valor numérico asociado a la cantidad del antibiótico.

- `operator` es el operador de comparación que se aplica a la cantidad del antibiótico. Puede tomar uno de los siguientes valores: `<` (menor que), `>` (mayor que) o `=` (igual a).

Se deben incluir todas las entradas correspondientes a los antibióticos que existan en el sistema, siempre y cuando se disponga del identificador del antibiótico.

Ejemplo:

```json
{
	"1": {
		"quantity": 500,
		"operator": ">"
	},
	"3": {
		"quantity": 100,
		"operator": "<"
	},
	"2": {
		"quantity": 200,
		"operator": "="
	}
}
```

Por favor, asegúrate de que los identificadores de los antibióticos y los valores de cantidad sean proporcionados correctamente.
## Modelo de clases 12/09/2023
![Modelo de clases](https://github.com/Juanipis/proyecto_medico/blob/feat/images/java/backend/class_model.png?raw=true)
## Modelo endidad relación 12/09/2023
![Moelo entidad relación](https://github.com/Juanipis/proyecto_medico/blob/feat/images/java/backend/model_entity_relationship.png?raw=true)

