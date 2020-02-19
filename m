Return-Path: <SRS0=HLeX=4H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291E7C34047
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 10:07:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC333207FD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Feb 2020 10:07:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0baOwT4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC333207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9D87C203F4;
	Wed, 19 Feb 2020 10:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AH4Eg8iFuDSP; Wed, 19 Feb 2020 10:07:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 083062000B;
	Wed, 19 Feb 2020 10:07:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7A67C1D80;
	Wed, 19 Feb 2020 10:07:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C2C4C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 18AC987874
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQb6CPJGBJ-L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:06:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 664D487860
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 10:06:26 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t14so9367502plr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2020 02:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GVRdPNZo5d7eI2NxNW1l7GKKSA1O3A8YX4K6fJNiyFY=;
 b=j0baOwT4MtNLCJOeh0o5lSqPQB90+Rp/h2KSZs0EGIBpTIb0AtoyvA9Om1n5YFIChN
 kteaGHD0cop5owLYIfi7ILHZFl/vUjEP8PP4z5tDqAuta7CFnOTHkXjeGdoceEfQY4XO
 +Ebx9VrVptRX/UV81DTLEQDt6kUPYlRyDJtljGmiWE6bAj0ohSZlDqigr+O8baB1TD7n
 IXCxhV5e35GbRm/8inLkz6r+6idv2be0yxk/GyBL3pGxrBw/DpTlWvPXiJBj6ZrPuQ81
 RyptQrK4Rp5tDRTw1lnJo2YOWDKA4Y202Di+Cqnuq/xTMh9naiEzvBzwJ+IaZfs+Hup8
 yNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GVRdPNZo5d7eI2NxNW1l7GKKSA1O3A8YX4K6fJNiyFY=;
 b=hqj/tdj40EJWx9IsuY8a9NJaZmuBF1Jz6A/lKQvE3X7ZbHYfd22uNJ5lV2bR1StoZL
 6StlCTnAy2wr87OYhsmyR6+t0mwxkgtHIFk8YmQtL2yw2hlxFR3FInMl4/WGHFXK3nHc
 tXOtjniOOUDZriUkNn+2cFbVCuA+FvMmxGlWUyVO36Y0dc8b42EJwDixeOF8WvBIJt2e
 TbVR99aNTLwxULe1jxSVuUdgOyCEfQeCqVZfyjN9iewWc0aaLnlPgW+vs4qGdUljNe9m
 p5/Dh+yZ2+MxWt8kZ2P2FxaxWjOAmMVMX68whdwDTw4CqAgBzc6My4JIYLYPrgeeHr/Z
 680A==
X-Gm-Message-State: APjAAAWPsV5vFjgqqpLsJa70w7AAMUyfu+OZoIcnO2cDmlVyTWWIS6yf
 mB21IRtHvwI5mJVhtrqKcYo=
X-Google-Smtp-Source: APXvYqzBjjlOD+j8XLKGMCJFZ0gJV4hY7IPslrCb7PxPpQVZPaaNPRR0FsXbdorABRNjPsdeAx5FPQ==
X-Received: by 2002:a17:902:7c85:: with SMTP id
 y5mr24648684pll.227.1582106786018; 
 Wed, 19 Feb 2020 02:06:26 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.220])
 by smtp.googlemail.com with ESMTPSA id w14sm2097754pgi.22.2020.02.19.02.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:06:25 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Eric Dumazet <edumazet@google.com>,
 "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Wed, 19 Feb 2020 15:35:46 +0530
Message-Id: <20200219100545.27397-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] tcp: Pass lockdep expression to RCU
	lists
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

tcp_cong_list is traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of tcp_cong_list_lock.

Hence, add corresponding lockdep expression to silence false-positive
warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/ipv4/tcp_cong.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
index 3737ec096650..8d4446ed309e 100644
--- a/net/ipv4/tcp_cong.c
+++ b/net/ipv4/tcp_cong.c
@@ -25,7 +25,8 @@ static struct tcp_congestion_ops *tcp_ca_find(const char *name)
 {
 	struct tcp_congestion_ops *e;
 
-	list_for_each_entry_rcu(e, &tcp_cong_list, list) {
+	list_for_each_entry_rcu(e, &tcp_cong_list, list,
+				lockdep_is_held(&tcp_cong_list_lock)) {
 		if (strcmp(e->name, name) == 0)
 			return e;
 	}
@@ -55,7 +56,8 @@ struct tcp_congestion_ops *tcp_ca_find_key(u32 key)
 {
 	struct tcp_congestion_ops *e;
 
-	list_for_each_entry_rcu(e, &tcp_cong_list, list) {
+	list_for_each_entry_rcu(e, &tcp_cong_list, list,
+				lockdep_is_held(&tcp_cong_list_lock)) {
 		if (e->key == key)
 			return e;
 	}
@@ -317,7 +319,8 @@ int tcp_set_allowed_congestion_control(char *val)
 	}
 
 	/* pass 2 clear old values */
-	list_for_each_entry_rcu(ca, &tcp_cong_list, list)
+	list_for_each_entry_rcu(ca, &tcp_cong_list, list,
+				lockdep_is_held(&tcp_cong_list_lock))
 		ca->flags &= ~TCP_CONG_NON_RESTRICTED;
 
 	/* pass 3 mark as allowed */
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
