Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649762E11CB
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118073; cv=none; b=s59dLyOgdjO+l7F2T51Fc+p86SL+U/YD4M7CKht9mdvadnb8yvQjZa91F2q3tJNr80hBF14S4Ec8jKqF5da+NNiW5+PgBOYbXOqlZ93J8q9gXDtgFIwpPiGrGkVRCI59GXfgA34/wsbYl3pvYpDeBBEbtmMW/IkjcvFvJwsXR6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118073; c=relaxed/simple;
	bh=2GfL6H8CYFvd2zlRSEbFF6hlTsz3/QN8XHAewO9l4TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSIWyoRqB+zm270/MkAdRVw/PSAQsX544qkg0YWBzVOi5bs6LKzE7Cqcs8IR67dAeB3DRFYsqZ95y52SS/faeEbwGF+OVlRXXJu7wZNRXABJV9fpKxajU0IC8qK6gkzq0KI7yybaG64dtAMy3srtdLcOu8qqTks6svHqj0uO5wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SydmGKb9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SydmGKb9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-25d44908648so68056965ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 07:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758118071; x=1758722871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lF4l0V5Y3ywmZyeZWtOMP5+EAmRdCLutinoQNvLsYc=;
        b=SydmGKb9tO2d+KGfOEd8HKYyVtL13d+PLr4jV3SklU06wyFmoyH0XuGCyQPFB/glrV
         yfvWJ5TLJsTgr7hwkMovpbmfznN01DuBok29OEYQHNnymppYTR29hqrC/DXbXU23cBIt
         C77gd7hH8yntMOCZuYSLaKT9o/oUz0XqONjF3/xP3AAifZquI+khUtrr7/Q+0Zk4qS1b
         Q3AejcYxjErylbVQGVzxuw0fLr/Z9Q+13VeVOHmhga1lQ5jyuIRQxW2BDtVd6IPHRQNG
         u3tcQsf3+EZ8D7ppCB/nTsEgeiRxafc83zUC2tBt2Ii1UIaUOD+OBj3g0HGTPE7Y7hbm
         s2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758118071; x=1758722871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lF4l0V5Y3ywmZyeZWtOMP5+EAmRdCLutinoQNvLsYc=;
        b=S1FxQnfSVpOZdAPnN9bCWI3m48I5XXHiMujaAUmSIUwC/J1HgyHpgXmgeL/mDYGLi3
         GA/aYaGcz3T++hhfciavlE31kUZy72iYBB8HTsTafE/rHRGJnNIC4k2n5dnFsYNKBLEr
         N0cudEX9Yh0LT9EA0KH9CXcoPXA3c7m8Yyk7Cz2vQv/PxpqHbqcVRdTITvXNVNfflBH0
         m03bfUiao87a+fBDcnA0D9DJK26b25COhxEYsaOdRsXFnILxjxLd6wgt6zvrnuXtOgtv
         s4en0TN7yAHASx5E/BNv+vuKlvoIcbLET4JDeBMaLHu+vrTvWB02+Nz5boj8zf5X7R4j
         PQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNw/Z+9VarsSb12r5SMjVmmXmg8LgEbEM3sYftBNuO1PNbdig2xizoadywMetq+mrS9c3QqvXoV+EmZzwD4YH+xKxBfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdEm09eu5L7qDmCF3emK7BJMV4nZeQFY3m+l1/daqBWKoVpE2I
	stdgI9qYgUv+vEH4pOLyGYIvdTUbtrbIaBaZVVoM8hINeX8s9AzOGbVv
X-Gm-Gg: ASbGnctDE2ts1NjYD4l+BEs3dBxi2BUIvVcEb7F9RxUSjaj8k3hts7l07u5KG1oGlTL
	M3KiqssDc0Ut+QdMpMBkkO+XjG9blOh3qPJ1+8+kXrJOOk4rW3Rcg8scKH8LvzvpIjxZk1CiYQL
	xS0tkL5gLdvN2OZ591FmojeKarx1SvUG4ydW2SPZdg/CwXD8/5YJhVI2/5xsCDgFxULNQdn0Z/I
	n0+5y5BE9i/DNRFnE2qmN0agxkfP0way+wj3oHgPxvF/XGXmM0jR0C7GzADbRGbRZokSWyT94cG
	P15Fsi7VCGsIX4MAmeSo4nZuZ57WhW8DNVRPtpkp1qY27meU2LKC3cMClswGT1Ztve3fhsNmRoJ
	N17ycNlKNOpYNgEK3LP653mT44bBg4YZ16WNEqeI=
X-Google-Smtp-Source: AGHT+IEr/hdZRZQ5SAxQUru2gpuQ/w8Xb+9gVyVGs2q8Lew9lO8+3ZDoV3nfvoNYt6YCJNKJutUiJA==
X-Received: by 2002:a17:903:4b03:b0:251:3d1c:81f4 with SMTP id d9443c01a7336-26813cf3339mr34224225ad.54.1758118070389;
        Wed, 17 Sep 2025 07:07:50 -0700 (PDT)
Received: from cortexauth ([2402:e280:2313:10b:d917:bfec:531b:9193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267c9996c93sm53058285ad.122.2025.09.17.07.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:07:49 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: krzk@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com
Subject: [PATCH v2] net: nfc: nc: Add parameter validation for packet data
Date: Wed, 17 Sep 2025 19:35:47 +0530
Message-ID: <20250917140547.66886-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 for the original patch, I realized soon after 
sending the patch that I missed the release of skb before
returning, apologies.

Syzbot reported an uninit-value bug at nci_init_req for commit
5aca7966d2a7

This bug arises due to very limited and poor input validation
that was done at net/nfc/nci/core.c:1543. This validation only
validates the skb->len (directly reflects size provided at the
userspace interface) with the length provided in the buffer
itself (interpreted as NCI_HEADER). This leads to the processing
of memory content at the address assuming the correct layout
per what opcode requires there. This leads to the accesses to
buffer of `skb_buff->data` which is not assigned anything yet

Following the same silent drop of packets of invalid sizes, at
net/nfc/nci/core.c:1543, I have added validation in the 
`nci_nft_packet` which processes NFT packets and silently return
in case of failure of any validation check

Possible TODO: because we silently drop the packets, the
call to `nci_request` will be waiting for completion of request
and will face timeouts. These timeouts can get excessively logged
in the dmesg. A proper handling of them may require to export
`nci_request_cancel` (or propagate error handling from the
nft packets handlers)

Reported-by: syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=740e04c2a93467a0f8c8
Signed-off-by: Deepak Sharma <deepak.sharma.472935@gmail.com>
---
 net/nfc/nci/ntf.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index a818eff27e6b..f5e03f3ff203 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -809,35 +809,61 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 
 	switch (ntf_opcode) {
 	case NCI_OP_CORE_RESET_NTF:
-		nci_core_reset_ntf_packet(ndev, skb);
+		if (skb->len < sizeof(struct nci_core_reset_ntf))
+			goto end;
+		else
+			nci_core_reset_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_CORE_CONN_CREDITS_NTF:
-		nci_core_conn_credits_ntf_packet(ndev, skb);
+		if (skb->len < sizeof(struct nci_core_conn_credit_ntf))
+			goto end;
+		else
+			nci_core_conn_credits_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_CORE_GENERIC_ERROR_NTF:
-		nci_core_generic_error_ntf_packet(ndev, skb);
+		if (skb->len < 1)
+			goto end;
+		else
+			nci_core_generic_error_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_CORE_INTF_ERROR_NTF:
-		nci_core_conn_intf_error_ntf_packet(ndev, skb);
+		if (skb->len < sizeof(struct nci_core_intf_error_ntf))
+			goto end;
+		else
+			nci_core_conn_intf_error_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_RF_DISCOVER_NTF:
-		nci_rf_discover_ntf_packet(ndev, skb);
+		// tech specific params are included as unions
+		if (skb->len < sizeof(struct nci_rf_discover_ntf))
+			goto end;
+		else
+			nci_rf_discover_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_RF_INTF_ACTIVATED_NTF:
-		nci_rf_intf_activated_ntf_packet(ndev, skb);
+		// tech specific params are included as unions
+		if (skb->len < sizeof(struct nci_rf_intf_activated_ntf))
+			goto end;
+		else
+			nci_rf_intf_activated_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_RF_DEACTIVATE_NTF:
-		nci_rf_deactivate_ntf_packet(ndev, skb);
+		if (skb->len < sizeof(struct nci_rf_deactivate_ntf))
+			goto end;
+		else
+			nci_rf_deactivate_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_NFCEE_DISCOVER_NTF:
-		nci_nfcee_discover_ntf_packet(ndev, skb);
+		if (skb->len < sizeof(struct nci_nfcee_discover_ntf))
+			goto end;
+		else
+			nci_nfcee_discover_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_RF_NFCEE_ACTION_NTF:
-- 
2.51.0

