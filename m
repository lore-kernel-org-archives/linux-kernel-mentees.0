Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55AF2EACE9
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 11:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758109295; cv=none; b=SJDmUWZYtF0gbL5IAZLvX5etSZw2o4V32zGGRdMYFfUXFpV4urZwaBsdJFt73xqAdgA7tW61TwDNqI/znY/8AlUeXdPSQgq0775cPy9XqVTj6KmxKbCcpRGSRlnz+NX5C8W4WbNgWtAIQoJ4CBIUmmbzEZgpYSnys+uva5+Fn4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758109295; c=relaxed/simple;
	bh=N/Ee7PwVVD0Btz2fKiYLBUQb8Z3NZU3V0y/CRtFbjSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8+7l9jaM6OkiUUqEil9Dadnge8AuQBLHS0ge8KpXwbr1Wgcr7Fvep5+TGR1VVxa81RAKJ3fsvi0/8WVWNANJID1/TEn9u7QZi7oYiKOR6xdAy1w78/ilZuitTVcEjPhOfzU7pzivZdlwQfdlLr3jGBJFiaAYgkx/lpP6a77cok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q51vtZxu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q51vtZxu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2570bf605b1so65753975ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 04:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758109293; x=1758714093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/71U6mk1HE0y17xhkV6xojGxhUtQ/FIiDu4wfoMksm4=;
        b=Q51vtZxuU9pVa94p3v7veK5gXLPZXamGQWJ7cr3loOL/xpyEu7tq8bWdARvdz+pqLL
         wTqYa3ipJ+k6VKaZLFkGYgnwPOQbjJboMuStfWGg2CqrooPVk29kpdiY3tB1BsxzqoaB
         OY31NBzTvrvNZIUYPJd3Jpd7e/44Nqn/FIuQrHO0O/NartsDq7/1Ui/TI9MvlxxXA+LN
         B2d6jUFkkgy9fjJRduFEBhXOHEMeq80M54zwncM4q11k03VyVn4w4vtIcTVNre4zMvoe
         1jAx5WjFgS71zjMEtVYW5w2Ji44SVPsk2aCSb1j9w86/RuEr3JsGCV3OyC0cFzBZqNUw
         GIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758109293; x=1758714093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/71U6mk1HE0y17xhkV6xojGxhUtQ/FIiDu4wfoMksm4=;
        b=KA/SNeTRbvLrSw0sl34CvFDvGGm6yttOcQQtoUVYJNqtTg5BtOSB7/NlP1pV2/dlKT
         yAV42GFKmcBsHBacuH1aaVzs2pG/rnzh3dxTQa3FvF5UEkaxhJJtuwvH1LJ0o74jPDvJ
         X2UstVvI8o5k08yFHlxN+hSMV5cVnzdN8KSTVxCmTLVBv9SF2/7elYY4cwKw75Pbl07m
         lfkSplttkCcca0rcAo7h0GAOneX9EBcUF/dJX1xDjCpNAPV0yQbdBr7Ciy0aYrW3HEGF
         S2e4x/tIhLwuaFmQfc9CQfMDfh3gZeTvSFOXhTSlqCgNI+zjebJ6SircbtM+6cyCmPzX
         UI3w==
X-Forwarded-Encrypted: i=1; AJvYcCVFDYx4XGByDJCjhB1ZPiZn6uGt0qRBlfYhythK+aEwDP09DiKV+4gOxBkGCOCruRauWIjz0v2BPa2DOv9eZQIcjZPe4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmfdQwZ+X2LtPFNZKpbs6/EgybLzTMmXbe5ypJsRMAA+bEL5Jt
	ptktlvYaBhzERQyT5k3JxA2eGLIYlSSGApO4iwwx39XozbJvSuufooHW
X-Gm-Gg: ASbGncvYaHnzb7bhCoEM6bPstXMcVHtR3KraMNYcU4JVZo+uRavnyR0+5Ke74WvcA7Y
	RdAY4wrIB9OtF8L+XcgxuT+xW8M0+G7lJQRI4RdUAXpIfORtO5wNs5VX+ZF472lwRlFhskTkMBw
	EJNmx2S6TmMn8HcS5KB+4OOm+QdcpLysVpIJKiMfifE4EkUBdExLY/7Mfx65trwMK361/pGbF/g
	MaX/rgLpSOJTFcndxCpO7Zsn57xukHt81/iXk34od9AqUTNJs6EexL0rFVSkQ5q+QFadwm0Klcy
	kaLp9wTN5O3G1x1BJfCUbDiv1nKvkP1lPsQR9OZtPMzVECEvBeFsybWu5QCdZrasGKAZ5fqiob8
	JZsyd4WJsV2fNVZIsfOK9M6+yKgfJiAdXv1mkb8M=
X-Google-Smtp-Source: AGHT+IF4IlklU6MYc9xEkBsSBCRnBKDqQDO2bhUmKc2QNEE0v/TjKfWMhF7G9o+gmjzjr/VZtfcv4g==
X-Received: by 2002:a17:903:2c9:b0:246:441f:f144 with SMTP id d9443c01a7336-26813e00ab9mr24839985ad.56.1758109292952;
        Wed, 17 Sep 2025 04:41:32 -0700 (PDT)
Received: from cortexauth ([2402:e280:2313:10b:d917:bfec:531b:9193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269741690a2sm2722865ad.92.2025.09.17.04.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 04:41:32 -0700 (PDT)
From: Deepak Sharma <deepak.sharma.472935@gmail.com>
To: krzk@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Deepak Sharma <deepak.sharma.472935@gmail.com>,
	syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com
Subject: [PATCH] net: nfc: nc: Add parameter validation for packet data
Date: Wed, 17 Sep 2025 17:09:37 +0530
Message-ID: <20250917113937.57499-1-deepak.sharma.472935@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Following the same silent drop of packets of invalid sizes,
I have added validation in the `nci_nft_packet` which processes
NFT packets and silently return in case of failure of any
validation check

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
 net/nfc/nci/ntf.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index a818eff27e6b..05ee474a1068 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -809,34 +809,52 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 
 	switch (ntf_opcode) {
 	case NCI_OP_CORE_RESET_NTF:
+		if (skb->len < sizeof(struct nci_core_reset_ntf))
+			return;
 		nci_core_reset_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_CORE_CONN_CREDITS_NTF:
+		if (skb->len < sizeof(struct nci_core_conn_credit_ntf))
+			return;
 		nci_core_conn_credits_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_CORE_GENERIC_ERROR_NTF:
+		if (skb->len < 1)
+			return;
 		nci_core_generic_error_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_CORE_INTF_ERROR_NTF:
+		if (skb->len < sizeof(struct nci_core_intf_error_ntf))
+			return;
 		nci_core_conn_intf_error_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_RF_DISCOVER_NTF:
+		// tech specific params are included as unions
+		if (skb->len < sizeof(struct nci_rf_discover_ntf))
+			return;
 		nci_rf_discover_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_RF_INTF_ACTIVATED_NTF:
+		// tech specific params are included as unions
+		if (skb->len < sizeof(struct nci_rf_intf_activated_ntf))
+			return;
 		nci_rf_intf_activated_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_RF_DEACTIVATE_NTF:
+		if (skb->len < sizeof(struct nci_rf_deactivate_ntf))
+			return;
 		nci_rf_deactivate_ntf_packet(ndev, skb);
 		break;
 
 	case NCI_OP_NFCEE_DISCOVER_NTF:
+		if (skb->len < sizeof(struct nci_nfcee_discover_ntf))
+			return;
 		nci_nfcee_discover_ntf_packet(ndev, skb);
 		break;
 
-- 
2.51.0

