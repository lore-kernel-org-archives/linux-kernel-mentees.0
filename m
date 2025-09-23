Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EB830C34F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657656; cv=none; b=SO59gU/iFn3W9Cg6zyaGA6Uj5hmjCeFg08CJnJMXuP2LYSGs6l+ujw0sKEEL3ncoJmJECX2jMtmF4/CE+V6FgRXzCyrMONtASRqGotEtw0rfqBR9Xw7mm053Y9G0/YxtSytWVuUoeRmyKQ7kRCCdapF7SMxn7Tv23nbESDRHox0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657656; c=relaxed/simple;
	bh=C8XXts6akLb11nM2mMQrQ1mX2Cb7JSe8mH+9EyknL/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jn1IYFEzelz/Ey0SZqppCF8/NKqds+Dc4O9k+RPzdztbtjmiIclOylUCu7MLbEY4lhmK08wIYA0sNhVY0Pi8kek/RO2xj7lG6yzRpxKWC9qmMlIe2rMH0KJTurvKG1Eg3mBQRTiTZoMGJPs/umJ9BDImyevc4ZKq9CGgh1pjCwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErAgwzuv; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErAgwzuv"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B1F410D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2Tv7dqSmpYN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 20:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23C51410B8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C51410B8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ErAgwzuv
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 23C51410B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:54 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b2b7d5ff690so47759266b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758657652; x=1759262452; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFnHRlaDkZFQz8z/nxD9a5/SArA8MCeQHjKgdaq4v7Q=;
        b=ErAgwzuvYpsCtLzBaifM2LrkZZ32wbWcUQ72rdKP9ocyI0rjuB5d2/CZnKaXUwsLjH
         WS2BkzlfHSCVpPhkeb0Q4jqUu7WgJDOrUgU80RhgKzPPhDXXM/1cCHOo4EW7YntwJwWr
         3h6M8jM76jUyzWsLJDSgzD5G+X2+GD8y9WK/DOo3+2B5i4e9cDbbq3WnzkwiDg5C/mL5
         ue+zoEJ3ld7ygMkK6Ma6MQDqDjgJy9gudBQg5Q6d7qXro2iGB/kOXeVDtLB64gXbpb3b
         w2s8350AkFD2SIHm9IBZK8C+8s/3CJl67Z+v+NP6+hCRtAI/9A+fTOmFx7/OpOw7Puv8
         dHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758657652; x=1759262452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFnHRlaDkZFQz8z/nxD9a5/SArA8MCeQHjKgdaq4v7Q=;
        b=eCmeQEfhp23BFyfpAQ+hs3WN1CFWP9SABuQ84XAi9Jd0JIg2xlXUNR8AUC1joual1s
         fyzM0NuAx45t4v7QDUmQHTyD86mT9hUqs2OLJkO58zp+jvBw6APBA52D/Rv4ST2Y4rkb
         1U5tWTSu45lCUyFzAJlSIDwbqi7ULGy1aWdj77xv85agoa10sZho43K/CzGhT3IP2CwD
         7dWKrCtVyDoXXB0HoBOBYU91W6GHytPjciaHCHeVlFpX1H5wN/dXQJ3aCMrFJALpXniF
         gMn/QgCfyKpjR/ZiU7hkRoyTQc8osZ/B1fUvG8/ks+nlaha+WFOUeKPFi7AXcGcDtXA2
         jKLw==
X-Forwarded-Encrypted: i=1; AJvYcCXSjmTxNiNMSonMFZfXL/1YlkXDMg+1t+55vRXD+mI+ZGLDdQGUwmMXLC2tBm645FxKwV71sboQC946O/vpRpiJUSyfiw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwP1bZAlzl7lCSpvRpcp6kNO+Z66RdsNtueCNyhBaDDrGssP0oR
	jWCsxkNA3hs9yAF5xJ8/W7dpl08nx9L3eM1NDr9LteV/3OhBn4iI0fSq
X-Gm-Gg: ASbGnctZARdZVBLjchwJBx4qAh74cIxhP5xmvvP4Vw+XIVtgvjlUz64esHA302Ldbvw
	S9UGBkqPgcZjL1PXEqZF55E5pFyEN1/blUKLJOSvFpq4WGcNaVRhB0Rlx55k9cykxruiPrCiLCJ
	rOJ1K1R2mOA182ad1OwAAvCayv1G/yXbL4AKyYdIZ9NwJ357VNmZl65L4WSwQGtT+LD2XqeSwJO
	Q0cETyAlbtaupSgouHoJbgLykn4SqT8G871C9tnUye5lekLihpP2svJrAeQY25/QtQVASDTEKvH
	B8ZKYWKQwj7BFEzsJTCc0Rr2Ghy/YDBe97pG2rOrrCs88j+6eaDY4TPADbeAS4Kkvexd5sLp+f1
	TLrOJ1YLSVlw6D17ueAOJFHCB
X-Google-Smtp-Source: AGHT+IGhKcZdV0r8YP2ON3pdAtvi9EACajla8mdLJY/F2fjwqzyOEqYb9k1Ezx6pq7ms/ARYTztc8Q==
X-Received: by 2002:a17:907:d8f:b0:b04:2d89:5d3a with SMTP id a640c23a62f3a-b302b80a6femr234862766b.7.1758657651892;
        Tue, 23 Sep 2025 13:00:51 -0700 (PDT)
Received: from bhk ([165.50.1.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2ac72dbe92sm672074066b.111.2025.09.23.13.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:00:51 -0700 (PDT)
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
Subject: [PATCH RFC 3/4] uapi: netdev: Add XDP RX queue index metadata flags
Date: Tue, 23 Sep 2025 22:00:14 +0100
Message-ID: <20250923210026.3870-4-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added NETDEV_XDP_RX_METADATA_QUEUE_INDEX flag to both netdev.h files
for the bpf_xdp_metadata_rx_queue_index() function.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 include/uapi/linux/netdev.h       | 3 +++
 tools/include/uapi/linux/netdev.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/uapi/linux/netdev.h b/include/uapi/linux/netdev.h
index 48eb49aa03d4..59033a607c16 100644
--- a/include/uapi/linux/netdev.h
+++ b/include/uapi/linux/netdev.h
@@ -46,11 +46,14 @@ enum netdev_xdp_act {
  *   hash via bpf_xdp_metadata_rx_hash().
  * @NETDEV_XDP_RX_METADATA_VLAN_TAG: Device is capable of exposing receive
  *   packet VLAN tag via bpf_xdp_metadata_rx_vlan_tag().
+ * @NETDEV_XDP_RX_METADATA_QUEUE_INDEX: Device is capable of exposing receive HW
+ *   queue index via bpf_xdp_metadata_rx_queue_index().
  */
 enum netdev_xdp_rx_metadata {
 	NETDEV_XDP_RX_METADATA_TIMESTAMP = 1,
 	NETDEV_XDP_RX_METADATA_HASH = 2,
 	NETDEV_XDP_RX_METADATA_VLAN_TAG = 4,
+	NETDEV_XDP_RX_METADATA_QUEUE_INDEX = 8,
 };
 
 /**
diff --git a/tools/include/uapi/linux/netdev.h b/tools/include/uapi/linux/netdev.h
index 48eb49aa03d4..59033a607c16 100644
--- a/tools/include/uapi/linux/netdev.h
+++ b/tools/include/uapi/linux/netdev.h
@@ -46,11 +46,14 @@ enum netdev_xdp_act {
  *   hash via bpf_xdp_metadata_rx_hash().
  * @NETDEV_XDP_RX_METADATA_VLAN_TAG: Device is capable of exposing receive
  *   packet VLAN tag via bpf_xdp_metadata_rx_vlan_tag().
+ * @NETDEV_XDP_RX_METADATA_QUEUE_INDEX: Device is capable of exposing receive HW
+ *   queue index via bpf_xdp_metadata_rx_queue_index().
  */
 enum netdev_xdp_rx_metadata {
 	NETDEV_XDP_RX_METADATA_TIMESTAMP = 1,
 	NETDEV_XDP_RX_METADATA_HASH = 2,
 	NETDEV_XDP_RX_METADATA_VLAN_TAG = 4,
+	NETDEV_XDP_RX_METADATA_QUEUE_INDEX = 8,
 };
 
 /**
-- 
2.51.0

