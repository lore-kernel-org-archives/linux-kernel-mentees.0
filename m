Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B995CC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:11:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B0F206F1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dz9QDLgW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08B0F206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6EF4987057;
	Tue, 17 Nov 2020 09:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNErT0kpjY0G; Tue, 17 Nov 2020 09:11:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F2CC870E7;
	Tue, 17 Nov 2020 09:11:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED1BFC0800;
	Tue, 17 Nov 2020 09:11:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D3D7C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 64DEF85CF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INHoVVLAthLx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:11:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C134D857E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:11:43 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s13so2494568wmh.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 01:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3hVscu+k6SSlE6i48YcuKo8tf7iXZk9fy8/VVkw6rQg=;
 b=dz9QDLgWd2CYd2MkYJ8hj2meZKbzh+fMslZKSXuHGMDlWg4k9ISAxOKuXEjsPMThPv
 aUU8fGM5SvuDNaG0EEG9lNmOmeLklIx1l2kVrgG8JelnuzULPHvrLqL+YCKMwkT3bbL7
 psXs+PWKxMYdCqLHkZL1fzyOtQQgA27lNBmQ1pfvgn4VDcHKslQYU2d/6K9sAXEqnp6r
 bb2FVcvJjhhU2fDUZSBVynIpHCcii6CBnH4iPa06rRlzeuJIWVQG1ohbeaaOMGTFTWZG
 463tOJ/cuwz7pl1Ri0K+/t5GLyzujMNXNyCKd5113R6hcJAeHSihM0wmK8XLPjQhOiTi
 CGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3hVscu+k6SSlE6i48YcuKo8tf7iXZk9fy8/VVkw6rQg=;
 b=Myk9YGCePw9lJX/xPuiBPhkNunzvkbiTS+149VmACRAPthYdvtXqEslBGSvyAFzQ02
 zQH0tcMxDbNcrm/Ngt25lmUsLvTomMMb32MCcC0VPdBIB7/qSM7nomsam8KQJDo/ZniN
 EoTgoGn7vB7shL+PafHvTbOYOqJL5opJWGHbKexNBOuY2WjSQxoaVHYfFy4eiqlNM+p+
 cD4vI7PMUls/el9UilViHx1MwjaHo9/A13vj6fZYIsu16hB4YMaGNj7OFsZu6iFL5Dn4
 MgMzNUpKrXXHDgHWcY1x7VnrFetW8RRsQ92buusSvm1CUU++/NcuaqhNPgRt7cCe2f8c
 dOrA==
X-Gm-Message-State: AOAM533CKP7YjYA36uQD/4tLlOJIpPy+yDRthdhB7PjoRpTEO/nc4CBm
 tbWSAk+XNojU1VHfXukWIROhfZBQ1pWJOkr0aVAYIeBuQMVcog==
X-Google-Smtp-Source: ABdhPJwKhkggnQu0162VA/QmpwrqnU3m1V66zc0PY/P8qlH7ZlhWyR733GSIt7p34rNpJa1mijQdeHI9Tra8ijSuCgk=
X-Received: by 2002:a1c:9695:: with SMTP id y143mr3215587wmd.70.1605604299589; 
 Tue, 17 Nov 2020 01:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20201117085553.52583-1-dwaipayanray1@gmail.com>
 <CAKXUXMzM8AYPWkCKXnTRQG-a03Jh+HDCF=pGAjEsg9ah0odG2A@mail.gmail.com>
In-Reply-To: <CAKXUXMzM8AYPWkCKXnTRQG-a03Jh+HDCF=pGAjEsg9ah0odG2A@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 17 Nov 2020 14:41:08 +0530
Message-ID: <CABJPP5AF2W+KEsKrQOeL9g1TpcCfsfOfRRmVygEQypdcYsZiXg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	OPEN_BRACE issues
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

On Tue, Nov 17, 2020 at 2:32 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Tue, Nov 17, 2020 at 9:56 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Brace style misuses of the following types are now
> > corrected:
> >
> > int foo(int bar,
> >         int baz) { bar++;
> >     return bar + baz;
> > }
> >
> > int foo(int bar,
> >         int baz) {
> >     return bar + baz;
> > }
> >
> > if (bar &&
> >     baz)
> > {   bar++;
> >     baz++;
> > }
> >
> > if (bar &&
> >     baz)
> > {
> >     bar++;
> >     baz++;
> > }
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>
> Looks good to me. How did you test this? Did you run on a couple of
> files in the kernel repository?
>

I have only run on some test cases I made, which also included the
style misuses above. Finding files in the kernel for this exact check
might take a bit work. Should I do that? I think these custom examples
pretty much handles all the cases.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
