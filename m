Return-Path: <SRS0=+Bvw=2B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF0CC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Dec 2019 07:48:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF63A20637
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Dec 2019 07:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5PHuxbR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF63A20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B1D4B20514;
	Wed, 11 Dec 2019 07:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRfHSkZvSRNx; Wed, 11 Dec 2019 07:48:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 49631204DC;
	Wed, 11 Dec 2019 07:48:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32CD0C1796;
	Wed, 11 Dec 2019 07:48:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A037AC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Dec 2019 07:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8FC06869EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Dec 2019 07:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Trjr00gy-XJy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Dec 2019 07:48:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3A23B8693F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Dec 2019 07:48:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y206so1394884pfb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Dec 2019 23:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YZr4Epca+GuujTKa3m7m+IfakHaCFSR+D2ApesAFk1c=;
 b=U5PHuxbRnHlJa1WF+pikiQbtPbj5pJ7lgV5v4nMGLt0Of0pIDalan3kAwk19+T1syH
 ky7XJJOk+Ns+WGs/KvQjndmdhnllQqGZvOdbFFpuK9+lrlM600XMxEE//PHAyFKeOFuK
 gTTc1HWEJFGqb+sbOKFDpdleIh8Av+xZ7FGZM0vYgdH+XdpaxC0hZgjCMDec5Jd4AKcW
 n5pWSscHt5SMundXJo+6cJ/RBX00VU2TQzUAMQFW++Priw7PoIYrMPi1ncUz+UHqhHJp
 oQ/5HJ1HkVRr95REdP9ZoW9T3XjRHobEwYMahgS8+VXu5xLi0hBey97bhL9s1OLBZjRJ
 6BCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YZr4Epca+GuujTKa3m7m+IfakHaCFSR+D2ApesAFk1c=;
 b=YGz3iHsakwo/18rQoGjBeeVMDmt5yt1gnmLhWUNTB9kgtJESNUJ/7TYe2YabIRpzma
 AUadA9RLuJkP41hSsRso9WjWFO2AB3SL/gY8eXY7VtHyC0XggVN1TwqUzK2Qe8NzrVJd
 e7/QOjGt2ADXpJob+RhX5StVW2ZR5ne/ogyfJxQcxA2qsmR9jVTX1tOKr1MUYC3tKpjl
 eSf27DNiYTPi27s418L7qznnzYsGJv4AFozzP7eDyo25DR0t9KGJLNtAf5cTCgrKHnb+
 7VWtd4D13z3K+BXhhBVJOaZJPTJuzm4FDoQUwv3/z7F4J/nQCdgJcpFJE0mQNE/ccYKk
 X/VQ==
X-Gm-Message-State: APjAAAVSA5U/5rPT74/q3OuCTS5eDGEgSXGmWf4PGKFeL77qk3ekoqP3
 eAP8gLYxKGfMtRvsobwS4GY=
X-Google-Smtp-Source: APXvYqyZDQK3BrPblKtF9yFedeidgw6D3UCAXB1xQ+YRFW+Bk+WImrFuf0ioiY/CAhm3NHCwwlxpEQ==
X-Received: by 2002:a62:b60c:: with SMTP id j12mr2351212pff.8.1576050528554;
 Tue, 10 Dec 2019 23:48:48 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:cdb:7615:9ccb:7dcb:bf59:4b2f])
 by smtp.gmail.com with ESMTPSA id i4sm1608055pgc.51.2019.12.10.23.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 23:48:47 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: kbuild-all@lists.01.org, trond.myklebust@hammerspace.com,
 paulmck@kernel.org, anna.schumaker@netapp.com, joel@joelfernandes.org
Date: Wed, 11 Dec 2019 13:18:42 +0530
Message-Id: <20191211074842.21400-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <201912110621.WJ6oENgf%lkp@intel.com>
References: <201912110621.WJ6oENgf%lkp@intel.com>
Cc: rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: nfs: dir.c: Fix sparse error
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

This build error is because the macro list_tail_rcu() is
not yet present in the mainline kernel.

This patch is dependent on the patch : https://lore.kernel.org/linux-kernel-mentees/CAF65HP2SC89k9HJZfcLgeOMRPBKRyasCMiLo2gZgBKycjHuU6A@mail.gmail.com/T/#t


Thank you,
Madhuparna





_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
