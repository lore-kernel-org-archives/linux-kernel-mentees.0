Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE214F8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2qu7G0s"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 433F441B88
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 10:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 433F441B88
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I2qu7G0s
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hi00wiIxFZrX
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 14 Nov 2023 10:44:35 +0000 (UTC)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8008141A32
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 10:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8008141A32
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b40d5ea323so3484587b6e.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Nov 2023 02:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699958674; x=1700563474; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ese5ke2XLpSRBDcMeCq3hzLNmJ5F/1muLUoYSwpaxSU=;
        b=I2qu7G0sR+KdfLFwzo+vkoMT5ZP8ltU9PwIO1eTdbKRWR+W4/9X2qfAje15/cltIwR
         u2cQn1Jqzqq+DXs7oMb+5xRze1TYfUh+MGfqYCrHIGwbm1YTk5MHwjFS/CPV1iH/YSjk
         eiuotS6KrYoR/q9AExBWRE9/dw9I/VEeIJosE/M4jf9gIg/egetpQMKEHBmXrP4GiSoW
         /HL7a07v8oOCGAfPKFInLcDMGoxdvJxF9Y0DgEVxm7V8sykvql6La80V+eheazfWfoaz
         XvFJM5YbPSA2bL9MhdVZgNrhv6VfIgi3OfwKgJXZ0YnYyRB7GAIiR5ytCeL6mwin7gYZ
         pNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699958674; x=1700563474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ese5ke2XLpSRBDcMeCq3hzLNmJ5F/1muLUoYSwpaxSU=;
        b=F70LBB7FKLzR57XvGzpA4wztdaXD8QYScr0yuRPx2y2C5zV/7QdNQZGLEyfPGXKfO8
         7q4kBgZi/HRSvO2M+N27tsn2sdJeK6deDzHdCJYaHx273JbVGAhUquhVbvVwuDlTKcgA
         XBDwotctfE7R+zNmvU5cqDZjJln35Kngpt/e0EZuypfoqRh4Vfx6WQiG8hV8Q0kkcMgd
         KNQPOEedJyX7BO1d7XqK0eD3YZ+lqlfdGpz9eCcPjfFMESzZDsTfw+VsGQZdpWxwixda
         Cdha2Lx0Bm58XvbElNdks+Uui0YH0s4j4zqgitKk/wUUwR+g/grWolk5Twj45YbpLqkc
         Y0rA==
X-Gm-Message-State: AOJu0Ywt9P8g8Q9Q56SKWSqXXXpNNUW9DYnkTiUkgtpq2o3IvAIlDEIB
	/LXU1Q3hCDansySItLgCpyI=
X-Google-Smtp-Source: AGHT+IGQnH4wysP3HUc+bm76QQNnQoy8z59V+hxPrwkW//Up3vQN2jRytRbS8C5DgblMsthrDZb/xA==
X-Received: by 2002:a05:6808:1794:b0:3ae:4cb2:fb43 with SMTP id bg20-20020a056808179400b003ae4cb2fb43mr13561395oib.21.1699958673982;
        Tue, 14 Nov 2023 02:44:33 -0800 (PST)
Received: from swarup-virtual-machine ([171.76.83.22])
        by smtp.gmail.com with ESMTPSA id 201-20020a6301d2000000b005b3cc663c8csm5279641pgb.21.2023.11.14.02.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:44:33 -0800 (PST)
Date: Tue, 14 Nov 2023 16:14:27 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	jiri@resnulli.us, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] netlink: specs: devlink: add missing attributes in
 devlink.yaml and re-generate the related code
Message-ID: <ZVNPi7pmJIDJ6Ms7@swarup-virtual-machine>
References: <20231113063904.22179-1-swarupkotikalapudi@gmail.com>
 <0d902d2b15ef44e9e0157d8012c42347ffeec86e.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d902d2b15ef44e9e0157d8012c42347ffeec86e.camel@redhat.com>

eOn Tue, Nov 14, 2023 at 10:45:23AM +0100, Paolo Abeni wrote:
> On Mon, 2023-11-13 at 12:09 +0530, Swarup Laxman Kotiaklapudi wrote:
> > Add missing attributes in devlink.yaml.
> > 
> > Re-generate the related devlink-user.[ch] code.
> > 
> > trap-get command prints nested attributes.
> > 
> > Test result with trap-get command:
> > 
> > sudo ./tools/net/ynl/cli.py --spec Documentation/netlink/specs/devlink.yaml
> > --do trap-get --json '{"bus-name": "netdevsim", "dev-name": "netdevsim1",
> > "trap-name": "ttl_value_is_too_small"}' --process-unknown
> > 
> > {'attr-stats': {'rx-bytes': 30931292, 'rx-dropped': 87,
> >  'rx-packets': 217826},
> >  'bus-name': 'netdevsim',
> >  'dev-name': 'netdevsim1',
> >  'trap-action': 'trap',
> >  'trap-generic': True,
> >  'trap-group-name': 'l3_exceptions',
> >  'trap-metadata': {'metadata-type-in-port': True},
> >  'trap-name': 'ttl_value_is_too_small',
> >  'trap-type': 'exception'}
> > 
> > Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> > Suggested-by: Jiri Pirko <jiri@resnulli.us>
> 
> Please insert the target tree in the subj prefix (in this case 'net-
> next')
> 
> Does not apply cleanly to net-next, please rebase it. 
> 
> Thanks,
> 
> Paolo
> 
Hi Paolo,

I have some emergency,
hence will not have access to computer for next 2-3 days,
once i am back, i will rebase and submit the patch again.

Thanks,
Swarup
