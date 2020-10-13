Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524A6C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:20:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB33208D5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O63rkK8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CB33208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6AFA7868D9;
	Tue, 13 Oct 2020 06:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MriRNtISolEJ; Tue, 13 Oct 2020 06:20:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B84F786E49;
	Tue, 13 Oct 2020 06:20:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9643EC0052;
	Tue, 13 Oct 2020 06:20:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA575C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B6A172740C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlH4WWtcuyzJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:20:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 by silver.osuosl.org (Postfix) with ESMTPS id EE50527404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:20:29 +0000 (UTC)
Received: by mail-oo1-f65.google.com with SMTP id c25so3950199ooe.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 23:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lo42A+t0+r/OWxwINtxuRZezshNopBeP8XKQ/zp9n3M=;
 b=O63rkK8EW2XSUAzVXRUNZRU2TnNJu5qtnWP50zR7/Xiblv9xvTFA03duUty3NZaO6J
 NCDFnRh1Oz8/FhSYcCryxK6k5GFhJyvT+YE35slF7XYKesD+guK/SlPqdLgkssCE7Ssb
 0Cc1TFzzdddVfwzJUkweqwqd+udlwqb4d1GE+bFmgbeLZHKQroAFsuO81pNL9JC8yJ+I
 nHJ46bJwZ89pGrIZ4n1nzwbC2aZjb+kqjb097reIj4zJQz0z+mzvvlXzkMjC2+OwozdS
 cObt03fGWlwepIzlFZzzFkPs6hOYH+94F6AOClHFQwyIcN2qNNc26nfqSpPAz+dO4kJq
 4fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lo42A+t0+r/OWxwINtxuRZezshNopBeP8XKQ/zp9n3M=;
 b=qT2oSPlOpyljhgw0pBDLgmkvhcaquuuzRcc0lmjBXwucVGCpQDCkXCHD3mO//xmOrS
 ExiyebYPuBu5HfKlKvcx1TfReVOn2SVWpfukzm+XGXumrXtRE34d9q0QqtsMvOme3UjS
 S+UInJw7XF48AIVUR3NGHttcTuYEzS7g+6ELDRUvl0boH8JM+K05QO9d7Gj+Qn1hG2cR
 aNZ4Fue7JncU/9dwJEwAsjemrnSdyNh52ugNUP0lb6Trt+OidTy7GhvPzMoBM3Pb7fdt
 ueaLCd/3yFIgs/FAZlnYGqVIL6eSwHPf9lhXvyiSrRxT5ngPSejJbiTaGgHYGLUpwfVR
 4VJw==
X-Gm-Message-State: AOAM532sF3EMhZ9QtELXxjG5LGtUgs+E2ZzZuEGRSm304B1qEmAjbKSM
 uUs8Zw32+CV+xBwc3hIhIIZ+FQmMyzzC1pesZc0=
X-Google-Smtp-Source: ABdhPJyM+Kns4uxj21FWd200cyifD/niPnz7/7a8y6PeQC5yj3FDW3ZOmfju0ZQmTdQrwQ4VKvWQG09vlpCLyYl5wPg=
X-Received: by 2002:a4a:c68d:: with SMTP id m13mr2204483ooq.64.1602570028971; 
 Mon, 12 Oct 2020 23:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201013060714.33713-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010130811050.14590@felia>
In-Reply-To: <alpine.DEB.2.21.2010130811050.14590@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 13 Oct 2020 11:50:03 +0530
Message-ID: <CABJPP5Ay1KHXYUzo1gkMrP9vmhX81g12L3ZQmPrec2ydujYxog@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
	whitespace in formatted email
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

On Tue, Oct 13, 2020 at 11:46 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Tue, 13 Oct 2020, Dwaipayan Ray wrote:
>
> > Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
> > checks.") introduced new checks for author sign off. The format_email
> > procedure was modified to add comment blocks to the formatted email. But
> > no space was added between the email address and mail comment.
> >
> > This causes wrong email formatting in cases where the email is in the form
> > "author@example.com (Comment block)". The space between the address and
> > comment block is removed, which causes incorrect parsing of the
> > formatted email.
> >
> > An evaluation on checkpatch brought up this case. For example,
> > on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
> > the following warning was reported:
> >
> > WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
> > system concerns)' might be better as 'David.Laight@aculab.com(big endian
> > system concerns)'
> >
> > Add a single space in between the address and comment when the
> > extracted comment is not empty.
> >
>
> Dwaipayan, looks good to me.
>
> So, how about a 'Fixes:' tag?
>
> Aditya, can you rerun your evaluation with this fix patch applied on top?
>
> Then, we need a comparison for:
> 1. completely before vs. after the two patches, and
> 2. after the first patch vs. after the two patches (to see that the fix
> works)
>
> More support on evaluation from others interested to become mentees are of
> course welcome.
>
> Lukas

Sure I will add the tag.
Do I send it to LKML after this or after more evaluation?
I did run on some of the newly generated bad sign off warnings and
they seem to be fixed.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
