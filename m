Return-Path: <SRS0=3/iO=4E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C28C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 17:28:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F1D20857
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 17:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9a6Mac4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67F1D20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3CCF8873DC;
	Sun, 16 Feb 2020 17:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSFw+VQXS9jz; Sun, 16 Feb 2020 17:28:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CFC9785AA0;
	Sun, 16 Feb 2020 17:28:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA498C07FF;
	Sun, 16 Feb 2020 17:28:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC4D4C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 17:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CCAF086CB6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 17:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4romM5m7i6t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 17:28:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 26FCB85AA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 17:28:19 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ep11so6115656pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 09:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=li9wRD+trYzeYRrIDTG7VErShRh4YzHNS/3QPJhsHYs=;
 b=R9a6Mac428S9opSV3aq/ZhqE30jY6lafTCf7S2d1eJ1E99RSCGWcpDXTeZ3Vg3+GyD
 ihz21YJzlyYeM3anV69vpMgMV6lksRliQJ0HCBJbYfSLI+6QzXpoQOwW0aU0izce8Ky+
 BvU/CsSiIhoznN0iXSXvbX23to+afL5HRUjQ/g0BjQj+mjhbeXlEqW0wLFe15ZHEn8Ip
 VZjDKptRZCNYMvxaU/Ngrb0Ps89+DO1AkcGFEVdK/ApL+P+Exqzjhlh3gNRNjQnnyuqJ
 MzGQYvNnAP301j1JSOtlVfkSF9EnxwP70stmA832B99N7jjUloV4FBtKk5SXhWB1f6Wf
 EL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=li9wRD+trYzeYRrIDTG7VErShRh4YzHNS/3QPJhsHYs=;
 b=UtTg+3ndBIxJah953XPbQBPUS0B0I6yoBbwhqPNy8Y6Edkj+X2i+qMP5yvTgdoDoGc
 8wUT38L6Mv67kH8Ipbzk/HKiP6eEIFp0pcYXwfSAEQ6SvB7bGs4lUPFLWZwrnAVDoG6A
 CK/UyzXFHvIz3YKNvca2nt+6nGBwjJFa2EIY5PHFxRXHO2625JA8tNIjn6xpoQbC8A0C
 hI7to1LAOfFU8eVuF/urmKaDMbMhN6a92WgTw0P62Vq2IhPIb8E9ZYAPdfvrGK7o7TCF
 LPcgAMsGhJiR1YCNxmxkhC4PI/YLjEQRQ2IrvAqCoMQRRADEtI/1uv7sp4GJzp9Grzak
 fAhA==
X-Gm-Message-State: APjAAAXnAD6CdL+b4wwWroZDbjUtVRdorpNXRGyIG1Je7+Hg1ORUMT2g
 poAcbqFvmEUsUksvjpbpRko=
X-Google-Smtp-Source: APXvYqwnA7pjS1054IxgkOuF4Ptq6AKSK3rxTwoaU0ILSWvT53J2OayxuX5Dez18xr9oJSMfJG/xXg==
X-Received: by 2002:a17:902:6a88:: with SMTP id
 n8mr12421746plk.265.1581874098693; 
 Sun, 16 Feb 2020 09:28:18 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.250])
 by smtp.googlemail.com with ESMTPSA id iq22sm13836213pjb.9.2020.02.16.09.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 09:28:18 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jeremy Sowden <jeremy@azazel.net>,
 Florent Fourcot <florent.fourcot@wifirst.fr>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Johannes Berg <johannes.berg@intel.com>
Date: Sun, 16 Feb 2020 22:56:54 +0530
Message-Id: <20200216172653.19772-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, coreteam@netfilter.org,
 netfilter-devel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] netfilter: ipset: Pass lockdep
	expression to RCU lists
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

ip_set_type_list is traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of ip_set_type_mutex.

Hence, add corresponding lockdep expression to silence false-positive
warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/netfilter/ipset/ip_set_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
index cf895bc80871..97c851589160 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -86,7 +86,8 @@ find_set_type(const char *name, u8 family, u8 revision)
 {
 	struct ip_set_type *type;
 
-	list_for_each_entry_rcu(type, &ip_set_type_list, list)
+	list_for_each_entry_rcu(type, &ip_set_type_list, list,
+				lockdep_is_held(&ip_set_type_mutex))
 		if (STRNCMP(type->name, name) &&
 		    (type->family == family ||
 		     type->family == NFPROTO_UNSPEC) &&
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
