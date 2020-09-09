Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DB7C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 16:01:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E32E20639
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 16:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YRCcYBzt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E32E20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9761286C24;
	Wed,  9 Sep 2020 16:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxNvr4LHyEG0; Wed,  9 Sep 2020 16:01:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6248286B26;
	Wed,  9 Sep 2020 16:01:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58478C0859;
	Wed,  9 Sep 2020 16:01:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA78AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 16:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D3F0486D89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 16:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-2abDYqDmIh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 16:01:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7721F86D86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 16:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id ADFC651BBF;
 Wed,  9 Sep 2020 18:01:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id ZgrdKOgIHVGP; Wed,  9 Sep 2020 18:01:38 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599667296; bh=e4qlURuILzRyUzrFxTQfMJVSDPvoVUTNY9vBZKFDpMs=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=YRCcYBztM4+m9u2n7M/TbUthnvCei93JPckdILE3QDPqZMHMm5+/UojU4pHjUjy4i
 jzWrnVXRQQoGZooF9phFgOCVKlAGTWvr5dJsdynxpqCkW0DkaLeLUORuaN0SZjq7ui
 93UdGxtE3LCnW53fTES7NZNDlaTu6Biaone623lZEjhEWhX/azOBWHIZ8ouIgQCh7C
 OAuiC6NNxbq1vCWfwRJo5X1ae9r0k0yAup2OI/yLQXeL7BU86cPUmhzEWaA2DKFEOX
 xaDIWnYznXrBoK1E7brH0+/VmfF0+8qFLDUeqXcBIN/DoYkYbdpkvxjDAsHhN8Gi1N
 btzUUHs13/bOw==
Date: Wed, 09 Sep 2020 16:01:36 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <7edaf9ca48af99a1f288111320e263b5@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2009091145130.5622@felia>
References: <alpine.DEB.2.21.2009091145130.5622@felia>
 <CAKXUXMxBxyQ9KM1d92d0vGuaGRLe6+aVHa3s_O=E-YTq_jLPJA@mail.gmail.com>
 <alpine.DEB.2.21.2008270707440.9436@felia>
 <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
 <32595de077ee7d674a628df11c58152f@disroot.org>
 <97cef44dfa6c692c20ef7a0d981e4863@disroot.org>
 <alpine.DEB.2.21.2008310702520.8556@felia>
 <a6f436fe39f48d9b7e537bdfad07fc7e@disroot.org>
 <CAKXUXMz8MphA5PYtLe_mB+3qNV-PSimmSVS2+P5vpv=4+VsBFw@mail.gmail.com>
 <8802360392ba3dd9ded3999c3f57560b@disroot.org>
 <65d03f2a884a92f5094dc417d0bf47e0@disroot.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Regarding "Linux Kernel: Evaluate and
	Improve checkpatch.pl"
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

September 9, 2020 3:22 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
 
> Create a separate patch that can be applied independently. As a mentor, I
> suggest to first send the patch only to me and the linux-kernel-mentees
> list, so that you get some first feedback without bothering the
> maintainers and them losing patience to work with you.


I created a patch which handles line break between commit and hash value,

It can be found here:

https://gist.github.com/eldraco19/1631a75f859a07541d3c7c73c4958ca1

Please review it and suggest any improvements.

Thanks,
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
