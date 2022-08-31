Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AB5ECAAA1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 Aug 2022 01:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B294E417AC;
	Wed, 31 Aug 2022 01:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B294E417AC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WQWrb6A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iaKyoYo8kYJ1; Wed, 31 Aug 2022 01:42:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6B2174176D;
	Wed, 31 Aug 2022 01:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B2174176D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4329CC0032;
	Wed, 31 Aug 2022 01:42:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6038EC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 01:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4084D40BA2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 01:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4084D40BA2
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WQWrb6A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICJyjRDklcpf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 01:42:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89D7A40235
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89D7A40235
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 01:42:37 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y141so13063838pfb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Aug 2022 18:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ubln5fbaH7ce6iCfzyyQW0XzblPfUEWaEnsNJEtuwZ0=;
 b=WQWrb6A2v+HplHa3p58KzNRe6SGR/3aIWFOSYkCJN0vW/pKmSkdNGK/JiCYm4EEbhH
 nVMI9oI06oNBKeVT4kRHfNoZ/j7eG7vmAX+6Izx/XPGRsV6Aluyw2K60H0tVaBm+DUxJ
 EhsnX3Ind220EeodRa+bvDXMM+ZZIqPurQhcUwudUmAra8VYIctv6qCypHE1VKNHCP3G
 4YcoOUwsJwE2OtZnuYwoWsStzSGz42wG02pXpODJot6I8B4/0sMcN6H31TM5F/j9c/Uw
 rzpSf6rFCe92nJ83yoNL7Y5j6WGJxGq7DqRZZ1v1vBO2r6NE4ZC+pO9r9bznIVIUuMHA
 znUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ubln5fbaH7ce6iCfzyyQW0XzblPfUEWaEnsNJEtuwZ0=;
 b=GflLmnz8VRHPC0zPRwJQyMkTishA8qmMiCgIouRfQAJRzOtr/kLqC/jpdYOWKmhtc7
 CcOOZzZUkip+oxuzSkOD37xFzGcNcwsCUBZ1L4ybdDkms9R+e7T9BlaHA0jHMCFBbJCs
 S+lwmf5xKfFnMWmahW3oyWckERbnU5YywvKcTnGPeqOvyzZo+IF5PmkoCJrYr4MF0SEQ
 DyRyqVSFD6pI1bcj3gh3oWjtC3R1HvV6Qf8TMLDTbORIi3wZZsbIKCPflQviC+ecJdwT
 upjw+33wZkb7QPR1X88eEaQDm/nahtM0bHVqVWJwOy4hwFD5dTYpcGEwgLbeOY/yfwPT
 n+KA==
X-Gm-Message-State: ACgBeo3rk+1nJQ9C1rvIHSHe38omXFfO7tUqSCosO7HF7dHkKwm8IzxY
 hNxoWd4ATnUfOydYBDRBh/c=
X-Google-Smtp-Source: AA6agR6kV/OhmOXg5dp+Bv+738W/VZODrtrBXBzu3xirOAwgxXAPMAvHOgtUE00PgnclQ8hA1OuYZg==
X-Received: by 2002:a05:6a00:4147:b0:52e:2d56:17c8 with SMTP id
 bv7-20020a056a00414700b0052e2d5617c8mr23961845pfb.51.1661910156971; 
 Tue, 30 Aug 2022 18:42:36 -0700 (PDT)
Received: from fedora.. ([103.159.189.150]) by smtp.gmail.com with ESMTPSA id
 k15-20020a62840f000000b0052ddccd7b64sm10080460pfd.205.2022.08.30.18.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 18:42:36 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com,
 syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
Subject: [PATCH] xfrm: Don't increase scratch users if allocation fails
Date: Wed, 31 Aug 2022 07:41:26 +0600
Message-Id: <20220831014126.6708-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <00000000000092839d0581fd74ad@google.com>
References: <00000000000092839d0581fd74ad@google.com>
MIME-Version: 1.0
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
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

ipcomp_alloc_scratches() routine increases ipcomp_scratch_users count
even if it fails to allocate memory. Therefore, ipcomp_free_scratches()
routine, when triggered, tries to vfree() non existent percpu 
ipcomp_scratches.

To fix this breakage, do not increase scratch users count if
ipcomp_alloc_scratches() fails to allocate scratches.

Reported-and-tested-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>

---
 net/xfrm/xfrm_ipcomp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_ipcomp.c b/net/xfrm/xfrm_ipcomp.c
index cb40ff0ff28d..af9097983139 100644
--- a/net/xfrm/xfrm_ipcomp.c
+++ b/net/xfrm/xfrm_ipcomp.c
@@ -210,13 +210,15 @@ static void * __percpu *ipcomp_alloc_scratches(void)
 	void * __percpu *scratches;
 	int i;
 
-	if (ipcomp_scratch_users++)
+	if (ipcomp_scratch_users) {
+		ipcomp_scratch_users++;
 		return ipcomp_scratches;
-
+	}
 	scratches = alloc_percpu(void *);
 	if (!scratches)
 		return NULL;
 
+	ipcomp_scratch_users++;
 	ipcomp_scratches = scratches;
 
 	for_each_possible_cpu(i) {
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
