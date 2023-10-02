Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6195BE7849A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 04:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80C181D21;
	Mon,  2 Oct 2023 04:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B80C181D21
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LAv3x+9e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2O4FivpwgUDh; Mon,  2 Oct 2023 04:35:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A4AE2814BB;
	Mon,  2 Oct 2023 04:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4AE2814BB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76092C0039;
	Mon,  2 Oct 2023 04:35:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2493EC0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF108418FD
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF108418FD
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LAv3x+9e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naaNHXpWe7ok
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:35:19 +0000 (UTC)
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2ED84183B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 04:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2ED84183B
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1e12f41e496so1856159fac.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Oct 2023 21:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696221318; x=1696826118;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9xW3a1nINnEbWotZ8VGaoeFipO2l6o5xih0v3ERc7HM=;
 b=LAv3x+9eOw6om+ZCla5DHrgPgkP28puvSUAxKhnD0PAAPLPL7fBtEqZe5G2N92R5Rt
 aI5XjVgoXoB8jKeeUafObO0uTixg5k3dLD5wBHZLQUHvRuaUhNgRd2Wr718uhSBho3uq
 xd9/f9MT7Z/Nx077lBkARvtAzUUEfQjrcgrnO13RxqHEAh5J81VUMLuXM09C7lAzjnU8
 d12DAefVoybk69uzLrPdhKxl0P7FB+aScQ5+ikIurcNw2o57Mx3/vzTqpYAZMRtsAAuk
 IFpvbdB0LvAc9vwuGBZ7p/oiPkKRY2f2/JVCXWkBdJGHrJDBWgSw0kYwNXUZ9+Iy/g/R
 eGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696221318; x=1696826118;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9xW3a1nINnEbWotZ8VGaoeFipO2l6o5xih0v3ERc7HM=;
 b=wS+muZf8hmVZZR888TbNwAXG2N8dOEU3LnWwCGj8/7k5bTj2GMZc5zdiK3aWihNSB3
 AdXDWTT0lC1D2vXQ4kbTahxC8PBfqJ7MHSBP/MfeeOapts7RGMNHSLKg6lDb93oOcH0M
 GxsSeLgeRscGeP4Y+expCEvRuqZD4XdqY8RjBOZ9E8ewC9UlEXYxONSwtXXVz1Y3LxVI
 FVpsHV+wS3zsW6G/pEs8ei2cbHW0auPCmTD6Ee2t6Y7FW4a8+cVa/YLryZ6Sy7vzdgVV
 RSNAm1DiNY5HZiS5XIMRmxFbbIUr46/4apIJflzBWMIRR33vGJWp+JjYrT6jSnIUilFS
 xmUQ==
X-Gm-Message-State: AOJu0YyhHgXydyUWjF2OkDt1mozEuJ8z66oFKBBXyDyOlvXhBN3q6F/A
 TDV+jEX8MyvyGAaq5kErIN4=
X-Google-Smtp-Source: AGHT+IEkNi/NNt+Pv2tFLsCHn+2hQDf1i9nxZM4iCql6G03AqLmJwsazn8elKpMjniaKfvVyPHFnUQ==
X-Received: by 2002:a05:6871:811:b0:1dc:723d:b8d0 with SMTP id
 q17-20020a056871081100b001dc723db8d0mr13014714oap.27.1696221318480; 
 Sun, 01 Oct 2023 21:35:18 -0700 (PDT)
Received: from [10.0.2.15] ([103.37.201.176]) by smtp.gmail.com with ESMTPSA id
 k67-20020a633d46000000b00577bc070c6bsm17446832pga.68.2023.10.01.21.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 21:35:18 -0700 (PDT)
Message-ID: <cc9825ac-1f5f-a15b-70f1-bdf238e78d32@gmail.com>
Date: Mon, 2 Oct 2023 10:05:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] jfs: fix array-index-out-of-bounds in diAlloc
To: shaggy@kernel.org
References: <20230926071312.14086-1-ghandatmanas@gmail.com>
Content-Language: en-US
From: Manas Ghandat <ghandatmanas@gmail.com>
In-Reply-To: <20230926071312.14086-1-ghandatmanas@gmail.com>
Cc: jfs-discussion@lists.sourceforge.net,
 Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

just a friendly ping

On 26/09/23 12:43, Manas Ghandat wrote:
> Currently there is not check against the agno of the iag while
> allocating new inodes to avoid fragmentation problem. Added the check
> which is required.
>
> Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
> ---
>   fs/jfs/jfs_imap.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
> index 799d3837e7c2..ace8a1506380 100644
> --- a/fs/jfs/jfs_imap.c
> +++ b/fs/jfs/jfs_imap.c
> @@ -1355,6 +1355,8 @@ int diAlloc(struct inode *pip, bool dir, struct inode *ip)
>   
>   	/* get the ag number of this iag */
>   	agno = BLKTOAG(JFS_IP(pip)->agstart, JFS_SBI(pip->i_sb));
> +	if (agno < 0)
> +		return -EIO;
>   
>   	if (atomic_read(&JFS_SBI(pip->i_sb)->bmap->db_active[agno])) {
>   		/*
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
