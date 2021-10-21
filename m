Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D021C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:09:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B295611C7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B295611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D89D440725;
	Thu, 21 Oct 2021 15:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3B9_eH2uFcml; Thu, 21 Oct 2021 15:09:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A9DD140017;
	Thu, 21 Oct 2021 15:09:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93ABCC001C;
	Thu, 21 Oct 2021 15:09:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7746BC0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64E406067C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KmmZlsy6uPd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:09:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C26EA60628
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:09:48 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id y1so609025plk.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TfHsGP2yi6lWLecTIcZVrIhetTubqUKD7yLErDw3x2w=;
 b=EUZaSbSsvxfgQPDyiZv6K9FvbiaFo8lnIoEmpC0ubPuoqxNOuIOf4K8ZsIh578ws0Z
 2EDdrEbYHum8lqROFe1C/onYlVaB50CDb5AwppL0LpxiFNIEWdnc8cQjEFdXeAobfidj
 x8qfJAw0gdtPVdlvPc21q9Yxry610dr7WFKlVHFUO1eyzNlo/F03H3hyjJckpZwfON5S
 b21ly6HIsBApY6VwbYgoI1P/Fu0X1AZm7c/Cai3cT3TlLzr9REQ44ISEUK3PawQUbAVm
 ZC1Qe6WDuHchsm5VVBggdsA8zJ1Xgd6h2KTs8gi19LGsz2M2EyYOMMdey6IAUQiBbt/o
 +Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TfHsGP2yi6lWLecTIcZVrIhetTubqUKD7yLErDw3x2w=;
 b=RzHQmmrz6DfiQa2GaCP+d+JA3kHzZkz86OK3Vg2bk1dKNB98UbAYv+RlZyuGi3JDsd
 NWZxLG5c3+tsWne3lxK0oLaBJdvZLjXxo8YOD9XM9UhPf94pmdcdHhL3HFC73kQN8/KF
 L1yjL4O/184TeMe8LN3A4JjnUlkoSKPy/z5L2+IXJ81kzSqc8uKXOMFKvG3YYflg1aYS
 IGN6w1WYe6tLm9vMearbYnw42k1KVj/UVM65fTJwsrmsa3VmOGFGN9+UmHUzJI3sjcBK
 6c/c4Q+t+Rdd3X9+njh2wvLCevfH8p3uQXGazSBA/WOTjNFCT7xmaXN7aaNVj1ISXk1f
 jhrA==
X-Gm-Message-State: AOAM530d8JXDil+qDh8pk7RtHCIBgcaMnKZmbd6ulrYUHO9bjagoXWm/
 hggQVLnvydi0AxLkOsVkppQ=
X-Google-Smtp-Source: ABdhPJxCZzHdSx53dvdDywLg2snzLq3kKzeBkBrose+fBiquWSSELbthuFAJlsRxyfUjW/fn7V8LMg==
X-Received: by 2002:a17:902:d4d1:b0:13f:af7:9068 with SMTP id
 o17-20020a170902d4d100b0013f0af79068mr5714981plg.20.1634828988016; 
 Thu, 21 Oct 2021 08:09:48 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:09:47 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 02/25] PCI: Set error response in config access defines
 when ops->read() fails
Date: Thu, 21 Oct 2021 20:37:27 +0530
Message-Id: <56642edd0d6bf8a8e3d20b5fcc088fd6389b827f.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Russell Currey <ruscur@russell.cc>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Toan Le <toan@os.amperecomputing.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Joyce Ooi <joyce.ooi@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Robert Richter <rric@kernel.org>, Sean V Kelley <sean.v.kelley@intel.com>,
 Ray Jui <rjui@broadcom.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 linux-arm-kernel@lists.infradead.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Scott Branden <sbranden@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Guo <shawn.guo@linaro.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value with error
response (~0), when the PCI device read by a host controller fails.

This ensures that the controller drivers no longer need to fabricate
(~0) value when they detect error. It also  gurantees that the error
response (~0) is always set when the controller drivers fails to read a
config register from a device.

This makes error response fabrication consistent and helps in removal of
a lot of repeated code.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/access.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 46935695cfb9..0f732ba2f71a 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -42,7 +42,10 @@ int noinline pci_bus_read_config_##size \
 	if (PCI_##size##_BAD) return PCIBIOS_BAD_REGISTER_NUMBER;	\
 	pci_lock_config(flags);						\
 	res = bus->ops->read(bus, devfn, pos, len, &data);		\
-	*value = (type)data;						\
+	if (res)							\
+		SET_PCI_ERROR_RESPONSE(value);				\
+	else								\
+		*value = (type)data;					\
 	pci_unlock_config(flags);					\
 	return res;							\
 }
@@ -228,7 +231,10 @@ int pci_user_read_config_##size						\
 	ret = dev->bus->ops->read(dev->bus, dev->devfn,			\
 					pos, sizeof(type), &data);	\
 	raw_spin_unlock_irq(&pci_lock);				\
-	*val = (type)data;						\
+	if (ret)							\
+		SET_PCI_ERROR_RESPONSE(val);				\
+	else								\
+		*val = (type)data;					\
 	return pcibios_err_to_errno(ret);				\
 }									\
 EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
