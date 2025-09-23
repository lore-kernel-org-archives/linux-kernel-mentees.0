Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2421230CB48
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657660; cv=none; b=IYfCqDkP6YarlPndK6AcNiv+o7fAFg+cScIHNyW/b1ad+eg/OOrFOChlbJppeT7NhhK/brDSjW2Ttcz1TFzkG6MGlMkci4X7YIhxWxYqRmRkv0GVP6sQgrRhewNiBerUyOEMTj4EwJUQTOeWdeO7I1z6mE8FELehLl7xKxXTg0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657660; c=relaxed/simple;
	bh=za6eoflza+eI0daPO52VrArrXQQh9oKqLFL2yU7G4qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oajtq6gbMReKCq/dYMx0GPCCJjJSGkd1VHjzwLnRxxRUamA0CbJwitmnVtsJv6UOzVevxLTwXZ0Hca0H0hOoK9Q2XOk1V+Yh9uoDvl/Ksqf0zLIaIFVN5ZwglaIdfBgnoUujRiVOWzENdxgiGUkZk8ddwGa0goAycaUan0StGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MphMrz9K; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MphMrz9K"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAF8C40C66
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QNXVngw0xN3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 20:00:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B223840C93
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B223840C93
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MphMrz9K
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B223840C93
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:57 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b2a55c5dd2dso68627166b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758657656; x=1759262456; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvM5EG3LMIQuZITndtrZP0Eki684ON50PFEBay054lA=;
        b=MphMrz9K6OTfbSz9/nMmA78t/JKI8Y2Z06od7upA9ZZXTptdnJZ2iHk7ULPjtvVZY+
         ZOc0KbALjmfUv7APyMc1PN6r2e4enDx5fmwtkN/Z6PwmFRmoE/ohos48CwKrrf5SwYC3
         JsTTLGSJd3eQPkomPrYlugxEfghI2SatAMaAakjmy/bBzNVxs1e2sqPPuBLjJwn2pdlS
         3UWAW9CvuANN8WZ9kNn3ZPkZrMKOdz7uoRQpHZZVhYMtAJI4RsWb7xyPTt8wKSXu77Of
         nyv5KXLU2aZuaWY60XYZzsSv3lMJsST907qNcWWfDjBEL7ueCgQ2peC2rG/jtZWhMRe5
         VpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758657656; x=1759262456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvM5EG3LMIQuZITndtrZP0Eki684ON50PFEBay054lA=;
        b=aelkhNxMXtEUyEshSEqgUTxbtTCNkDPEUjeV0MA+bIU75eCOvUzO8SMiYMWFIOqCpC
         nZDw4x8WtQCQkVGz1WQgYiRzpXnQdWyGTpP2UTeOtSFSuBh5zZu9/iBZvTub8kpCqxim
         df7mLGsTZ8ipCqLClXtNqCZEhvCc3Y/JVnO/wvNRR54FJ8VQeKCJAuDNuGIolsX7RRrv
         wl+hpG5aau4CzC1BtJNyLzJLDTIQpyISUIhTjGCeenb7o/Amnor1BNEoold4QS0dsetq
         CmJ8yGG4GuducHyU5FE1P8nFpxmuiFhYEateQaclY2C7x5WfX881BomVu0c61Vi37jZS
         jIbw==
X-Forwarded-Encrypted: i=1; AJvYcCWRaYYczR/6xNZYRmCnL8oTbKgSrl27Fxext00zIQnygGRDNVO7WcnnAqfgjWHj3oyk+cB1QYF3m9P/WNiglXXcw6WzFg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwG3RWGaZj6DuYRKihdf6BALcbRJuAXAFvCBaGsw92nGR/qKC7q
	Xk7hc1Vqu4/UuIOMi3Lwhwv5tJuzgXQL4SHCEoRyFVmwKwS6SdfrvpZA
X-Gm-Gg: ASbGncuYgcNrVjHXEWlQqAbzYknRVxUNbvGVrssSa7NciqAi9+ptnzVa4N3TDkbe27U
	MAeyFSWLXqvP8lc/lZVSESVBmmXPNFN8H1wkM51KeKaDFsW20S34z2NwJAgBqQamB02y82xGsCl
	w2/LhNFTA9R9fhtAl51bZLNf9TsXiE2pAy5OzFO5vZfSVvNxf04GRwYrplr4phS5fGNs0PW+6JM
	35TEAb5HYp56fy5cfWfUniTcuiGGWROEwz9yG4yx5P7niTNZzkNs13TlzUHqZUh+ayv4g4pYRj+
	wnt9n8V5EpycEkNi18c5a0+vk2ajm49GGIF9mslGW3z9IP8z3DIlPtD2SEnk91GcxkR8VZauqs/
	l6m7Ipaqrp5z/lDqbxZaiMSbe
X-Google-Smtp-Source: AGHT+IFnbqnzDpvcF1npAo3gJlRiN0aWJNOZlV40ujMaGftot7QGowUdecTibpSbqF5TWABjiIk+nA==
X-Received: by 2002:a17:907:3f1b:b0:afe:88ac:ab9 with SMTP id a640c23a62f3a-b302c10a6acmr180708366b.9.1758657655543;
        Tue, 23 Sep 2025 13:00:55 -0700 (PDT)
Received: from bhk ([165.50.1.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2ac72dbe92sm672074066b.111.2025.09.23.13.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:00:55 -0700 (PDT)
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
Subject: [PATCH RFC 4/4] net: veth: Implement RX queue index XDP hint
Date: Tue, 23 Sep 2025 22:00:15 +0100
Message-ID: <20250923210026.3870-5-mehdi.benhadjkhelifa@gmail.com>
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

Implement xmo_rx_queue_index callback in veth driver
to export queue_index for use in eBPF programs.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 drivers/net/veth.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index a3046142cb8e..be76dd292819 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1692,6 +1692,17 @@ static int veth_xdp_rx_vlan_tag(const struct xdp_md *ctx, __be16 *vlan_proto,
 	return err;
 }
 
+static int veth_xdp_rx_queue_index(const struct xdp_md *ctx, u32 *queue_index)
+{
+	const struct veth_xdp_buff *_ctx = (void *)ctx;
+
+	if (!_ctx->xdp.rxq)
+		return -ENODATA;
+
+	*queue_index = _ctx->xdp.rxq->queue_index;
+	return 0;
+}
+
 static const struct net_device_ops veth_netdev_ops = {
 	.ndo_init            = veth_dev_init,
 	.ndo_open            = veth_open,
@@ -1717,6 +1728,7 @@ static const struct xdp_metadata_ops veth_xdp_metadata_ops = {
 	.xmo_rx_timestamp		= veth_xdp_rx_timestamp,
 	.xmo_rx_hash			= veth_xdp_rx_hash,
 	.xmo_rx_vlan_tag		= veth_xdp_rx_vlan_tag,
+	.xmo_rx_queue_index		= veth_xdp_rx_queue_index,
 };
 
 #define VETH_FEATURES (NETIF_F_SG | NETIF_F_FRAGLIST | NETIF_F_HW_CSUM | \
-- 
2.51.0

