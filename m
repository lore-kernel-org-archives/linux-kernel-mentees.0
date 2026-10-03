Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8507138D3F2
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  3 Oct 2026 22:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791068399; cv=none; b=iMUBGo2Gp31lyBtvpcsBsuEwYzqH1E48LtWmf+HWYCnO+xuXU9vgzYzw9SeiCvvgbVAaqO3r+GOpa3NaFOgoudCq1AKQqhQh6yaMkI+Cfh9WgsMU/w1EVoRlULM+9uuUugIOZGZEVJoiuPLtuiK3yUFs2w666Z6AVEnz58eKSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791068399; c=relaxed/simple;
	bh=SUutfiwzO/e+2stY1S7H/GwbXbashPZzZ96LlGG+qEY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eJxW7R+c7GehXtsQcS5n/jJjkpxibMI4bNIGga8sjrGjR3pGANrApc+sz5P7yOWS1Vi5S0mlVaCS0b4hHgbpF1cQZ+Qyy5v38HY6moOf+hkP893GyZi1vh2u0VBb57aWmsTcHOQm3k/rvNccbfm1kJQChs/Hk9CPZgMZI6Uh0j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s88vB/il; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s88vB/il"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c5358fc28so84227f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 03 Oct 2026 15:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791068396; x=1791673196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NovMvuXEi62igDdNspHTToOhEM/m3GWr8IsLt04Y3NU=;
        b=s88vB/ilNUEIjSt/Ciwkxb5SeaW5+5zUMhO12ZL+sE0UlM6ZZKZsLJUJGPNS9+PRkR
         Dd5AXVmZ+hkTjzAOuK69XfeeDUpeMXcmlb8d/kdudCtguQ+cAHxnhKHiPTKdj/wumUpM
         2ASNIDx20svHNGzK8ReHcKzrwNWUbl3vTdM8Bp4pdHZ7MweidrNn7aViRpOuAklNfHlp
         DO6N1vm4QdBr7/Eqlpt3uqU/aLFCMoyL0Vz/p3oM2y37tm9Xo+UB0epyjZIcUGE5GZm4
         xV+3HZLdivZhHSoAC+cbNlTphW+UvQxjkYfDKk3qUbZrI4pFrfrqsCuupRKYIoZ9WbK2
         hh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791068396; x=1791673196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NovMvuXEi62igDdNspHTToOhEM/m3GWr8IsLt04Y3NU=;
        b=KyZcjps3eh9KBVe7NVe3SwTpSi3KNNHTJ6YMJnSxS79nIvAcNzGUjoyTVWlrXigBH3
         S3IM5T6HcD1pdxWF44u9fikzNAJiMwj10WaQXixFhG4vaiNuR0YupAZMWQs38fgB94Md
         d70X8pVTpNh/tQ2Tx6nSLyfJG9iB5Jmh2LNXKDLAdF7Vqabp7fJMnyvwJuj70aD+I9Nr
         cXM9X+C5N8qx08VgqyNxdBbsr8se3jsPmhfSISC4f/hvUpJBE6dIqlfKXsl4Bw0iQGKE
         DPphCHeI09Zb6ZHt0UfZ4eY7Q7KuS9kHX9RlLIfdpNKipab9jzWICtcyVkWuuMmeZOJb
         j3Rg==
X-Forwarded-Encrypted: i=1; AKwUvBwU1zbUk91RQTJEjw1c2y18SGb+KLZosW2yWxIOUTrkzOZf9LeBQseTB7g9NbwUtsA9/x1ReDmjfE1w+yrASpAiThZOlA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLIbjWCQPmUEXgQ1e1eu7jf69bqJps/NfakMVrEu+Oo8td/04af
	vfam7a81mdLOlpkURMl7LcETWzdZBrhC5HBHYlhA3NHBgMOqjclAJKkN
X-Gm-Gg: AYBFou0awoZ2n2DRPDSg4I8huXZWjMeWXh6BJ56CKJtN9pWBomo5l5kPsHEv9ohHhUx
	CcuDzaQZ743CXWLmX0aj4RjN09vEXtMl3S9RnLuvLaa0TR+hZQWLZ+arUVcdGOSeqwrcD6uutBW
	wdvav6pn+KH2ROonvOvMgwAi6rQcADtrShoqVVdVHcovEFjijcmWsb5MxcigsAorcw9NoOXq6Ln
	2ph5hEbooogG0GV3m/Ht4IxKgKxRphxJGHmHw4aW0A0yBK1M5vYEfclqJ3OkNddKKgt0BvY/Gv3
	+YVqI+lcctWMnVbNRCkyJXrDTt+XWuXmu8natj74f8eTzmqlHuFvdo7RQh7E87xxQpSkSnCePxw
	vd2abQ/u5hUsgnsEtHkCW63BvMhqf9lRl/Pa67tbyBiBWaXkNN6Oga06P0m9mx/9cX3+nNlJpwk
	woAaZwljy6z61yl+upzDDwxddgJaoAJW92EzLbG0UsQ/R+x/5VyD5hEp++N1B1kFwioijsKAhac
	48s0UH+u11/xlWUHfW59ccstq3irYHKET5TY0ZVUuztrlYNBQyU/gnWPVbpHbNwAaU=
X-Received: by 2002:a05:6000:2610:b0:48a:f511:e418 with SMTP id ffacd0b85a97d-48c48010c2dmr5226227f8f.38.1791068395569;
        Sat, 03 Oct 2026 15:59:55 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b383065a4sm13841740f8f.44.2026.10.03.15.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 15:59:55 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	raghunathpalla.0209@gmail.com,
	syzbot+3decf7252f8521fa80ff@syzkaller.appspotmail.com
Subject: [PATCH] nfc: port100: don't wait forever for a sync command to complete
Date: Sat,  3 Oct 2026 23:59:52 +0100
Message-Id: <20261003225952.86316-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

port100_send_cmd_sync() sends a command and then sleeps in
wait_for_completion() until the device answers. There is no timeout,
so if the device never sends anything back, the caller sleeps forever.

syzbot hit this in probe, with a fake RC-S380 that enumerates fine and
then never answers GET_COMMAND_TYPE:

  INFO: task kworker/0:1:10 blocked for more than 143 seconds.
  Workqueue: usb_hub_wq hub_event
   wait_for_completion+0x2ca/0x5e0
   port100_send_cmd_sync drivers/nfc/port100.c:933 [inline]
   port100_get_command_type_mask+0x1df/0x3a0 drivers/nfc/port100.c:1018
   port100_probe+0x694/0xba0 drivers/nfc/port100.c:1549
   usb_probe_interface+0x788/0xe50 drivers/usb/core/driver.c:399

Probe runs from hub_event() with the USB device lock held, so it's not
only this device that gets stuck. The hub worker is stuck too, and so
is anything else that needs that lock. In the syzbot case the process
behind the fake device is itself waiting for that lock in
usbdev_open(), so it can never answer, and the two wait on each other
for good.

Use wait_for_completion_timeout() instead. If it times out, kill
in_urb. The command then finishes with an error the normal way,
through cmd_complete_work. That path still writes to arg, which lives
on our stack, so wait for it before returning.

I tested this with the syzbot reproducer on next-20261002. Without the
patch, 5 hub workers and the 5 reproducer processes hang almost right
away. With it, probe gives up after the timeout ("Could not get
supported command types"), and the reproducer kept going for 5 minutes
(177 iterations) with no hung tasks and no KASAN reports.

Fixes: 0347a6ab300a ("NFC: port100: Commands mechanism implementation")
Reported-by: syzbot+3decf7252f8521fa80ff@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3decf7252f8521fa80ff
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/nfc/port100.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index e769a30b8b5c..2ca593f6c9fd 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -86,6 +86,9 @@ static u8 ack_frame[PORT100_FRAME_ACK_SIZE] = {
 #define PORT100_CMD_STATUS_OK      0x00
 #define PORT100_CMD_STATUS_TIMEOUT 0x80
 
+/* Timeout in ms for port100_send_cmd_sync() */
+#define PORT100_SYNC_CMD_TIMEOUT 5000
+
 #define PORT100_MDAA_TGT_HAS_BEEN_ACTIVATED_MASK 0x01
 #define PORT100_MDAA_TGT_WAS_ACTIVATED_MASK      0x02
 
@@ -930,7 +933,16 @@ static struct sk_buff *port100_send_cmd_sync(struct port100 *dev, u8 cmd_code,
 		return ERR_PTR(rc);
 	}
 
-	wait_for_completion(&arg.done);
+	if (!wait_for_completion_timeout(&arg.done,
+					 msecs_to_jiffies(PORT100_SYNC_CMD_TIMEOUT))) {
+		/*
+		 * No answer from the device. Kill in_urb so the command
+		 * completes with an error, and wait for that, since the
+		 * completion handler still writes to arg.
+		 */
+		usb_kill_urb(dev->in_urb);
+		wait_for_completion(&arg.done);
+	}
 
 	return arg.resp;
 }
-- 
2.34.1

