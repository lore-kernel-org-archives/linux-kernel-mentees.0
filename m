Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DC4C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 16:43:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D179217A0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 16:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvU8ZLhe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D179217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E266784F76;
	Mon,  7 Sep 2020 16:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHn6ptzOBxEP; Mon,  7 Sep 2020 16:43:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03DB684E88;
	Mon,  7 Sep 2020 16:43:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF337C0052;
	Mon,  7 Sep 2020 16:43:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10A2EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 16:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EDB18870D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 16:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQuzn425hQrc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 16:43:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1CDFF870BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 16:43:32 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t16so12918141ilf.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Sep 2020 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TSkwP4Ipdk8JyD4dT+/Y0/gHV/cBrU9SwIhGEmDPldo=;
 b=BvU8ZLheHDVtPmavbo6+NRV9qy09BCq3w0ULhOxfwM/X0SWVhBPQweYSfU2FyPuNgD
 jyogD1VyTCkeXVLMohHsalgmemSPuia0Kzs2xzC+dzR61k/ItLZgLSFRlOEKVxojjFpv
 bbFRH3UG7ARZLpzjG1GL0MChxEb1N/MA39nrG+14iwCfOB9J5wulaqHxIlYNBj3q7rw9
 3Sbiqbdaq1Yq+Q2qgZcuBayTM+YO9cYot6PX6GHn4/a934Ifi4toG9IzChz3PiCe6HtM
 N4uvYjP6BKBXxGFqb+xcLw4bgvEifgSdWRt4vTJtrcF7Wzttqpwt3UY62lFuqfC15+Zh
 AWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TSkwP4Ipdk8JyD4dT+/Y0/gHV/cBrU9SwIhGEmDPldo=;
 b=KN5QBRiv2UOc+W/BgTEeHwlWLAPnT6ArQCECNmflnuKy2slsvKlSlhI5+fbxsg+t6j
 vyCmXjb2E1btl7RC+shDtE5nVDuFYKxDH5tdpb0AblKE6YPYDHI4oMo0p91y5j+KSaG1
 POKLmAkUnkCWY9ltNljVon0sHnMtW25YCl+ZekjYZCK33rp2hvLlYctd+L4nqUZZ95hA
 3z/Yh9VHyeJf2efdZZaLUJU6YSlUDhf+nijv7cSS/Yfhix5uQD/7ZEEYt3/yifLjOmJf
 h9hrptA76/PlFnr7N3o0LUu/KpR3tpwD7Yd4nNP3fwtPBeLDtYkVZKfL1eqQzFrOEkKr
 DHrw==
X-Gm-Message-State: AOAM533WBOIwK5qIQ0TaLag6EDA3tjhicNhRWxl/Bevt0M9ShwKcecZ6
 l78aU1nVh8BgDvOLk8p3iqy+LzG/6hOUPEprYGw=
X-Google-Smtp-Source: ABdhPJwoSuP93/H09vfVT5GoqtobOzZsbUzEhg6/jYO+egS+zzZEd4IVi0N8uNBUAnIYAC/fbWusYlCohy2olPWeM/8=
X-Received: by 2002:a92:ae06:: with SMTP id s6mr18464761ilh.64.1599497011409; 
 Mon, 07 Sep 2020 09:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2008270707440.9436@felia>
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
In-Reply-To: <8802360392ba3dd9ded3999c3f57560b@disroot.org>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 7 Sep 2020 18:43:19 +0200
Message-ID: <CAKXUXMxBxyQ9KM1d92d0vGuaGRLe6+aVHa3s_O=E-YTq_jLPJA@mail.gmail.com>
To: Ayush <ayush@disroot.org>
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

On Mon, Sep 7, 2020 at 4:28 PM Ayush <ayush@disroot.org> wrote:
>
> September 7, 2020 1:09 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
>
> > I think you should extend this whole check to work properly with line
> > breaks. You can see how this is implemented currently in checkpatch.pl
> > just a few lines above, right?
>
> I have written the conditions for handling line breaks.
>
> I will be sending the patch to the mailing list after this mail.
>
> > Can you provide a full list of checkpatch.pl findings in v5.4..v5.8
> > where all the different commit 1234567890ab ("Revert "..."") variants
> > in the commit message appear?
> >
> > Then, we can use those commits directly as test cases for your extension?
>
> Actually, I have made a list for some of the similar commits which are correct but
> checkpatch.pl will give GIT_COMMIT_ID error on them. I have tested my patch with 30+ commits.
>
> Here is the list of commits:
>
> https://gist.githubusercontent.com/eldraco19/f78e637ead0e47e1bb187f83a391a904/raw/1ee853ab1b7db86d663f6537b7c43e284e30dad2/commits.txt
>
> Some doubts I still have:
> - commit
> 1234567890ab ("Revert "foo bar"")
>
> is not allowed as per the rules, right?
>

No, that is allowed. There can be of course a line break after commit
and before the hash, it is just that the current checkpatch.pl script
does not handle this case yet.

That would need improvement.

> - if the commit mentioned has double-quotes like:
> commit 1234567890ab ("Revert "foo "lorem ipsum" bar"")
>
> example: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.8.y&id=9d7c249a1ef9bf0d5696df14e6bc067004f16979
>
> For now, checkpatch.pl is giving an error in such cases too. But there can be `n` cases like these, we
> can have so many quotes nested, so I think it's better to avoid this pattern, please give your opinions on this.
>

I do not think that it is disallowed, but maybe a new check in
checkpatch.pl is recommended to make aware that quotes in commit
message subject lines cannot be properly handled and are discouraged.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
