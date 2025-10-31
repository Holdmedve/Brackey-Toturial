class_name TestSuite
extends GdUnitTestSuite

func test__hitbox_is_hit__health_is_decreased() -> void:
    var hitbox_component = HitboxComponent.new()
    var health_component = HealthComponent.new()
    hitbox_component.health_component = health_component
    health_component.health = 10

    var attack = Attack.new(2)
    hitbox_component.damage(attack)

    assert_int(health_component.health).is_equal(8)
    hitbox_component.queue_free()
    health_component.queue_free()
    attack.queue_free()
