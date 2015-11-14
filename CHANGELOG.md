# Change Log

All notable changes to this project will be documented in this
file. This change log is based upon [keep-a-changelog]. This project adheres to
[Semantic Versioning].

## [Unreleased]

## [1.3.1] - 2014-11-14

### Fixed

- Emailed activation link now works.

## [1.3.0] - 2014-11-14

### Added

- [**feature**] Microposts, like posts just micro. You can create, view and
  delete them.
- [**feature**] Image upload, when creating microposts you can now upload a
                picture as well.

## [1.1.1] - 2015-11-10

### Added

- [**feature**] Forgot password, you can now request a password change and
  you will get the link to change it via email.

### Changed

- Sign up, you must now activate your account via email before using it.

### Fixed

- User index now shows only activated users.

## [0.7.2] - 2015-11-07

### Added

- [**feature**] Edit profile, users can now edit their profile data.
- [**feature**] User list, see who else is registered.
- [**role**] Admin, who can delete other user accounts.

### Security

- Non logged in users redirected when attempting to edit user's data.
- Logged in users redirected when attempting to edit other user's data.

## [0.4.0] - 2015-11-05

### Added

- [**feature**] Log in/out, uses can now log in and log out after sign up.
- [**feature**] Remember me, users can now chose to stay logged even if they
                close the browser.

## [0.2.1] - 2015-11-02 [HOTFIX]

### Fixed

- Fixed a broken link to `rubyonrails.org` from rails logo.

## [0.2.0] - 2015-11-02

### Added

- [**feature**] Sign up, users can now sign up and do nothing :)

## [0.1.0] - 2015-10-28

### Added

- Bootstrap 4 Alpha look and feel
- Temp sign up page

## [0.0.1] - 2015-10-23

### Added

- Rails generated project structure.
- README, contains short info about this project.
- CHANGELOG, contains notable changes to this project.
- DEVCORE contains motivation and development details.
- MIT LICENCE
- Static pages: home, about, help, contact.

[keep-a-changelog]: https://github.com/olivierlacan/keep-a-changelog
[Semantic Versioning]: http://semver.org/
[Unreleased]: https://github.com/mbrand12/sample-app/compare/v1.3.1...HEAD
[0.0.1]: https://github.com/mbrand12/sample-app/compare/59d0d68...v0.0.1
[0.1.0]: https://github.com/mbrand12/sample-app/compare/v0.0.1...v0.1.0
[0.2.0]: https://github.com/mbrand12/sample-app/compare/v0.1.0...v0.2.0
[0.2.1]: https://github.com/mbrand12/sample-app/compare/v0.2.0...v0.2.1
[0.4.0]: https://github.com/mbrand12/sample-app/compare/v0.2.1...v0.4.0
[0.7.2]: https://github.com/mbrand12/sample-app/compare/v0.4.0...v0.7.2
[1.1.1]: https://github.com/mbrand12/sample-app/compare/v0.7.2...v1.1.1
[1.3.0]: https://github.com/mbrand12/sample-app/compare/v1.1.1...v1.3.0
[1.3.1]: https://github.com/mbrand12/sample-app/compare/v1.3.0...v1.3.1
