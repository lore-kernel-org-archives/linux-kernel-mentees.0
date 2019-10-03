From: bnvandana@gmail.com (Vandana BN)
Date: Thu,  3 Oct 2019 16:38:56 +0530
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] vivid: Metadata output support
In-Reply-To: <9439560a-dbc7-9aeb-a27b-314ace85dc81@xs4all.nl>
References: <9439560a-dbc7-9aeb-a27b-314ace85dc81@xs4all.nl>
Message-ID: <20191003110858.7120-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191003110856.xJD0w8okHVfiLSTke3YgDzf4b9ySgxyGeEoY0kH6kg8@z>

This patch adds metadata output support in vivid driver.
New metadata format V4L2_META_FMT_VIVID is added,
which is used to set brightness, contrast, sturation and hue.
V2 has changes in metadata output structure and metadata format define.

Regards,
Vandana.

Vandana BN (2):
  v4l2-core: Add new metadata format
  vivid: Add metadata output support

 drivers/media/platform/vivid/Makefile         |   2 +-
 drivers/media/platform/vivid/vivid-core.c     |  98 +++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  10 +
 drivers/media/platform/vivid/vivid-ctrls.c    |  14 +-
 .../media/platform/vivid/vivid-kthread-out.c  |  50 ++++-
 drivers/media/platform/vivid/vivid-meta-out.c | 174 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-out.h |  25 +++
 drivers/media/platform/vivid/vivid-vid-out.c  |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 10 files changed, 368 insertions(+), 12 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h

-- 
2.17.1
