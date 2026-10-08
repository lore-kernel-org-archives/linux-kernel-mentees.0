Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6A3A5431
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  8 Oct 2026 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487135; cv=none; b=qQhv22xtOq/PTKCxIN17Mgz4dq+nfy97lMBSoL+wRt4oQkL5LnJK1WgEHzXjydqHl51NY5rKHYrBLWVqDzo6GeO2V5kuTDvvN+28OsL5looHS6Vi4Eb8rO/KUPb2YdK7GXxUlxST73RW1WLqyy5anuqsXF7Gnb+i44FMJFsvA1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487135; c=relaxed/simple;
	bh=NtDq6e8LX1lDAOuEJn4iBhESf83UdpiEIuIR6bCr5Ks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=snO5hX/K8q2nE8KSb1nCP0581sGwHGAR+vmpyDSXLY7a9fbwvA1glwdNG6bEL7FgJ4u70t4JnlhBn5DfSlVqrifi7CKzPe66+Sk9VjSjBQWkYf/luOj1OTSznEj7fg27xRvXx3+4OENudaB8Mo3U2h94WT0oO8rhuzzR5JQLLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA0kRON4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA0kRON4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2266446f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 08 Oct 2026 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487133; x=1792091933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvBBYt0QHaBsGt4sgK0v6LDNYZqIUkl6IROUmRuxWdQ=;
        b=MA0kRON4QhGs4BFgBBAgi4HRfsrAJG2EJZEtjdlzBWzrS11n2MkBbKy41ES+f2Sv7P
         XD5g+jI9SWeImTwn37uTXuKSJoaiPZtsPuAPLASS30Tty5rtPk/xcbUCdXr22vmutoQc
         jlwKzyBh6OBE6Gs9fBjY9T8W+022jdIF7/3WHLuJPCIRxQB91TgHI+U5NO86qZTyT18N
         fAfajRYIwtPdSvMR36Tflqj1P4WXEAJBVPPfcNPuAioMHJJUy84onfJYQJ4fUy479k3f
         cDy2Be813t/dpu4ZzbtnGI6Ousdu/bQsr+KP78VY6cIIfOqj2nEyQNJGo0vH/32HAa1f
         XkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487133; x=1792091933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvBBYt0QHaBsGt4sgK0v6LDNYZqIUkl6IROUmRuxWdQ=;
        b=Xo0uNBuK5I+k8Ku7Pen0I6LsFmUGTiakNtOsS0KEoPHgm+cwxhKh8AL9/9GmbBwYMa
         As7Fl4KK5L/QKclxDz8ADG2R4RHTw+yvcy5HLKefQpL2zxAj4VvHe9jixuOhOSe0JT7X
         Rkq4fffuqnT2XTG14JR5d4X0arBs8vj3yOo9sPge9WaPe8pOEvlGEUIO8iwLINgVsONh
         RXle5o0zashsjfP3n76fgpWR0KmwdQ/saEu4PgYLNdognaFqy6FoHq/z3Y7fN5Bnb0Fq
         Mt1+pWbcTy+rU+FPcenkaU7dtMa56vQHCNfhozXNUtEZzZT+2GPKg5KIaQRvutQXPMGq
         i+dg==
X-Forwarded-Encrypted: i=1; AKwUvBy/Uc7YkVsbvDm27UEXnZjpRg9jUOIr9tK9MZzX60vcaSWraCckwnziQRMP0GSdmnJ8YYv11S0jkMlpZuEShT5+GmdWfQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKw70f0sNQs8ppj7WISCIeP1P143cVy0hu9rve37ggpZX1SDsxp
	PINKxkaAmYqE2hNEG33pkjp0pVmVwBuv/yjXIWTO8dwKNKQEDiNotAWQ
X-Gm-Gg: AYBFou3o9xIunH842GMx0u+6vcCMoPEZnCLsQspE+DV42dpuMnT2CAE775KfonCvtoZ
	Jd0AIDEnr9SJ9ovQUVTtkWNArcFL1biK4gLWQBkHbSRZK1+vIWGhs3dj2IaLot3Mhhim1K/vzHv
	hMuhEMJvVftRm2BULBWwnStQOize8odgWD7069h+H4yg08jelrOxktPKXpDkJa50VMUnXICtFod
	L2uyikSaZD5VH5AVUbZ6phoiPzauDjoDe56I/poMbgF/DE5PvvXZfL8llC1PJ4CXNYVZr8/hDB/
	wjxBRFKN/v1z00ziilHoJ5wvD0zerz6HIZPBAFcsm6iozemio/xvXxVlRWSOlxMOdXRzstQ4AHc
	MkpaZ+LBnqngvliYcasxrKyppDA6LCl11LQMVdR++EQg8I19YzcxjXNoj0idC4l8ZWZpX3Bxxpc
	ctdWd25o2etb2I5dndBHHQkkSBnndxghTYiIuNGzwAMsW8NFVdG67LzhIARpSiQW5Vwv3XrosTG
	gh5NQHWSKFf2LzAuIJoB8t2jjOIZlnvfxp6g/ps3WaIAn414wlkO0r8MyVGD8oJXQsd
X-Received: by 2002:a5d:64c9:0:b0:48c:7037:aee9 with SMTP id ffacd0b85a97d-48c72890fdcmr12484231f8f.50.1791487132477;
        Thu, 08 Oct 2026 12:18:52 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db650fe17sm1104128f8f.9.2026.10.08.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:18:52 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>,
	Daniel Wagner <dwagner@suse.de>,
	Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+da94a51633758d13bd63@syzkaller.appspotmail.com
Subject: [PATCH] nvmet-fc: don't drop the last assoc reference in nvmet_fc_delete_ctrl()
Date: Thu,  8 Oct 2026 20:18:48 +0100
Message-Id: <20261008191848.47066-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot hit a recursive locking report on subsys->lock when a subsystem
is unlinked from an FC port.

nvmet_port_del_ctrls() holds subsys->lock while it calls ->delete_ctrl()
for each controller. nvmet_fc_delete_ctrl() grabs a reference on the
association, queues del_work and then drops the reference. If del_work
gets to run to completion before that put, ours is the last reference.
Freeing the assoc tears down the queues, the last nvmet_cq_put() drops
the last ctrl reference, and nvmet_ctrl_free() goes for subsys->lock
again:

  WARNING: possible recursive locking detected
  ...
   nvmet_ctrl_free+0xa6/0x8e0 drivers/nvme/target/core.c:1766
   nvmet_cq_put+0x158/0x200 drivers/nvme/target/core.c:848
   nvmet_fc_target_assoc_free+0x418/0x2220 drivers/nvme/target/fc.c:1173
   nvmet_fc_delete_ctrl+0x717/0x7e0 drivers/nvme/target/fc.c:1581
   nvmet_port_del_ctrls+0xfb/0x150 drivers/nvme/target/core.c:311
   nvmet_port_subsys_drop_link+0x1e8/0x310 drivers/nvme/target/configfs.c:1119

It's a real hang, not only a lockdep warning. I reproduced it with
fcloop by putting an msleep() before the put: rm on the configfs link
gets stuck in D state for good.

I don't think we need that reference at all. del_work does
list_del_rcu() and synchronize_rcu() before it drops the initial
reference, so an assoc we find on assoc_list can't go away before
rcu_read_unlock(). nvmet_fc_schedule_delete_assoc() doesn't sleep, so
just call it inside the RCU section and get rid of the get/put. If the
assoc is already being deleted, terminating is set and the call is a
no-op, which matches what happened before when the get failed.

With the same msleep() in place the patched kernel unlinks cleanly and
the assoc is freed from the workqueue.

Fixes: 4049dc96b8de ("nvmet-fc: defer cleanup using RCU properly")
Reported-by: syzbot+da94a51633758d13bd63@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=da94a51633758d13bd63
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/nvme/target/fc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..eecdffefa24f 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1567,8 +1567,14 @@ nvmet_fc_delete_ctrl(struct nvmet_ctrl *ctrl)
 		list_for_each_entry_rcu(assoc, &tgtport->assoc_list, a_list) {
 			queue = assoc->queues[0];
 			if (queue && queue->nvme_sq.ctrl == ctrl) {
-				if (nvmet_fc_tgt_a_get(assoc))
-					found_ctrl = true;
+				/*
+				 * No assoc reference here: we're called with
+				 * subsys->lock held, and if del_work beat us,
+				 * our put would free the ctrl under that lock.
+				 * RCU keeps the assoc alive until unlock.
+				 */
+				nvmet_fc_schedule_delete_assoc(assoc);
+				found_ctrl = true;
 				break;
 			}
 		}
@@ -1576,11 +1582,8 @@ nvmet_fc_delete_ctrl(struct nvmet_ctrl *ctrl)
 
 		nvmet_fc_tgtport_put(tgtport);
 
-		if (found_ctrl) {
-			nvmet_fc_schedule_delete_assoc(assoc);
-			nvmet_fc_tgt_a_put(assoc);
+		if (found_ctrl)
 			return;
-		}
 
 		spin_lock_irqsave(&nvmet_fc_tgtlock, flags);
 	}
-- 
2.34.1

