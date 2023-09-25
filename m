Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6A0CE7A94
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Sep 2023 11:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C618E418FE;
	Mon, 25 Sep 2023 11:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C618E418FE
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net header.a=rsa-sha256 header.s=zmail header.b=o54JjpWD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmIlqnI9p6jt; Mon, 25 Sep 2023 11:24:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 752ED415E5;
	Mon, 25 Sep 2023 11:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 752ED415E5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52E0EC0039;
	Mon, 25 Sep 2023 11:24:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 696C6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 11:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AC9F415EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 11:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC9F415EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id odDBkewQI7fz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 11:24:33 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB4F0417FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Sep 2023 11:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB4F0417FF
ARC-Seal: i=1; a=rsa-sha256; t=1695641069; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XXN41uh2MugBFGEid7+EZCRU511mZUoHzHBSVqvNu6zaPKjmnVdOlnjGlOT/9IGkt/bkzMwnNJecMqI7sQRHlaNBRnH7qVhDhIpNLQiRSppceXMsTMLIPVWBCP9K00z8z8qlZuXEF/0TjY58mH5zCJJjlbBCfz2NVoz6FxPmsX0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1695641069;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6QTBopM4AFokGMXe5eTyZo7tsMvC10D0AZEDxQ4I2I8=; 
 b=YMmnpyXNtdvVwcAzwmDdHA2dAMiw0VfMEW6cK83rb8lfX4ylzoKqKgVU4ToLiZt9rtnYW4VEYWJgmO3dIZJLPVAcFfU23ixEjMHbeJGTlND1FaGP1SMt9H1Db7LMZVTeEt/AqxSAESCoogD8WC0CA2FvhoHsF5pGeWRQvzRqLPk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=marliere.net;
 spf=pass  smtp.mailfrom=ricardo@marliere.net;
 dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695641069; 
 s=zmail; d=marliere.net; i=ricardo@marliere.net;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=6QTBopM4AFokGMXe5eTyZo7tsMvC10D0AZEDxQ4I2I8=;
 b=o54JjpWDPBdbUjK0Rg6qowmJZnG4LnrpIyvskIVkd77Pak6ynmSwVAEl7+aQZ1P5
 p+qu/sQpUdyynBDpBenl5GLXcN7+/a/B7jICanBGJ40/Tnr9q7fE8l/UDphAY2mb5w9
 9nbXeLrGuId8gmoZ6UqWiR0pT4I2CyA+sKkGIC6s=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
 with SMTPS id 1695641067825275.3232582858525;
 Mon, 25 Sep 2023 04:24:27 -0700 (PDT)
Date: Mon, 25 Sep 2023 08:24:29 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Juntong Deng <juntong.deng@outlook.com>
Subject: Re: [RFC] selftests: Add dependencies information for kselftest
Message-ID: <z6mgbk3rho5xh37ufwxu5tkblvk3kw44fg6pr2qcalwcsx6hz4@ehd3k5sr5ixy>
References: <VI1P193MB0752C18200A14B449C863B1899FCA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P193MB0752C18200A14B449C863B1899FCA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-ZohoMailClient: External
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, shuah@kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
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

On 23/09/25 06:25PM, Juntong Deng wrote:
> Most of the tests in kselftest rely on external tools and libraries
> to run, which means that in order to run the tests effectively we need
> to have all the dependencies installed first.
> 
> But unfortunately, there is currently no way to know in advance what
> tools and libraries the tests in kselftest depend on, and can only be
> known when a test run fails.

Hello Juntong,

did you check if tools/testing/selftests/kselftest_deps.sh does what
you're after? It won't tell you what packages are missing because it's
distro-independent, but it tells you what libs your system is missing.

e.g.

(...)
Targets failed build dependency check on system: alsa bpf cachestat
capabilities clone3 filesystems fpu futex hid intel_pstate kvm landlock
membarrier memfd mm mqueue net netfilter powerpc ptp rseq rtc safesetid
sched seccomp timens timers user_events vDSO
-------------------------------------------------------- Missing
libraries system -lasound -lcap -lcap-ng -lcrypto -ldl -lelf -lfuse
-lgcc_s -lm -lmnl -lnuma -lpopt -lpthread -lrt -lz -pthread



Regards,
-	Ricardo
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
