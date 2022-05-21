Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E21C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 May 2022 01:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 059F140489;
	Sat, 21 May 2022 01:56:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HERi18Zi4sB; Sat, 21 May 2022 01:56:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0F563400CB;
	Sat, 21 May 2022 01:56:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFD6BC0039;
	Sat, 21 May 2022 01:56:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B778C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 01:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10D934023F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 01:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UafV34z_lCp6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 01:56:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C041400CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 01:56:52 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id bh5so8678582plb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 May 2022 18:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=QSpdu/egxZKM3RI4Cm6qIa5QbmxuKJHaffE0Voql3CE=;
 b=n+FCuihC/ER3eImgCgVl3ISMdL+95BNlaHQw2lyKmlIWK0/C9MflJZI4U1bkGDVOpb
 2Y9d9Q2wCR0VGI14/T6bU8wFszFL0MsWZLtTRwYp09WuvUAfy7f3Lx2Ngvg1ApFtUUJM
 XLe4MXpetTLfTrLksxd1C3bOPSywH9oiSVCXw8zFn0q0ygk3qJluuoYxQk18Vz7bEx6m
 m5oZPk/H+5naWH7V7TYaDBstM+WVxYlnRLXuSejjhSCjNEhtJdHGwAV9VfAM05Zm7jwE
 Xg4TAgoAdkxuFrqEWAeZ/ooJVllGKV/pHsyAyn+TrGKOOtK6EJr7D6dTuedpX7qnqWK9
 bJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QSpdu/egxZKM3RI4Cm6qIa5QbmxuKJHaffE0Voql3CE=;
 b=TvpTUZxh94ylGsZ/V8858RLW+H0/lgNA/HIRryvO6ymiPWl1BAZrn+me605uiKKipT
 UUs3gxHu+s0/B2qzO5j+8zTgna0BUlLjV5AlmvbJr2FaxpuOwRidxY3OhpGrSj/6GYly
 Up/Hl2XFqi8cW1d9E+8OLEvK36xScUDIgeDKmFrEUgRuFMPGt80QDG9eoAQXz+ABwc8W
 JMfRaqFJT8SspoJhGZBwmz2aEfV85QPp8KXnbzXh54/lvZrgT1V3JptvgEnnkQmRaKxI
 a5tKTbBjU8WG/Wt6wnTG/wkMXQy7G+yXPJ63sPfRs9B4Ubb9VN6b2W6UYKNe5LvcB9c4
 IDIw==
X-Gm-Message-State: AOAM5330gCQHD7xf1WF1LD5o4vl5fp5GXQj/A4DLF2A9hUDphhpHO5BS
 Ha5d2Ygle/ps0V44FIE+TnA=
X-Google-Smtp-Source: ABdhPJwB33uNJRdpq/U3R+hTLr5qXtUv3ydzsK2RhgBiLI9R27LrrZiyuE+0kc4bRBlkBq6A88c6Ow==
X-Received: by 2002:a17:902:ce87:b0:15e:a619:4294 with SMTP id
 f7-20020a170902ce8700b0015ea6194294mr12482580plg.157.1653098211441; 
 Fri, 20 May 2022 18:56:51 -0700 (PDT)
Received: from Negi ([207.151.52.3]) by smtp.gmail.com with ESMTPSA id
 n9-20020a629709000000b0050df474e4d2sm2381525pfe.218.2022.05.20.18.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 18:56:50 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: mips: Convert plain text file to ReST
Date: Fri, 20 May 2022 18:56:13 -0700
Message-Id: <20220521015613.6197-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Converts .txt documentation file to ReST format(.rst).

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 .../devicetree/bindings/mips/cpu_irq.rst      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/cpu_irq.rst

diff --git a/Documentation/devicetree/bindings/mips/cpu_irq.rst b/Documentation/devicetree/bindings/mips/cpu_irq.rst
new file mode 100644
index 000000000000..601cc12caa2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/cpu_irq.rst
@@ -0,0 +1,56 @@
+=============================
+MIPS CPU interrupt controller
+=============================
+
+On MIPS the ``mips_cpu_irq_of_init()`` helper can be used to initialize the 8 CPU
+IRQs from a devicetree file and create a ``irq_domain`` for IRQ controller.
+
+With the ``irq_domain`` in place we can describe how the 8 IRQs are wired to the
+platforms internal interrupt controller cascade.
+
+Below is an example of a platform describing the cascade inside the devicetree
+and the code used to load it inside ``arch_init_irq()``.
+
+Required properties
+-------------------
+* compatible: Should be **"mti,cpu-interrupt-controller"**
+
+Example devicetree
+------------------
+::
+
+	cpu-irq: cpu-irq {
+		#address-cells = <0>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	intc: intc@200 {
+		compatible = "ralink,rt2880-intc";
+		reg = <0x200 0x100>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&cpu-irq>;
+		interrupts = <2>;
+	};
+
+
+Example platform ``irq.c``
+--------------------------
+::
+
+	static struct of_device_id __initdata of_irq_ids[] = {
+		{ .compatible = "mti,cpu-interrupt-controller", .data = mips_cpu_irq_of_init },
+		{ .compatible = "ralink,rt2880-intc", .data = intc_of_init },
+		{},
+	};
+
+	void __init arch_init_irq(void)
+	{
+		of_irq_init(of_irq_ids);
+	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
