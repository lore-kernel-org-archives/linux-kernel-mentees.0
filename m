Return-Path: <SRS0=VNSv=6E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8179C3815B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 06:36:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7839B2073A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 06:36:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IKoVdphK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7839B2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 41CF920441;
	Mon, 20 Apr 2020 06:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsu1bH522lQO; Mon, 20 Apr 2020 06:36:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 93BAA203B9;
	Mon, 20 Apr 2020 06:36:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E585C1D74;
	Mon, 20 Apr 2020 06:36:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0FCBC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 06:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C35A920440
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 06:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Otnyb7TIckbC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 06:36:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 1351B203B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 06:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=1ZwiicauWnlJyYqBOjYVKIuw0ezoPJWguiiqMIoLyio=; b=IKoVdphKXNa5YRM6DsCQXdVgiJ
 aUvjUTqxRBKM4TxGoxk79HWJkNfD2paOgkBdliIu75vOZi0Q0PGFE95sunOxDMkBsT3KzAS+3GwLh
 xmG/NOUMDCxbLSHg17i7x5cQ72/8Z43ZT868KMpjIoSOEYibTfjG9ekUClUXpV59n/Qr5pk9Alzag
 dqMP8HvmzJWj+e6cWjCdjDbw2/cjXQ05OXbKBaavlfpfVOd1T/qAbi2nsDVIIP3HpLvc12R81saHB
 KvAWTODuV++aAVSMgBGkecxoHmSvsxcW82RiUajIvo4KWGJ9D7rNie/Ao5iTCRAH9oXzRh0Zjz9xQ
 wUONW6xg==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216]
 helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQQ2Y-0004Aa-3Q; Mon, 20 Apr 2020 06:36:22 +0000
Date: Mon, 20 Apr 2020 08:36:17 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <20200420083617.7cdcbd1c@coco.lan>
In-Reply-To: <d21c9671-9848-9286-844c-69d7fc9f8297@gmail.com>
References: <d21c9671-9848-9286-844c-69d7fc9f8297@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Jonathan Corbet <corbet@lwn.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Is anyone working on fixing warnings
 these Documentation files ?
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

Em Mon, 20 Apr 2020 02:56:18 +0200
Saheed Bolarinwa <refactormyself@gmail.com> escreveu:

> Hello,
> 
> Please is there anyone working on fixing these files. I have have 
> checked the email archive,
> 
> though I surely have not search thoroughly.
> 
> Please, let me know if you are working on any of these:
> 
> 
> - Documentation/admin-guide/ras.rst
> 
> - Documentation/virt/kvm/amd-memory-encryption.rst
> 
> - Documentation/trace/events.rst
> 
> - Documentation/power/pm_qos_interface.rst
> 
> - Documentation/process/programming-language.rst
> 
> - Documentation/filesystems/fuse.rst
> 
> - Documentation/admin-guide/bootconfig.rst
> 
> - Documentation/admin-guide/hw-vuln/tsx_async_abort.rst
> 
> - Documentation/filesystems/ubifs-authentication.rst
> 
> - Documentation/driver-api/driver-model/driver.rst
> 
> - Documentation/driver-api/gpio/driver.rst
> 
> - Documentation/driver-api/thermal/cpu-idle-cooling.rst

There is a set of fixes from me at:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=docs-fixes

that were already submitted, but I guess Jon didn't merge yet.

Btw, if you want to do any work, I suggest you to take a look on
this tree:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=all-docs

Where I merged all patches I did already for documentation and
that weren't merged upstream yet.
Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
