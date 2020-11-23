Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762C3C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 13:18:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD60F2100A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 13:18:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed4xEW8o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD60F2100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6FDC085608;
	Mon, 23 Nov 2020 13:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2E883kD9JI4R; Mon, 23 Nov 2020 13:18:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0274585535;
	Mon, 23 Nov 2020 13:18:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD9D9C0891;
	Mon, 23 Nov 2020 13:18:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62C60C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 556E220498
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6UwGCCJcd0tg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by silver.osuosl.org (Postfix) with ESMTPS id CB2F12048A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:18:51 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id j10so5500646lja.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 05:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3EGpgjNhRwkWlAufacpHgszcY/WMn2g4dmHjhLBV6e4=;
 b=ed4xEW8o2E+XKyYu2ZSQYP/QWV7WU3GDZFtrbayS/DHjNwO3muxC6aH5Av3f59tjHP
 eOrSodwolIlkketL/aaJbvM748wgE9wj/P20dHBtDnY7r7xFPx3FswG6UqPTJrqmgFzo
 xtSvb8nC7zyVN8RJSlzgdTKPZw65wdtRoaqQifbZWnG3d7xbd5MH8m0+kgNup3g0SUpg
 HukCWggzp7E9b4vtVC3ukS8sAlXzCmOqcqZ7liSRhHSIhrdAmTK6LgsKSVaq9k8dGDyT
 I9TNjGMWSbb5RsJBN9sPDiYOCNlUgASJgq4vF6Y/rvq5e1JbxoWPTmxOw2aFwHyqIh6I
 HPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3EGpgjNhRwkWlAufacpHgszcY/WMn2g4dmHjhLBV6e4=;
 b=Xnv4q7lNU84+LqVTol9C/cbT/ObAZ3XJ4MuOFU4UNetuRZkLVPp3M2WanEhATE/1mg
 29CCgOlu4uCEpB2eNYz8Xhdw+IjmFGChwbRC80E+cUlpv7MgMuFKL2TvzY/7jOu1UBo+
 CJl00bwIOyprhwleE9E7HRe/6Q9ML1A4SU++kyzVuLn7635yG+Wf0ZtEWS/bEikklIP9
 rOGub3PXej701SlvyJF/WfEdBNFwjtRrTrFqALf/TOyk30vME4bs8Lb419h8UXpGZjDQ
 WEQyubGeeHI5JVSlu1nmv2BjS2Wu27W5X7N9UAzeoPkH2SRyeMiGXJ0c+EENiLV0Mc8p
 N8pQ==
X-Gm-Message-State: AOAM531CvFZsHdtaGP4P+VGIWTvZzrChSciQ1I6ny953ah2/AoXrjlAB
 pGqQ7ldAawHCK4kALeAciKwiuBTF3iZkZYUMJDo=
X-Google-Smtp-Source: ABdhPJyWFCLhD5SWScmwqFEh77aP9WjxA9i+45+4iEhvl4CGPmD02s03IHxOY4Vtcd+ZHKWqLkkT+0/UgX4SaLvRzf0=
X-Received: by 2002:a2e:80c5:: with SMTP id r5mr12019506ljg.297.1606137529781; 
 Mon, 23 Nov 2020 05:18:49 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMxwPSELEwWT91-+P8azzjxiaoKY8SLKvZVFLUJznvUyBw@mail.gmail.com>
 <5ad7076b88de21faae79cdc718631a5af80d574f.camel@perches.com>
 <CAKXUXMzQdwvs+gfs1eD131jMQvkTPbghN=-CDLevrSX0CJBdmw@mail.gmail.com>
In-Reply-To: <CAKXUXMzQdwvs+gfs1eD131jMQvkTPbghN=-CDLevrSX0CJBdmw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 23 Nov 2020 18:48:19 +0530
Message-ID: <CABJPP5BBRtUuKoF5N-WVVBO5cmPKOnffqFMTbkOY93EPJf_Xdw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] Alternative to checkpatch fix options
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

On Mon, Nov 23, 2020 at 5:37 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Mon, Nov 23, 2020 at 12:48 PM Joe Perches <joe@perches.com> wrote:
> >
> > On Mon, 2020-11-23 at 10:33 +0100, Lukas Bulwahn wrote:
> > > Dear Aditya and Dwaipayan,
> > >
> > > For creating fix options to checkpatch rules, please note that:
> > []
> > > it simply might be easier to invoke
> > > clang-format with a limited rule set for specific formatting fixes
> > > rather than trying to implement all of those syntactic fixes in
> > > checkpatch itself.
> > >
> > > Aditya, Dwaipayan, can you please consider that option and investigate
> > > the clang-format capability to do the fix before implementing that in
> > > checkpatch?
> >
> > Which could be extremely cool if clang-format works on patch contexts.
> > But as far as I know it does not.  clang-format-diff does.
> >
>
> I used the term "clang-format" in my mail as the overall term for
> "clang-format" and "clang-format-diff".
>
> > What maybe could happen is integration with checkpatch and the actual
> > application of the patch to a temporary file and then using
> > clang-format on the modified block similar to the integration of
> > clang-format and vim or emacs with selected contexts.
> >
> > Maybe the integration of clang-format-diff could be done, but my
> > reading of its help file seems to show the newly added line needs to
> > be extracted without context. (ie: using -U0)
> >
> > Anyway, please do investigate the integration because as you've
> > probably noticed, adding --fix rules to checkpatch can be painful.
> >
> > I'm not in any way against this concept or integration, but I do not
> > expect this clang-format-diff integration to go particularly well
> > unless the patch context provided is an entire statement.
> >
> > Maybe checkpatch could learn to apply patch series or could be
> > integrated along with git to apply patch series to a test branch
> > and clang-format-diff and the entire statement or function around
> > any change could be extracted and again run through clang-format.
> >
> > I suggest you play with it and see what you can do.
> >
>
> I agree. It is by no means straightforward to run clang-format on a
> patch (or on a git commit) and integrate it with checkpatch... it will
> need a bit of exploration, investigation along those lines you
> suggested.
>
> Aditya, Dwaipayan, feel free to explore and use the mentees list to
> exchange ideas and investigations.
>
Thanks Joe and Lukas for the insight. I shall try to bring up
something.

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
