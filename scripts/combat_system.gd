extends Node

var entities: Array = []


func register(data: Dictionary):
	print('registering entity')
	for key in data.keys():
		print('key: ' + str(key) + ' value: ' + str(data[key]))
	entities.append(data)


func unregister(entity_id):
	entities = entities.filter(func(e): return e.id != entity_id)


func apply_hit(source_id, target_id):
	print('applying hit between source ' + str(source_id) + ' and target ' + str(target_id))
	var sourceEntity = _get_entity_by_id(source_id)
	var targetEntity = _get_entity_by_id(target_id)

	targetEntity.health -= sourceEntity.attack # this is still fragile, linter should complain upon typo
	if targetEntity.health < 0:
		targetEntity.node.queue_free()



func _get_entity_by_id(id):
	print('lookin for entity ' + str(id))
	for e in entities:
		for key in e.keys():
			print('key: ' + str(key) + ' value: ' + str(e[key]))
		if e.id == id:
			return e
