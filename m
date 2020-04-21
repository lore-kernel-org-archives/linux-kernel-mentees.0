Return-Path: <SRS0=yja0=6F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4C8C5518F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 05:07:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40ACA206D6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Apr 2020 05:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="ZHInWwaF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40ACA206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E82C3878B4;
	Tue, 21 Apr 2020 05:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V80levqmSS-y; Tue, 21 Apr 2020 05:07:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E4F48748E;
	Tue, 21 Apr 2020 05:07:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A323C1D91;
	Tue, 21 Apr 2020 05:07:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0FC1C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 05:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A9B95878B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 05:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQjHEORWws8T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 05:07:15 +0000 (UTC)
X-Greylist: delayed 00:11:55 by SQLgrey-1.7.6
Received: from condef-06.nifty.com (condef-06.nifty.com [202.248.20.71])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 33B038748E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 05:07:15 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-06.nifty.com
 with ESMTP id 03L4rMIH019868
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 13:53:22 +0900
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 03L4qp4S002783
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 13:52:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 03L4qp4S002783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1587444772;
 bh=/bMQlShw8uk7wtf7csiuF+GhrxiF4rVo+x6bc8t2/pE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZHInWwaFV6Ppb5RJptyXg2Hjwhhcv/Ew7dIOaejliN5o945L/GOphVXlnBGkuk8Lf
 PNMpNUHKpy71O2JbSaYT6WRdhMHOY2QIwBfipvcS559mOb3YVNVIQ0j8xjuvLKIuv0
 +xF2yDcKyT97aKRHZWB3u0DLDY52hsANzuyQM08w/DOg0WOZUKQbif81cSYc6/Y5oi
 fRWn6AOCN5nDOgmEpy0PQHM0WFamJdZCxWJAOepjD2O0hm6JjvgITU41MG6O/7b6hm
 ngZIoo3NN7cYgVqWkDCZme0DIFMZnxHvxsjDDWd2VbZNO/vkyz2+3ZjlTRKIJl5SI5
 EBhdW6Com/TYw==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id s11so449040vsq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 21:52:51 -0700 (PDT)
X-Gm-Message-State: AGi0PuYANsEqiK2rUoBx0PQkYfHOUSgIQt5k+Yz4UnMQR8Ib9Dxw1ZkC
 17C+P1Ajufx2xd6Xu7TLNQAywScbe9+cJTYFe0I=
X-Google-Smtp-Source: APiQypK5llLv7LJrjEM3PXYVXtnIpMbDbXFW38yPuWSVyr/Dlk13SYDsY48W+fB8TZ7RTuAWTfCi+VnAHLy7xjr+UOU=
X-Received: by 2002:a67:e94d:: with SMTP id p13mr11315926vso.215.1587444770520; 
 Mon, 20 Apr 2020 21:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200414012132.32721-1-vitor@massaru.org>
 <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
 <b82142248b38085fa3ab49a9d3181cabd5a79a91.camel@massaru.org>
In-Reply-To: <b82142248b38085fa3ab49a9d3181cabd5a79a91.camel@massaru.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 21 Apr 2020 13:52:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPdSDGX32wXM8MPAQjOwky9qWX2sAo4SWZEcWP5RdTOg@mail.gmail.com>
Message-ID: <CAK7LNAQPdSDGX32wXM8MPAQjOwky9qWX2sAo4SWZEcWP5RdTOg@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kbuild: ensure mrproper
	removes arch/$(SUBARCH)/include/generated/
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

Hi Vitor,


On Tue, Apr 21, 2020 at 7:27 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>

> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> >
> > Reported-by: Brendan Higgins <brendanhiggins@google.com>
>
> Was actually Reported-by Theodore Ts'o <tytso@mit.edu>
> https://groups.google.com/forum/#!msg/kunit-dev/QmA27YEgEgI/hvS1kiz2CwAJ

OK, please add his tag, then.


>
> Can I add suggested-by Masahiro Yamada <masahiroy@kernel.org> ?

Please feel free to do so.




-- 
Best Regards
Masahiro Yamada
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
