Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3864C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 14:29:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF16A24171
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 14:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfQLOSr9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF16A24171
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 68B5485F7D;
	Thu, 22 Oct 2020 14:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFvoA8v2wLSi; Thu, 22 Oct 2020 14:29:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E0F4585F79;
	Thu, 22 Oct 2020 14:29:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B904EC0052;
	Thu, 22 Oct 2020 14:29:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7500AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6448E877A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quSik6odmEB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:29:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9F4618779E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:29:50 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n15so1641868otl.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 07:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B7FqKHFfS49zxyu+pUH1xYjvE7WmswgfS/eG68iZMow=;
 b=KfQLOSr9hR/2q/1IT5Z227xatMBJMVQxPKI+Id56RVCAn7RhVSJCoG5Pw5m9mIG7Tr
 tYEqO7S2uJ7uJghDKKpPZdaAYX0NmerGX0ODiCJo6VvyO9V7YBwOZvqg/BccWYeJNZPn
 F673KvHOZZKtx6VvfXXXrW+HY8SE2d2xlG2V80FBRQgWq/zIyLI7SzGJloV5nNyov5ES
 581GnTvuy5udfYOkkQp9qFOgMU0uyKjUafrw0VTBhtvv2JyaANO52KqCyMblgnBHKP8M
 bgi4B2zHv2c71Evaw3VTQJhDit3rlvC3dM5ZIQsjjd9beMSGMuPXyLEnCEXoAmTjDkN7
 LV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B7FqKHFfS49zxyu+pUH1xYjvE7WmswgfS/eG68iZMow=;
 b=e+Fwg8txA+R/9gUr+GX1vbFOE8XDIRRpkQAZIO0HZkYQESXUWHJtUA96KgVuUwSA1U
 si+zntfeZBaMfpdYxiLyrVlV+6QBieHigM3d1zOSYvfc9W+kAPPmoY7ZGaNj2bZjmm/k
 5OjFZorYAurZmYvE4O1Xgin2p5sko8eEyvSEjnUK+75OvcjiVCZEtnM0+apvl1FBLFfT
 MXNzr70cCtsuegKODiBvHB3IRBWC7xrSp7zjgtXjuJzk4iuaj+WmiiyUxOVTFa0P1fzI
 3o9e7iyX7uZbup25/uTjVy9UXpA/a95pAVFbBP3bWNDtOujDk3TIAsVnr5SMupMrbcY0
 zkWg==
X-Gm-Message-State: AOAM531zU0s1KZMia8YMDuxWCGeHVnWpdTQp5bcNEEytDt7ldxmkCBAz
 /Z5e4366f6Tf7w8LjVAclrUuaEjMDOqEDkhrAjU=
X-Google-Smtp-Source: ABdhPJyDLjSUWMnUIx1g9TLdFY2yJNOlGgaIzzg6p9t0gKkAP6s5hrEK7TkOZkxsA3w2Ruc+hgf+yPNx1MW9dNfWugA=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr1941944oth.215.1603376989609; 
 Thu, 22 Oct 2020 07:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201022124741.620334-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010221614570.5261@felia>
In-Reply-To: <alpine.DEB.2.21.2010221614570.5261@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 22 Oct 2020 19:59:20 +0530
Message-ID: <CABJPP5DawTPVpxOxKex9ZMuXdUxoojH7gcapz+zA5+-mw=wojA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: extend
	attributes check to handle more patterns
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

On Thu, Oct 22, 2020 at 7:50 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Thu, 22 Oct 2020, Dwaipayan Ray wrote:
>
> > It is generally preferred that the macros from
> > include/linux/compiler_attributes.h are used, unless there
> > is a reason not to.
> >
>
> Did you checkpatch this patch?
>
> I always thought checkpatch warns to use ./include/...
> as path when somebody just use include/... in a commit message.
>
Yes, I did check it once again. I get no warnings even with
--strict.
>
> > Checkpatch currently checks __attribute__ for each of
> > packed, aligned, printf, scanf, and weak. Other declarations
> > in compiler_attributes.h are not handled.
> >
> > Add more definitions to the attribute check.
> > The following patterns are added:
> >
> > __alias__(#symbol)
> > __always_inline__
> > __assume_aligned__(a, ## __VA_ARGS__)
> > __cold__
> > __const__
> > __copy__(symbol)
> > __designated_init__
> > __externally_visible__
> > __gnu_inline__
> > __malloc__
> > __mode__(x)
> > __no_caller_saved_registers__
> > __noclone__
> > __fallthrough__
> > __noinline__
> > __nonstring__
> > __noreturn__
> > __pure__
> > __unused__
> > __used__
> >
> > Link: https://lore.kernel.org/linux-kernel-mentees/3ec15b41754b01666d94b76ce51b9832c2dd577a.camel@perches.com/
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
>
>
> I guess you could add suggested-by.
>
> I am wondering if this could be refactored into a shared function and if
> all different warning messages each deserve to be an own type.
>
> But send it out as-is to Joe and the list and we continue the discussion
> there.

I was a bit sceptical myself as the code size for this is
too big. Function will probably help but then I think
parameterized/non parameterized types needs to be
differentiated.

But sure, I will send it to Joe with the comments about
refactoring.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
