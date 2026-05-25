Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2AF37CD3D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 May 2026 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707102; cv=none; b=uSdro+1Exub0nNKfMA45orrxHeMUjbXXc8mBHoMYGz+LxwCYWefw1crZYlw6XteodRqHQZSXo6sCrhi/MG8cYZB0b9Ghs9zdO/FV7X1uRMRPdfNGKHJgY8bcHYk6Bx9DaeKPZoYPb6JJ6bib9kLpyuvixTh/qJj7ccW2ks89fpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707102; c=relaxed/simple;
	bh=APGIhPHWPR/+wOGzlnoG4GOHhlB1pMxWopND9p9UWfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ov1kSzrdQb191q2Ml6JTHPUg2mFh80pNCqd7lO+VDxO8nAp9tFxjFJHE2pgI5MMiAYOB9yoBv5B0+e4BI7mFS2Po8BVYnmQ59C7L25VdrRb2Xl1vylh00J/XONg1fMDAQgjZ8bus2Zn7iiB7mkXtKNja6jL2in1xp5lxmNiQmSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQIE+zrF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQIE+zrF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bea7176c72so31518815ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 May 2026 04:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779707100; x=1780311900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ev+qvGFv8hIErwC5zu3VS01UuSRGE6RIayOr3UZ1lFQ=;
        b=MQIE+zrFRshN3E8C5wzccWHCC5i9cAu/u2SY85Rhi3vap8493dvXVrVyA+wxMdcCkd
         ldEVkcAR2jVGk6UjuEqQ1IL17rDXxUlurOZUwN3Pt00imz7m2VisJw/ZnHgxaQf0r3NA
         bUQ9uKfPX+Rl1mcyEJ5ntGnyti7C8M+66Trs4JUj2jenPeCGBCkKMFN5EqCte+a/j2eB
         +GDhMkKD+YLl4Rw1g1IiYZFxEA4GPrWEf1xhtJgn+iCC6XOoI2ifMFsiNgIVyDYVrffX
         Dowzk/7W3KG4GKAAianLRFk+R+DlcNXdlVVMGRx0pxlBwovn5eRI9NsUdAVjgNHe09ZO
         iEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707100; x=1780311900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ev+qvGFv8hIErwC5zu3VS01UuSRGE6RIayOr3UZ1lFQ=;
        b=m4RbeAePI3YQjtlvKlYx+PaLg4tPQjsKYf4aFHP/iKn5KRJGIYu1UT6Yr1lDwya4ss
         RB83QoTzvbXoC36TYQ+lgjWqSBDx5jjvx+V89PhCVtOtRVh09jQPT4HExOl5DLadHyEO
         txlOroAeEEvtvqjNVn3Y6vn1ng9vr1z3Og+Tp5DXkPWbg7AhcEMnEiyySszbp0qfeeJ9
         XkmgMjdW3fcahMnN6hxwdZ/iFZgDFqKaCSsqdKUE/sXmy/JMOVo1/EF4MuJ4BbVfaX8f
         eSiy+tlUFYWF/3/4kzk53LS16UQmNsTnxq8VtylQNcZC6ITcSzQJKw10vrVD76Zk+KpN
         zkBA==
X-Forwarded-Encrypted: i=1; AFNElJ+0qoEcmBd2kRnBvn5baR6prLcpCZ6KBV/rGcI8FlyueI4xi58oM7D9rQfdmuM/8pCfEzQm2Q1ufZ2S1iFqRJxaI9q5TA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCEr0dlXlQRnMdUccjj0Ha/eIAcfoe2EJBzNqop84i4xUrUa8F
	AMIko1jRsEnrcufGa9vMcYRBPwc/eUNKqzLwiZ7xsCHg483B+IUFBB69
X-Gm-Gg: Acq92OF16e1TBVXlTxBwDSzk1uBipvHznp2FmCz3wgOGUf0uKBCn6HiWr9J/3Rseq/a
	LRfh/ykSJ7N5kBdb9SUK58RAGQIJ9ChpZTSCMRstCL2uDH0CRWHu1dfZW/yzxczT2d12OuKjcak
	YUmZGXIZQ+/sH0B5zLRYybocs6/soVQWenr/uawdwWwKejYg51uyvXolLJAkb9h+VnGxQjHK58W
	Sb3Ka4Z6cMOO/of4cDDVv3AGDRFdyKNpf4hMwsckwcHE3aHDF8LbKL0w3tAfj6yAuRc4nX8g4YW
	3UuM/PZ7KaTqEmVKPvcNutd8ROIGnux3oLFpn2+nPPLwS7CnfK0YFW5gYEK3Mp70mz0Hf0Y644/
	plIy5FLuVYzR2/y9pGfI5Jo+Dd75R+if+l5NSquSQZpFLvIo+c8ZF0EXAyKa21SfNI00lG6zqUn
	0IWBG8KTCiyf84/4uv6l2myH8UW0OmqXovkcUNN/KtpLX32yk=
X-Received: by 2002:a17:902:db0d:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2beb0698547mr158655125ad.24.1779707099972;
        Mon, 25 May 2026 04:04:59 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a29sm88776955ad.11.2026.05.25.04.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:04:59 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	pmenzel@molgen.mpg.de,
	me@brighamcampbell.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	SeungJu Cheon <suunj1331@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3] Bluetooth: RFCOMM: validate skb length in MCC handlers
Date: Mon, 25 May 2026 20:04:43 +0900
Message-ID: <20260525110443.139485-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RFCOMM MCC handlers cast skb->data to protocol-specific structs
without validating skb->len first. A malicious remote device can send
truncated MCC frames and trigger out-of-bounds reads in these handlers.

Fix this by using skb_pull_data() to validate and access the required
data before dereferencing it.

rfcomm_recv_rpn() requires special handling since ETSI TS 07.10 allows
1-byte RPN requests. Handle this by validating only the DLCI byte first,
and validating the full struct only when len > 1.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Muhammad Bilal <meatuni001@gmail.com>
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
v3:
- Apply skb_pull_data() in rfcomm_recv_mcc() before accessing the
  MCC header
- Return -EILSEQ instead of -EINVAL for malformed frames

v2:
- Use skb_pull_data() instead of manual length checks (Luiz)
- Add MCC header length validation in rfcomm_recv_mcc() (Paul)
- Allow 1-byte RPN requests per ETSI TS 07.10 (Paul)

Testing:
Tested under QEMU with VHCI and KASAN enabled by injecting both
well-formed and malformed RFCOMM MCC frames.

Well-formed PN/MSC/RLS frames and both valid RPN variants (full
8-byte form and 1-byte query form) are parsed identically to the
pre-patch behavior.

The following malformed frames are rejected before reaching the
MCC sub-handlers:

- truncated MCC headers
- PN/MSC/RLS/RPN payloads shorter than the fixed struct size
- invalid intermediate RPN lengths (len != 1 && len < 8)
- MCC payload lengths larger than the actual skb data

Frames with cr=0 are still silently dropped, and oversized frames
continue to ignore trailing bytes as before.

 net/bluetooth/rfcomm/core.c | 67 +++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 18 deletions(-)

diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
index d11bd5337d57..364b9381c2dc 100644
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
+		return -EILSEQ;
 
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
+			return -EILSEQ;
 
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
+		return -EILSEQ;
+
+	dlci = __get_dlci(rpn->dlci);
+
+	BT_DBG("dlci %d cr %d len 0x%x bitr 0x%x line 0x%x flow 0x%x xonc 0x%x xoffc 0x%x pm 0x%x",
+	       dlci, cr, len, rpn->bit_rate, rpn->line_settings, rpn->flow_ctrl,
+	       rpn->xon_char, rpn->xoff_char, rpn->param_mask);
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
 
+	rls = skb_pull_data(skb, sizeof(*rls));
+	if (!rls)
+		return -EILSEQ;
+
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
+		return -EILSEQ;
 
+	dlci = __get_dlci(msc->dlci);
 	BT_DBG("dlci %d cr %d v24 0x%x", dlci, cr, msc->v24_sig);
 
 	d = rfcomm_dlc_get(s, dlci);
@@ -1644,17 +1673,19 @@ static int rfcomm_recv_msc(struct rfcomm_session *s, int cr, struct sk_buff *skb
 
 static int rfcomm_recv_mcc(struct rfcomm_session *s, struct sk_buff *skb)
 {
-	struct rfcomm_mcc *mcc = (void *) skb->data;
+	struct rfcomm_mcc *mcc;
 	u8 type, cr, len;
 
+	mcc = skb_pull_data(skb, sizeof(*mcc));
+	if (!mcc)
+		return -EILSEQ;
+
 	cr   = __test_cr(mcc->type);
 	type = __get_mcc_type(mcc->type);
 	len  = __get_mcc_len(mcc->len);
 
 	BT_DBG("%p type 0x%x cr %d", s, type, cr);
 
-	skb_pull(skb, 2);
-
 	switch (type) {
 	case RFCOMM_PN:
 		rfcomm_recv_pn(s, cr, skb);
-- 
2.52.0

