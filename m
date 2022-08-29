Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF9FECAAD5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Aug 2022 15:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B4CD81A73;
	Mon, 29 Aug 2022 15:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B4CD81A73
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N1pIhGD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IV5Jrwsp0yQ; Mon, 29 Aug 2022 15:03:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3433381468;
	Mon, 29 Aug 2022 15:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3433381468
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1D21C0033;
	Mon, 29 Aug 2022 15:03:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2469C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 15:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACF7040B87
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 15:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACF7040B87
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N1pIhGD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3LMiItWEfxoM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 15:03:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B584E4051E
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B584E4051E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 15:03:13 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so4549845pjq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc;
 bh=hl19yC27qvJPGzvVoFgwuG8P3RA3WT4VWzdG/9QIu5c=;
 b=N1pIhGD3wyaigKJVuMP6jb4oj231Asc43jUz5tjVhjk5bTdEAAcjlu+xAvZU/qb9+m
 1m5qLiwFAUAIcOjaHfMSChJoyufmA6Zxclf8RU9S0ixKv80UoHtL5WOqQbTrCT5xznXF
 i/DS01nwtIF3d68Na5mCvQV6XHczdhOioi+X3kRLspOP22nPcUGEzf/BcTd2Wab9vPr2
 Pb+N0BxHyJH2UG61ugOuyC7ND/2XO7a1AAvBqSddPCtxvGkFlyUweO+GxukeWHRkQLyG
 GSzOxEhS5UmBsZtvXcWaPYZyMCdtpdX+51/lZH7B3YGIrlj1f6rRpOARqnvUSkOJO7lm
 aX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=hl19yC27qvJPGzvVoFgwuG8P3RA3WT4VWzdG/9QIu5c=;
 b=SF2AfjEZarQGRStBBJTuIklh1bWwXDJXLE9MHEFMn83eRu8sf9qIHf4t5O9NBl1Jec
 A/uHjhYISukUd5UlWujkhvgrnctQyMsAwX8Dt+XANukv2dvghLp86371vFhD1fzKg1sf
 uXeCGgqKbfeIi1R+lXe/nI4NUtDM/Ns9KVRa+ZtdYQlEoQr8GH5AtQukCPo+UBwjVK+W
 4Xk6MNBR2a2WkSO4UMGcJHpD5kvRxJ+smf8raHTnTcmI3Tjpb5eRgPspSsH3F3dF9QSh
 Mdjum9/Kco3XqxVlXemtwlUFM9m2U9dLZVO98giWZdF2Hvn2OTqsqPiVQ7Wemr1oKsGm
 vtvg==
X-Gm-Message-State: ACgBeo2UesC3FNDJEqZlnHTTkJO7MQgnBEdWtWZvE0Dab2MFX0ShZMFA
 yLWHv836hZcaORDbFJ40SD0=
X-Google-Smtp-Source: AA6agR7OFBttzwRQAP0jnnmDnPAv1l0tyFU2JXitdpeRVfDA4S77kutEDWZof5n4mxHqPaLyKs4WNQ==
X-Received: by 2002:a17:90b:2404:b0:1fc:b5d1:446f with SMTP id
 nr4-20020a17090b240400b001fcb5d1446fmr18494415pjb.58.1661785392095; 
 Mon, 29 Aug 2022 08:03:12 -0700 (PDT)
Received: from Negi ([207.151.52.7]) by smtp.gmail.com with ESMTPSA id
 u1-20020a170902e80100b0016c4546fbf9sm6644546plg.128.2022.08.29.08.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 08:03:11 -0700 (PDT)
Date: Mon, 29 Aug 2022 08:03:10 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Anton Altaparmakov <anton@tuxera.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] ntfs: Ensure $Extend is a directory
Message-ID: <20220829150309.GA26122@Negi>
References: <20220727001513.11902-1-soumya.negi97@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727001513.11902-1-soumya.negi97@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Tue, Jul 26, 2022 at 05:15:13PM -0700, Soumya Negi wrote:
> Fix Syzbot bug: kernel BUG in ntfs_lookup_inode_by_name
> https://syzkaller.appspot.com/bug?id=32cf53b48c1846ffc25a185a2e92e170d1a95d71
> 
> Check whether $Extend is a directory or not( for NTFS3.0+) while
> loading system files. If it isn't(as in the case of this bug where the
> mft record for $Extend contains a regular file), load_system_files()
> returns false.
> 
> Reported-by: syzbot+30b7f850c6d98ea461d2@syzkaller.appspotmail.com
> CC: stable@vger.kernel.org # 4.9+
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
> Changes since v1:
> * Added CC tag for stable
> * Formatted changelog to fit within 72 cols
> 
> ---
>  fs/ntfs/super.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 5ae8de09b271..18e2902531f9 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -2092,10 +2092,15 @@ static bool load_system_files(ntfs_volume *vol)
>  	// TODO: Initialize security.
>  	/* Get the extended system files' directory inode. */
>  	vol->extend_ino = ntfs_iget(sb, FILE_Extend);
> -	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino)) {
> +	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino) ||
> +	    !S_ISDIR(vol->extend_ino->i_mode)) {
> +		static const char *es1 = "$Extend is not a directory";
> +		static const char *es2 = "Failed to load $Extend";
> +		const char *es = !S_ISDIR(vol->extend_ino->i_mode) ? es1 : es2;
> +
>  		if (!IS_ERR(vol->extend_ino))
>  			iput(vol->extend_ino);
> -		ntfs_error(sb, "Failed to load $Extend.");
> +		ntfs_error(sb, "%s.", es);
>  		goto iput_sec_err_out;
>  	}
>  #ifdef NTFS_RW
> -- 
> 2.17.1

Hi Anton,
Have you had a chance to look at this patch?

Thanks,
Soumya

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
