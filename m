Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6BAC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 13:39:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47AC522243
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 13:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbm92EiE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47AC522243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F03202052E;
	Tue,  3 Nov 2020 13:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duGv0Y4dN9bw; Tue,  3 Nov 2020 13:39:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0FE682043C;
	Tue,  3 Nov 2020 13:39:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE730C088B;
	Tue,  3 Nov 2020 13:39:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8338C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 87ED92051B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WI1Pivr9I+3s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:39:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 798B22043C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:39:48 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id z2so16088496ilh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 05:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ik11Hs5p8kvWdsgygQREqx0BXgwqkXR60gDsp9sPVI=;
 b=Pbm92EiEkQbC0U7mWLdZ7QIXji44qmNzzFegstRqQQ0y8TzTbtyHT9JyFXMp4Bm1V5
 +xUEqbWl2FU66uunnK3mMLRXlMyjrz1NU/pWxslVN5Y44iBZJ1A6PT6UYeMR5nTjLhqq
 ANneMrscPhX4jTr+ffLyyxzVqcR8lgFFT4bT1/2gnpNHfAvT3N3xcPYeD3m2pJmBKRBU
 tvbCkwsgDLcUVZTFFfcr6dDa5oLTFRCPmoKXFo8riCms/KjfOpSyk8w8K88b9erEUm01
 0nmeZKMabHnEInIKM83Jh4KXtXb6qGYRSmcurzgxi6iAPpVqxpa14Hkypxr/PdAQDjot
 t2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ik11Hs5p8kvWdsgygQREqx0BXgwqkXR60gDsp9sPVI=;
 b=eP30vn0xzq4QL+uDNBaLIWaL/hRfbqg6ZmsE4aa6caMSjzZedUOTkYR+7qi22Vymj1
 JaGriKas75lpYAj6Fx6O4ktxbts7D6aEOlP9w/yhuSq9dvgAQEr35g0bEr519ZDs5urW
 ZGL9wJZC2vk7Cp2vxgt5CWD3G5ExtOai1YEyI1PiBXL5Fk1cu8S2N1ShmMWwWqkzARTP
 4AjRZOmlI6+LKaer4uaDvjbLGl9zAXhJ2SomzV1cIZDe0LmDbI2RPg6jd+KtLWYFwByI
 OuhNNAIx1nc7NxcOV/h85kmMZjwDsGoheObqaeNc4WE/iuSKpdc3qogTXu2bFYPEVOZE
 J1mg==
X-Gm-Message-State: AOAM533HFFRMpU/GUirdxhoPbSZgPrFD5iXvIrxGja7c4tQG2NoyqzEP
 h7QTZ817VzTG2d+fDvL+xdB0FSVjTorcKytNLupN4vDbaso=
X-Google-Smtp-Source: ABdhPJzttQnz0VTK4VFUf2jrftmKzICNtx8XRZE3pwMFKqli9BPpHkdygDRNsmxz4JIQB1T/w8tTUpl1HX5+uWNHtps=
X-Received: by 2002:a92:cb51:: with SMTP id f17mr13900958ilq.64.1604410787835; 
 Tue, 03 Nov 2020 05:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20201103133052.21053-1-yashsri421@gmail.com>
In-Reply-To: <20201103133052.21053-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Nov 2020 14:39:32 +0100
Message-ID: <CAKXUXMx9nYkFBy3RYf-LY9VYUeWcf4FuQpT9F3=_p=9baBQikA@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fixes for
	BAD_SIGN_OFF
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

On Tue, Nov 3, 2020 at 2:31 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, checkpatch warns if the author signs-off two or more times
> for the same role.
> E.g., for commit 6dd47d9754ff ("mac80211: fix
> ieee80211_txq_setup_flows() failure path") we get warning:
>
> WARNING: Duplicate signature
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>
> Here there are two Signed-off-by lines present for the same user. So,
> we get a warning to remove one.
>
> Similarly, we get warning if the author of the commit signs-off under
> co-developed-by.
> E.g. for commit 6e88559470f5 ("Documentation: Add section about
> CPU vulnerabilities for Spectre") we get:
>
> WARNING: Co-developed-by: should not be used to attribute nominal
> patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
> Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>
>
> Provide fixes by removing the duplicate signature line and the
> co-developed-by line from the commit
>

A patch shall only do ONE thing. I see two here.

The duplicate signature fix is simply wrong, because the indication of
the duplicate signature is imprecise.

Probably, we would first really need to understand the valid cases of
duplicate signature warnings compared to the invalid ones.

Please rework.


Lukas

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 58095d9d8f34..4e6cbca495eb 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2818,8 +2818,11 @@ sub process {
>                         $sig_nospace =~ s/\s//g;
>                         $sig_nospace = lc($sig_nospace);
>                         if (defined $signatures{$sig_nospace}) {
> -                               WARN("BAD_SIGN_OFF",
> -                                    "Duplicate signature\n" . $herecurr);
> +                               if (WARN("BAD_SIGN_OFF",
> +                                        "Duplicate signature\n" . $herecurr) &&
> +                                   $fix) {
> +                                       fix_delete_line($fixlinenr, $rawline);
> +                               }
>                         } else {
>                                 $signatures{$sig_nospace} = 1;
>                         }
> @@ -2827,8 +2830,11 @@ sub process {
>  # Check Co-developed-by: immediately followed by Signed-off-by: with same name and email
>                         if ($sign_off =~ /^co-developed-by:$/i) {
>                                 if ($email eq $author) {
> -                                       WARN("BAD_SIGN_OFF",
> -                                             "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline);
> +                                       if (WARN("BAD_SIGN_OFF",
> +                                                "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline) &&
> +                                           $fix) {
> +                                               fix_delete_line($fixlinenr, $rawline);
> +                                       }
>                                 }
>                                 if (!defined $lines[$linenr]) {
>                                         WARN("BAD_SIGN_OFF",
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
