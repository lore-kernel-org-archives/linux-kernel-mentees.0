Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8607BC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 16:45:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40B3205CB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 16:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jilu8Bi3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40B3205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 33AF4862A9;
	Tue, 10 Nov 2020 16:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o2RYMtJSRMa3; Tue, 10 Nov 2020 16:45:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B430185FD4;
	Tue, 10 Nov 2020 16:45:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACD33C0889;
	Tue, 10 Nov 2020 16:45:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04C61C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 16:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DA9A82033B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 16:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kp5rpK1r623d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 16:45:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by silver.osuosl.org (Postfix) with ESMTPS id C9A0120104
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 16:45:13 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s24so14826474ioj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 08:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dLPAh5EuA4Acg/+PX1+LmI8PxPsCNG6OCBRVBolVfcM=;
 b=Jilu8Bi3I1awlV4rWgyR1UNECDsjGzJu+rtL+t51E4UcKYdLBHf1UaBJdkr2GtHeb4
 lDzCqTqr2wry7gUxQbxFztXJasYjFpaeViUa+IyW7Q8FyP21dNssOHj1VlRz48iLLcaP
 ODIAnOsszfuiHdNLasURD6jsX/ysJZgRaSgM2bFbaKvxqpRTwYWVBQmKXBTTjyPGOE5d
 O1FDq4/pwXmV+R1vbMmz1Syjb15SHAgccYfMqC8k5ftCJjr9FB7gOln7bSOESnr9LimH
 ABVphgoWWanV+rYP53AKYRWmA90UahVX2dYDo7dTmoT5BdvWlwcP5bfVsXPfPH1uGbXq
 KlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dLPAh5EuA4Acg/+PX1+LmI8PxPsCNG6OCBRVBolVfcM=;
 b=Dz1QjUeTOjALQHouWC6lhPi5oCD1Pto+czKsd+pv7Oh7e6OZzA0Iuy11PJAOLrbd8j
 D/tv4QNud0HMxbYLPirpf/fKi1szWd+TP8LJYsLSocOULROBwsOAKpGhO3izdVnYP20g
 i10wvCwgda/x0wPVMlX5RBTvmnv8FSIwPlgVUjsDOOCXuCvBLNSj46X9F1oz1A1l6G0x
 ZM1CkKFVityuBSZR+ylDEocawfyf64AwP5j/Z+gMlvFoYnrTAfa3jt2uDGCORD6P1CHy
 cMq1VqtH6Wg9nqsFYAF13neFEsZbrsDVcbemjuKEblIxtg70iL6bBEgWpwdVs2siAfTR
 aejQ==
X-Gm-Message-State: AOAM532qMVYnYD5paO/K7/HOPi8/Ze9NHNDaNAdaV9CiRSLoiXVie5TK
 RjBgULbunwJPBseCAdgQOyZkbAPmzYknGWyo96k=
X-Google-Smtp-Source: ABdhPJwDMBjPPXdnfQYUxc1m7ZxFgwL15mYgS/rZ3ZTzcsx6PmDm8tgl5nLSBccjd9TObFXvHitUzNiPcgR/OABljts=
X-Received: by 2002:a02:b704:: with SMTP id g4mr3340061jam.139.1605026713009; 
 Tue, 10 Nov 2020 08:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20201110134214.24082-1-yashsri421@gmail.com>
 <CAKXUXMzSQX-NjOw1KBHMfag1GkizAJvLpyopjiRdOf+6K1r-KA@mail.gmail.com>
 <0ae65118-d18e-5820-e7d4-2dd816251788@gmail.com>
 <CAKXUXMyCJXqxoppfozD0ERtXWZg2Pnzy6dguS5-4c13uN9vRmA@mail.gmail.com>
In-Reply-To: <CAKXUXMyCJXqxoppfozD0ERtXWZg2Pnzy6dguS5-4c13uN9vRmA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 17:45:03 +0100
Message-ID: <CAKXUXMw2X2V-Fcy7ChMk4gOkDfsiUTVXYFphz3V2uKeF140rdQ@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Documentation:
	include sign off for reverts
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

On Tue, Nov 10, 2020 at 4:34 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Tue, Nov 10, 2020 at 4:27 PM Aditya <yashsri421@gmail.com> wrote:
> >
> > On 10/11/20 8:19 pm, Lukas Bulwahn wrote:
> > > On Tue, Nov 10, 2020 at 2:42 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> > >>
> > >> Currently, we do not have any documentation on commit reverts regarding
> > >> the requirement of Signed-off-by tag for it. This may be misleading to
> > >> the users.
> > >>
> > >> On evaluating MISSING_SIGN_OFF over v4.13..v5.8, it was found that
> > > Just some minor nitpicking on wording:
> > >
> > > Evaluating MISSING_SIGN_OFF checkpatch warnings on v4.13..v5.8 showed that
> > >> 4 out of 11 cases for this error is because of missing sign offs in
> > >
> > > 4 out of 11 cases missing a sign-off are revert commits.
> > >
> > >> revert commits.
> > >>
> > >> Add documentation regarding the same.
> > >>
> > >
> > > ...to document the community consensus and let readers know.
> > >
> > > Send the revised patch out to the appropriate developers and mailing
> > > lists and please CC me and Joe (because it is also on checkpatch
> > > rules).
> > >
> > Thanks for reviewing. I have updated the message.
> > Actually when I ran ./scripts/get_maintainer.pl over this patch I am
> > getting a long list of maintainers, so I wanted to confirm once if I
> > should send to everyone in this list.
> >

Maybe you misunderstand my previous email:

you should send it to those two people:

> > Jonathan Corbet <corbet@lwn.net>
> > (maintainer:DOCUMENTATION,commit_signer:9/11=82%)
> > Drew DeVault <sir@cmpwn.com>
> > (commit_signer:4/11=36%,authored:4/11=36%,added_lines:53/80=66%,removed_lines:212/228=93%)
>


> It could be that Drew was contracted long ago and is not in the
> community anymore.
>
> You can drop these five people:
>

And "drop from the list" means: You should not send it to those five
people below.

> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > (commit_signer:2/11=18%,authored:2/11=18%,added_lines:9/80=11%,removed_lines:13/228=6%)
> > Krzysztof Kozlowski <krzk@kernel.org>
> > (commit_signer:2/11=18%,authored:2/11=18%,added_lines:9/80=11%)
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> (commit_signer:1/11=9%)
> > "Alexander A. Klimov" <grandmaster@al2klimov.de> (authored:1/11=9%)
> > Tom Rix <trix@redhat.com> (added_lines:5/80=6%)
>
> These are the right mailing lists:
>
> > linux-doc@vger.kernel.org (open list:DOCUMENTATION)
> > linux-kernel@vger.kernel.org (open list)
> >
>
>
> Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
