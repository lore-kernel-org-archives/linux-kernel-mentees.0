Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15BD846F
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Apr 2026 04:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775969719; cv=none; b=EB2OiFL3qqEgNoKzuzCvaAyqiVdUc/cBIcEc3OO44VAm59GEiUlDHSfIpprn3+PWmtJ3pIHcF1sxlEtzertwWX4aZeL3LthnBxeshSsHv3sd9l14vLA63uP1Mk1iUZRXW0z68/7SjHC+0lmOSgrzdv1O4meX4OxG8T4n2sygPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775969719; c=relaxed/simple;
	bh=h67u/6cCGMsuCnoS5f8sr2GBiplSgjqdsWq+mlqVuug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OFyPSqm9qHOAbUACeczrBAI7SohxHHuEWrLleyjTU0L2FMD4Wb93Ngk3yUBFXevrxV3NV6LIiKwAjzbAwvgj/E+P6+OWkNox08YSTYYwNGaEB6+K9k3aLToca228RMaOI21/WzQRqj0h12GgPwt7lnTCjNgRpZzrwVZJdMIVHos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rq+xR4dd; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rq+xR4dd"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so3194103a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 11 Apr 2026 21:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775969717; x=1776574517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QekY0/ezMpABbrLK5HXT/JhJSiKSSxHOEZGPAweniG8=;
        b=Rq+xR4ddQsmPCllAaemUovxgZe33RURbKcYr2FXnNIU8iXIpgaC4MoTv+JNLuJnoK3
         4GWOnFSjH6iaVRMUMV+R2IpqK6jK2oHPCbyyOigUKFlmAR30htDPIM7UUNuePZx2W2G3
         7psWTm8BcbnRlf6PLXcnUjRMI83Hy4IxzbEQHYbrXuzEc+z2H1/T3PZOn+StKNc/aKte
         N7+rC2giXfMCtrUgGlZAHGBgDTUSCFIf6ki0G1dhgJQVBQPZoyZ3BqCmlliF2GishEI1
         mU4wvMyIRDQU/r3HJGeSoPM66hvTt5AHAFlUaGXNM43BzraqvsJM1ih1rcMyE+VfRQ4E
         8jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775969717; x=1776574517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QekY0/ezMpABbrLK5HXT/JhJSiKSSxHOEZGPAweniG8=;
        b=mcOHSiPoB8kVl2YkWuGDWllPZ8kpOUeO8VF4TWGNJt4VSUd7Itbg44RH86oAgth3R5
         WidSu/V4x2olc0Ge7MZHe1A0cEoKwWqgC50UWu8mZk4Atph7PnIAAd4LJzuKBrxmeLha
         id6zBwhH7k6t6MXqRsLB1jeGyWgYBNA8SgPPmeSeOT5HzGlZlW0tL+pmc7ZyRVkqfaOC
         rQ8wQrInzphD0KKn91yL5RtR+/mdX+Gnp5JEaL3Ayb5ZlBnNVXvbI1ZxmhCvbO16gkmZ
         O5ZbZT8lsd2lkzhx6YhERvN/14M4PX6fpbiVomqAbVLNqWsUVz30IqRWz15FO32ExUvN
         qDkA==
X-Forwarded-Encrypted: i=1; AFNElJ9sq/woJpWzfMBzErnMeUOEBlAlTqrSkcZgOEJJ8l8jdEjGoJwzJpIzI4Qf1XsflBiOJOUN5fF00Rj3OHQ3No4ycGSiPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLoJmoAHFBRS9jDx29h0NwR9Y+guuhRriqBnHVRJZU7uX8DjdH
	PJOyAxqRkA/qlVOizXAMK+OfZZE/WcPrL4xnpNguodwhH+R6FRsYlMdH
X-Gm-Gg: AeBDietKLeZVrFFgZpa9NEnI2BIi8MGpK/d74IbOhlB1Q76saZGMFYr/agqAFBqEKBW
	bieUR56tUV7HroOkEFpS7/zekmoAZGxicLc5NaXOyeXRFYAzr5jY61cm+4O7vHYUWlqhj6yk2Qm
	BP9zgUojTcXsosL3UK/PpDEi0GGQMsuevnp6swHQ1ZNeb7W4YiKtA8mwFR0D8ve79N38/eKir6k
	M3l1vT97WsNhbQQa5wNL964IfyvZePwsYiEVBeF4FWoJpyxxDGE4QK13qXg5mS4F8Us+On8uLqh
	KEpD/lZU4Y/OcIRuLthCU04cO+QbIi4sHevYqq4AobZ8BCMrSZ4yZLwCXISsOXecaRF0xy+h2P7
	Oa6PnA1v7gXLQ6DnisV1MdgZupmB5V7FEPi1aF3NR952ezGdYlC06lquJWUvMqn1aoqaiRQMO0D
	blwTkLQKHQXnsAPyBCHcWDLs2Ems8T5H4wUwZEsGerLQODwr8=
X-Received: by 2002:a17:90b:5185:b0:35b:e5cf:20fc with SMTP id 98e67ed59e1d1-35e4285c0acmr9923793a91.26.1775969717304;
        Sat, 11 Apr 2026 21:55:17 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e34ff7a64sm11792092a91.8.2026.04.11.21.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 21:55:16 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	kees@kernel.org,
	kuba@kernel.org,
	me@brighamcampbell.com,
	shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] Bluetooth: RFCOMM: validate skb length in MCC handlers
Date: Sun, 12 Apr 2026 13:54:57 +0900
Message-ID: <20260412045457.53100-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rfcomm_recv_pn(), rfcomm_recv_rpn(), rfcomm_recv_rls(), and
rfcomm_recv_msc() cast skb->data to their respective structs
without first checking skb->len. A remote device can send a
short MCC frame, causing out-of-bounds reads from the skb buffer.

For rfcomm_recv_pn(), the uninitialized pn->mtu value is stored
in d->mtu via rfcomm_apply_pn(), then echoed back to the remote
device in the PN response, leaking kernel heap data.

This results in use of uninitialized memory, as reported by KMSAN.

Add explicit skb->len checks against the expected structure size
at the start of each handler before accessing the payload.

=====================================================
BUG: KMSAN: uninit-value in rfcomm_run+0x7eae/0xee90
 rfcomm_run+0x7eae/0xee90
 kthread+0x53f/0x600
 ret_from_fork+0x20f/0x910
 ret_from_fork_asm+0x1a/0x30

Uninit was created at:
 kmem_cache_alloc_node_noprof+0x3cd/0x12d0
 __alloc_skb+0x855/0x1190
 vhci_write+0x125/0x960
 vfs_write+0xbe1/0x15c0
 ksys_write+0x1d9/0x470
 __x64_sys_write+0x97/0xf0
 x64_sys_call+0x2ff0/0x3ea0
 do_syscall_64+0x134/0xf80
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

CPU: 0 UID: 0 PID: 3374 Comm: krfcommd Tainted: G        W           7.0.0-rc7
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
Kernel panic - not syncing: kmsan.panic set ...
=====================================================

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 net/bluetooth/rfcomm/core.c | 40 +++++++++++++++++++++++++++++--------
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index 611a9a94151e..daeba71a1514 100644
--- a/net/bluetooth/rfcomm/core.c
+++ b/net/bluetooth/rfcomm/core.c
@@ -1431,9 +1431,15 @@ static int rfcomm_apply_pn(struct rfcomm_dlc *d, int cr, struct rfcomm_pn *pn)
 
 static int rfcomm_recv_pn(struct rfcomm_session *s, int cr, struct sk_buff *skb)
 {
-	struct rfcomm_pn *pn = (void *) skb->data;
+	struct rfcomm_pn *pn;
 	struct rfcomm_dlc *d;
-	u8 dlci = pn->dlci;
+	u8 dlci;
+
+	if (skb->len < sizeof(*pn))
+		return -EINVAL;
+
+	pn = (void *) skb->data;
+	dlci = pn->dlci;
 
 	BT_DBG("session %p state %ld dlci %d", s, s->state, dlci);
 
@@ -1483,8 +1489,8 @@ static int rfcomm_recv_pn(struct rfcomm_session *s, int cr, struct sk_buff *skb)
 
 static int rfcomm_recv_rpn(struct rfcomm_session *s, int cr, int len, struct sk_buff *skb)
 {
-	struct rfcomm_rpn *rpn = (void *) skb->data;
-	u8 dlci = __get_dlci(rpn->dlci);
+	struct rfcomm_rpn *rpn;
+	u8 dlci;
 
 	u8 bit_rate  = 0;
 	u8 data_bits = 0;
@@ -1495,6 +1501,12 @@ static int rfcomm_recv_rpn(struct rfcomm_session *s, int cr, int len, struct sk_
 	u8 xoff_char = 0;
 	u16 rpn_mask = RFCOMM_RPN_PM_ALL;
 
+	if (skb->len < sizeof(*rpn))
+		return -EINVAL;
+
+	rpn = (void *) skb->data;
+	dlci = __get_dlci(rpn->dlci);
+
 	BT_DBG("dlci %d cr %d len 0x%x bitr 0x%x line 0x%x flow 0x%x xonc 0x%x xoffc 0x%x pm 0x%x",
 		dlci, cr, len, rpn->bit_rate, rpn->line_settings, rpn->flow_ctrl,
 		rpn->xon_char, rpn->xoff_char, rpn->param_mask);
@@ -1589,8 +1601,14 @@ static int rfcomm_recv_rpn(struct rfcomm_session *s, int cr, int len, struct sk_
 
 static int rfcomm_recv_rls(struct rfcomm_session *s, int cr, struct sk_buff *skb)
 {
-	struct rfcomm_rls *rls = (void *) skb->data;
-	u8 dlci = __get_dlci(rls->dlci);
+	struct rfcomm_rls *rls;
+	u8 dlci;
+
+	if (skb->len < sizeof(*rls))
+		return -EINVAL;
+
+	rls = (void *) skb->data;
+	dlci = __get_dlci(rls->dlci);
 
 	BT_DBG("dlci %d cr %d status 0x%x", dlci, cr, rls->status);
 
@@ -1608,9 +1626,15 @@ static int rfcomm_recv_rls(struct rfcomm_session *s, int cr, struct sk_buff *skb
 
 static int rfcomm_recv_msc(struct rfcomm_session *s, int cr, struct sk_buff *skb)
 {
-	struct rfcomm_msc *msc = (void *) skb->data;
+	struct rfcomm_msc *msc;
 	struct rfcomm_dlc *d;
-	u8 dlci = __get_dlci(msc->dlci);
+	u8 dlci;
+
+	if (skb->len < sizeof(*msc))
+		return -EINVAL;
+
+	msc = (void *) skb->data;
+	dlci = __get_dlci(msc->dlci);
 
 	BT_DBG("dlci %d cr %d v24 0x%x", dlci, cr, msc->v24_sig);
 
-- 
2.52.0

