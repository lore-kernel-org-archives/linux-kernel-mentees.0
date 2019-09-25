From: bnvandana at gmail.com (Vandana BN)
Date: Wed, 25 Sep 2019 13:57:28 +0530
Subject: [Linux-kernel-mentees] [PATCH v7 0/2] vivid: Add metadata capture
	support
In-Reply-To: <bbef8158-e603-7f80-308a-129d76c68a1b@xs4all.nl>
References: <bbef8158-e603-7f80-308a-129d76c68a1b@xs4all.nl>
Message-ID: <20190925082730.15550-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This Patch series adds support for emulation of metadata capture in vivid
driver.
UVCH metadata format is supported as it is widely used in webcams.
https://hverkuil.home.xs4all.nl/spec/uapi/v4l/pixfmt-meta-uvc.html

Regards,
Vandana.

Hans Verkuil (1):
  vivid:  fixes for v4l2-compliance issues.

Vandana BN (1):
  vivid: Add metadata capture support

 drivers/media/platform/vivid/Makefile         |   2 +-
 drivers/media/platform/vivid/vivid-core.c     | 107 +++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  14 ++
 drivers/media/platform/vivid/vivid-ctrls.c    |  64 ++++++
 .../media/platform/vivid/vivid-kthread-cap.c  |  52 ++++-
 drivers/media/platform/vivid/vivid-meta-cap.c | 201 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-cap.h |  29 +++
 drivers/media/platform/vivid/vivid-vid-cap.c  |   5 +-
 8 files changed, 462 insertions(+), 12 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.h

-- 
2.17.1
