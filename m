Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C651C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 11:11:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D249D20725
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 11:11:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJo/hHf/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D249D20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A99EB22D33;
	Wed, 23 Sep 2020 11:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iEvua039jS2x; Wed, 23 Sep 2020 11:11:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9E0FA203D3;
	Wed, 23 Sep 2020 11:11:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86A82C0889;
	Wed, 23 Sep 2020 11:11:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3524C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 11:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C7C298688B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 11:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W+aLsrQKzsC5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 11:11:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3466586870
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 11:11:25 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id q21so18565163ota.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c0m7DEcCJwaAyhhuRDnQVJROGf2invaFPIy62zwUJV0=;
 b=dJo/hHf/GCcrwQCfMIb9HBmBWiaoXvD/hxqVkTJyJs/AMkcZKXGuxBTcsCu+ZwHeoR
 sOldjyAKUR6kdEtNfr3SUWPgHKvM+ZSeg67knpwmp7TzT38pNTjmcQD4MyTN/dwnz/Kb
 pVLIAJmUbft4JRP2eFTrwId6dkd/PbtuYx6V6MBZAj/yo35bah2OSNL0wtz5Zz2Tde80
 iATmEZ4hQLKFDDAP0nkXo4dRR3w8PTL3e3bz93rdXpkPPgWBbRzSRJsxJNvexzmAR9cS
 0CkfKa+Bua7fIMCD2hNBhYJTQbrACgRp3rbljrM8q9CccyZAQBJQzLynIpKwh0OhqLYe
 MrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c0m7DEcCJwaAyhhuRDnQVJROGf2invaFPIy62zwUJV0=;
 b=R/+Q5GSX0j0yV3AmXzG+Whsup2JxD34is7j3Nlh9Ltx2qbANwo5Vaud3+CS7c07Z1H
 R9tJRGiQuaEJ1Qv1Tf98wuTHVUmyzHIfAkyzr7GAPzHTFq8AZYzb3oHxf2VmJOaGmiWI
 T6TiY3W7qKLOXxfbyD73guGonnn9wRqF0TUjO72e+J6BjoMO+zU684Z58OCqHy6K7GLI
 ZYjF0+5F2jw6AlNu0JdDM5/X/jqPWHWBEB86Fkq/Ch3AhqN6JQfA7cmcrjTxZb09shYD
 wqcoYaptH2QnkuqkD0j8yETLI3Jar8H2dVuBpvGDe9hDf6MUgFWyBcZfRguYiqfze+BG
 0N7g==
X-Gm-Message-State: AOAM53000PPWhMedCLFF9or5D/xNVegRhHB4XPSTNiaWQmjGwkr5SiR1
 1pDstvAezh+gC4aIerbVHbEkM5dxrRn6MOadHsc=
X-Google-Smtp-Source: ABdhPJxLiUKqCcane/ajS3ssso/8GUAckAn5jlK3U+uPpmTns3ddzYw2dWaxi/YaKkw45wLr7b/DgIo/z/+JV1qLCHQ=
X-Received: by 2002:a05:6830:c4:: with SMTP id x4mr6101002oto.30.1600859484252; 
 Wed, 23 Sep 2020 04:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200923100213.83901-1-dwaipayanray1@gmail.com>
 <338209a79fdd0b3f30d020825a5dafa98dd49ee8.camel@perches.com>
In-Reply-To: <338209a79fdd0b3f30d020825a5dafa98dd49ee8.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 23 Sep 2020 16:41:05 +0530
Message-ID: <CABJPP5BgYXk2DFDtPjj1Ma=oXMsmWQPQje7=Zb-y5Ubvh8fZgw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: extend
 same_email_address check to load mailmap entries
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

> .mailmap entries are used when a person no longer has
> access to a particular email and a mapping is created to
> allow these old/invalid email addresses to be converted
> to a current/valid email address.
>
> The idea here is that a person may have a .gitconfig or
> equivalent that still uses an old/invalid email address
> but uses a Signed-off-by: for a current/valid one, so
> a warning _should_ be emitted for this case.
>
> At least for checkpatch, mismatches in email addresses
> should not be papered over by assuming equivalence between
> multiple email addresses.
>
> So this should be a separate test and not used in a function
> named
> "same_email_address".  These are specifically _not_
> the same email
> addresses.
>
>

Hi,
Thanks for the clarification.

So instead of eliminating the warning completely will it be a
better alternative to display a more descriptive warning
on the lines of:

  "WARNING: NO_AUTHOR_SIGN_OFF:
   invalid/obsolete email address used in signoff by
   author $author"

Or is it better to ignore the mailmap extension in checkpatch
and just display warnings for either mismatch in name/
mismatch in email.

Like, you had mentioned one in:
https://lore.kernel.org/linux-kernel-mentees/
7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com/

In that case, same name, but different mail address was
reported as a different warning.

So, I believe two cases can be handled better:
1) Same name, different email
2) Same email, different name

For case 2, it might also be possible to ignore the warning
completely.

What do you think is better?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
