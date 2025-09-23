Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240312F3620
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657643; cv=none; b=EiMPtcXkEjCAaFM8AqO5JRDttITeqnXU5iVEZXH3YIwHFaD99Lh2I67Zres8cypNxk9pQ1lIohp/+LHK5UoRBDTNECCCSKvTrAqnRGwqbVBS13D0Pz7JpajAwlVyyaKRjwmG1PTv6oWTE1ggRddtN8aNPhtcTgkeLGG9ZKQrU60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657643; c=relaxed/simple;
	bh=DUqNL0BxXw9yb60YTESlG8jt6nJyQ3pOZOLBywKCkqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LOQDWvqJh8Q5Mh12gkAKEavMihvS5Wk68YNsYv2Fj1395U7Z5XmVjiWQSYKoSsWAkSHyMoYQHHUf2yH+qo84WbfxFSAr25eKP0ES1PM5VZkythqoo5BcShHLf6H6hO1tfwG0jaTnWlFy41s/ewZh2ZknP/AmN+KoKF99ZRdaNSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ea1u/rio; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ea1u/rio"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB04E61098
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvq5J57_Mqdx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 20:00:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC96F60AFB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC96F60AFB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ea1u/rio
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CC96F60AFB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:40 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b2a55c5ddadso46056466b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758657639; x=1759262439; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MMlXrZQAEQaYYcackbMrUxU4ktpxJHOJCKry2TD8zSM=;
        b=Ea1u/rio/UBGuf/JSlgNT3sMWf6VMBtBrMrofMNXeMaaa+9CpiZJuts/jxNHtY7QnF
         b1F/OFjMKk2avsQzM0yet7lOmEDry1iETDNDQaydseHn4Wwysos0kBHyy1Meqm0/re27
         jt2Wt5I+L+lfNyrsETHT7fPbSOGFfQVIqQiQuqzOqpRJBhriJxUQw/D+XARGR5QRmKY3
         +uL2nEmIt3jqoG+TsY9CcB5k2GPOHEKazZ5BW4DLopm3/XGNFJNN40KavLyez6OgYjEg
         DeHzUuWHyOgApkaseY57CO6c+k/mYa3CKYDMFQCkxuilEpUSn7ZGPfLix3JVtd+2A4jV
         Rcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758657639; x=1759262439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMlXrZQAEQaYYcackbMrUxU4ktpxJHOJCKry2TD8zSM=;
        b=ZCV/sM1VbGynuWtFBX/zv3fOKHqR10xE3QTjCU/vdyR0AMWRZGz1hVVi7bPBPQ7FZd
         D9c2YtP+eFEY5Vs+9Stdff9gJ1A7DbDGSym2oYmY/UP7RpPVEyG0yh3fN6e7mJhGpiuh
         u9eHIvNM/f1WrXKsB2oBBQkBb5FFh6PbRbHl55g4hV6tdBigF0v7ALSyqdgApyw8dI1G
         /Xye9yziiBSvPolUQ56tkFsuWzOUGrsTXYKeDXbkf3sVwgVQs4bHNFPldUWSI0C+Emph
         T/SrJL6F64eKPdriUik+76J/PPsL0dlbNLqroCB5Hm5/7JILdCj0Ff92oEIloLu/+uXI
         oPaA==
X-Forwarded-Encrypted: i=1; AJvYcCXEXF0uKCjk/2nYcCtLk+iX9d5XA3LZrkESpxeL90hDiU3uSQRRbmnxgkNQwygoVVL4r0abu4cIY2IXe2Xet95HmStH+Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzAL+dulPwUT0WsrYP/7gYd3n1mKLOcjNVxNUYTT4X6z9DvdefY
	mw/zMUzKduk5cWqjviIifx9Guz2IOEbTmt/8F37SIxInqflAn2n13sXQ
X-Gm-Gg: ASbGnctrVDdfNCCw2vQIftPKPFyPxxM0c6XcTaHBPTfpj6bSMHy40/47yBZuN5YfGKD
	/xhcOCfPOpxHBp+SEal/jOI4t9qNysgvL28PlJ2j4mQpqQd9kUJZN2t7C01hIqeuBk4VyhlPepV
	lkKZjTymGbxXlbzKMHACfaB9B8xVyKyXtzd/7RfzTyyW+t3+LXq6BjENMRbbnLp/xoLKshiwJF7
	mjKNL2rXGyq5WFV+TXx4ycbjCYZc0KAr2YDJVZVOhANbGgdiE9neK93kh9NMn+tI976kOPP3dTC
	f8XTla+mps2r4MlMI9O2nv7hhR5LlRjidIwb5Fr2XscKLerMpJa3WKNlQjwCYHEtQ0zyoGmAMbh
	n9fkfQ0tPD0MUOX1CwrN7g/O2
X-Google-Smtp-Source: AGHT+IHN5XcNp/1KJalZXV/5R5ZCq+blsOxXx3/x4YcOoDnXFZxHCB5DKHENkTDjUloqq8JYpW2v8w==
X-Received: by 2002:a17:907:7b8c:b0:afe:ae6c:4141 with SMTP id a640c23a62f3a-b302689ce0emr142054966b.2.1758657638404;
        Tue, 23 Sep 2025 13:00:38 -0700 (PDT)
Received: from bhk ([165.50.1.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2ac72dbe92sm672074066b.111.2025.09.23.13.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:00:38 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	andrew+netdev@lunn.ch,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	matttbe@kernel.org,
	chuck.lever@oracle.com,
	jdamato@fastly.com,
	skhawaja@google.com,
	dw@davidwei.uk,
	mkarsten@uwaterloo.ca,
	yoong.siang.song@intel.com,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org
Cc: horms@kernel.org,
	sdf@fomichev.me,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH RFC 0/4] Add XDP RX queue index metadata via kfuncs
Date: Tue, 23 Sep 2025 22:00:11 +0100
Message-ID: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
Mehdi Ben Hadj Khelifa (4):
  netlink: specs: Add XDP RX queue index to XDP metadata
  net: xdp: Add xmo_rx_queue_index callback
  uapi: netdev: Add XDP RX queue index metadata flags
  net: veth: Implement RX queue index XDP hint

 Documentation/netlink/specs/netdev.yaml |  5 +++++
 drivers/net/veth.c                      | 12 ++++++++++++
 include/net/xdp.h                       |  5 +++++
 include/uapi/linux/netdev.h             |  3 +++
 net/core/xdp.c                          | 15 +++++++++++++++
 tools/include/uapi/linux/netdev.h       |  3 +++
 6 files changed, 43 insertions(+)
 ---
 base-commit: 07e27ad16399afcd693be20211b0dfae63e0615f
 this is the commit of tag: v6.17-rc7 on the mainline.
 This patch series is intended to make a base for setting
 queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
 the right index. Although that part I still didn't figure
 out yet,I m searching for my guidance to do that as well
 as for the correctness of the patches in this series.
 
 Best Regards,
 Mehdi Ben Hadj Khelifa
-- 
2.51.0

