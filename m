Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660C0C43464
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 09:08:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B5720773
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 09:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9gxHM53"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8B5720773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4E5AF204ED;
	Mon, 21 Sep 2020 09:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSXV4dFcvp9E; Mon, 21 Sep 2020 09:08:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2D64B20516;
	Mon, 21 Sep 2020 09:08:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A282C0859;
	Mon, 21 Sep 2020 09:08:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE9D2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AB44085F83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wn6u45uPaXFf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:08:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 06F3285F77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:08:09 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id x69so16119806oia.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 02:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dbWT07vpyZ1SWOiX3mk1Zbhx2jweWcU4bi6BNw5WLn4=;
 b=o9gxHM53+poPwlM0QzjV4UkiBVIgdjEQzc9A2zCqZfequDc82OY+uGutMbbrBSygG7
 1BFvVx4mNq/byu7WPiLdZeuYUhHiW4F5Xesl07Grtg//k9p76j3v67xZDCVXe+ShUAzY
 7rshIfx9NH1KHCvTmodpYLxpI3fUbgMg/nRlV0KQ41Q9VqJf1tpkIO+tJiPICwn5PCoC
 h3kQAZwQIMj/7NSTxrwPbBKQysz4yVdCIK/euM2F7A1FxixhvM5y6kaqKn/1DVdIAzeS
 mKUdeLkRqXLPct1MjF27lFEIU3R4IiTRID5rbgpLYtFMe6EwbzrdY0ngmUiGnlnoTA4n
 iI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dbWT07vpyZ1SWOiX3mk1Zbhx2jweWcU4bi6BNw5WLn4=;
 b=UDp6xMFJP3Me7bJi+f+CQygA0mnyPhcPgMLfZdC9yV6F5NnbQZogRdyak1+31ZZBJf
 Sm3S9o5hPNH/9GPiA9neqiwsPlLRtKOlO+ZeRtlfGa2s+UmnR0ccuR8XXzN/Jm1JU8WY
 +xpYoFiI4bWqE1+XkqFUqHyg55zeQOj77oSf/ZZ60s2gZxFSbUYni7IcuyhUro7kQTu0
 2ymvjsj5dHnC+9Nq367Gly53AcTfrVtGX3RnMW8h53fXSDpQoXBcFD5IjX1e0X6Bhh42
 tQsKJrvy4zrDcQHeEOexmm4t1bUhVjgayfTKEBCz4rwPDAb7LXtJo+RuXnXednydmzk4
 f5+w==
X-Gm-Message-State: AOAM5328gd7fmyMQX6oVVPLbtPCYXbVgrLKlxbhDw+Dm/m4yMTo1E45R
 ot1eD6KoaGF02BZJEm3JCV93FqqgN4vChb3CGo0=
X-Google-Smtp-Source: ABdhPJzeEyih95uzcPdIb/0WJFTRnaedGGPpPqimX9825FR2IexiSSD9S79D3jUknFE2/ADoGdSohLwdcduhm38XuRM=
X-Received: by 2002:aca:b2d7:: with SMTP id
 b206mr17211915oif.110.1600679288048; 
 Mon, 21 Sep 2020 02:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
 <alpine.DEB.2.21.2009181238230.14717@felia>
In-Reply-To: <alpine.DEB.2.21.2009181238230.14717@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 21 Sep 2020 14:37:48 +0530
Message-ID: <CABJPP5A8kaaFqR9Sm-rS6uuWb6CdbnkLLPXWpgp8XeEgC9uOJw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
	NO_AUTHOR_SIGN_OFF issues
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

Hi Lukas,
I did send out the patch.
Weirdly enough, my gmail inbox decided to combine both
threads with subject [PATCH v2] and [PATCH v3]. Did you
get it separate or is it the same case? In other mail boxes
it seems to be okay.

Apart from that for fixing the different email addresses, I
am thinking to try copying the read_mailmap subroutine
from scripts/get_maintainer.pl, see how it works and
try to write a solution based on that. I will let you know
once I achieve something.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
