Return-Path: <SRS0=2ll/=63=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0536DC2D0F8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 May 2020 07:30:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D18205ED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 May 2020 07:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1HBj7BS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D18205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0F7A86B98;
	Wed, 13 May 2020 07:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9Zeg8QNBotd; Wed, 13 May 2020 07:30:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4679F86946;
	Wed, 13 May 2020 07:30:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35335C088A;
	Wed, 13 May 2020 07:30:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9D19C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 07:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B606D86B8A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 07:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2VmVoUMiiEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 07:30:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8E94D86946
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 07:30:16 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id u10so6489853pls.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 May 2020 00:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SFsW3bIOVcFHipmxwkC0H0m1z04X3WyFGADGmsB+qJs=;
 b=g1HBj7BSbECQY90MFDpv0gSLVc0an55Q5f0WVj2EfdwDbrGC63nq4Klmi3y8GM1UhH
 Pqkw3NnPJ4DR8IvJ0ON/axoDfEB6djHJD+r1SDQwnDA48SuiuySo6UQyHzkAAsXQtny8
 mYNL1fqlhWE5w8nzy1fVtFIUs3FZcnAV/P9viWpadAjNOG9WHaA4lPqDMCGQJdCKrkjn
 z0ewqHKHSCmVQ1dsgnTRtIhY0pFkOKNdsuTDZU+xAGDfU6BjutjthtYB00Xbfk76S9Dp
 vIE9N7S1LnqP1EOxku3bqxYGTPAb8ThjcN/ywhkN50cEHYGi6t//++4YffopAoBX3NFg
 ejeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SFsW3bIOVcFHipmxwkC0H0m1z04X3WyFGADGmsB+qJs=;
 b=fs5Yt3pD4VzweesFNSeO8WGDMwrc9rtXYeRGwMFMt7wQw4QnZ8ePH0ogbclpuea2zn
 l301CUjwtRjfzpVo5/ZqY0dTYicI0CXN8/sNBsk6QTaVvAP2u9Lv7S1TxbMvSeHnyJ1J
 byuTJpdPVHfjXr51xK4drjFIPHg1r9DfL/f188JYb9ClayQl5TfgvIKHOqdBduLgvbNs
 Ut4BXMYM6FI7JNcgDKVG65g0WNgK25YmmqMdqKsdZW180j9O52ARLvso9S8lu4avncx6
 JSfdEdj/ZvHPG0xcGsieZFK2HnLLjDtsxUide4gPPF4MXxziFYXtD+QWKXg7K5VQIZH0
 Nzaw==
X-Gm-Message-State: AGi0PuaPZimIGsD+mfrwgVPO+VVX7UBoLBztthHyMMy6+X1VY+0DTC9W
 eYmIjxG27L/j8SvrPo2DRF0=
X-Google-Smtp-Source: APiQypKvO2gBnsZ8oA6lmTiXfr0Wmq6XMUelEr1mCpV1WdYMWnBIKaazYFxG6unWhPLpPwE2x36W+w==
X-Received: by 2002:a17:902:9a06:: with SMTP id
 v6mr23892927plp.343.1589355016109; 
 Wed, 13 May 2020 00:30:16 -0700 (PDT)
Received: from localhost.localdomain ([1.38.219.254])
 by smtp.gmail.com with ESMTPSA id n9sm14852828pjt.29.2020.05.13.00.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 00:30:15 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Wed, 13 May 2020 12:59:51 +0530
Message-Id: <20200513072951.3453-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200513072951.3453-1-jaskaransingh7654321@gmail.com>
References: <20200513072951.3453-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] tests: Add test case for struct
	pointer function call
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

This test case is in response to the following bug report:

https://www.mail-archive.com/cocci@systeme.lip6.fr/msg07332.html

Add a corresponding test case for a struct pointer function call.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/structptr_func.c     |  5 +++++
 tests/structptr_func.cocci | 12 ++++++++++++
 tests/structptr_func.res   |  6 ++++++
 3 files changed, 23 insertions(+)
 create mode 100644 tests/structptr_func.c
 create mode 100644 tests/structptr_func.cocci
 create mode 100644 tests/structptr_func.res

diff --git a/tests/structptr_func.c b/tests/structptr_func.c
new file mode 100644
index 00000000..e65dc4ce
--- /dev/null
+++ b/tests/structptr_func.c
@@ -0,0 +1,5 @@
+void func(struct socket *sock, struct sockaddr *uaddr, int peer)
+{
+	sock->ops->getname(sock, uaddr, peer);
+	return;
+}
diff --git a/tests/structptr_func.cocci b/tests/structptr_func.cocci
new file mode 100644
index 00000000..cf725d96
--- /dev/null
+++ b/tests/structptr_func.cocci
@@ -0,0 +1,12 @@
+@@
+struct socket *sock;
+struct sockaddr *uaddr;
+int peer;
+@@
+{
++int ___addr_len;
+...
+- sock->ops->getname(sock, uaddr, peer);
++ sock->ops->getname(sock, uaddr, &___addr_len, peer);
+...
+}
diff --git a/tests/structptr_func.res b/tests/structptr_func.res
new file mode 100644
index 00000000..1b2d437c
--- /dev/null
+++ b/tests/structptr_func.res
@@ -0,0 +1,6 @@
+void func(struct socket *sock, struct sockaddr *uaddr, int peer)
+{
+	int ___addr_len;
+	sock->ops->getname(sock, uaddr, &___addr_len, peer);
+	return;
+}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
