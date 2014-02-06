About
================================================================================

The `ipaddresses` module adds a custom `ipaddresses()` function. It returns
a hash of available IP addresses with the interface as the key.

```puppet
	$all_ips = ipaddresses()
```

The `ipaddresses()` function works by checking `facter` fact values. It's
intended to be computationally light, and simple to use. There are no passable
parameters, and always returns a hash.

Depending on use, it's recommended - but not required - to include the
`puppet/stdlib` library. This makes it trivial to turn the `ipaddresses()`
returned hash into other values:

```puppet
	$all_ips          = ipaddresses()
	$all_ips_no_local = delete($all_ips, 'lo')
	$external_ips     = unique(values($all_ips_no_local))
	# value is ['4.4.8.8', '192.168.0.5']
```

License
================================================================================

All code written by me is released under MIT license. See the attached
license.txt file for more information, including commentary on license choice.
