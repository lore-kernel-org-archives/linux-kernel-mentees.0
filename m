Return-Path: <SRS0=t6EQ=FO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE90C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Dec 2020 11:50:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E3A23D5A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Dec 2020 11:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10E3A23D5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FBFC872F5;
	Thu, 10 Dec 2020 11:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3wv7Y9tvrHr; Thu, 10 Dec 2020 11:50:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 90496872D8;
	Thu, 10 Dec 2020 11:50:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 750D9C0FA7;
	Thu, 10 Dec 2020 11:50:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02362C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 11:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DC2EE86420
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 11:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FB3UTOTifPeu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 11:50:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CFB81863D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 11:50:41 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id e7so6311161ljg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Dec 2020 03:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qtAm5dAOQPb1MVS/P0SLFjpSyUHVl1xhrpWXpZLL7UQ=;
 b=hA3pzWzrRRDMNpbqUN39RZ7v5dpe5ROCXQyLBNEYWKrdeOIFs7lO6blRsetcBPiz43
 n9f5zqGKX/vTZeYchyF1+v4XPYWKtNNlBN6vko1tLV7FqKr6pnEQnXbn7VIDGlCc+PQ5
 Zd+/4lWZ7KhYAzeAK7lvRvxiXlFV2mT2kJBG8HKGlEspiazRgo89tcAuwQdskIxb7taA
 Az8+eNUItavkuCeFAMVKApoBjaxZYqY4BzYUFy2TjN+krXyvoxHyOfs6v1x0LiizC/bL
 p5xTMDnKuDa5t7QlXc+qSm+HqKQy1JCmcpTpKe2GB+kqgPIqy5U05PIOlAl2OXBeQhNz
 ctEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qtAm5dAOQPb1MVS/P0SLFjpSyUHVl1xhrpWXpZLL7UQ=;
 b=eHaIc8r7Ab2Rle1I4ISBQaNabavJ8mrhRewptI1EDtsCRoAupz5L1FUFUMU4Iqcyr9
 UlLI2T/gQ3OBCU9lcfRlcBoHx1Fo8qvJO9dlRbpytL7ja2IgpKZbofj6BsqM9UseDOdk
 vfwButZZR9L/GATldTyvWXsPj23BmvGeHcwYtRr/s/RrYEicYnFF5bLBAJI/OCY/I5ya
 gxSIBoXgPXclV/5fahl3V+PIjWqGn/tELh0v/Nogb5kzL/ihukp/2X8r7dtvirMsDVSm
 78TfNXDt7Urx7ul+Jv0wU2E3YNnHln6nfrirInVPAyVCvSjI/lNGeVDICOuYjx3CX93a
 ljbw==
X-Gm-Message-State: AOAM5324mM/yqRqx3fBu9nsOm1g6Zza2TbyhKYWmbxKmvSCU2pcT6Z6k
 6BcHGNfXqb+alpBfb0rHz9HsouU5diZniTqOTAM=
X-Google-Smtp-Source: ABdhPJwgsGUHGa/EnNB7amRp7ujDmB/Fmc7mWJiNFMhAa4ehjXZ+rv2F0R4d6O6IvNLmXbkyClIuRMfTCTbheREHres=
X-Received: by 2002:a2e:164e:: with SMTP id 14mr2831599ljw.482.1607601039807; 
 Thu, 10 Dec 2020 03:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20201207185747.132636-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201207185747.132636-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 10 Dec 2020 17:20:15 +0530
Message-ID: <CABJPP5BcuBXZuS=eO+83h=mUrDFK3UK9m=AX3DbJx6yXv7m-PA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option to
	IS_ENABLED_CONFIG check
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

On Tue, Dec 8, 2020 at 12:28 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Documentation/process/coding-style.rst specifies the use of
> IS_ENABLED macro:
>
> Within code, where possible, use the IS_ENABLED macro to convert a Kconfig
> symbol into a C boolean expression, and use it in a normal C conditional:
>
>         if (IS_ENABLED(CONFIG_SOMETHING)) {
>                 ...
>         }
>
> checkpatch correspondingly has a check for IS_ENABLED() without
> CONFIG_<FOO>.
> Add a --fix option to the check to automatically correct the argument.
>
> Macros like:
>  #if IS_ENABLED(THERMAL)
>
> is corrected to:
>  #if IS_ENABLED(CONFIG_THERMAL)
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7b086d1cd6c2..751cd13622b9 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6877,8 +6877,11 @@ sub process {
>
>  # check for IS_ENABLED() without CONFIG_<FOO> ($rawline for comments too)
>                 if ($rawline =~ /\bIS_ENABLED\s*\(\s*(\w+)\s*\)/ && $1 !~ /^${CONFIG_}/) {
> -                       WARN("IS_ENABLED_CONFIG",
> -                            "IS_ENABLED($1) is normally used as IS_ENABLED(${CONFIG_}$1)\n" . $herecurr);
> +                       if (WARN("IS_ENABLED_CONFIG",
> +                                "IS_ENABLED($1) is normally used as IS_ENABLED(${CONFIG_}$1)\n" . $herecurr) &&
> +                           $fix) {
> +                               $fixed[$fixlinenr] =~ s/\bIS_ENABLED\s*\(\s*(\w+)\s*\)/IS_ENABLED(${CONFIG_}$1)/;
> +                       }
>                 }
>
>  # check for #if defined CONFIG_<FOO> || defined CONFIG_<FOO>_MODULE
> --
> 2.27.0

Hi Lukas,
You probably missed this patch.
If you are okay with it could I send it off to LKML?

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
