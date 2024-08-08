Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6174B137776
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723137372; cv=none; b=SGraucOXg6qzsVqqCVKxib+TNI4p+Z8cdB0zA9/CsAALDeDfOfX4JmOLm7Egj+OyIzrB3ASlrlSbmD+X88oVCWNRhDcsMf3IfAlSxuUXA43aYqHWQU6ejnLv2BceI/stYUBlQOPwJ5CVomIY1+Nw32QyGObqRyEbfyDrI425fQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723137372; c=relaxed/simple;
	bh=AmfAKhd7JZNmHVCMtwv1yOYawxwb64qdiiGQS1yGea4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cf3iEOHRsAyRG7Kp1/WLZLd4EjLZPKbubyLEEWcQp/SHNojp2tBilBe8gU5jmmBguPp5oapali6k7cjLHDpkziTpeFofIGdcPocjOQ1YbueSKFUvnXgK78z7R0bVK3XDXYARJDsKZGM0PFDpZIkBiZhz816XjRG1mrdc7VkH9W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dN8X+Mnw; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dN8X+Mnw"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9834460B16
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 17:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anAeuozCKy9O for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 17:16:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=ricardo.marliere@suse.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 123E860AF2
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123E860AF2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dN8X+Mnw
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 123E860AF2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 17:16:07 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52f024f468bso1378563e87.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 08 Aug 2024 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723137365; x=1723742165; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=st0s5Z9mi2hAD2ReYlxZIR+JXV8s4jkhXBC0CZCPwXg=;
        b=dN8X+MnwhL5DDkEsSjhuYJoKoSAm3XpQyhprzznf+ZcQ/L6vHiAHC9YEVpd6HaG3UQ
         osh4cDEA0SAhJh8A33xASbOkhdiMxcXw5gWMVp5UY6JVCxpuYmkecmepWPLUw0vRzvTa
         L0DilAzeAFFVNSz611ki7/1ZlXBJGgAZ+AwVj5tCA0wURKNslPwiuYybBkY1OwPM7CV3
         Ko7Z/67ezswnhMW+dxVlD0GFYmMhGwyu2BTCfVnPhtHwZmjLqz4RkxzN+VpuU5IaGE8l
         XTcQFSG3GJRhrRkIj9qPO+UpGFll1SQHQD4xj2UaYfSmZGqrhpyagCnHmMjpnACLIekS
         QVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723137365; x=1723742165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st0s5Z9mi2hAD2ReYlxZIR+JXV8s4jkhXBC0CZCPwXg=;
        b=WK/CnG5iB7jC1/FZpY/Cy5t+T3801T8OmiLBWl+Ne7NSErLLuNvm6bc0EDchQTBXUR
         g0t5NHYQaI1unZJh0J+7T98lMax+ioHxy2ckVb9+erAU4zV+4WxQY7heYFmuIjfJU1nR
         jIwQrpcridyeVajDlahuQnUYvq7qBa7GK7VN9zwnSCtXYJVLQYCWsw44ryCA3rc3SGM1
         o30M4nFTT2zYQT4ORd8C/PiN9sbPKtTKx+M7dMJV6em96hg3ZtFTA073iOI/0C2n5y9G
         ckPncKvhT0nXCDfFgCxjTqetYIIPxJQxHLKq9F+dMGHhdpTBDaFkAPXKP/UWVevCZlix
         ZJyA==
X-Forwarded-Encrypted: i=1; AJvYcCVerKQxzUV/OenuszY0lUy7zCv1eQlFQePf3HSjfIiraxnFZtCRC9Td4Hjeqw8npk+hgNpNU1ep5V47fn+qQy+dKLRh75BYr62DGb5/s1R0NseLY9bTUGLHtKgYLehK
X-Gm-Message-State: AOJu0YyvVqtUyd8vriQcn2653DxCnpHNodLW3ix3yNwlnSx8e2zQVPD4
	vsL1cceW5zKIU+JZiohryTT37pFao/Jf9qdVZ5+sKqbTec5I+QPiwHgjKa7+Kyg=
X-Google-Smtp-Source: AGHT+IHsgX30qz3orEWU6+1Q6Da+D4eKSRWcSdtLZ1meVBwhaimtR7PA766jQg4sICJhnA+RF55TsA==
X-Received: by 2002:a05:6512:398a:b0:52e:f2a6:8e1a with SMTP id 2adb3069b0e04-530e5843ed7mr1796625e87.29.1723137365170;
        Thu, 08 Aug 2024 10:16:05 -0700 (PDT)
Received: from localhost ([2804:2484:804e:2e16:dcc2:6ad2:464:9a29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5917829esm126911615ad.215.2024.08.08.10.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 10:16:04 -0700 (PDT)
Date: Thu, 8 Aug 2024 14:15:58 -0300
From: "Ricardo B. Marliere" <ricardo.marliere@suse.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Pranav P <pranavsdreams@gmail.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Added extra word to Extra Version
Message-ID: <5cehhbme7e5jvwqv2aolqbmwrm6m6ttaxjifxew23wbhahombz@uupdjxrtu7ec>
References: <20240808154824.13390-1-pranavsdreams@gmail.com>
 <2024080800-reply-fineness-f5b8@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024080800-reply-fineness-f5b8@gregkh>

On  8 Aug 24 18:21, Greg KH wrote:
> On Thu, Aug 08, 2024 at 09:18:24PM +0530, Pranav P wrote:
> > Signed-off-by: Pranav P <pranavsdreams@gmail.com>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 8ad55d6e7b60..9a4012a08c0f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -2,7 +2,7 @@
> >  VERSION = 6
> >  PATCHLEVEL = 11
> >  SUBLEVEL = 0
> > -EXTRAVERSION = -rc1
> > +EXTRAVERSION = -rc1-karuvally
> >  NAME = Baby Opossum Posse
> >  
> >  # *DOCUMENTATION*
> > -- 
> > 2.34.1
> 
> I don't think you meant to send this to me...
> 

I'm assuming he sent as part of the application process for the Fall
term of the bug fixing mentorship, but forgot to strip the public
mailing lists :)
