Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3BB1A9F83
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Apr 2026 01:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776128881; cv=none; b=KJ4Xy2C6HVAlIiBmzEteqsG3lm7HdMshxcPWGIuzyU8yRIBEtw3+aPmmtGtYNI4v2K6KEaE4vQ13mbD1j62ePsABRidv74uWtOSQ+Vug87Re/DLoC5PZgEIrwZ0pyp0eSQHNw3HRii3bY2FYE3HLF2o8WmupAzFGJQk62pOpb9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776128881; c=relaxed/simple;
	bh=X2stRK6BzVJ6STaMrFyFvTkg+1K5bRk267jpYZn6laQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inJ72DvaGrHfSmLCnY3OqsVDgVqncYO8sweX1WcnwgUUnBjEpY22HsWOmALrszrYZ679p/lWqqmcf+zzVz9RjCS/W8yhvoorPy6LR5BCC9kSTinFwrF2nFpFD3wZHcjLGSwWnrVC3IOvHK0VhftEan4MfAYCFkSF8oJxQQdabAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKdf9NBN; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pKdf9NBN"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso2704182a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Apr 2026 18:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776128879; x=1776733679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSOBQXbJwd+/LjKElFzLkgeeqFY61/pHJa45E1A6Tmg=;
        b=pKdf9NBNlWuzC96RFLc8EjEDMc8ygQjnXQCwJVesl/dS0YTiYX6aQC5cCNRekftZtl
         0J/ZAdGJQ7OFoIWXkZFeuePY81rIh/x9lrAgmDY8RGMLskaWuzGdAX0ePDhoPvseMprV
         vyDZZ2JR86ZkNPFbG4tzaq0PM6DxuPh0GDxd0t+doTmKbz+FFdl/4ksZGS2njOdG23et
         asn5ssMwmfqL9VBErJ/HX2lugjZP+E9FDwdjrAnqS4EgfxtMKF/oUKtfUR4ydqGqsykS
         LvGC0KYWdPbNBDKwb2HfaIoX3GkyGcpRe8Z8uFjljANQw29W54YncSesCRNxy0jYEwQy
         WCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776128879; x=1776733679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSOBQXbJwd+/LjKElFzLkgeeqFY61/pHJa45E1A6Tmg=;
        b=ECHHgoucbmwCKa5G5fFJrNfWvdToWsRre5CK+8GJddeCSrC0b5K1/x/Eov9ppN6h9p
         sU1ao1HyF712iCZtBEnKqeuStqJBOBU/Nh9l8zi/w2XMs/AL7FQHlqoEp2EkmCi/y7Do
         hLdmv0Iar7DMqPv7A/5XXV8Q2XOI3UXZdkV57QGsxLq2RouXqmN0IQJH6j/tX1O8JyCx
         s8r1XA2Vhb8dsrcSgQKqUE/tg6oSKY7l5sEuFNOJ/anD/9DDokCYyxIOWJ7cguekBJNg
         uAPnPE+n8pqMdmyuakL9o+7SEz4gTX93UZ0znKJ1IIgj/yXSid68qwvelPzDhsHBLIz4
         8NKg==
X-Forwarded-Encrypted: i=1; AFNElJ93hcRIcONaopcggjWvXfu/TMpt3LuoosXakARdCXEoVbj/lRMkTbsmtqNGPI5Tt0XzHud66l1MjSFQji0IAevMC1WBbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLHRZpu1m6vLk21SyFXP4BanGPd1DTZJZRSxV5ktVX/fopmy1K
	6e/coK2z2c638yQtBdbL6iXJBOwBkhirZU7YCB4re2ILc2DKOPe6DcUA
X-Gm-Gg: AeBDiesNP+mySI5F003Xnb0GrPue38L3kKmL9eEjh1ilyk/n5T7Sp0lsq9Zf0GRTIN6
	wPv9aTrP5k9sFcWV855OrG9sOSKQltTn37WP11mE/SQOf9r5ojlY5xJO84v6E78TjjWofLTVfuc
	6p86w1jQUcYScIw1DkC9RTF6vgDY/tkNiovqoacvartylT02lZVdr0jHiiTy01pCJzBm9IsdQol
	Mp+weV7eC+5Eyq7IVUKRPvmm8fYws7qMbqmCmrDrgJ5SDGxFdjggdcQp6VT6U9v+RkTuZXWl4zM
	hFYW0X/9zbWYsi4i3GbfymVlhquFWf3fpt2XLEovAmj35r+sU2jjRIwgeHtgD0OBj7ZsAI+jzTM
	pMleDyT8sfMx5IHHuXXBV0+s/9d4TvnfNY0PJ9QZ3HndarKqkIZVaeDH+q59GK17icm3ZkasLUw
	zwceUs0Nx8RA44ruNUbFcQtTghW2YZtWDMJZpDnjEFKd62/8w=
X-Received: by 2002:a17:90b:5292:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-35e4278b94bmr16069292a91.5.1776128879162;
        Mon, 13 Apr 2026 18:07:59 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fc6eabb29sm222009a91.6.2026.04.13.18.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 18:07:58 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	pmenzel@molgen.mpg.de,
	kees@kernel.org,
	kuba@kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v2] Bluetooth: RFCOMM: validate skb length in MCC handlers
Date: Tue, 14 Apr 2026 10:07:41 +0900
Message-ID: <20260414010741.233892-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RFCOMM MCC handlers cast skb->data to various protocol structs
without validating skb->len first. A malicious remote device can send
short MCC frames to trigger out-of-bounds reads in these handlers.

Fix this by using skb_pull_data() to safely validate and access the
required data in each handler. Return -EINVAL if the skb does not
contain enough data.

rfcomm_recv_rpn() requires special handling since 1-byte RPN requests
are valid per ETSI TS 07.10. Handle this by first pulling a single byte
for the DLCI field, and only validating the full struct when len > 1.

Also add a length check in rfcomm_recv_mcc() before accessing the MCC
header fields.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
v2:
  - Use skb_pull_data() instead of manual length checks (Luiz)
  - Add a length check in rfcomm_recv_mcc() before accessing the MCC header (Paul)
  - Allow 1-byte RPN requests in rfcomm_recv_rpn() as per ETSI TS 07.10 (Paul)
---
 net/bluetooth/rfcomm/core.c | 66 ++++++++++++++++++++++++++++---------
 1 file changed, 50 insertions(+), 16 deletions(-)

diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index 611a9a94151e..a2dfbff816d3 100644
--- a/net/bluetooth/rfcomm/core.c
+++ b/net/bluetooth/rfcomm/core.c
@@ -1431,10 +1431,15 @@ static int rfcomm_apply_pn(struct rfcomm_dlc *d, int cr, struct rfcomm_pn *pn)
 
 static int rfcomm_recv_pn(struct rfcomm_session *s, int cr, struct sk_buff *skb)
 {
-	struct rfcomm_pn *pn = (void *) skb->data;
+	struct rfcomm_pn *pn;
 	struct rfcomm_dlc *d;
-	u8 dlci = pn->dlci;
+	u8 dlci;
+
+	pn = skb_pull_data(skb, sizeof(*pn));
+	if (!pn)
+		return -EINVAL;
 
+	dlci = pn->dlci;
 	BT_DBG("session %p state %ld dlci %d", s, s->state, dlci);
 
 	if (!dlci)
@@ -1483,8 +1488,8 @@ static int rfcomm_recv_pn(struct rfcomm_session *s, int cr, struct sk_buff *skb)
 
 static int rfcomm_recv_rpn(struct rfcomm_session *s, int cr, int len, struct sk_buff *skb)
 {
-	struct rfcomm_rpn *rpn = (void *) skb->data;
-	u8 dlci = __get_dlci(rpn->dlci);
+	struct rfcomm_rpn *rpn;
+	u8 dlci;
 
 	u8 bit_rate  = 0;
 	u8 data_bits = 0;
@@ -1495,15 +1500,16 @@ static int rfcomm_recv_rpn(struct rfcomm_session *s, int cr, int len, struct sk_
 	u8 xoff_char = 0;
 	u16 rpn_mask = RFCOMM_RPN_PM_ALL;
 
-	BT_DBG("dlci %d cr %d len 0x%x bitr 0x%x line 0x%x flow 0x%x xonc 0x%x xoffc 0x%x pm 0x%x",
-		dlci, cr, len, rpn->bit_rate, rpn->line_settings, rpn->flow_ctrl,
-		rpn->xon_char, rpn->xoff_char, rpn->param_mask);
+	if (len == 1) {
+		rpn = skb_pull_data(skb, 1);
+		if (!rpn)
+			return -EINVAL;
 
-	if (!cr)
-		return 0;
+		dlci = __get_dlci(rpn->dlci);
+
+		if (!cr)
+			return 0;
 
-	if (len == 1) {
-		/* This is a request, return default (according to ETSI TS 07.10) settings */
 		bit_rate  = RFCOMM_RPN_BR_9600;
 		data_bits = RFCOMM_RPN_DATA_8;
 		stop_bits = RFCOMM_RPN_STOP_1;
@@ -1514,6 +1520,19 @@ static int rfcomm_recv_rpn(struct rfcomm_session *s, int cr, int len, struct sk_
 		goto rpn_out;
 	}
 
+	rpn = skb_pull_data(skb, sizeof(*rpn));
+	if (!rpn)
+		return -EINVAL;
+
+	dlci = __get_dlci(rpn->dlci);
+
+	BT_DBG("dlci %d cr %d len 0x%x bitr 0x%x line 0x%x flow 0x%x xonc 0x%x xoffc 0x%x pm 0x%x",
+		dlci, cr, len, rpn->bit_rate, rpn->line_settings, rpn->flow_ctrl,
+		rpn->xon_char, rpn->xoff_char, rpn->param_mask);
+
+	if (!cr)
+		return 0;
+
 	/* Check for sane values, ignore/accept bit_rate, 8 bits, 1 stop bit,
 	 * no parity, no flow control lines, normal XON/XOFF chars */
 
@@ -1589,9 +1608,14 @@ static int rfcomm_recv_rpn(struct rfcomm_session *s, int cr, int len, struct sk_
 
 static int rfcomm_recv_rls(struct rfcomm_session *s, int cr, struct sk_buff *skb)
 {
-	struct rfcomm_rls *rls = (void *) skb->data;
-	u8 dlci = __get_dlci(rls->dlci);
+	struct rfcomm_rls *rls;
+	u8 dlci;
+
+	rls = skb_pull_data(skb, sizeof(*rls));
+	if (!rls)
+		return -EINVAL;
 
+	dlci = __get_dlci(rls->dlci);
 	BT_DBG("dlci %d cr %d status 0x%x", dlci, cr, rls->status);
 
 	if (!cr)
@@ -1608,10 +1632,15 @@ static int rfcomm_recv_rls(struct rfcomm_session *s, int cr, struct sk_buff *skb
 
 static int rfcomm_recv_msc(struct rfcomm_session *s, int cr, struct sk_buff *skb)
 {
-	struct rfcomm_msc *msc = (void *) skb->data;
+	struct rfcomm_msc *msc;
 	struct rfcomm_dlc *d;
-	u8 dlci = __get_dlci(msc->dlci);
+	u8 dlci;
+
+	msc = skb_pull_data(skb, sizeof(*msc));
+	if (!msc)
+		return -EINVAL;
 
+	dlci = __get_dlci(msc->dlci);
 	BT_DBG("dlci %d cr %d v24 0x%x", dlci, cr, msc->v24_sig);
 
 	d = rfcomm_dlc_get(s, dlci);
@@ -1644,9 +1673,14 @@ static int rfcomm_recv_msc(struct rfcomm_session *s, int cr, struct sk_buff *skb
 
 static int rfcomm_recv_mcc(struct rfcomm_session *s, struct sk_buff *skb)
 {
-	struct rfcomm_mcc *mcc = (void *) skb->data;
+	struct rfcomm_mcc *mcc;
 	u8 type, cr, len;
 
+	if (skb->len < sizeof(*mcc))
+		return -EINVAL;
+
+	mcc = (void *) skb->data;
+
 	cr   = __test_cr(mcc->type);
 	type = __get_mcc_type(mcc->type);
 	len  = __get_mcc_len(mcc->len);
-- 
2.52.0

