Feature System
==============
* Rake task needs to be updated to not take an explicit feature but should
either read the features to install from a manifest or some sort of feature
install migration system should be developed.

* Feature "Provides" could include menu and menu links.  This could then
integrate with the menu system allowing features to have pre defined menus.

* The menu's and menu links could then further be visible / useable based upon
features enabled status as well as the permissions.

* A theme system could be developed (and was discussed).  Essentially you
could install themes as well.  Themes would answer to core what regions they
implement.  Widgets of features would then be able to be positioned within these
regions.  A proof of concept of widgets and regions have been developed in the
tukaiz products theme and wombat gem but the regions are just hard coded.

* Core feature system should implement "HOOKS" that plugin / features "can"
implement but wouldn't have to.  An example of where this would be useful is
with registration types.  The feature system can allow modules to "hook in"
registration types.  Essentially the core application would need a registration
strategy and rely on a particular registrable interface that all registration
types should implement.  The core system would ask "Features, do any of you
provide a registration type?".  Each feature that does define a registration
type would answer, "Yes core, I do offer a registration type.  Here is the
information you need about it."

* An interesting scenario may occur when options a site is implementing certain
aspects of a feature e.g the invitation registration type and then the feature
is disabled.  Should all sites that use the invitation feature be switched to
some default?  Should there be a warning to an admin before they disable a
feature that sites are utilizing?  This will most likely need to be considered
on a feature by feature basis but will need to be thought about.

* An "app bootstrap" routine should probably be developed that will ask the
features for their information about what functionalities they offer, example:
the registration types they provide. The answers the features provide should
then be cached during the bootstrap so that further usage of this information
throughout the app is read from the cache instead of being queried for at every
usage point.

* How to handle versioning features?

* Add update task for features.  For example, when a feature has new permissions
added to after it has already been installed, some sort of update functionality
will need to add them into the system.

* Dependencies between features should be defined and enforced somehow.  For
example, if access request relies on invitation, access request should not be
able to be installed if invitation is not available.  If invitation is available
but not installed, installing access request should install invitation first and
then access request.  Beyond installing, enabling and disabling a feature should
respect dependencies as well.

* Sub-features could be another nice addition.  For example, an e-commerce
feature may have multiple checkout flow features, payment features, shopping
cart features.  If you disable the e-commerce feature, it would lock down
functionality of all sub features

* Dependencies within address book on bs2 functionality should be limited and
removed if possible.  In theory an engine should be able to work in any feature
compliant system without knowledge of other models, controllers, etc that the
host application may have.

* as an aside, the patterns and practices outlined here may be useful:
http://stackoverflow.com/questions/10763006/plugin-architecture-in-web-apps-examples-or-code-snippets
