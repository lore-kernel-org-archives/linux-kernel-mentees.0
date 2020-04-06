Return-Path: <SRS0=pM+b=5W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B33C2BA80
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 11:00:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE249206F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 11:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKJsvcpo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE249206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9283085E03;
	Mon,  6 Apr 2020 11:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVcK9Q-_6WZ7; Mon,  6 Apr 2020 11:00:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8FDB885E27;
	Mon,  6 Apr 2020 11:00:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 770F0C089E;
	Mon,  6 Apr 2020 11:00:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD6E5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 10:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B589887DA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 10:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZhvB4-nxWYKw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 10:59:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 590A4861D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 10:59:57 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c138so7364463pfc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Apr 2020 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=76mGlpp6BFJSmPDHJW6kprv/8C2HQ3fa7ORMT87pipU=;
 b=XKJsvcpo7Y3eIsvwt+slK2It9/UwJptza1whwFfWJeSj+Tk+KPPzWRnlV8RzFZnRco
 /y7P0QfbJX6+uyw/ECZSlNemCC0/iajDr+1ag30GCLMMRu5NcpKvX9FkOA2gYmQZI698
 NHwzj58/n2FvYzGWfXQMvk+h0znA13zDb/EZuCDh94XdXGJYTJiQw0ILMoO5sLMAePcA
 vaAVOnzoTiiSNsWCJVKud051c87X5fZ2jUa/FtqGx2Asx2VGORgUd7wMw2XAlPwydg/+
 SrGwQPAkrr9goYq8UrZDdBGT2FeBGd/7ZJLVvTxDRZwkeZhXyMGxpuHt9BOGKWHq7Xl8
 N2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=76mGlpp6BFJSmPDHJW6kprv/8C2HQ3fa7ORMT87pipU=;
 b=rKOSROpnyvLgm/ioPjcWha8/L8SJjWxwlAnyyManfBf8HlgAiAMNzqnfmM1kBB9qeH
 O26pCDmPQowhuaKD7JeAyVApUjM8vBPEK9QlxeCniQJEz5VfQroE6q3DtRHFRfZgXrUk
 SasGplfLepQUkY3u38Ff1coqMklKCz+eI8t4wbGjbu4atksWEL0PBlHLhEw3vGNAGwIK
 AGZg6zr3Ka6DavpW54O6Mb/tCX3syLUcysvCWUR1xTPEC5MPuulNDhG03XgNiv5Wb5QW
 kRcG2eFtlYXg/AlWDigUl97GtGkDhBkQEEChusOMg9EpkG24xMwu/iGIu/Y0d6y1B1iV
 4Xyw==
X-Gm-Message-State: AGi0PuZ79TSjiJMDcpLLsM3LzJrXWNUGfoxUmWQ+yw7IOdOaEAQ0jNdv
 gDRsYJr/1ySUIXMfAav/DW0=
X-Google-Smtp-Source: APiQypLo5R6aTgUFGFSStDUnpE8fqAAl3q8UtUXqjkfX8M/Kws53j2EaC6qi929TvME8Gj6oK+ylkg==
X-Received: by 2002:a62:7911:: with SMTP id u17mr20215835pfc.305.1586170796382; 
 Mon, 06 Apr 2020 03:59:56 -0700 (PDT)
Received: from workstation-kernel-dev ([103.87.57.178])
 by smtp.gmail.com with ESMTPSA id x68sm9955214pfb.5.2020.04.06.03.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 03:59:55 -0700 (PDT)
Date: Mon, 6 Apr 2020 16:29:50 +0530
From: Amol Grover <frextrite@gmail.com>
To: James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>
Message-ID: <20200406105950.GA2285@workstation-kernel-dev>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.24.1
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 linux-security-module@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RESEND] device_cgroup: Fix RCU list
	debugging warning
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

exceptions may be traversed using list_for_each_entry_rcu()
outside of an RCU read side critical section BUT under the
protection of decgroup_mutex. Hence add the corresponding
lockdep expression to fix the following false-positive
warning:

[    2.304417] =============================
[    2.304418] WARNING: suspicious RCU usage
[    2.304420] 5.5.4-stable #17 Tainted: G            E
[    2.304422] -----------------------------
[    2.304424] security/device_cgroup.c:355 RCU-list traversed in non-reader section!!

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 security/device_cgroup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/device_cgroup.c b/security/device_cgroup.c
index 7d0f8f7431ff..b7da9e0970d9 100644
--- a/security/device_cgroup.c
+++ b/security/device_cgroup.c
@@ -352,7 +352,8 @@ static bool match_exception_partial(struct list_head *exceptions, short type,
 {
 	struct dev_exception_item *ex;
 
-	list_for_each_entry_rcu(ex, exceptions, list) {
+	list_for_each_entry_rcu(ex, exceptions, list,
+				lockdep_is_held(&devcgroup_mutex)) {
 		if ((type & DEVCG_DEV_BLOCK) && !(ex->type & DEVCG_DEV_BLOCK))
 			continue;
 		if ((type & DEVCG_DEV_CHAR) && !(ex->type & DEVCG_DEV_CHAR))
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
