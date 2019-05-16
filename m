From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Thu, 16 May 2019 15:23:24 -0600
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] Update verbose help and
	show_range()
In-Reply-To: <20190511230310.4438-1-skunberg.kelsey@gmail.com>
References: <20190511230310.4438-1-skunberg.kelsey@gmail.com>
Message-ID: <20190516212327.4310-1-skunberg.kelsey@gmail.com>
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

Changes since v2:
  * Patch 1: Update commit log to imperative mood

  * Patch 2: Fix logical error
	Previous:
	(base > limit || verbose < 3)
	New:
	(base > limit && verbose < 3)

  * Patch 3: Fix logical error
	Previous:
	base > limit
	New:
	base <= limit

Kelsey Skunberg (3):
  lspci: Include -vvv option in help
  lspci: Remove unnecessary !verbose check in show_range()
  lspci: Replace output for bridge with empty range from 'None' to
    '[empty]'

 lspci.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

--
2.20.1
