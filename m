Return-Path: <SRS0=BcdZ=BV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3137C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 07:49:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8E320656
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Aug 2020 07:49:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1f7ZE4K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8E320656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5EC4D8760D;
	Tue, 11 Aug 2020 07:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-vtetT7-GMZ; Tue, 11 Aug 2020 07:49:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 84CF687645;
	Tue, 11 Aug 2020 07:49:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 675CCC07FF;
	Tue, 11 Aug 2020 07:49:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEA86C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BBD0B203F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esgvsTTzLyC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:49:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by silver.osuosl.org (Postfix) with ESMTPS id EB07C203B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 07:49:16 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id w2so5508990qvh.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Aug 2020 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OOMSJE9xSBil9mXDx2Lia4KUqWqXBp/e2t+xm7m3Qh8=;
 b=F1f7ZE4KDjPF6dImWkq/5Gb5Ibw/zsrD+Y+bAFrUMb2y8iUJult1fm9hB0McdzouIP
 JdDgEL1T2JKzUfHwWYdBwmkOObOmECVPSE43vBjnO8kfMo4FuMKCwhbmdiKeIPv5iz7L
 IE25z3GCJwOCUWTeQCgIZMZ8PIMkHN+IFDgY8wMNCbsC3ngJJuI7/lB+STIlvY2ysxqF
 ldKh+gEuY1fZUGum5vnuiVAGZ4fX/Dcx3RTT3RcYeK3t/7XuKa7ZhV+D86LSpYOVn+GG
 d4Gr2ojxTkHSGSiIKscJVFKq+vyJBGOqJiFz5iMLUNPcjV+SCQjFLjVaYbqOvQ2CLPI0
 j6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOMSJE9xSBil9mXDx2Lia4KUqWqXBp/e2t+xm7m3Qh8=;
 b=IK9lnBDIeG/DNSqT46woxmMhk5KxpFU3+nx8/+vh/3pr80ALB7kCjZIAwMyeg41Rlq
 1gIoOnRX23rj1wuunhakqmJJ5AGakiProhdZSTr1Bn9tE+dk/t+hCmYHHh+0bZlJem04
 exHd+2lGIUAhkSbyxr83td/p9JwmWwEDQocFdyAKujWOoBGskf0BP2ArU+j8OSrC5gNH
 XN3tM+PLE+5NFrwsqu6rtx+Vb34r7me2HKVYpK50E08Fi58Az08fVT0j8SBgRooTDFzb
 0dreeZbr0wWj+41yVMy4iR2bHS8U5qXn8g3BLFLV9VVBJUzuTAtTV2MCjvVM/NnIzsGm
 eYoQ==
X-Gm-Message-State: AOAM532IE34GlKTnxed7Ez1B/Zork52VJaFUrcGpfBdDBi5ch2ekX8W7
 irQoFHfr482/0YPOYZsRlw==
X-Google-Smtp-Source: ABdhPJyKvjIhgKI2nli71gIsO+GWvcApvoJ6Cm7TU2kBmCv9kYz8IAaCuRaLy8t1HOMGLqJIMFiQtA==
X-Received: by 2002:ad4:44e5:: with SMTP id p5mr32058968qvt.197.1597132155990; 
 Tue, 11 Aug 2020 00:49:15 -0700 (PDT)
Received: from localhost.localdomain
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id j16sm16693897qke.87.2020.08.11.00.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 00:49:15 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Wensong Zhang <wensong@linux-vs.org>, Simon Horman <horms@verge.net.au>,
 Julian Anastasov <ja@ssi.bg>
Date: Tue, 11 Aug 2020 03:46:40 -0400
Message-Id: <20200811074640.841693-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810220703.796718-1-yepeilin.cs@gmail.com>
References: <20200810220703.796718-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: coreteam@netfilter.org, Florian Westphal <fw@strlen.de>,
 linux-kernel@vger.kernel.org, Peilin Ye <yepeilin.cs@gmail.com>,
 lvs-devel@vger.kernel.org, netdev@vger.kernel.org,
 netfilter-devel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Cong Wang <xiyou.wangcong@gmail.com>, syzkaller-bugs@googlegroups.com,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [Linux-kernel-mentees] [PATCH net-next v2] ipvs: Fix uninit-value
	in do_ip_vs_set_ctl()
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

do_ip_vs_set_ctl() is referencing uninitialized stack value when `len` is
zero. Fix it.

Reported-by: syzbot+23b5f9e7caf61d9a3898@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=46ebfb92a8a812621a001ef04d90dfa459520fe2
Suggested-by: Julian Anastasov <ja@ssi.bg>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Changes in v2:
    - Target net-next tree. (Suggested by Julian Anastasov <ja@ssi.bg>)
    - Reject all `len == 0` requests except `IP_VS_SO_SET_FLUSH`, instead
      of initializing `arg`. (Suggested by Cong Wang
      <xiyou.wangcong@gmail.com>, Julian Anastasov <ja@ssi.bg>)

 net/netfilter/ipvs/ip_vs_ctl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/netfilter/ipvs/ip_vs_ctl.c b/net/netfilter/ipvs/ip_vs_ctl.c
index 412656c34f20..beeafa42aad7 100644
--- a/net/netfilter/ipvs/ip_vs_ctl.c
+++ b/net/netfilter/ipvs/ip_vs_ctl.c
@@ -2471,6 +2471,10 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
 		/* Set timeout values for (tcp tcpfin udp) */
 		ret = ip_vs_set_timeout(ipvs, (struct ip_vs_timeout_user *)arg);
 		goto out_unlock;
+	} else if (!len) {
+		/* No more commands with len == 0 below */
+		ret = -EINVAL;
+		goto out_unlock;
 	}
 
 	usvc_compat = (struct ip_vs_service_user *)arg;
@@ -2547,9 +2551,6 @@ do_ip_vs_set_ctl(struct sock *sk, int cmd, void __user *user, unsigned int len)
 		break;
 	case IP_VS_SO_SET_DELDEST:
 		ret = ip_vs_del_dest(svc, &udest);
-		break;
-	default:
-		ret = -EINVAL;
 	}
 
   out_unlock:
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
