From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 13 Oct 2019 23:17:14 -0500
Subject: [Linux-kernel-mentees] [PATCH 1/8] cec-follower: fix analog tuner
	device info update
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
Message-ID: <20191014041721.52025-2-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191014041714.JRc7fu-mlKGI8_JYrKsMBkKAupy0bn2I-PzaRw2Ocec@z>

With the addition of digital tuner control support, analog update
needs to set is_analog and tuner_display_info.

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 46acccf4..b3b20b89 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -131,6 +131,8 @@ static void analog_update_tuner_dev_info(struct node *node, unsigned int idx)
 	unsigned int freq_khz;
 
 	node->state.freq_idx = idx;
+	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
+	info->is_analog = true;
 	info->analog.ana_bcast_type = node->state.freq_idx / tot_freqs;
 	info->analog.bcast_system =
 		(node->state.freq_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
-- 
2.23.0
