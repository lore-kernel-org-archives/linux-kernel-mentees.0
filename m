Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E94B226165
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 30 Jun 2025 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272556; cv=none; b=uWiyJCtlQwG+yWcdX2a5++KgnNbNe/zYAkFT+gMOvCyvbY79SBdv5JP/i3mrwgSm6T5Hvt7DiiPBG1+S9hfIPHQfs0NTAqqGKIc/lhgoDfKKwISqKlNZO0v1C4hdIyhHEuvy/+K6dcRtuigxW5t0SA8zQrkcJ6aEJ8Zu9tQKU1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272556; c=relaxed/simple;
	bh=hbl6aKOFyrCpAMd3O9ukAhgw6X3wjq6glq0MIKEE2gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ErGUBPFysG91mUBF9ojvcghNbT9geuCUuAs0dB0i9q79NKEWFdFUd1uxKIo2fblix5T+4aeTf20lC0Ts49QvxcvPa4YvSyBohEUZ1ZePGIQntgS/XvX/oY4c4oimDnsCDhtRxCYhba1rA9ylyn80pduVvw23Pms8igTamTkn/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kllonPT+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kllonPT+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747fba9f962so3846346b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 30 Jun 2025 01:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272554; x=1751877354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4plGK5bq5RnwaM8ctVOu6ZgjjUnMHD+gm6XjSI880o=;
        b=kllonPT+UJxHv3YQPXL/Js53/DdRrCkc9H1ryoCa/ir2xLotNKAmFvvwMIW0QfL75s
         iwKNHtSf0dDsv9vBk4BA/EE0hXrma6YHJgH9n5tFkxcNXIYRmNfjfFZwJ96s8rl4eE/w
         m13ZkbZVjhMsQFzz60fFST7IONZ6BLhZ8YFQ7ih8ouyby3UzAh6VDaZ7PB8krHIgrTFn
         BGyBwinwqMlfbwW9+nU3YcQhRK3TTBC2yShN2YZ5XxyvHFP7+RrcliBxrhuTF6zjfTx0
         VchGFvrNSxgWBJAQ0JFekMvoyDHC+pwkIMc5FWIvUTt593T2MQF5IvBgbb7SiZTv6f9t
         Airw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272554; x=1751877354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4plGK5bq5RnwaM8ctVOu6ZgjjUnMHD+gm6XjSI880o=;
        b=CXti6xeMpvea4pX0KrFB3caq57E9nSxlSopPrfNbEHAo7ma0+yWWDbPBU15x8AJTG8
         22lOYAN4d8jVcKivvb5A4OWJhbElmBxNHo6yoBRYP3U81rWb9SENXdD/yISlTuMT9xQf
         +wlM7tk32PAPdH6O2eMBiRULQvMt5Mz3h9u7dLBV/4Rl5ysHjnXVzrjE6lNKhOfsscNx
         CbFM+Ozers1aadbhd1g+rlDmudjjvy9zmtWqyp02UJjS7BdXEOCITNfI8j48vNnygffP
         XzePOHvMcmLQPVEE/VCUazMypL1hsIlr+Eboncn+1SXxt7t6Wk96qCELcrV4FVgWdn4L
         Sf6g==
X-Forwarded-Encrypted: i=1; AJvYcCV/fdh2AaiBHFmrvxeXSXn/6I0RiyrXCSttG6NQg7wPVoJg/CugbJFCIlj3wq47EgJWS+CUBK3cI8Y/l7Ha4B70kxfSUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0OOKa0NKW0Cm6EIjQanawVj0Y/W60Xa++/Sl+QA6UGpmKhJ99
	QoVE6KDV0n4uHLRyNcvfKWOCDjL0/mvG7D6j85CZ1ppcncmynR5CUJc1
X-Gm-Gg: ASbGncvqFekL3WAjbp8PPIAGawNL/0oEnJuRYfa/t5bcJ01MD+v/d6uSdjEEiv0ahzS
	sYf6F/84Ymqb1lUFoV5rUrU4RzrcJ3UoDDT+9YDDhpjfZIPOA18nUXaMoWZXoz/05T2vFhV3Y8z
	UCTbIEa7w9dTJ0skLLO1xhRa+3LuPuv9zNLp2F4AFTbLb9F8KMEzO2m4eh2DZvJUptcw7TByhPg
	iGG3D5TuPmJnIzoebN1YyJIxRK5dvolecFiTxS5MufEPx/D/9dIxcd5ocq6oDdvcJbGhoya4r0G
	0OrrgXQ46lUd4HDnCDMsgqlXfPOZnHxPYAU8om8REnqklVqw3PSzT1QLm3Wga5kgoF7d3yE6pvT
	CMm/VxQ==
X-Google-Smtp-Source: AGHT+IGM9wfHSeMMXfeBZheGggepk2ZqiWnb9R0ko13yd/AL0hGgh5N+CjMk8e3oprn88leMOC/mQA==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-74af7aef473mr17756726b3a.10.1751272553630;
        Mon, 30 Jun 2025 01:35:53 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c31:3031:bed6:689:68b3:ea6e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ebcb5sm8320722b3a.151.2025.06.30.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:35:53 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: ocfs2-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Cc: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	pvmohammedanees2003@gmail.com,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	skhan@linuxfoundation.org,
	stable@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+e0055ea09f1f5e6fabdd@syzkaller.appspotmail.com,
	Junxiao Bi <junxiao.bi@oracle.com>,
	Changwei Ge <gechangwei@live.cn>,
	Gang He <ghe@suse.com>,
	Jun Piao <piaojun@huawei.com>,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH 5.15.y] ocfs2: fix deadlock in ocfs2_get_system_file_inode
Date: Mon, 30 Jun 2025 14:05:42 +0530
Message-ID: <20250630083542.10121-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammed Anees <pvmohammedanees2003@gmail.com>

[ Upstream commit 7bf1823e010e8db2fb649c790bd1b449a75f52d8 ]

syzbot has found a possible deadlock in ocfs2_get_system_file_inode [1].

The scenario is depicted here,

	CPU0					CPU1
lock(&ocfs2_file_ip_alloc_sem_key);
                               lock(&osb->system_file_mutex);
                               lock(&ocfs2_file_ip_alloc_sem_key);
lock(&osb->system_file_mutex);

The function calls which could lead to this are:

CPU0
ocfs2_mknod - lock(&ocfs2_file_ip_alloc_sem_key);
.
.
.
ocfs2_get_system_file_inode - lock(&osb->system_file_mutex);

CPU1 -
ocfs2_fill_super - lock(&osb->system_file_mutex);
.
.
.
ocfs2_read_virt_blocks - lock(&ocfs2_file_ip_alloc_sem_key);

This issue can be resolved by making the down_read -> down_read_try
in the ocfs2_read_virt_blocks.

[1] https://syzkaller.appspot.com/bug?extid=e0055ea09f1f5e6fabdd

[ Backport to 5.15: context cleanly applied with no semantic changes.
Build-tested. ]

Link: https://lkml.kernel.org/r/20240924093257.7181-1-pvmohammedanees2003@gmail.com
Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Reported-by: <syzbot+e0055ea09f1f5e6fabdd@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=e0055ea09f1f5e6fabdd
Tested-by: syzbot+e0055ea09f1f5e6fabdd@syzkaller.appspotmail.com
Cc: Mark Fasheh <mark@fasheh.com>
Cc: Joel Becker <jlbec@evilplan.org>
Cc: Junxiao Bi <junxiao.bi@oracle.com>
Cc: Changwei Ge <gechangwei@live.cn>
Cc: Gang He <ghe@suse.com>
Cc: Jun Piao <piaojun@huawei.com>
Cc:  <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 fs/ocfs2/extent_map.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/extent_map.c b/fs/ocfs2/extent_map.c
index 70a768b623cf..f7672472fa82 100644
--- a/fs/ocfs2/extent_map.c
+++ b/fs/ocfs2/extent_map.c
@@ -973,7 +973,13 @@ int ocfs2_read_virt_blocks(struct inode *inode, u64 v_block, int nr,
 	}
 
 	while (done < nr) {
-		down_read(&OCFS2_I(inode)->ip_alloc_sem);
+		if (!down_read_trylock(&OCFS2_I(inode)->ip_alloc_sem)) {
+			rc = -EAGAIN;
+			mlog(ML_ERROR,
+				 "Inode #%llu ip_alloc_sem is temporarily unavailable\n",
+				 (unsigned long long)OCFS2_I(inode)->ip_blkno);
+			break;
+		}
 		rc = ocfs2_extent_map_get_blocks(inode, v_block + done,
 						 &p_block, &p_count, NULL);
 		up_read(&OCFS2_I(inode)->ip_alloc_sem);
-- 
2.49.0

