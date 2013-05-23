# Search for a pattern in your log files

[![Code Climate](https://codeclimate.com/github/garethrees/hunter.png)](https://codeclimate.com/github/garethrees/hunter)

I generally use a tracking gif in the mass emails I send out to get a rough idea of the open rate. It's not a small task to open each log file, filter it and then count each occurance of the gif.

Hunter does this for you!

**WARNING:** Hunter has <u>**no tests**</u>. This was thrown together, so use with caution. Contributions are very welcome.

## How to Use

### Install

		gem install hunter

### Use

Create a new hunt for the string you want to match:

		hunt = Hunter::Hunt.new('/images/email/tracking.gif')

#### Look in the current log

		hunt.look_in('/var/log/httpd/access.log')

#### Look in an archived log

		hunt.look_in_archived('/var/log/httpd/log_archive/access.log.1.gz')

#### Look through a folder of archived logs

		hunt.look_through_archive('/var/log/httpd/log_archive')

#### Look through a folder of archived logs for a specific log type

		hunt.look_through_archive('/var/log/httpd/log_archive', 'access.log')

## Known Issues

* "Archived" means with the file extension `.gz` – no other compression formats are supported
* `look_through_archive()` relies on your log appending a digit after the original filename and then compressing to `.gz`
	* e.g. `access.log` becomes `access.log.1.gz`
* **There are no tests**
