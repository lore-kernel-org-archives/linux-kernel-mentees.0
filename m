Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A9EC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:35:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A27372078B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 18:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2IPkEG1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A27372078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6B6DF861E3;
	Sun, 11 Oct 2020 18:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtEk4tFK9cp6; Sun, 11 Oct 2020 18:35:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0124586194;
	Sun, 11 Oct 2020 18:35:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA29CC0052;
	Sun, 11 Oct 2020 18:35:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E9BBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F23BB861E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hfB36d-2nZr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:35:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5B5DF86194
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 18:35:54 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id p16so5471076ilq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 11:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lcdGN/vINFziH4Kk7VKz9UDcsJ9k8shPQZXX5jJiD0A=;
 b=E2IPkEG1S66pqmrnPIbzctW5VHbzCJBDhxU7hCfS8YvC3xfO0W2sPH2/rnNOq0Wjlg
 i6nsyveX+PKRYxoHmaSUffgO2LH6fLJdXPijqAzSZKG7x99t7OkhZ6GsuqUKqJus8LTI
 a4abpnKJolcicmc28ETNO1Lb7CW2o5zonWEGbHNBiyZTiFTeDPLUIq3Rdx659LG6LDYH
 SuKeRfxbldjvJ4Xs4fBvcX9U/f+IJSVC/ZSUuWE86Cf7y/0Wpjivk4qh6twjjjOSypmF
 2uXdYcrQ8r/G4g90R7oFxVYGxGeRczLP03sOkBR38G9BEby74dcVFXIj0Isnt+qv4w1l
 3kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lcdGN/vINFziH4Kk7VKz9UDcsJ9k8shPQZXX5jJiD0A=;
 b=ELdXGWSP8XHR0M4IqDaVcNutldDEUfxa4Vmi9Qq2R+vBIrMb7oUb+2gedzciFzeTeA
 E0m/iZYtf8SNXUdw8dJcFqC+npN9RoenRV4rn8pOaZDw1Cj6vZCvCJEYvRlTXs2RU2i5
 VZg3o5euSbnfZkUG3bs0OTkz6BgokNljrLfHDRP15XU6fXq2kO8x1+LEPcMAvfiEcesF
 uGw0xBTAglLeQxb/5grm9eF/S9Py7fysRvMvpeZg/Rx8MzqFw0GrfJsT0x7djLrKUtRW
 ONEzce+2MLVHnuuAHwHSSykRVxselQNeWX3uf9NOUFeOOaz6EWNAfcFAD2cE1IYNVFoP
 ybZg==
X-Gm-Message-State: AOAM533Qjwd1pBgrqAGPxIOAUVpdq5xyAn2mfbpi/EUZpgZDeTIgB3kn
 YUWPY1/anzGRig4HdvlaIPyyl8HA2nJOUKAQ12c=
X-Google-Smtp-Source: ABdhPJz6rCBQHRgrwdGDUBFOwetNlY/NZAT0W0/Ds7DbfiH9EvONxKopXfcfM7/yR5rlUkHEveZhuIORmTdRE9xyvsc=
X-Received: by 2002:a05:6e02:4af:: with SMTP id
 e15mr15780564ils.64.1602441353535; 
 Sun, 11 Oct 2020 11:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201011162123.1151215-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010111946390.5535@felia>
 <28381616-fb42-4efa-7a5a-7127e1a3f794@gmail.com>
 <alpine.DEB.2.21.2010112017490.412@felia>
 <3a27184a-0bab-92e5-1d86-a74bc699ca57@gmail.com>
In-Reply-To: <3a27184a-0bab-92e5-1d86-a74bc699ca57@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 11 Oct 2020 20:35:42 +0200
Message-ID: <CAKXUXMxQTOW7qqsigMa9-b+va+KBEYb4cREAJunbAVQeaZcXGg@mail.gmail.com>
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On Sun, Oct 11, 2020 at 8:32 PM Ujjwal Kumar <ujjwalkumar0501@gmail.com> wrote:
>
> On 11/10/20 11:49 pm, Lukas Bulwahn wrote:
> >
> >
> > On Sun, 11 Oct 2020, Ujjwal Kumar wrote:
> >
> >> On 11/10/20 11:20 pm, Lukas Bulwahn wrote:
> >>>
> >>>
> >>> On Sun, 11 Oct 2020, Ujjwal Kumar wrote:
> >>>
> >>>> checkpatch script checks for invalid EXECUTE_PERMISSIONS on source
> >>>> files. The script leverages filename extensions and its path in
> >>>> the repository to decide whether to allow execute permissions on
> >>>> the file or not.
> >>>>
> >>>> Based on current check conditions, a perl script file without
> >>>> '.pl' extension in its filename and not belonging to 'scripts/'
> >>>> directory is reported as ERROR which is a false-positive.
> >>>>
> >>>> The script can correctly handle patches with mode changes and
> >>>> shebang line if shebang is taken into account. So, along with
> >>>> the current check conditions, adding the shebang check in the
> >>>> check conditions can improve the reports of the script.
> >>>>
> >>>
> >>> I think one of the core design decisions of checkpatch.pl is:
> >>>
> >>> checkpatch.pl can run on a patch, even if the patch does not apply to the
> >>> current repository version that is checked out.
> >>
> >> From our past conversation I remember about this particular point.
> >>
> >>>
> >>> It solely uses the information in the patch, and does not try to guess how
> >>> it could be applied etc.
> >>
> >> I am fetching the 'shebang' from the patch itself (therefore I do not
> >> understand how does the proposed change violate that design decision?).
> >>
> >
> > Okay, maybe I misread the patch; so, where those the first line come from?
> > What if that first line is not part of the patch?
>
> In that case there might be a false-positive. But I tried to handle such cases
> where the first line is in the patch itself.
>
> Okay, so there are total of 4 cases with file mode change:
> 1. mode change + create + modify
> 2. mode change + create
> 3. mode change + modify
> 4. mode change
>
> the patch will handle all cases of type 1 and some cases of type 3.
> Other cases won't be handled because they cannot be handled without
> breaking the core design decision.
>
> I do have references to say that the cases 2 and 4 are
>
> Which I thought is an improvement over current logic used for the check.
>

Sounds good, maybe you can explain that in the commit message and then
send that to the mailing list and Joe Perches.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
