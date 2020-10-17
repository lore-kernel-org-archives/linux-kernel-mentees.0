Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74F2C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 16:50:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5442074A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 16:50:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wy2kowaO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5442074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1291187D2B;
	Sat, 17 Oct 2020 16:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUFk5O+zkY6s; Sat, 17 Oct 2020 16:50:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A8E7287C6A;
	Sat, 17 Oct 2020 16:50:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C9F2C0052;
	Sat, 17 Oct 2020 16:50:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15981C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F1A1387D2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQV+5WHp2uLc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:50:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2E33E87C6A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 16:50:24 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id n11so389814ota.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ypO4D+lCWHgDUozLpM6wT/YiqQy0Ek26O6Lt6jvs4bM=;
 b=Wy2kowaOKHqRe1fM39TY92/SC/bIqm6XUoAijQ4N4HpxQop/hwXkeXftYa85hYOs06
 bjHUC52DEjroU/sRiCnO5IfmKS73WCWommHfiX2lZAOTpWqn63najeVp/9EHjdvPhLTU
 tt0TP4USQi0j6zU+jFf/RKC6Anr7qRynHAPYZJzz72o5B4TiLKQkkxAh2EEXdjNxUmG6
 gUepFqpUjOENGHsr2tMnqCexPPBHKEy3MmakeYXn7dipzt99u3uJdhYhgj51ip6fenBz
 HI4dxN5GIt7GmKUP2is8imiQTsXI48W6gS58WFHr6EddcXeGp3HvC2SUcMm9l0m6qsUy
 5YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ypO4D+lCWHgDUozLpM6wT/YiqQy0Ek26O6Lt6jvs4bM=;
 b=dvpmkearEXR1Fbu2FmJ3/Ol98VCXlZK6isTDaOmKxZ3DbNhn4Ki+2ZKssE+UiHNjeq
 lH+Vi+n5zPs7ZEL0FXlCb/1d7BuTSJG+hVLj/yfwitxP8SpDQCIm5YWHy5XyfxzC2rW/
 bu6G1bDt33vzlvi4l2qJAQoWM9JnBhEoIkeQWeT2mCf0UQrBSJJAXfxQYO+2TaROMZ0x
 4va+GCPpX2VpD6YZivZF9Kg2AG6YRENBDHNWOivlQ/XRR/5aPZgNE2N2A0TURAmuW24e
 Gf9WMFp9Y2RlLz+AyrFcpBrW5XisMAthaZ5t4HSy8rizfKhobL8ExDXpX/nItXx2BDM9
 ULJw==
X-Gm-Message-State: AOAM531+tK3KiTmRd1a7SSIpDvIM+TfKRML0+JSKDbfpZRuGvmxq/Lz6
 XMtMj3ICYlRSVqdQ3RgGO2BVJw3A3sxKksr4G7M=
X-Google-Smtp-Source: ABdhPJxao0Izqts8K9liVx7YNWZE7FEAhAAztRVYAiPrMuLoATgBQQ3jYYgI5CP/k7vwrb4/7yLHqU0/HJtVDAB3uik=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr6385715oth.215.1602953423381; 
 Sat, 17 Oct 2020 09:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201017162732.152351-1-dwaipayanray1@gmail.com>
 <1ad9c5f49e10a192f0c6efb1116f3f0d31adce74.camel@perches.com>
In-Reply-To: <1ad9c5f49e10a192f0c6efb1116f3f0d31adce74.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 17 Oct 2020 22:19:56 +0530
Message-ID: <CABJPP5DuQ_Y0LLS5BzNXUWyxjzp9ts5kgEH-3+7Pn7PPjq0Ljg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new exception
	to repeated word check
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

On Sat, Oct 17, 2020 at 10:03 PM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2020-10-17 at 21:57 +0530, Dwaipayan Ray wrote:
> > Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> > moved the repeated word test to check for more file types. But after
> > this, if checkpatch.pl is run on MAINTAINERS, it generates several
> > new warnings of the type:
>
> NAK.
>
> Slow down and test before you send more patch versions.
>
> > +                             next if (index(" \t.,;?!", $end_char) == -1);
>
> what does this do?

Um, it checks if end_char is not present in " \t.,;?!".
If end_char doesn't belong to this list, then the check shall
skip. That is the test will skip for "word word:", but will produce
a warning for "word word." or "word word?", etc.

Shouldn't this itself be the case or am I perhaps going wrong
somewhere?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
