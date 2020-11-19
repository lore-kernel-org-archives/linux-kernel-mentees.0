Return-Path: <SRS0=/60u=EZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A2BC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 08:30:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50AEF24655
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 08:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in4AxJJs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50AEF24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C17F286895;
	Thu, 19 Nov 2020 08:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZ_yoSFJDk75; Thu, 19 Nov 2020 08:30:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13E2486896;
	Thu, 19 Nov 2020 08:30:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2E50C1825;
	Thu, 19 Nov 2020 08:30:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05F17C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E959A86BA4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMNQuR98G15B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:30:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3F674864D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 08:30:00 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id z14so4547404ilp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 00:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hx7cTR+vEmu1Hy31NMSvlbDgZyCy/JH0pFaYfkG2OxE=;
 b=in4AxJJss8IXGEHfUB5+AgmrpawBw2mlZR0As5fE/HXTiIL0Otqt2bKeNKodslQJ/4
 ypPblxaY9Zt6FiCivUZco8A/IHcY28Z2ZnRArw0ZQrcHznUdO67MawlbEzp9WNVI2z+d
 ONHB5U2luQ2k+5ll3Oub/4e+brUpi9iFc3kKSLVYNvq4ColGj88fd7JaDuIEtJ8bhiV6
 ZZBwU4helVbjZm5E1YAaumCcZ6oUtgdaniYu1xqD97Fi3CT9UHiuwk4Oy4+Y6vjNgjfz
 gSXPr+MKjGtatHV7RpfdtWMeBNe9wzlcM9xUep2o/XZMg4Cwwiq/mIXXELVJ769KaYdR
 zSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hx7cTR+vEmu1Hy31NMSvlbDgZyCy/JH0pFaYfkG2OxE=;
 b=K8/eQOWSuP6NW7krB298TP0PHdQ61R7oqEzDQ4VVK4Z2j4xTEdBj2QRVSji8CtZZdN
 3xCyHJ656090pFGOJtG9e20bikBGIQ5Rre/Nx1S+awPJtbxJk5jBEkvI95L763TIV79k
 qbaM8tS1a9MycVDTjmLbsbTUCnmDH2JwlsgdqU7MCt3AsiZEsP3dPQ/sr1qXHqCu+3b9
 GPDaP/xTEXSOZXPWzfOGJnEIDCRehQGaMBTgGtqCZ1IudUXeMCvQOgKZHn1VwYKeZQe6
 is6qqiqKNs9AdktWUCo3qbg8WB4Xc5B71vnEXSae6eeGm2KRdVfJaOW7v7MSh+w0O6E6
 HIig==
X-Gm-Message-State: AOAM5332mW02qklXy0pbl4SCH/3WjEYlBSWVWzvuxbGLeBgZiSmdlUdw
 A6BtbLrsD8z/AhfkHuEIPaGOfkFWNldt8gKVkxo=
X-Google-Smtp-Source: ABdhPJwrt7tQCoK2FcEABvcMYS3WUSeqNsHL7UKCgudvghbynUbAZkPQKubnuh81ElmzqzoKDESKpVtZXEFIgV5Migs=
X-Received: by 2002:a92:2c06:: with SMTP id t6mr20434693ile.125.1605774599563; 
 Thu, 19 Nov 2020 00:29:59 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMxNZ+PzdXHxYcYa4Yv2PO9oEx6Ob8LECc+hFzN5H_-HJQ@mail.gmail.com>
 <cf279eb568e02c0d56feddeab535e731f48c4691.camel@perches.com>
In-Reply-To: <cf279eb568e02c0d56feddeab535e731f48c4691.camel@perches.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 19 Nov 2020 09:29:48 +0100
Message-ID: <CAKXUXMyf4OodjYTDZz2mg4kG5cPp9T2wirRHXiuZ86uxnxNt0A@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] Potential new task: a new self-test in
	get-maintainers.pl
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

On Thu, Nov 19, 2020 at 9:10 AM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-11-19 at 08:38 +0100, Lukas Bulwahn wrote:
> > Hi Aditya, Hi Dwaipayan,
> >
> > here another potential task for some perl work:
> >
> > Implement a new self-test in get-maintainers.pl that checks if a file
> > entry line is already covered by the others provided, i.e., all files
> > matching to one file entry line is already matched by all the other
> > file entry lines of the same section.
> >
> > Here is a quick example where I did something wrong of that kind:
> > https://lore.kernel.org/netfilter-devel/20201109091942.32280-1-lukas.bulwahn@gmail.com/
> >
> > This needs a bit of reading and understanding the MAINTAINERS file and
> > what get_maintainers.pl does with those entries. get-maintainers.pl
> > already implements some self-test checks and you can add this check
> > above to the existing ones.
>
> I think that's a pretty trivial defect.  Overlaps aren't fatal.
>

Thanks, I agree it is not fatal, it is just nice if we can keep
MAINTAINERS clean.

> Renames and moves are pretty common though and the maintainers
> F: and X: patterns aren't always correct/current.
>
> Perhaps more useful would be a new script that tracks all the various
> commit file moves/renames and maps those to the MAINTAINERS sections
> so that the moved/renamed file patterns in MAINTAINERS are updated.
>

I agree. I could imagine a patch warning mode (either in a separate
script or in checkpatch.pl) that warns authors with something like:

"
The file renamings in this patch change the corresponding sections of
those files:

file1: XYZ DRIVER -> USB SUBSYSTEM
file2: UVW DRIVER -> THE REST

Is this intended?
The following diff will adjust the MAINTAINERS to keep the section
assignments as-is:
...
"

Especially when files move from some section to THE REST, it is
probably unintended.

> That's rather out-of-scope for both get_maintainer.pl and checkpatch.pl
>
> A trivial script I wrote and used a couple years ago is attached.
>
> https://lore.kernel.org/lkml/da894e81adc28ac98d9c399d24d8eb075b30fd1a.camel@perches.com/
>

Thanks for the pointer. I think that is a good starting point for
adding more checks of this kind and hopefully, we can somehow wire
those up either in checkpatch.pl or some other checking scripts that
are regularly executed.

> Done using -next with an empty patterns directory
>
> $ perl ./scripts/get_maintainer.pl --self-test=patterns | \
>   cut -f2 -d: | \
>   while read line ; do \
>     perl ./dump_section.perl $line \
>   done
>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
