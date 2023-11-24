Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4AD33CE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Nov 2023 22:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b="K8wYQGHw"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D079741D92
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Nov 2023 22:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D079741D92
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=K8wYQGHw
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6zEbMbCRSD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 24 Nov 2023 22:30:03 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DCB8241C26
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Nov 2023 22:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB8241C26
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b2b3da41eso16554315e9.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Nov 2023 14:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1700865001; x=1701469801; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9aMoVAYZDthyr2anGCDJRxJF5mVykGeJEK+2TP+uDA=;
        b=K8wYQGHwGDVvjgYXotUf72ODahzgz1De3pAAi1Ub9ukuDQbd+hsfRZXngimzrKJ4NH
         Uf7wQkWyNo1WzFw+w3GC/EYUk3d+LE1j0q1oW6TCTNPYdY3stRCjsolwm3YHVv+rW4o7
         Zq0AH20e8GXk+9P3XDoa9UkTqVFttVfpsjtk52tPANYcpQSMDuMVsIzXsyoLjBgiBO57
         tYlFuZX5DXRX2jixSLZmTT+SCRw8CLtaUhGJoJ2woFtPCtx3YkDlDkbh8pwqD1QY2/OO
         dapUDy1AxY7BBG+mAZw3Q+FVq1YyOMEcASaFL+Koj441oEqhHpjOMIRZ4Ho+M6XVaebc
         M8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700865001; x=1701469801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9aMoVAYZDthyr2anGCDJRxJF5mVykGeJEK+2TP+uDA=;
        b=m2TL1OL7OhRjPXod8rSZUJWjSmi6Nkd1NsGdnZvqKuJxCZWLylYW6htTk035RFmqAW
         kSx2v9I2enMKyfkIZOKoIiMZ4C5D5pLnU54ZcHTjpHd+aBKEr0IBgKrSx8plbxfGmS4R
         1KRobiS60/ce+dsxHJGu4ni1bN4wy7uMsubvAQxeri/qSemqSNywC/YRO6sb5KWVKlVI
         /mRPTQd8bQp41xza5XmhTRO14xP6K4R+4WSk+kva7zfT7Yl+hz1hPfqukK/IsQBsXara
         wgJHFornsp5N7UE82M+lOU4ZQhbrdiY5j3+tge72TB5zAaEiZu+sZdRO93rPNseU+bCO
         oB6Q==
X-Gm-Message-State: AOJu0YwuPlM9F7YzDwWD4rclGZWafDJcTsGqmm/AnmHNUPU4UfYEnhtc
	FcHa/6LDimUajZ+FbaJkMaQpTA==
X-Google-Smtp-Source: AGHT+IEriUeR3Amtpl0U1j/IWdPGBWZcNP0dPbDNg/M3cJq/yy5X8cAy7YxhVmrIlfkD8JFMWZQvYg==
X-Received: by 2002:a7b:c857:0:b0:40b:35f2:3b42 with SMTP id c23-20020a7bc857000000b0040b35f23b42mr3286516wml.22.1700865000755;
        Fri, 24 Nov 2023 14:30:00 -0800 (PST)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id m5-20020a5d56c5000000b00332cbd59f8bsm5274213wrw.25.2023.11.24.14.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 14:30:00 -0800 (PST)
Date: Fri, 24 Nov 2023 22:29:58 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH V2] media: stk1160: Fixed high volume of stk1160_dbg
 messages
Message-ID: <ZWEj5sDUs83qn0pc@equinox>
References: <20231122161304.12434-1-ghanshyam1898@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122161304.12434-1-ghanshyam1898@gmail.com>

On Wed, Nov 22, 2023 at 09:43:04PM +0530, Ghanshyam Agrawal wrote:
> The function stk1160_dbg gets called too many times, which causes
> the output to get flooded with messages. Since stk1160_dbg uses
> printk, it is now replaced with dev_warn_ratelimited.
> 
> Suggested-by: Phillip Potter <phil@philpotter.co.uk>
> Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> ---
> v2:
> Thanks for your suggestions Phillip. I have updated the TODO comment and 
> used dev_warn_ratelimited for inclusion of kernel warning.
> 
>  drivers/media/usb/stk1160/stk1160-video.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c

Hi Ghanshyam,

Thank you for the patch, but it is sadly incorrect.

You have created this V2 against a tree including the V1 version of your
patch. A V2 patch should apply cleanly against the source tree, with no
previous version first needing to be applied.

On another note, why are you using dev_warn_ratelimited here, and if
there's a good reason, why not use it for the other callsites in this
function? (Genuine question here, I've not studied the difference).

Please create a V3, many thanks.

Nacked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
