Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011772BDC25
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Dec 2025 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764695366; cv=none; b=MaXEXgxz4GW6hBHU+zV9GVM8NVwNRCLv1YgewuafizFCn9dWjQXcSFY45OQc/ZcOFNAojYVU2WTTPRxQUYuqYHIHivRSzrcF0wRaVk1dViQLp3oF2UMKETulmxtNKyyjMTKX/VkB13wvpEj001YyK8iL7XrPRswTdZngnK1Brt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764695366; c=relaxed/simple;
	bh=45MijeCikbLICClrSiN36MCZK5B0JwjpmGbgdSAYvuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqqfTVepsZdwZdT5PRPkppyUX9SG788AaewwiBSXAfocmvQCH6NRIK+GS4DVGFXrdhvPAFjppHEzcxvVu1dKGiiPOoZMjo7li/E+vdfSCdCYMSEJZbfuGm3GdmiEUEDZfbhveOs9sOoDR4WoBp4F/6h5QIAIyOW4Q/MRTDbYFzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gVgCK8/K; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gVgCK8/K"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 436D28071E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Dec 2025 17:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XZSjcbRon2Q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Dec 2025 17:09:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=cmllamas@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73A7C806A2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A7C806A2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gVgCK8/K
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 73A7C806A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Dec 2025 17:09:22 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-29852dafa7dso1010135ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 02 Dec 2025 09:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764695362; x=1765300162; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OE8hvHCw3MFr7aZguM67044oyYLQlhCB1XpMeHQTUwk=;
        b=gVgCK8/KGGXhu+82BM0xRxbIfQn5zI7UfqWTo24dzQhymDQNg64PtRMmd0tTrh6evp
         uojTqBUobOuCGwYU1PKQC0T/5ORkX//WoBA4HhSnbLubbJ+YfTL/x5b7Rerd8lZOnbt8
         CM5YmyVnBGdU2V00/2Lxx+p+OB0pQC5ijhdGrmt6M+Kfepht+iONagei8t85I5STh7E2
         QbnReNkpQcz+YOQzVEl0ZfS7HdmtE06A1GjJSBQuyBnXG29iX5D7vx0yDtPLfk0KN8az
         BxuEFMDVdYWAEIhFavWLTUThgk9qqNj/YdX0sPurq6KFK642GFwttYAthi87yGzzQdVB
         PHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764695362; x=1765300162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE8hvHCw3MFr7aZguM67044oyYLQlhCB1XpMeHQTUwk=;
        b=qB5jgoxVz1H/us0D20NWxV4lc7paa6vi1ewYYROIFKPqjMDZ0RvarnuAAGTYJ0cT0V
         yZqgcePjZSihMIsRXgq1xaQaXP68DrzzbvHsYI+w/SLeufSAB+MmO2lM1hIhP7O7LS8h
         iLNyBawTCgv3rL43Z3YQXyS2gOSkOzUR23EHp+WYfjT1BSYDC3TDHh4/vS/9uTnX9OCX
         lTkoXlpyQAKdOCI5OhTrqNTM7xt7mN6yvPxXmQZHE738t5ZrTPdfZr0kl6ymVb4tqDk2
         BhzcvwhJy4tlCu/sMWfGdIzTbRndiCelssduZwvoKwwVzohJnR+/6fdT9vRU52z7+9ZO
         /Cow==
X-Forwarded-Encrypted: i=1; AJvYcCUlNQcdNMTHtY6sTvtnrQabZrswM3w+WA7GOOk4mXGpyAz+oPbyGEibSTNbp6bbdxB8CPuiL7L9uPZvQgFl0dC4fbg2rQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxQQjGjD+MlDMgbpseykfFsnx870ZC4TGcDwW4bfYjgnQ/EU2qm
	ukgTKXRtpY7DKSnIuHlZxHpkuIl8fCbBkQmp7CZjUtW7Q2+baVA0HFCdqJz47agsYw==
X-Gm-Gg: ASbGncvsBLChFLOwNDz8Y2/C8zEkezj4+2H5ys/YSbzB6qMNc2F7FVAWkvLBGgu6jK1
	jpJ8CrjRDZiO3dM2IhAa6Lloyf54qD3NLogqfABdbZkgsrUtqV1qZjbAhCgcphQqPtorFvRKBIv
	GQLXtMXQ6X/Cm6RPR7NViRML0IktARNtdZwLr706ej51F3WqmR+kvZN7uypwh/QB+b9jUc7+Ii0
	qYfncgcTWnfgDlwvyJNuDQBaJxg13zrkpxjPkVR06I0jIpT4zpoZsm98ODoR7FZaMsSgoKuxU41
	NAu+H1zb6l0lpGaOfpB/y0kYoBvUMbAjQIL+kA9vjbRR4BCkZMT3FlaVcDMWtZFlxG9/OZgvHhE
	TquFTmLRqxEG666RqjMe3XdzPkBTgCPMCkRgVxliToi+oKAbpXFscyAivuk5/sC7fp4fVmFbAr9
	shE3dt0Sw0qztKRjYciI90XG0a6BmSZTWaZPzFYAZUp8D+8da/jw==
X-Google-Smtp-Source: AGHT+IGn6qVIdCSHwhrPC1gJqwBrvK6krzCrgmGdVcVIh8pC0eWA+kD/oRIoY5s7r5uGCIuLAyh54A==
X-Received: by 2002:a17:903:1c8:b0:297:eadc:3cd5 with SMTP id d9443c01a7336-29d648abdb6mr335365ad.15.1764695361233;
        Tue, 02 Dec 2025 09:09:21 -0800 (PST)
Received: from google.com (129.35.125.34.bc.googleusercontent.com. [34.125.35.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b68805sm17547149b3a.9.2025.12.02.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 09:09:20 -0800 (PST)
Date: Tue, 2 Dec 2025 17:09:15 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve <arve@android.com>, Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] android: binderfs: add missing parameters in
 binder_ctl_ioctl()'s doc
Message-ID: <aS8dO9V4suAPF4QG@google.com>
References: <20251121111203.21800-1-adelodunolaoluwa.ref@yahoo.com>
 <20251121111203.21800-1-adelodunolaoluwa@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121111203.21800-1-adelodunolaoluwa@yahoo.com>

On Fri, Nov 21, 2025 at 12:12:02PM +0100, Sunday Adelodun wrote:
> The kernel-doc comment for binder_ctl_ioctl() lacks descriptions for the
> @file, @cmd, and @arg parameters, which triggers warnings during
> documentation builds.

Could you please add the warnings here?

> 
> Add the missing parameter descriptions to keep the
> kernel-doc consistent and free of warnings.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
> https://lore.kernel.org/oe-kbuild-all/202511201725.ni2HZ2PP-lkp@intel.com/

The link for the `Closes:` tag should be on the same line.

> Signed-off-by: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
> ---
>  drivers/android/binderfs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
> index be8e64eb39ec..47f6d1e5971e 100644
> --- a/drivers/android/binderfs.c
> +++ b/drivers/android/binderfs.c
> @@ -224,6 +224,9 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
>  
>  /**
>   * binder_ctl_ioctl - handle binder device node allocation requests
> + * @file: The file pointer for the binder-control device node.
> + * @cmd: The ioctl command.
> + * @arg: The ioctl argument.

Can you please follow other kernel-doc format in the file? e.g.
alignment, no period at the end, etc.

>   *
>   * The request handler for the binder-control device. All requests operate on
>   * the binderfs mount the binder-control device resides in:
> -- 
> 2.43.0
> 

This is the wrong file though. The reported issue was for the
drivers/android/binder/rust_binderfs.c file. Can you add the same
kernel-doc additions to both files in your next version?

Thanks,
Carlos Llamas
