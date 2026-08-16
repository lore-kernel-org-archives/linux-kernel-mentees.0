Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287684B04BF
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 16 Aug 2026 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786894760; cv=none; b=kuirlVo87UsauN2OT/wDRtPoCSOJ44piFIM+DGAUsFGpzPz5myfOg/xdlkcs+ywtbL2eB6dhsWK1Rw/nkl+OP7kPVjIf520wRsZnNun6wBHYq7/9XlmJ4VGN1xEKLu+St5CcAFbnOI0XTIBVdC947NyyJsJaCXfbtIqJJX8cPBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786894760; c=relaxed/simple;
	bh=zPX8KBkMZJrT+ze6Vk4oOsowxMMXWy+Jz5rlbiUqD6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4hbN76V7Se4i4nm75AMIrU3qsgFUQMuWi0VyO8pFEo6NuAyd9zO+a2ZLl9CaNgHXXiyWzsFRAATWfK1dO/4Tn2lDA4h12L4ifKeHEYbCmCb0gDu12t9Y8qxWwb4RbK5WV2WVaLcU2DMSGOulQE+4Y5GHvGEqzlcyWjnin0D5M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5Pq+QDz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5Pq+QDz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so20953745e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 16 Aug 2026 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786894757; x=1787499557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+AD3yvYtELlzfMYB79Dik4mUEZ2MSC2FzjAo/30HpA=;
        b=C5Pq+QDzYsY8pwho+5VidQ6x/qAvfo3cg8OGNcw8OHy+Jhk77rCXOw2sWcrj/nAvOZ
         wKUTK2xVT282XY+l1jwb3b6K59V49S6bDFnyCMqqsMzRwgGdrOUEzzESw6OVN1iXaiZH
         QV4TJBT2pwONu91LL/EDtAVIJlZdDKn2IQWzn76qXk5o6rkI6kLRthHefopDVJ3n3Cyg
         6rz0lJf38OjHbHxXKM1fwYDrovjQxPP8nhWyPEx31AyJq9FywvVPmvqRL6YJY0X7N6p3
         9+L1ZWLMgh91uzhfmiRp977yI2ojJQCkXHRbnBgg+hSmUQoXKprnrXayBQQ0yPNPbCvr
         pJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786894757; x=1787499557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+AD3yvYtELlzfMYB79Dik4mUEZ2MSC2FzjAo/30HpA=;
        b=kn8IB3FI8oCY5Sf3j3X6c0lWjidRb71Y1lSrR8523LBjaR/uf+y7M2MY4RqP03Z3lO
         zj+xNqRiAf9zTKn3I7JiHRQfKJ7gFCoJJg6x+9UvfaJR0680ek3jWftmBSTG4dri+TmQ
         YOKkj5SewP/EkDSzNYFzfe4swKOH04gIpCmBkhwRZB1qsNeupXbSpLZGxPQMH7QZp0vK
         txcnSI3zP55D+dulCVFyZZOC/Kwz6q5l3eegwRAp9o6p27ZbxlD8+SL7yjvZzfC7cBKh
         YcBBr1ejyZ/N3evHAjbiqRD3ISmrL4XIGjw0cpltIBlND5HIc1lNnN/dp5pl9pMfWG1c
         egUg==
X-Forwarded-Encrypted: i=1; AHgh+Rqioa6lMJaBzExBMMlDsyd47OpnEpY90n6Ew+23h0LeqZfoMTWSnlDycWuv9KPVPmy1fQlfQu3o8xTVt+9XAYnIuYb9Lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkveTiJk6sS3aGaMPtUzFMiTZUU5jovVHnnlxDMJF8KX+vRATx
	2KbpvR+/B6HpFi0UMpyFcDEdXbfEVuZEwoXR/71x7+xg4FA4PNF2k9I=
X-Gm-Gg: AR+sD12WloGpjc/VBVjK/E8hODWUIa2bMXXuIHa03WkLWrnKAujkytiTpljACPGnjlT
	HAOnXSaWigqVe3pv8m8NgojWTDcAo6Fw7oGfSJU1/cDEZG2mseIHNe5Beq8/0MuQacnvMzGAE7o
	x+ls1+DUC5X9c3Id1FHK1Kl/evuTSVf3Ib+lz+n5hkjqHvgo/JIT1JFB9qPeivK7ZMs2R8Ikbb9
	LPx0wYZ8vWsWYnQMV06tJCpE9D+di0vncNAOF12pyx9U7jYxgT3lC+9kBrB/qmw3ptesfbnGIKN
	vk6i/rqS62HHpFhqDsZNXoLk8CkKdQRPfTeI1e5R+5sZbafQpmXY3aYg2+GbIAqFQHzqizmISf5
	kNYany+TlnT1Z5GRQt8Zk1IAg9oJ49qc9szNPh6fRuH4b7cs7f+KRE3Gy7jc27Sp/sX00Pd+yMY
	+QPhZnc6pwI2AoOkWfUupy1+npB32U5apvcQrt5smUJAxiKXbeWwpPBiGuUxxv2kjNMat4otJPZ
	VYd4oLgMGK2bWxrJYXKU3BtnBtxX01UST34hYV/1lgIlC2kdy1x5rRmx5iEjS/pVorJ1qGiBbhW
	naR1m56z6M/6d6g=
X-Received: by 2002:a05:600c:37cd:b0:499:8596:3ba9 with SMTP id 5b1f17b1804b1-499879c279cmr331256545e9.18.1786894757402;
        Sun, 16 Aug 2026 08:39:17 -0700 (PDT)
Received: from archtop.localdomain (92-242-249-15.broadband.mtnet.hr. [92.242.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999610ddaesm75681475e9.7.2026.08.16.08.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 08:39:17 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ulf Hansson <ulfh@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>,
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com
Subject: [PATCH] mmc: vub300: fix sleeping function call from invalid context in vub300_inactivity_timer_expired
Date: Sun, 16 Aug 2026 17:38:09 +0200
Message-ID: <20260816153809.7067-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 Currently, the function vub300_inactivity_timer_expired, which gets
 called in a softirq context, calls a sleeping function in the following
 call chain:

 vub300_inactivity_timer_expired -> kref_put -> vub300_delete ->
 mmc_free_host -> cancel_delayed_work_sync -> __cancel_work_sync ->
 might_sleep -> BUG

 Fix this by replacing kref_put(&vub300->kref, vub300_delete) with
 vub300_queue_dead_work(vub300), which does the same thing, but in a
 workqueue context.

Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
Reported-and-tested-by: syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1ee4f3b9228e35f14677
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 drivers/mmc/host/vub300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index 2dae474dcd06..df0096bc53db 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -744,7 +744,7 @@ static void vub300_inactivity_timer_expired(struct timer_list *t)
 	struct vub300_mmc_host *vub300 = timer_container_of(vub300, t,
 							    inactivity_timer);
 	if (!vub300->interface) {
-		kref_put(&vub300->kref, vub300_delete);
+		vub300_queue_dead_work(vub300);
 	} else if (vub300->cmd) {
 		mod_timer(&vub300->inactivity_timer, jiffies + HZ);
 	} else {
-- 
2.55.0

