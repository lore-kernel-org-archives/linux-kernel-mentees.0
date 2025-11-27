Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B52827E06C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 19:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271177; cv=none; b=BBqPOC9mJa3oILymuo8GP2g5Bsp1nm+HoiCmI3ZTnJNsXSmo5y85ATmkAjMM9KzohmAF31adFwxWZozUVAc6mjUo40YCqMlyGDNzjGFA3kYo6GLuwZ5wQDhmgtWMzlWhYrsBdabR4yLg8A3LOB6u+axCmbqkHyuIxm2PlRFlVBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271177; c=relaxed/simple;
	bh=QiQubMv26zYAKcBaIcJDXjIhFZMBqqNoxcxStSi01jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WC9CdxlTCoa8L6wAOT3FJ7ifdFdxRvvhS+n/G91LVYkDNwaIAEeooC1vSwLNk3b1ko3l+zZO9oGcpYf/D3gelp9PNhwidsKRVYm3NorzZQTrZMJe7APNkNIDcdSz56+Z5fSKDy6nmBJie/cwldoWtBE1E+1SL2xktoeGyuuzk8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMjfJ0Bg; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMjfJ0Bg"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso1622488b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 11:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764271176; x=1764875976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc1zInQPA3mOeFCysXnI54YAVIuQEcNbca5dzFQtVUQ=;
        b=IMjfJ0BgON/Rsz6Nz77o9gERV821e2Ln40RRWoyTSu4UEbXT//RdlgbSUmyEcFlmZ+
         MYPoYsAuW2wHwQ0pFfvHg2HXD4jIzjWFbWzDu70zJovLnfSHQHo6RjnnXGdR5ntuNXma
         avYX0Cglm8ZTTZiBd4QkLnuLAHTPzVi3BnhRtiOiERw+aVeGfIe9I8iwpCFz7p+MHtOk
         be21hU6wV6KjcsG2+3MQs+y4g/qbDwwM/GefYV9zZUDg7a+5q7cXFNCFbhT0rcF8CnwO
         vJqqGTZQqHQJeJXT82V0mPr9qosYlMMK7ZcPX1RrnCxHZNheGAKhl80aLKHd3zLFKFH0
         TFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764271176; x=1764875976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bc1zInQPA3mOeFCysXnI54YAVIuQEcNbca5dzFQtVUQ=;
        b=JUlurbB81naZDwDx4d8kRK7OnTTOG1khX9RCJzg7RZqvaT8NmgDS2Dn3gpdO4Uk90I
         lA0Iw4fftCoexo31qza96PCPajDnaFVjCY74H4uM353RUWwp9LxV5bByb607HRQb9K3c
         sV/ZuN2AFj6qA3tkypsFVgu7okWRtOrieCxJ9+Jie5w4WO0NWY7HzbP6+2FJfo/8gNmv
         8TgLYtBXHZL11sCWYoO1MSnL/dbOXYNJh4QzrrtZaPTTtOmfxVBcKT9lpUBPlztSIaXb
         kf8n2urQGvrpc9Ap1w3nA9qRY7xzseICpm3c8kTGDUpz3DXTF1YJVpTAOPnzbLjkyOMU
         egWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFtFLLlqK6HiaP4zaMPt/p9E5+CTGdcNDrBxNQdKYtVEEwaX8oDmgu5KLCQQs6C75uUzZTIQDt7+Bjv6JvqyScU6Vn6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNaR5v5xErKxtemIqpKowJvhvx6YZ1qncmIcldlQIRtnlCgOm+
	/xKjPhYC0AAzUeod+XPEmX0MfXo6JFNqsw3iI23Wv02w3A278K+1fofZ
X-Gm-Gg: ASbGnctROrHaPe4wTvsKmgrwbX5Quh3Jn9nzWqXKC9Zq8XoNeti8VFvSlE3CzwO1HLA
	H0BbnE9Jp2O5iL7uzWkWIMhp8kQymzDiLZ17coRR7gxCGwz9THEF+JxDUQB3c8Z2BQiVMni74kr
	Z6J5oOgEu688z6obxi1CgZR7GGwJSI74hACCp/eF3Qr4g0Nqwh/KXS1jx2NmpB30lNFtOrjKY/o
	8saMsqBowD2oAwOBtA7aH5JeZWA+epq9HDezmFf3DJqDpSG/In4g+ozYczQCx/VUpcpxKhy7ida
	f9u548+nqaBs4LDgVEktSMLrbEr0N64B6iCEIzXTxA1mZdzEZhRbEc0mSisqguqgAyYYHGJHPwl
	O2ngYnbhe/Na+u871J/gS9Ri4FdN3hSsA3Bl81fCr41gpIbq1INPNJVtUdXhK2x8kPg8FKEHRPJ
	g/d9zIYGHOzYJ0lANt
X-Google-Smtp-Source: AGHT+IGhP0W8lcI8uELg/tQPQCKcVo14Va1mvj+bMVqnMs/DZ2d195Ll0cMh0zJjIMvRCX2xb6uVyg==
X-Received: by 2002:a05:6a00:2d9a:b0:7b6:363b:c678 with SMTP id d2e1a72fcca58-7ca8760d166mr14107945b3a.6.1764271175664;
        Thu, 27 Nov 2025 11:19:35 -0800 (PST)
Received: from rakuram-MSI ([2409:40f4:211f:b50d:1190:e256:8b21:a462])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f176096sm2620703b3a.57.2025.11.27.11.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 11:19:35 -0800 (PST)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-can@vger.kernel.org
Cc: mkl@pengutronix.de,
	socketcan@hartkopp.net,
	mailhol@kernel.org,
	khalid@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rakuram.e96@gmail.com,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [RFC PATCH 1/2] can: dummy_can: add CAN termination support
Date: Fri, 28 Nov 2025 00:48:07 +0530
Message-ID: <20251127191808.144723-2-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127191808.144723-1-rakuram.e96@gmail.com>
References: <20251127191808.144723-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for configuring bus termination in the dummy_can driver.
This allows users to emulate a properly terminated CAN bus when
setting up virtual test environments.

Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
Tested the termination setting using below iproute commands:

  ip link set can0 type can termination 120
  ip link set can0 type can termination off

 drivers/net/can/dummy_can.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/can/dummy_can.c b/drivers/net/can/dummy_can.c
index 41953655e3d3..2949173547e6 100644
--- a/drivers/net/can/dummy_can.c
+++ b/drivers/net/can/dummy_can.c
@@ -23,6 +23,21 @@ struct dummy_can {
 
 static struct dummy_can *dummy_can;
 
+static const u16 dummy_can_termination_const[] = {
+	CAN_TERMINATION_DISABLED,	/* 0 = off */
+	120,				/* 120 Ohms */
+};
+
+static int dummy_can_set_termination(struct net_device *dev, u16 term)
+{
+	struct dummy_can *priv = netdev_priv(dev);
+
+	netdev_dbg(dev, "set termination to %u Ohms\n", term);
+	priv->can.termination = term;
+
+	return 0;
+}
+
 static const struct can_bittiming_const dummy_can_bittiming_const = {
 	.name = "dummy_can CC",
 	.tseg1_min = 2,
@@ -250,6 +265,12 @@ static int __init dummy_can_init(void)
 	priv->can.xl.data_bittiming_const = &dummy_can_xl_databittiming_const;
 	priv->can.xl.tdc_const = &dummy_can_xl_tdc_const;
 	priv->can.xl.pwm_const = &dummy_can_pwm_const;
+	
+	/* Advertise software termination support */
+	priv->can.termination_const = dummy_can_termination_const;
+	priv->can.termination_const_cnt = ARRAY_SIZE(dummy_can_termination_const);
+	priv->can.do_set_termination = dummy_can_set_termination;
+
 	priv->can.ctrlmode_supported = CAN_CTRLMODE_LISTENONLY |
 		CAN_CTRLMODE_FD | CAN_CTRLMODE_TDC_AUTO |
 		CAN_CTRLMODE_RESTRICTED | CAN_CTRLMODE_XL |
-- 
2.51.0

