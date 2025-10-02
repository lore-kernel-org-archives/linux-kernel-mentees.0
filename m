Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E35D3207
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 23:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759446403; cv=none; b=cK8jcZm2ltXJpqA5k/ZEV4eqFCKPKWhGkCaS1UzJuE6lUHcaRWkqKwm4sVGzNHvZfGVBI2t1JES+IK/yfEjig59cZdYBac1LdxDwcKGKHCHArJvVEi+Uk0TaY9YFsBNAdB7uGW7pmbBpJFKTAgwzqAOOh7mp3+Vs5SwpTuIXJ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759446403; c=relaxed/simple;
	bh=05QBzRd86DhaBHC/HzFaLKts1U4K0ZRH0JC89nOeuak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dCICCr4ZCRP/RDtWVcrk65z+lLicp+hTw+A2p/IZeAg/SY9+LeIDH8/WnSmCfGrlsLjikAbzzpxAs++KPNFDx9LKfK6v0l+5zXB7+l9oU9x8tdcvYQ5hwOOZsQ1x46O9cq0Zix3p60TIJVGHQdTn1HelZT4NLuXfCoQDPG+r07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+Tsq2XR; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+Tsq2XR"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFC644023E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 23:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRB3HmMZ0gvS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Oct 2025 23:06:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=nirbhay.lkd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0626D40050
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0626D40050
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e+Tsq2XR
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0626D40050
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 23:06:40 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-32ed19ce5a3so1456963a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 02 Oct 2025 16:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759446400; x=1760051200; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFC69a6NBsLOPw5S/NgD9GIK97Ncfay1Ur+maFKsDH0=;
        b=e+Tsq2XRlMLlFnAPc8+6CBEONIW4WHD2Xe6rkqwOHQXTTMKY6+EtfY2oQbIuIxghaQ
         irlLEBHeVo0RFyvsQADqRCIN7WMTsJWs4oVq3j5iHStqRbk7UHMopw2MIzx87++m1dML
         PS+FmZhSAbMeW/fQJtCkQ+orNq8C8c0ZbAczmGVSmEWspJn/OkBxntAIbuu0CQaJ8yAg
         bFbIHcUUVO772FhUsFjJSQBGmaNwM/23POELMoyr/9z7mSlogUnw65PxpYpduwaLy0wp
         ZZiMengMbnrlcqxMUN1Q9VIABdtm65Z6TNkZNii84ZHXgtq22VLLcUOKmrKDgefTq5R9
         rqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759446400; x=1760051200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFC69a6NBsLOPw5S/NgD9GIK97Ncfay1Ur+maFKsDH0=;
        b=IVeYYgcaeF1JDSLks5YWpcC5sQWeqihObgG84l2Iav801LZmtySzarc33gcITSckuZ
         NuGmOvNCIYvP8Oe3Tg7wzaDbWMPJ3x800Lu8hdBSFRIMt17TDBclbLaSesimTm6ZY5LX
         je4P1QNKW3JNnX/8mAIVH34ceXM6DzkWkvUxkiXp8fabufe746B6ukZfUx/OkqOJVomK
         TBnj0tghM7IGWm9kVh3JyuVO7zVTu9PxncIugi5Wzb500VgQdSC7qbLgJuKOaVrTJqIH
         x1w05iw7Og+LAt0TFbqiEhmFQAIGsbO5GWnaTJK3HsOR85PpWdaagOe4ipXSovaIDc9a
         2RMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfXBjyZwPW+MHU3E9HnmgC2RYPlfuxUfi7NClX5xqKoYXUmJsLzY/xsKRHVSkJiil1+mG+xIEIfV7XPeIpPEiqjh16SQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yww1AVTjXF/LsJ8NmpUN8zuXGt6/o290crEXaX6WZmI5AozLDh9
	fcPseF9yV/WYA9mWXw6Xe4Dg+ynhGb+j8G8cBaOgld+CzUngUvSp8XrN
X-Gm-Gg: ASbGnctOh7W3jyXlekA/fP62qwYM/sexOwVR6c2e73pEpYOpKL00VhLNTe6pWOkug0w
	SRYuW2OM4INXAuN9nraXmULEQUSb76u9Eb63/iN04r5ld5YkjNjzR4ljwhpmUxULA0uFOYkajx9
	TcY59fPijoab7Gil8g4fKIfqKqL2sSA7Zr/GmQRG70L48OViIn2kP/jPyCePko/zRhOSqP+622U
	cq2eJJ2z1h2UaVJdTiLIBBsQxYsOk1oExsb5hcON4eBoNOSadO9p4WUBTdy+MSyPIUq04zcaICa
	bnuhllOiLH/fny7yE5oD6mx4el7aVvp9nyhgAWWUXGGQxoUfjWMEf5SO5eTqjo0jaf7ZYgR/40p
	5esnqUyz0Q/CIUVWDpCQuNNq3SzSD/zNd/CNt0tWMEw==
X-Google-Smtp-Source: AGHT+IH1WIU8g22isSecQbTXQR/OaPg7POU4rIe/BBXToSrLprRb4xIP/ItGnvzzz7IDJ3lkUGpVSA==
X-Received: by 2002:a17:90b:3ec7:b0:31e:c95a:cef8 with SMTP id 98e67ed59e1d1-339c27affc2mr953133a91.32.1759446400209;
        Thu, 02 Oct 2025 16:06:40 -0700 (PDT)
Received: from fedora ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a0c666sm150292a91.1.2025.10.02.16.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 16:06:39 -0700 (PDT)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: 
Cc: david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>,
	syzbot+7f176adb30b21606c5fc@syzkaller.appspotmail.com
Subject: [PATCH] bcachefs: fix use-after-free in bch2_dirent_to_text()
Date: Fri,  3 Oct 2025 04:36:24 +0530
Message-ID: <20251002230627.23315-1-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bounds checking before calculating pointer offsets in dirent name
accessor functions to prevent out-of-bounds memory access when
processing corrupted filesytem metadata.

When d_name_len contains a corrupted value, the pointer calculation
&d.v->d_cf_name_block.d_names[name_len] results in an offset far
outside the dirent structure, triggering KASAN use-after-free erors.

While bch2_dirent_validate() detects such corruption,
bch2_dirent_to_text() may still be called for debug output, so the
accessor functions must handle invalid data gracefully.

Fixes: c21f41f6905be4fc5059a10a5bba94105ba87269 ("bcachefs: bch2_dirent_to_text() shows casefolded dirents")
Reported-by: syzbot+7f176adb30b21606c5fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7f176adb30b21606c5fc
Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 fs/bcachefs/dirent.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/fs/bcachefs/dirent.c b/fs/bcachefs/dirent.c
index d198001838f3..8be31b41c32b 100644
--- a/fs/bcachefs/dirent.c
+++ b/fs/bcachefs/dirent.c
@@ -58,8 +58,16 @@ static unsigned bch2_dirent_name_bytes(struct bkey_s_c_dirent d)
 
 struct qstr bch2_dirent_get_name(struct bkey_s_c_dirent d)
 {
+	unsigned int name_len, max_len;
+
 	if (d.v->d_casefold) {
-		unsigned name_len = le16_to_cpu(d.v->d_cf_name_block.d_name_len);
+		name_len = le16_to_cpu(d.v->d_cf_name_block.d_name_len);
+		max_len = bkey_val_bytes(d.k) -
+			offsetof(struct bch_dirent, d_cf_name_block.d_names);
+
+		if (name_len > max_len)
+			return (struct qstr) QSTR_INIT(NULL, 0);
+
 		return (struct qstr) QSTR_INIT(&d.v->d_cf_name_block.d_names[0], name_len);
 	} else {
 		return (struct qstr) QSTR_INIT(d.v->d_name, bch2_dirent_name_bytes(d));
@@ -68,13 +76,19 @@ struct qstr bch2_dirent_get_name(struct bkey_s_c_dirent d)
 
 static struct qstr bch2_dirent_get_casefold_name(struct bkey_s_c_dirent d)
 {
-	if (d.v->d_casefold) {
-		unsigned name_len = le16_to_cpu(d.v->d_cf_name_block.d_name_len);
-		unsigned cf_name_len = le16_to_cpu(d.v->d_cf_name_block.d_cf_name_len);
-		return (struct qstr) QSTR_INIT(&d.v->d_cf_name_block.d_names[name_len], cf_name_len);
-	} else {
+	unsigned int name_len, cf_name_len, max_len;
+
+	if (!d.v->d_casefold)
 		return (struct qstr) QSTR_INIT(NULL, 0);
-	}
+
+	name_len = le16_to_cpu(d.v->d_cf_name_block.d_name_len);
+	cf_name_len = le16_to_cpu(d.v->d_cf_name_block.d_cf_name_len);
+	max_len = bkey_val_bytes(d.k) - offsetof(struct bch_dirent, d_cf_name_block.d_names);
+
+	if (name_len > max_len || cf_name_len > max_len || name_len + cf_name_len > max_len)
+		return (struct qstr) QSTR_INIT(NULL, 0);
+
+	return (struct qstr) QSTR_INIT(&d.v->d_cf_name_block.d_names[name_len], cf_name_len);
 }
 
 static inline struct qstr bch2_dirent_get_lookup_name(struct bkey_s_c_dirent d)
@@ -212,11 +226,18 @@ void bch2_dirent_to_text(struct printbuf *out, struct bch_fs *c, struct bkey_s_c
 	struct bkey_s_c_dirent d = bkey_s_c_to_dirent(k);
 	struct qstr d_name = bch2_dirent_get_name(d);
 
+	if (!d_name.name || !d_name.len) {
+		prt_str(out, "(invalid)");
+		return;
+	}
+
 	prt_printf(out, "%.*s", d_name.len, d_name.name);
 
 	if (d.v->d_casefold) {
-		struct qstr d_name = bch2_dirent_get_lookup_name(d);
-		prt_printf(out, " (casefold %.*s)", d_name.len, d_name.name);
+		struct qstr d_cf_name = bch2_dirent_get_lookup_name(d);
+
+		if (d_cf_name.name && d_cf_name.len)
+			prt_printf(out, " (casefold %.*s)", d_name.len, d_name.name);
 	}
 
 	prt_str(out, " ->");
-- 
2.51.0

