From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Sat, 11 May 2019 17:03:07 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] lspci: Update verbose help
	and show_range()
Message-ID: <20190511230310.4438-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Changes since v1:
  - Expand changes into more patches for easier review.
  - Combine three patches for lspci.c into patchset.

  * Patch 1: "lspci: Include -vvv option in help"
    No changes made. Added to series for review.

  * Patch 2: "lspci: Remove unnecessary !verbose check in show_range()"
    Move into it's own patch since v1. Dead code which checks for
    verbosity to be true.

  * Patch 3: "lspci: Replace output for bridge with empty range from
  * 'None' to '[empty]'
    Patch builds off Patch 2 to change show_range() output to be more
    consistent between each level of verbosity.

Kelsey Skunberg (3):
  lspci: Include -vvv option in help
  lspci: Remove unnecessary !verbose check in show_range()
  lspci: Replace output for bridge with empty range from 'None' to
    '[empty]'

 lspci.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

--
2.20.1
