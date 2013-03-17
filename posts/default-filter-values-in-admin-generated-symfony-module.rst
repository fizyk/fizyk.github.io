.. title: Default filter values in admin-generated symfony module
.. slug: default-filter-values-in-admin-generated-symfony-module
.. date: 2011/02/22 22:02:56
.. tags: symfony, php, admin generator
.. link:
.. description: Admin generated backend modules are very useful, they are generating with all necessary code, they have some layout, all necessary actions are there and are easy to be modified. recently. You can even add default filter setting, although it's not as simple as editing generator.yml.

Admin generated backend modules are very useful, they are generating
with all necessary code, they have some layout, all necessary actions
are there and are easy to be modified. recently. You can even add
default filter setting, although it's not as simple as editing
**generator.yml**.

So, you can set default filter? Certainly not through table\_method,
this setting is for basic query, admin's filter is operating on later.
To set default filter values, there are two methods you might want to
overwrite. These methods are located in your module's
**moduleGeneratorConfiguration** class located in your module's lib
folder.

First method is getFilterForm(), which is used to serve filter form to
be generated:

::

    public function getFilterForm($filters)
    {
        if(!array_key_exists('field_name', $filters))
        {
            $filters['field_name'] = 'value';
        }
        return parent::getFilterForm($filters);
    }

Variable named **$filters** is array containing default values for
filter form. Once we use filter, values get passed through filters to
form, so it could show consistent field values. But if the field doesn't
have value, we could set default one here. But that method only sets us
default value on filter. If that's what you want, you got it,
otherwise... overwriting this method is completely unnecessary.

Second method to look at is **getFilterDefaults()**, which is actually
used to get default values for filter. These values are then applied
both to filter form, and the query from **table\_method**.

::

    public function getFilterDefaults()
    {
        return array('field_name' => 'value');
    }

Method returns an array, that has same construction as the **$filter**
variable from **getFilterForm** method. Now you can enjoy your admin's
module list filtered by default values.
