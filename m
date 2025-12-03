Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B012324B26
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764789481; cv=none; b=pgU4z1CCdQ7FBlbTVluPCuoLEZXmM5wjrd4AtQzxMu6gjDDgiDDBcUHnDEZeYSN/QTPxu51MYpyjgsFJVJw1A/5NJjHdwUQwwnraY53Al9aVj7weLzAYEXgr0KBhjrieonl3GiTsNsYlC8z5gFIe0gdqlIr2/H8Eh7BgLMRSzgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764789481; c=relaxed/simple;
	bh=USnLm7GDkh/QWC1LY4TPnyHCbn78OxLiqiS2+bvZ9VI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uoPsNSS2XNirGw76iO+iO7YgCF3IBQBVviwVb1ruAlt35sMHT2DIEPoekghPnk4QgevOhnm8NhpsVPxmor8TOogktXcRyruiF2RW6r7byA/f8IYEMH2mNIjuAJKwLgoYX2rHQtDPl1VbdHspXQIIEB/Y9BIRtGycs+Qqa80Cz0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmmtUmuJ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmmtUmuJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D316160633
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 19:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77opXqQismfA for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 19:17:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3237C6058D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3237C6058D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LmmtUmuJ
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3237C6058D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 19:17:58 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-343ea89896eso28132a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 11:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764789478; x=1765394278; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6iTv+jxCLMgJTqv4zJ35P8h4uCjs9494yiCOJzGvP0U=;
        b=LmmtUmuJ2oouCLdx1QUSXI1wjn380yCR69vIkOkkUUNANc+KKI8y7mmCUxrPqB02u5
         lIqIQId/XlZiUrZzkAVHWVsOg50TqFfN9F5efB0gQp6MbwnKQXFiByrCRIAMSsfKt5Ku
         hOG6b8YIeWIOnCnPOSDXnbE8giqhpCOXbgU8KZ25lQDnO7f6oV6DqGhRIzXhip/usZyh
         5GPTVdd3LaQiElnE9dGbI80pR2d6sp47OPrf4PFS2zlE7kGeOOa3BOh+ANDtAc6eciMG
         sEbk3eU49QlREnkWQAXAGccQOfT572DFz3Dwdd4hwlb1z0igKeQ0/GVIrOFknL48I8G4
         Lppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764789478; x=1765394278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iTv+jxCLMgJTqv4zJ35P8h4uCjs9494yiCOJzGvP0U=;
        b=KHCbfMAZf5mQe2Be0vXI6QxzssbhMAjKVERmJyWXSpXl8IUqnAQKaNwIvFRAKyV2y5
         3WM4QzIQ6VqQc5x49GDUKBGkH4O1m0/NwDiT7dLnfb6wyLJbMyO5PhzdEGwSkbjJXN18
         iklGecKps3Je4wo2IFhBLfOuDUirpvccw8K1MxSoIALdEbq4zGpGzrQoKom4UwbYKzKQ
         6NoFsX0SL6pJQkwRYU2JDk2GhTNgT2ibj6db645Gwkr9Ti9wdTqON2/7gaghRS3uuDrg
         lQoY4d8v/xa6+aA7J7MW91yogOQuxa2tiyNO83xwDE+k+HhMr5lKoyUIWS577z8k8s9/
         AWmw==
X-Gm-Message-State: AOJu0YyRv2nG3q9wBnEibOHrrC5amSVk3l6f9B1WhVisnEwTW1shTuu5
	XoMqpW38fXUbycPP3IchGImXSXbkVF//ibifSsnEif4XAeq5c6RihQEyEXnx0vey
X-Gm-Gg: ASbGncvU+sDMwZBumq0p2K4YrtTZzB4RIP5a/GjkLaK13B4b7gX4V4b+b7/9MUywtiG
	epwtBFHhGONx1mxV4UPBCs/1fexvZvo8IsreHdgmo03Oe9ZDw30kbrH+Lu2jfE58qGKV6m+RbTJ
	+AuO3C4ePfGeZ1/He1LzI+wl8Cw8qYnBcHx/uphuIs6j85P6oZGB9yd6GzzRxygY6KrVH+HSaDS
	d57I4d3usLURSfdoniCPmJZBxGCc39HdRsXr+HRFIJL3iHimO/LJ7PSwtC0FU7f+CVWRQtozB2q
	K/m+CC49D0FTbs/8Nh9Ukocz/Peba9B/ewlDfeapkwAAjgkNmIBC7RzmIfzrdz6rS6bLfJE2y9h
	jCRh7Dz9NNB9ZInSWm4pg4ugTD9gdvVN8xbcUl/r4JlltBfrcPV4hP/af64R8kfDdrF0/gkQ7DK
	yKGSTRBR87WQliUthVX6o=
X-Google-Smtp-Source: AGHT+IFMir/v4p5eC22DpnDZcblBNCoUo8QfniyVutGYcK+UKapVvVN5phw0cR7NylgNr5IFljGhog==
X-Received: by 2002:a17:90b:2f03:b0:343:6108:1706 with SMTP id 98e67ed59e1d1-349126895a7mr4245812a91.17.1764789477875;
        Wed, 03 Dec 2025 11:17:57 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34930b5a195sm601293a91.3.2025.12.03.11.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 11:17:57 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <ricardo@marliere.net>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mpic: Fix dead link to fsl/mpic.txt
Date: Thu,  4 Dec 2025 00:47:05 +0530
Message-Id: <20251203191706.58901-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the reference to the old 'fsl/mpic.txt' binding, which was removed in
commit 326d25198112 ("dt-bindings: powerpc: Drop duplicate fsl/mpic.txt").

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
No functional changes.

 arch/powerpc/sysdev/mpic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index ad7310bba00b..b6c7b7dc1622 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1105,7 +1105,7 @@ static int mpic_host_xlate(struct irq_domain *h, struct device_node *ct,
 		 * First two cells are as usual.  Third specifies
 		 * an "interrupt type".  Fourth is type-specific data.
 		 *
-		 * See Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
+		 * See Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
 		 */
 		switch (intspec[2]) {
 		case 0:
-- 
2.34.1

