Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFAAC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jul 2022 13:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A72060FE7;
	Sat, 23 Jul 2022 13:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A72060FE7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=C5Kc0g6Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qhus0oISGurF; Sat, 23 Jul 2022 13:51:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5C56660FF0;
	Sat, 23 Jul 2022 13:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C56660FF0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33934C0033;
	Sat, 23 Jul 2022 13:51:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACF60C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 13:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 697FC84AE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 13:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 697FC84AE9
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=C5Kc0g6Q
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwxrEzpKOosd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 13:51:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC5C984AB4
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC5C984AB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 13:51:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658584264; cv=none; d=zohomail.in; s=zohoarc; 
 b=XYU1zZnXuqFX5/HEudi9MdMxktvd9itAU+I2kePgDtCgp6Li1x8deFEeTSo4eTQS1AbaC/ivef2pbxmOYDcr2MTZ3t4RpyknGzLsXwEhNuVnyM40iFlvYFHv1s6A4JVc97EEyhqomPGugRHf6mFMnY8vj2Z+pRvpg+t8RZgiH00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658584264;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=kk/+ZMIM3QEokLR9dNDr3dm8l5WXXAEPykmzd3WKeh8=; 
 b=bBmfhYES5zT2HidO8HpjBfslnBmO60DtgLqOtOH5Sz+OLgjxOhtn2KH1Uz8/eFMCpaI5O6vHw+spAgfOU1gCxzta9YMbvk6j9CBjTZqDm1BkKRuOV9X+zPxixdBv4ljsbHaOpjPz5HMLN2uqV6ievgrMCFjHYvCafKDwNv099Dg=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658584264; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=kk/+ZMIM3QEokLR9dNDr3dm8l5WXXAEPykmzd3WKeh8=;
 b=C5Kc0g6QcesPZacQeSWUfVye11w85Epm+2OhT0JWxQuKAC0qiYGDe5rM2GegGr6F
 0GncE33rxOJHfMEfbX9lJ/wGrkzBNGaBREdPQmq4uoF7icdrgn8A0XmbYG4yKWadTN6
 O7VluijrgjArt2qZmswtFWS1t01hw+BtIxp4wY6s=
Received: from localhost.localdomain (43.250.158.127 [43.250.158.127]) by
 mx.zoho.in with SMTPS id 1658584262744848.2252468169082;
 Sat, 23 Jul 2022 19:21:02 +0530 (IST)
To: David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Message-ID: <20220723135035.199188-1-code@siddh.me>
Subject: [PATCH] keys/keyctl: Use kfree_rcu instead of kfree
Date: Sat, 23 Jul 2022 19:20:35 +0530
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-security-modules <linux-security-module@vger.kernel.org>,
 keyrings <keyrings@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

In keyctl_watch_key, use kfree_rcu() for freeing watch and wlist
as they support RCU and have an rcu_head in the struct definition.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 security/keys/keyctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 96a92a645216..087fbc141cfd 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -1832,9 +1832,9 @@ long keyctl_watch_key(key_serial_t id, int watch_queue_fd, int watch_id)
 	}
 
 err_watch:
-	kfree(watch);
+	kfree_rcu(watch, rcu);
 err_wlist:
-	kfree(wlist);
+	kfree_rcu(wlist, rcu);
 err_wqueue:
 	put_watch_queue(wqueue);
 err_key:
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
