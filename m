Return-Path: <SRS0=/XFi=C3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8503DC43464
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 10:44:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F2421534
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 10:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hyv9iuO9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0F2421534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 82EE520404;
	Fri, 18 Sep 2020 10:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5MiZW5CNUfwK; Fri, 18 Sep 2020 10:44:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EE0D6203C9;
	Fri, 18 Sep 2020 10:44:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFAA5C0888;
	Fri, 18 Sep 2020 10:44:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DC5FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 76C3187313
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLDsWd_Erfq2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:44:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 428D586CA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 10:44:18 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id b12so5554509edz.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=o3lnvLq6c5qT5O/iFMXjdSN+Ft4SAIo7PI9daA3BiR4=;
 b=Hyv9iuO9grG+6A6L0JYCpauoSAzv503AbSJrtTXR1RU5jVe0/H6EEArzM3cUo2Foix
 ThtHErJAPAf1R/qSw27Jv7DPQa3u9Jl/FUwjOD8+Fx3DGdouo9mk0mFq/LLEw8Yi4QiL
 RRWMihE06MGL2iVDc5sIB0RBETBiSX6BWXCg15+FRDVfGr+qFwIlr8pFHBtjVIXWNeQ0
 frU07A5OaJQX8GEODKWk5KspEYaOkY04OuMt1rgtyXuFodIid7fgEYr8LgVUMrbObbmd
 fUhPLzCVTUz59S8dU0vWKktuKbFaAO9ICoebwbRORcPZOADoNmj5sqguS5GearYKM+ZN
 mFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=o3lnvLq6c5qT5O/iFMXjdSN+Ft4SAIo7PI9daA3BiR4=;
 b=ZEKEQe6pJ2xq+L3zfK/7g1i164mh2TIuaawSl0nmI9o9SrGxpjmYCHFllCISJvWunx
 rvIyYv9s3FZEWJolKIBI56We+kXMthzKhgcqvCTFE0XVZ7j0XuBiCaGuuQwRaZzC47f9
 fr17jtgxXvd7agBV43etTlM6s54mQ2Upww9NJTdOUz3Bw1wjQEv7Hrx5FUwj7AfzcWyu
 hq+rB2ypyfaDV4W6YqULznmilpe1Z41J87BiMQkqnx9wWZjDBXFh3TxYW6eWsY43TcjE
 E0WnkPtr1SnS0LMDzRMEC+NHdaU6jCIU8DBvq5eVI/766zacnuHh1Bl0Gys0YDgxZ2wH
 OfJw==
X-Gm-Message-State: AOAM530J0TdW7mBB+46VKzSHSrfC/w/PAQl0GUHWSzJV3uycy7mlHrsw
 xjuJtSSj2uzAPbzugc3u3A0=
X-Google-Smtp-Source: ABdhPJxdKM3yjxIN2Kz/Qkb9g8wCTIIb3C5kknyJtdR2GNoRysRx7j6nkVdvnfFWthy6gSMtukqGjg==
X-Received: by 2002:a50:fb0e:: with SMTP id d14mr39263854edq.172.1600425856609; 
 Fri, 18 Sep 2020 03:44:16 -0700 (PDT)
Received: from felia ([2001:16b8:2ddd:a500:ec98:e0c0:d9aa:534d])
 by smtp.gmail.com with ESMTPSA id n20sm1986686ejs.14.2020.09.18.03.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 03:44:15 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Fri, 18 Sep 2020 12:44:14 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009181238230.14717@felia>
References: <alpine.DEB.2.21.2009181157160.14717@felia>
 <CABJPP5DGpep-S5F+J=dxdhBBDp2J9wQBrJvH_Ys6uJDj3AfRRA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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



On Fri, 18 Sep 2020, Dwaipayan Ray wrote:

> On Fri, Sep 18, 2020 at 3:36 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Hi Dwaipayan, hi others,
> >
> > I had a quick look on the NO AUTHOR SIGN OFF issues reported by
> > checkpatch.pl on v5.4..v5.8 on my own small script.
> >
> > After collecting all the data in a tsv (no details on that tsv here):
> >
> > $ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv | wc -l
> > 1064
> >
> > $ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv  | cut -f 7 | sort  | uniq -c |
> > sort -nr | head -n 8
> >     175 Missing Signed-off-by: line by nominal patch author 'Daniel Vetter <daniel.vetter@ffwll.ch>'
> >     116 Missing Signed-off-by: line by nominal patch author ''
> >      68 Missing Signed-off-by: line by nominal patch author 'Trond Myklebust <trondmy@gmail.com>'
> >      43 Missing Signed-off-by: line by nominal patch author 'Thinh Nguyen <Thinh.Nguyen@synopsys.com>'
> >      40 Missing Signed-off-by: line by nominal patch author 'Pascal van Leeuwen <pascalvanl@gmail.com>'
> >      36 Missing Signed-off-by: line by nominal patch author 'Alex Maftei <amaftei@solarflare.com>'
> >      31 Missing Signed-off-by: line by nominal patch author 'Valdis Kletnieks <valdis.kletnieks@vt.edu>'
> >      24 Missing Signed-off-by: line by nominal patch author 'Luke Nelson <lukenels@cs.washington.edu>'
> >
> >
> > Here a quick look at the first two:
> >
> >     175 Missing Signed-off-by: line by nominal patch author 'Daniel Vetter
> > <daniel.vetter@ffwll.ch>'
> >
> > $ grep "NO_AUTHOR_SIGN_OFF" v5.4..v5.8.tsv | grep "Daniel Vetter" \
> >   | cut -f 1 > commits-NO_AUTHOR_SIGN_OFF-Daniel-Vetter
> > $ cat commits-NO_AUTHOR_SIGN_OFF-Daniel-Vetter | \
> >   xargs git show  --format="%b" -s | \
> >   grep "Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>" | \
> >   wc -l
> >
> > So all 175 commits are of the type:
> >
> > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ...
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >
> >
> > and the second:
> >
> >     116 Missing Signed-off-by: line by nominal patch author ''
> >
> > That is probably due to not parsing the patch author with a line break.
> >
> >
> > So, if we can find a solution for Daniel Vetter (of course, not
> > hard-coding it in checkpatch.pl), e.g., by adding a .mailmap entry for him
> > and making use of that in checkpatch.pl,
> >
> > ... and for the encoding problem, then we got around 27% of the
> > NO_AUTHOR_SIGN_OFF 'problems' solved. Next, we can continue to look at the
> > next few remaining ones. The longer tail of warnings are clearly warnings
> > that deserve to be pointed out to newbies with a broken setup.
> >
> > I hope you can continue to work on a solution for this class.
> >
> >
> > Thanks for your initial investigation,
> >
> > Lukas
> 
> Hi,
> I think I have figured out how to fix the authors with a line break.
> The checkpatch script keeps a track of the previous line in a variable
> $prevline. I can use it to fix the author's initial signature. I will
> send you a patch on this when it's done.
>

Okay, let us start to have this first patch correct and accepted by Joe 
Perches.
 
> And for Daniel Vetter's issue, it will be a bit more complex i think
> as checkpatch
> seems to check both author's name and author's email by parsing two
> strings.
>

When the first patch is accepted, let us discuss with Joe the best 
solution for this case.

> At revision 10b82d5176488acee2820e5a2cf0f2ec5c3488b6,
> scripts/checkpatch.pl,
> 
> 
> line 2673:
> if ($author ne '') {
> if (same_email_addresses($1, $author)) {
> $authorsignoff = 1;
> }
> }
> 
> line 1213:
> sub same_email_addresses {
> my ($email1, $email2) = @_;
> 
> my ($email1_name, $name1_comment, $email1_address, $comment1)
>  = parse_email($email1);
> my ($email2_name, $name2_comment, $email2_address, $comment2)
>  = parse_email($email2);
> 
> return $email1_name eq $email2_name &&
> $email1_address eq $email2_address;
> }
> 
> The easiest way at this point will be to modify same_email_address
> subroutine and add checks for other email addresses belonging to
> the same author by loading .mailmap.
> But will this make the subroutine heavy?
>

Yes, it is becoming heavier... but maybe still as performant as before if 
done right.

You could always run a quick fast path check and only if you cannot find 
the sign-off, you do a slow path, loading .mailmap and checking.

By the way, there is already the function read_mailmap in 
./scripts/get_maintainers.pl, so we would not need to implement that, just 
find a good way for both scripts to share this implementation. 

But let us do the first patch and then discuss with Joe.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
