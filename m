Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF8F3002AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Sep 2026 15:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=140.211.166.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622545; cv=fail; b=q8V2Dwhy36MsyCZyA/cIyFjqPT2HNJ52L+ESgJK76c+raq46358V9emEVssgM7g4JandsDOrNUV3lUzKdk3vTah1AR7oG1vW6azFyMAmunlYpAYn9Vk8J1XMWg9AaGKzcRK68mjcoSiCtrhkju/8P4I94QO/67V6lmG05GzD8eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622545; c=relaxed/simple;
	bh=gFFdN1ha8Tp79B1B3Zl2oM554MhbhbybYNUFrHskT80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qz4fAEhzosRPOgfjbCQp9hy8ZFM1l0cXygubLeyR9o40l4DiXdKAmNlXMcVb2UzLORqhTuGB4VCdxQBAn+wT0DdVTKkhZD6xbQaSlf2estDzCkYIC/T8TE4s9rQ8eo6xCr+c8kxE4AOC6z8MHJzbJ/7TXfWkreUkRLzwAMYcCho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btZP7RZ9; arc=fail smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btZP7RZ9"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78B9640B0A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Sep 2026 15:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.748
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lv_BU8uFCXbt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Sep 2026 15:35:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B914A40B09
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip="2607:f8b0:4864:39::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788622541;
	b=Vl29KfzNDCfAqO6yb43zZr2Xb3VFC1X5YiAlC6l3UKjao3CaSSpMl2GtxxyuiozlZDWg
	 fuQ3CB17VmMNHNPz38aKKKECPKnZNuPAosh5OKPFEdhhKSlmUrT1Jg5T+6ZD/aA1vwj5u
	 K35WYOhflE+F+DFtfUTfADXtbfT3fG6nxqOtpbimVmDMsZ4/Z8pK+11ypVfJamtRiVbYj
	 OgV9bM8nwoRd9DQmcqp+IZqflnh6RYWa0Q1/cMTlCepudNe7v5S4xQwPlcaEDrLcXmx5x
	 lk+jRzWWs7VmEbMmx0cbdsGY2RxRZUP06S+ziVGwQOi/f0FcEqWUCD8UlpKEvS5JJTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788622541;
	h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LAz1FDbqTt7J5VIP7BaX6RtKlr+dOf12zCQcqewm6No=;
	b=lPCToybu92aKYZf0KH3enLen0oJiYdx/7c5g/TVbx/yhCuVqC2FEeBC3iGxbk/lvcO5u
	 rUH8Hw+mfcuqZVxm/wRFfT+L3Mc5MrCEP+Ei+PCFFKqXUdxJqzu0lw7VNyntceEsfN8VL
	 vdFjMNsCqo2W9Wu6MBcEoWaPJgD7T1/HMJQOd8Qfe551PQ94hcdGgowtp58qNOpucCP+A
	 cjqw+joxCtiu5S0WGdcg2s62l33steaLhNGyyfZGkxK7cMau1oB+Mu26v1SfkN5pJY1z9
	 lxZhGu1YNvnennkIhTvNriVh+RgblYj9QBUIJKlWtT2YfceIuIwT8AgM1ZmULiRmjAA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=btZP7RZ9;
	arc=none smtp.remote-ip="2607:f8b0:4864:39::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:39::10; helo=mail-pj2-x10.google.com; envelope-from=ayushmukkanwar@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=btZP7RZ9
Received: from mail-pj2-x10.google.com (mail-pj2-x10.google.com [IPv6:2607:f8b0:4864:39::10])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B914A40B09
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Sep 2026 15:35:41 +0000 (UTC)
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39931869b4aso94170a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 05 Sep 2026 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788622541; x=1789227341; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAz1FDbqTt7J5VIP7BaX6RtKlr+dOf12zCQcqewm6No=;
        b=btZP7RZ9Kchbgh6X6j2tQg+dvc5cOKVbdqTc1YJHXYmR35Cx3wlJDjKv7/MkY4J4Fh
         UQkAFgrrwGsZWBCpGCV2V/3fmzuoZekOFd9tPiWiZGZmDQu+MNHZRJDA2hbTXDmFtbyL
         dZNtFwSud017TnJnKLy55gywQczPEkLvWkwDI1KLWocb4xZ/g95RtQ+BO0goVEeHGr9i
         OKvaRNKUbIQVPDkjW11xPBMLEImJ/vAownTULKrN0ej4KZVHeBqxme1/XbLqwshmFW+k
         UUm6rMsXG85/vQ3EDgs0O+PmwuDCbKLwX7gZtdDRQOtW8CAgRKJ2/LQ+5O06AkLwVM/L
         +HDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622541; x=1789227341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAz1FDbqTt7J5VIP7BaX6RtKlr+dOf12zCQcqewm6No=;
        b=ObmVYJd5h/mr/j8StWXQHXFfZab9bqQzANudWs2HkNVEjKyE0lGHBjcMUL0Nct2cF0
         Y350ll0qQMCT7I9/nAWD8f98KORfc4nnRYCprRl5fi+bRboV/nE+z0k3wYRZ0g6U9unr
         gAWLFY4s1sVWfiD6LzDug5SuXTcb0daGG8d1P5lg6p8RgB64O2nmx3weX46u3rK0g5qy
         3hhq+DOW45LnCQaHohQnyaZC/lWdAOUGkZNAV00nrPdbau9bHWv81JHdH+68V9FHL9Gs
         OcDXd2fKTGl+8HGlx6i1BIUuRpG/jPxM08TWGJcKH+sfMYSX8ehln2OFnpP51xAvFXxC
         S/yA==
X-Forwarded-Encrypted: i=1; AKwUvBwRd6Tkn+GlSxIJpqRmvIgbMNYw30G1Ehe9WqnOtGJu0uAjd0NG2G57B9sgjnM2CNEIHdopBg0Dzl0DZ70Gzzp7LT8f7A==@lists.linuxfoundation.org
X-Gm-Message-State: AFuF++nqHFtAr/RtlSE+augitEYKDrrWMmRGh5E5McIrnwLEYlM1k0GL
	z+3Lq+ZDkWwDypCG6IM2Afbkd6jYKMrH9CrpFLveJcNWiGa6XbGZWlRx
X-Gm-Gg: AYBFou31H4V6A0iArFil/PgvPz3sNYtnwdRIOh7aY4pgnEbpUJF7KAuLIxMcbefoVwe
	UdNnc+SdZAFEo2fUNNTOrdG1AgDsNhzHzH+6I/Wed6MBRQcOA8nm9Q3RRU15gzzd3DDxArntrKU
	msbF9R8y0Ap5EWPGRe9p51GBjf6xMBt/6/v1WHtVmLMcs/kEpN2CFLWdK//FJr+MA85UtHaWPFe
	0hkBrj1dk0gbV6ttLPPXCAUYVah06kGHSiFUMfW6Ijsf8bsw7AX+zmGB2bKm1epa1swms55a7Hi
	Wc6NWvvR97wtVjBGUI0BoBmbdWChMy7jGpWqQ1BToTq8WvIDh3n3j0o1Xq0s5jk08N9nsfGLgGt
	iU0piC1AzoU3HUqDyBu+AEOi9FEY0ZCMBN6qSvW1vEI2/uU0vE/k4N4f3WF3wpPW6YsGGrFHiOv
	UAvDDUM0skI/WI1XFWN/KqjAIRGMUCxGADe5NswE0jKrmIIzlnYDxZxygFi1j8H1fBtl2+kLySG
	2Pu92y8842S+/kw32qMHyYuZNIX5I9nKNUYI2xhAV4MR5TieI4g09EUnDynTV8Cijs=
X-Received: by 2002:a17:90b:562b:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39b3d5f2c09mr6126052a91.2.1788622540707;
        Sat, 05 Sep 2026 08:35:40 -0700 (PDT)
Received: from fedora.iiita.ac.in ([103.119.35.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm10493484a91.11.2026.09.05.08.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:35:40 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	ayushmukkanwar@gmail.com,
	sashiko-bot@kernel.org
Subject: [PATCH 1/2] staging: octeon: fix use-after-free in tasklet teardown
Date: Sat,  5 Sep 2026 21:05:29 +0530
Message-ID: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvm_oct_tx_shutdown() kills the tx cleanup tasklet while
the net devices are still registered. This could lead
to use-after-free when a tasklet is scheduled after the
tasklet_kill() is called which might run after the net
devices are freed.
Fix it by unregistering the net devices before the tasklet
is killed.

Fixes: 4898c560103f ("Staging: Octeon:  Free transmit SKBs in a timely manner")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260615172734.42038-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Note: This patch has only been compile tested. No runtime testing was
performed as I do not have access to Octeon hardware.

 drivers/staging/octeon/ethernet.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..98d4e025c301 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -113,7 +113,6 @@ static void cvm_oct_remove_device(int port)
 		cancel_delayed_work_sync(&priv->port_periodic_work);
 
 		cvm_oct_tx_shutdown_dev(dev);
-		unregister_netdev(dev);
 		free_netdev(dev);
 		cvm_oct_device[port] = NULL;
 	}
@@ -694,6 +693,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	struct device_node *pip;
 	int mtu_overhead = ETH_HLEN + ETH_FCS_LEN;
 	struct octeon_ethernet_platform *plat;
+	int port;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
@@ -729,7 +729,6 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
 		int num_ports = cvmx_helper_ports_on_interface(interface);
-		int port;
 
 		for (port = cvmx_helper_get_ipd_port(interface, 0);
 		     port < cvmx_helper_get_ipd_port(interface, num_ports);
@@ -953,8 +952,21 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	return 0;
 
 err_rx:
+	/* Unregister ethernet devices */
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		if (cvm_oct_device[port])
+			unregister_netdev(cvm_oct_device[port]);
+
 	cvm_oct_tx_shutdown();
+	goto disable_ipd;
+
 err_tx:
+	/* Unregister ethernet devices */
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		if (cvm_oct_device[port])
+			unregister_netdev(cvm_oct_device[port]);
+
+disable_ipd:
 	cvmx_ipd_disable();
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
@@ -984,6 +996,11 @@ static void cvm_oct_remove(struct platform_device *pdev)
 	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
 	int port;
 
+	/* Unregister ethernet devices */
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		if (cvm_oct_device[port])
+			unregister_netdev(cvm_oct_device[port]);
+
 	cvmx_ipd_disable();
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
-- 
2.54.0

