Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37B5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 19:50:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86DF5206DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 19:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRssmw8d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86DF5206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5001988AAD;
	Mon,  6 Jul 2020 19:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiJeeK+rYBvQ; Mon,  6 Jul 2020 19:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB7E0886F7;
	Mon,  6 Jul 2020 19:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BF0DC0893;
	Mon,  6 Jul 2020 19:50:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A482C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 19:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 507A386CDD
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 19:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Flny91dPFiZW
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 19:50:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5C7C86B5B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 19:50:55 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f6so25113340ioj.5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 12:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j0M4T8dUXUI9ImYcx37T99MpV9nqqVTfojn46xY4bjU=;
 b=rRssmw8dK7h5lE8u30jXTFglO2eNguvoyANQv9RPhz8WmOzYOsE/cCdd4Yti8Ly7Dq
 9xOIDzmsq5U5DuKlBYRNF8MvEhddYtRA3v3Hu1oZvsz/OhW/94iTOjGaZJ3GQh1OwNG+
 RVKoxGhnc5LtIWngq90+55Bce2nSD3W6d563IjS8gkGeRCdwvtxgprEBzZ6MKT6exRSb
 P3ONVwo7ermqr5J4AKr6woPmmAdG7uWpN3x2ufVhzZZcNGLpWO749yBWNhMeBj+sfUta
 qJk3Ho/YUxLMlNpUKj1hWpAgDtSV4Hlt3fiCA5lzu8+ui1Zst8rMQb1zTM5Iyh7aR44H
 B+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j0M4T8dUXUI9ImYcx37T99MpV9nqqVTfojn46xY4bjU=;
 b=qqahDN3UW5piZbnBZujHrZVz47FA2OpXycX3nDS91+cBnUA7RkG0xoDWtYKJdkgqgj
 sLu5oTqLg0buxc0sstsFbu3QwATfT3jW588EPIh/Ltf1uFKgJ6rFbxhsFmnULHrwfWFp
 eGqoA0ED03+H9EbZ0iDKp+kttYFjx7KZo5HhXXBfdQsYVJSlW9HfrPPKft9PE2567qMd
 PLhd3/wRZuNruLqwb6djWUucUrh14K9t7DzBSA2K7kauD/hBD1PGhzhqViHrMqvY1NUz
 NMHYcFeHBpP/RJqBbixRuf1yLkJfc3LlqBlEAEHddRvuPF5l8wllbrBB6EzegeLEPLv7
 gP5g==
X-Gm-Message-State: AOAM531cFVsS0serAbFyJ1h2y8PtR8AIxn50pMAClfiCEcpQSgbOQ4ee
 YrZ1x3ncNhpKk+d4AD+j1YYjORYwhdlDSEazv18=
X-Google-Smtp-Source: ABdhPJyVaNxXZX6/t8lW9Lpjje/fHs7+t4ExMiY4rFxmkwTTqhwNj+WM235vDg4nB2luwQcctRTYAkxb11naqGbD9CQ=
X-Received: by 2002:a6b:8e56:: with SMTP id q83mr27334969iod.61.1594065054959; 
 Mon, 06 Jul 2020 12:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
In-Reply-To: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 6 Jul 2020 21:50:44 +0200
Message-ID: <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Adjust spelling
	check false positive
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

On Mon, Jul 6, 2020 at 10:08 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
>
> checkpatch.pl issues warnings on the commits
> made to scripts/spelling.txt for new entries
> of typos and their fixes. This commit adjusts
> checkpatch not to complain about the same.
>
> Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> ---

How often does that issue appear? Can you use your checkpatch
evaluation to show that it is relevant?


Would not be easier to just exclude the check of this whole rule if
checking the file scripts/spelling.txt.
That would at least be much more understandable, than this complicated
indirection you propose below.

>  scripts/checkpatch.pl | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 3cacc122c528..538776faa96d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2994,14 +2994,16 @@ sub process {
>                         while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
>                                 my $typo = $1;
>                                 my $typo_fix = $spelling_fix{lc($typo)};
> -                               $typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
> -                               $typo_fix = uc($typo_fix) if ($typo =~ /^[A-Z]+$/);
> -                               my $msg_level = \&WARN;
> -                               $msg_level = \&CHK if ($file);
> -                               if (&{$msg_level}("TYPO_SPELLING",
> -                                                 "'$typo' may be misspelled - perhaps '$typo_fix'?\n" . $herecurr) &&
> -                                   $fix) {
> -                                       $fixed[$fixlinenr] =~ s/(^|[^A-Za-z@])($typo)($|[^A-Za-z@])/$1$typo_fix$3/;
> +                               if ("+$typo||$typo_fix" ne $rawline) {
> +                                       $typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
> +                                       $typo_fix = uc($typo_fix) if ($typo =~ /^[A-Z]+$/);
> +                                       my $msg_level = \&WARN;
> +                                       $msg_level = \&CHK if ($file);
> +                                       if (&{$msg_level}("TYPO_SPELLING",
> +                                                         "'$typo' may be misspelled - perhaps '$typo_fix'?\n" . $herecurr) &&
> +                                           $fix) {
> +                                               $fixed[$fixlinenr] =~ s/(^|[^A-Za-z@])($typo)($|[^A-Za-z@])/$1$typo_fix$3/;
> +                                       }
>                                 }
>                         }
>                 }
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
