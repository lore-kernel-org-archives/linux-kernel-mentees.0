Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A32DC33B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657653; cv=none; b=CBiEibOe+OS0Qdy22B+YAbFGdSh55ca+FmjBPA/6UzK6VA6qj3A7WoaGO6jOu9Q40tHBD+lIGNDTny/9A74EvIlLhgH/v7ROAmqRHqBJTv79WZKymMT02LhmBP4Unp8ZXJ/D1pTb6BqjecsQ7H34IqxY+1Aq9Dv3PjeFfhtXQ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657653; c=relaxed/simple;
	bh=0fk/n7B9mEiC2MeLQRlJTessoCBaV440mO7d/PjdBWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JduSwByHlj01EWBWjL+WENhfFiXNzhnLeTBnFTl27tWaaSnq5TKZXH/ifMN7PWaJfhhNjBPVGIVsQVb4FXPcQ/MxFpvdD236qHJpfIKUgW1QlIDk3jv0q/G21UyMiWUkk6vbvEGbCulMRgoKKzgHpHC+RHcamQWzMifsbb6VpOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncVNL/10; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncVNL/10"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61C7260AFB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YTx4TjpFFSh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 20:00:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85BC9611E6
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85BC9611E6
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ncVNL/10
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 85BC9611E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:50 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b2a55c5ddadso46058866b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758657648; x=1759262448; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxvGwdECme9sva+F1ujIW8jaKUJIsBLHPhmAsgPJYCQ=;
        b=ncVNL/105DPmFz2bz+49YTEfBTYaossySNpUJXXH9uh9hB+D3zIZHIljkJ0WmE4qpM
         fj+PSHmrgSv4tQsjLl0pyw0ukSLIFUP2JORPHIl1hw2WtYLwlJ7WbUZW7JxYbgy9lff+
         0bIqzFm8EvIauOb0HgKtFuS/8Tnp/Si5KGuzoK08JP5KKQcoj46hi4ZW52Do8jeCZvJu
         wQ1uAQMkiIiGAzuZt9BATKBv1STQpJ3CEmxwB2KZHqCaY4+eCEDdgLKtD75oIrgyMhdm
         wMqP4mgy5d0h6S0GpNDlbO2MqEOxAzRrSrIBZEDq3gjasJPr0aeq8RtB0KD8WcHwM4/v
         CqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758657648; x=1759262448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxvGwdECme9sva+F1ujIW8jaKUJIsBLHPhmAsgPJYCQ=;
        b=t0wNGWYuaUQuKfso2KR5AD1Wsf29KTEccIYzfPP/UimsbpKutfhO8gcc/XwixVQ4x2
         /VSFv5mRGE4vKm04Mz5+AS/Dlg+1qjM4BpmTspe2VDbGfk8+Wyz3TCdzkQNpaSGbmukO
         /+Fso9MsODrATrnXwpiHV6B/9wI7E92qy8Ou5sBrHLbnu90zGzTHs5PKa+Grj+qg7eiC
         yYv+HLJV5nfUM67xE5CEQ+jWhJ+WTVWaEerK0a19tg9dLi89AZ5JAbZIrvbSXnptVVh6
         K7T3fGGDXXZNkOB5QH/HBrUxPd7Kz104zXyVt7rmvqDUWx5NYScQz0F15FX6mlasW0Ey
         lYbg==
X-Forwarded-Encrypted: i=1; AJvYcCUm4Kk6OoKfH4OHjR2FnP//hE4jA5oe+GwHhj7E1nHwu/ZUbN4Fx6BZN35zv+ow91kXpbyOqfDArZ/cAOPqWu0X0QA1mQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzmCWoAhr3/RwiTIo7bkNKNQEZlTnP8rSh/QidwvKp+tAJap2tv
	TCQAEumTbKKKlKu7DyVGfyNS0FIic0wHRaBNfpGsz2GGIOoNplPHxD7N
X-Gm-Gg: ASbGnctsMTqVsr4laM5Jn+eeFYPAidRqRSneELLG98AdzPEKU9hU2jpX88feydsQS/k
	gM+uv2hH1h/exjVEjJ3XIkOmtLiEvGz4nutSnc7LYSPMybL10c3SDQ1SHN2D1/au98hH70ODonp
	TIgg5TRsYtwSk8j/zOmqxq7HWxAGLf4mq8LKp6zQYqe1MG19dHvG3qZeqqTBqVD1XH0Lb2b2a2R
	ADCQYKYCSX0Sg8xgyfoVRR2mD5/rjG8SP8EgIgRzYISGcgJKbDeGc01RCP/Vt/K+Rs9LxQGDRAy
	tcYUV+tGaLiHiadMA75Ufh3MciDhoE5fM6CF/C2jAtpILueAlDAphaQzs2FC50p3VnLvr4E+f96
	qILAWZr2Twm8qDj96qU0eBniChU+JzU8P4b8=
X-Google-Smtp-Source: AGHT+IE9jKk/zzdKDwXkO7sxSkoqe/jjpTEgScJwrOwZYkbO90+nHVble2JF4n49Nmv6GbSPvrhTqg==
X-Received: by 2002:a17:907:940f:b0:af9:6580:c34f with SMTP id a640c23a62f3a-b302ae307b6mr174461766b.9.1758657648256;
        Tue, 23 Sep 2025 13:00:48 -0700 (PDT)
Received: from bhk ([165.50.1.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2ac72dbe92sm672074066b.111.2025.09.23.13.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:00:48 -0700 (PDT)
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
Subject: [PATCH RFC 2/4] net: xdp: Add xmo_rx_queue_index callback
Date: Tue, 23 Sep 2025 22:00:13 +0100
Message-ID: <20250923210026.3870-3-mehdi.benhadjkhelifa@gmail.com>
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

Introduce xmo_rx_queue_index netdev callback in order allow the eBPF
program bounded to the device to retrieve the RX queue index from the
hw NIC.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 include/net/xdp.h |  5 +++++
 net/core/xdp.c    | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/net/xdp.h b/include/net/xdp.h
index b40f1f96cb11..edbf66c31f83 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -547,6 +547,10 @@ void xdp_attachment_setup(struct xdp_attachment_info *info,
 			   NETDEV_XDP_RX_METADATA_VLAN_TAG, \
 			   bpf_xdp_metadata_rx_vlan_tag, \
 			   xmo_rx_vlan_tag) \
+	XDP_METADATA_KFUNC(XDP_METADATA_KFUNC_RX_QUEUE_INDEX, \
+			   NETDEV_XDP_RX_METADATA_QUEUE_INDEX, \
+			   bpf_xdp_metadata_rx_queue_index, \
+			   xmo_rx_queue_index) \
 
 enum xdp_rx_metadata {
 #define XDP_METADATA_KFUNC(name, _, __, ___) name,
@@ -610,6 +614,7 @@ struct xdp_metadata_ops {
 			       enum xdp_rss_hash_type *rss_type);
 	int	(*xmo_rx_vlan_tag)(const struct xdp_md *ctx, __be16 *vlan_proto,
 				   u16 *vlan_tci);
+	int	(*xmo_rx_queue_index)(const struct xdp_md *ctx, u32 *queue_index);
 };
 
 #ifdef CONFIG_NET
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 491334b9b8be..78c0c63e343c 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -962,6 +962,21 @@ __bpf_kfunc int bpf_xdp_metadata_rx_vlan_tag(const struct xdp_md *ctx,
 	return -EOPNOTSUPP;
 }
 
+/**
+ * bpf_xdp_metadata_rx_queue_index - Read XDP frame RX queue index.
+ * @ctx: XDP context pointer.
+ * @queue_index: Return value pointer.
+ *
+ * Return:
+ * * Returns 0 on success or ``-errno`` on error.
+ * * ``-EOPNOTSUPP`` : means device driver does not implement kfunc
+ * * ``-ENODATA``    : means no RX queue index available for this frame
+ */
+__bpf_kfunc int bpf_xdp_metadata_rx_queue_index(const struct xdp_md *ctx, u32 *queue_index)
+{
+	return -EOPNOTSUPP;
+}
+
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(xdp_metadata_kfunc_ids)
-- 
2.51.0

