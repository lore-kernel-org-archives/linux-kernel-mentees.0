Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736E529CFB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723712089; cv=none; b=lu6s3qwkq8tCYDzoxkGDBCJIj0+I0YugMMWLPQJGdQe27mgD7aRLuYLWGf3VkB51+IsS74shYou0mEdD0Y6qcx3ja8SdyAw68vs3Al+tpf5CbLYBHDO9iWagcJ84WSUVVUfNQik8z+55UznXkMDXCtjzEHh0zyZRWvcg0cgAWkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723712089; c=relaxed/simple;
	bh=rLKZUBjWrQu2/xjMehdykdJEg7f21xRvPKlAPeHdcvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYi0IN7a9RISgid3UrUxFyNN4/JSqtT8/UJZeagmwhv15Ig7gqamRdw0o5cEIjEE5LMjPpGLp34nxNNObnpAv+rP49Q3Ih1je/dshEWvcP6a3JBQV7Ob0f2alSphXl3ONHxHv6VZzm2wrV+haSUAzP++2pcz+qfC2HPG8tMJaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPYyVFVX; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPYyVFVX"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DCFD40485
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 08:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G86F-HfJ0_3y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 08:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A1CD403C2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A1CD403C2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RPYyVFVX
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5A1CD403C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 08:54:47 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-201d9fa899dso5394545ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723712086; x=1724316886; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DSGDEVznudip6ys8kTBLXc4uWsRb5sdveY1LwBuoYaI=;
        b=RPYyVFVXymW0v0E/U7UAgVqj1VkGKZt6fN6BqeBD4kZW3RjJ15D1yJuqsvx3llpch9
         fVVPAU7T8QeYtIT/esxw0tP37bML9YWWHXEtJfcPt7QXVKpZWYxLyTfIqdLH8vTTyI2k
         tnZcYep2+9Yj5SBvOchtg98vByL2trB66J3Nqi4+c0g/G1WMv0xSwE+CDggzyk0qdep9
         c38CvY6v28oAsJ5DNOddRHNKL9l/kH6s7E/IqEPG8HT7v5bm/cA/0hY9gk243oAg00Xb
         ImGo+IeVdSB5hiMPfS3mKbfAlRLwCY02YV6bI/E7JB50phnY8H7zAFk2P5UcBufTlTyb
         vGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723712086; x=1724316886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSGDEVznudip6ys8kTBLXc4uWsRb5sdveY1LwBuoYaI=;
        b=JCYd0miYtTqiBvumvmrr/WLcRyNsktyetzFsyz+H+BTFiH0TLr247h2XYnXhCHtEhA
         lz7Q9p4BytGHcwXWpiqQFp4Ad7yNPyzAlJTKRcMKCRjdZMYCzNtOm3946p0flqHXAEgm
         XuOBmqz9EC0CdSfCkwZe/pmePW5T54RCcS2gCKFl4DPsXjJtsc6Nb8mLpvGyWGeSNoAx
         SU6Af6vB70uJZwcDG86MPTmMla1drHZPn4FV69sg5JsagVyOIhIdipJ3Ym92TXzLfd5p
         tWXmMYirNFRWeZns8Yo/CfkMb3Iohywy7g55TUnscgro3CyfFUn7UWLc756eMSNp/qbi
         3iNg==
X-Forwarded-Encrypted: i=1; AJvYcCW3vv29QQ9YXNEfZMbAFN61LXG7T4GDk4gBFZzITmAk+4/Y+qMQpgyhmToKRz0wOoVrqzKPS51PRgkBuEpvytImRWzWLBvGLVm1AybQTH84xO6f+bwY8TMhB99/hyXF
X-Gm-Message-State: AOJu0YzPt1eXfWM7VKLaBE2UlBW7PmWitP4z1SKQcvgheoK4xDTvmJdy
	4zA7Ee2O3kpDv5XM56doXy5e66FH7rnwFEZQBzTUipgMODbjY9mV
X-Google-Smtp-Source: AGHT+IEf0iPNZzrNrc2k20f0gWyOQ/VUeh7E2S0o3OJ8b5QhjcsdPmrWU2qkETe7j1Gei30Jpg8Prw==
X-Received: by 2002:a17:903:230c:b0:201:f83e:c25d with SMTP id d9443c01a7336-201f83ec4famr3506195ad.7.1723712086413;
        Thu, 15 Aug 2024 01:54:46 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.235.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f038b3f6sm6859205ad.215.2024.08.15.01.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 01:54:45 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:23:09 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: uvc: Fix ERR_PTR dereference in
 uvc_v4l2.c
Message-ID: <Zr3B9Sccu+1FHW2z@embed-PC.myguest.virtualbox.org>
References: <20240815071416.585559-1-abhishektamboli9@gmail.com>
 <2024081518-fracture-thousand-c20e@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024081518-fracture-thousand-c20e@gregkh>

On Thu, Aug 15, 2024 at 09:59:35AM +0200, Greg KH wrote:
> On Thu, Aug 15, 2024 at 12:44:16PM +0530, Abhishek Tamboli wrote:
> > Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> > and uvc_v4l2_enum_format().
> > 
> > Fix the following smatch errors:
> > 
> > drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > 
> > drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > 
> > Also, fix similar issue in uvc_v4l2_try_format() for potential
> > dereferencing of ERR_PTR().
> > 
> > Fixes: 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
> > Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> > Changes in v2:
> > - Add check for dereferencing of ERR_PTR() in uvc_v4l2_try_format()
> 
> You sent 2 copies of this, which is the correct one?
Sorry about that. Actually, I forgot to add the maintainer: Laurent Pinchart 
in my first Patch v2 mail.

Regards,
Abhishek
