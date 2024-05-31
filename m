Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5975C156225
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 31 May 2024 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717145988; cv=none; b=aFKuhbxs20VcUXRqKmsRrRNpHCgFukGq8ksi5iB97V9VBdfG/vRlepFCiTmLI1+jTZFjFNqCxxE/S4UJa/XJD+BHf4SgX5ztlAohPQ9KdOzPBIM4S38lWycQV2OhXvXpdGhVi34w2exUijeueiE4LGG1xvNROfj6oGA4VPlsqXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717145988; c=relaxed/simple;
	bh=jOivSIzkd4jtGmFStyLd/I4XqpFlRP41SuJUQMMG2sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uxiljj0zfxor3v8+dZVyLW8TdKHwaCzGe3amwTPVduYxCReyo2f0sylipxS4al3hO7kf/LaVsgxGnOaQDeY83vLDwM/PA8EiBHxMmXpj9Hsecdb6yxYLoalbbU1Uu7XcJG7FlISU9U5NIlxT22JZQPdo784AgcwBQhtYfhchZFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9jKrYeI; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o9jKrYeI"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB045606C9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 31 May 2024 08:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vC0FdQD-NmXx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 May 2024 08:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 056F060633
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 056F060633
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=o9jKrYeI
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 056F060633
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 31 May 2024 08:59:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-57857e0f45eso2075742a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 31 May 2024 01:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717145984; x=1717750784; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEAJOPIhEWOmImkEnnoVh+jLPad4uMXeH/NY3H2GRI0=;
        b=o9jKrYeIl2nmy9TTRUCMNoJFZCGykxh/Pxop6yAxjtx4g+Ed1ubHhyxWyYL020UOMc
         W3Sb64hEEy3bL5maqCusQ/XrEND6pCtrDsvIABhVolbA4aVBB/5rAOZTTfcVRHtLSGwd
         UvYCdJ3jXGAq8CnqSurdWjzbMeWcsGq/0APGkIUys94temeotx4yWCakbL/BFKKWwqZt
         YNZaW4V9C+PHJc3atujQirMnHcYSw73k98sIsgkwihaPBATgnq5fN2u8Rw+ctBy/l/1j
         yJok17DNLfb+r0bPKCXR+Imz5J08hw0s7vN2jgFRPlnPMX3sQ/w9PFMOSOEd4gT1uC7f
         /BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717145984; x=1717750784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEAJOPIhEWOmImkEnnoVh+jLPad4uMXeH/NY3H2GRI0=;
        b=nohFh5Im/PHTOVYafb3f4lrA7vl6Q60Xjen5k4s1QbwGG/EP0OL0EhTd07lfT7ETtr
         aAPIodNKQGN3Ck5C9QfEgdfnq7fV4t1qK0jS/ug/WgGl4zeeVP0tDMIgmXR0+KOvhg4f
         V72kYPCgM9m4MQvZG6Hy/D0ZIuevm9aiUSZIUP2j1o6hlo+/SRktZ96+qRPWLs9wNeeb
         DsGoF/OH1chlq3viTkLygneWVd/JlSPGWVteihM37tv5c5fiz/y59F86hj4M/EPd5Ea5
         kMYcNDFUFqH3FGt+woIW6nLeSX3s6h+wpTYXXTp2l2W8wj5bjQfj9ER64+T1rHJIQPcK
         7bgg==
X-Forwarded-Encrypted: i=1; AJvYcCWR1zCsthwoeDqDCgmD0HzdPkZY2ln+yHa0oaur2zeaeuPvCSlG5VYm1WC4tPdpuJkmCOkgOR+oeDMYKeDu8EYUvav0HY7HSXnXh3pxTtag4gwyVz6dWdxcpKmcBBzu
X-Gm-Message-State: AOJu0YyQUDLK6iEt4y/A89iOxDVWu0KbrWkXRDRCe4GUQ9GQZO2x/KRU
	Bl6R/p+5oiQIvugo52YT9kN36+AP0LIIP1sr1p9Utve2z0EHMqv78yjdk7A5pRI=
X-Google-Smtp-Source: AGHT+IF/+rHvuamC5rV6HuoONHpBWDQh8Vzl/UQvPqxXxUfAJx1CxKPhaOOB+FzJQ17g2/141Srb7w==
X-Received: by 2002:a50:a414:0:b0:579:7b6c:5ab3 with SMTP id 4fb4d7f45d1cf-57a364e3615mr984027a12.22.1717145983629;
        Fri, 31 May 2024 01:59:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c9c125sm770024a12.90.2024.05.31.01.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 01:59:43 -0700 (PDT)
Date: Fri, 31 May 2024 11:59:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com,
	benjamin.tissoires@redhat.com, bentiss@kernel.org, jikos@kernel.org,
	jkosina@suse.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	luke@ljones.dev, syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] hid: asus: asus_report_fixup: fix potential read out of
 bounds
Message-ID: <d87335b8-9eae-4689-87b4-b581c0b28c9b@moroto.mountain>
References: <000000000000915d550619389e8a@google.com>
 <20240528050555.1150628-1-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528050555.1150628-1-andrewjballance@gmail.com>

On Tue, May 28, 2024 at 12:05:39AM -0500, Andrew Ballance wrote:
> #syz test
> 
> there may be a read out of the bounds of rdesc.
> this adds bounds checks
> 
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  drivers/hid/hid-asus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 02de2bf4f790..37e6d25593c2 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1204,8 +1204,8 @@ static __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  	}
>  
>  	/* match many more n-key devices */
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> -		for (int i = 0; i < *rsize + 1; i++) {
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && *rsize > 15) {
> +		for (int i = 0; i < *rsize - 15; i++) {

Yep.  This looks correct.  Please resend with a complete commit message
and a fixes tag etc.

>  			/* offset to the count from 0x5a report part always 14 */
>  			if (rdesc[i] == 0x85 && rdesc[i + 1] == 0x5a &&
>  			    rdesc[i + 14] == 0x95 && rdesc[i + 15] == 0x05) {

regards,
dan carpenter
