Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FA81AB6C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732112252; cv=none; b=A9lV2L2Q+rpSg6IKjPJdA7GRSpO/pk7/9ecGMqvERFk6GIu7QcObutM9H47NUgSt4g/VgNyPEgotM/tFSE+4vQn2P7PnCzki0dj6EgMpfXv5JQ1BGghwUjvmOLkcau7FsS/AOYpJqO5zGZtWLMWlbnfZ/jwS2g5CHIswiUbfZJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732112252; c=relaxed/simple;
	bh=HogWdnf+gEHBSeIlBDgdFSdAuYMxYp4y2Azfwc74ToU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPYQlBuRStP6NnWoL4rE6q/5lG5mNaiWprDh94k+5fFx1eCA3RVLQSdL3izLMpI2mc8bdo9nwJiWqNlUV2zdWrWvNk7GHRsn2EUFdKblQiBkdVp8Uvn5BOfdBm/AZrXRa3J0bwB4HNo+mzkgpoveNCqoX0Xiwayhn4XYYzDef94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxoiBHQi; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxoiBHQi"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C31BC402A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 14:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCTPDXHO0FXl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Nov 2024 14:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A105540003
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A105540003
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BxoiBHQi
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A105540003
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 14:17:29 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6ee6a2ae6ecso48147367b3.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732112248; x=1732717048; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ccxSot4avXFbxADK2ckghODPjyViSvYvN2WCFkbOZs=;
        b=BxoiBHQiesiTnNMqwaH6QDVvm0oZ6OpHJGitsQRXuTbQtPBl8/cuAEh+PLgL/lUnJM
         YJlyTwJrTIeykdjMYf8B/kuoD7gvwSEyEbNjprj/hm4RIsyT/4m8CVwiakRSfsU2NQva
         lnOu9+qVa3b54a60AW6bLIJt2b1ckSWEtYHwTJPQlKtLze+CgwIFjMBG9Fohy/lEPjkr
         o/3RC7YQkfSFuAjvxJDReoaWshsLHvtvmahyV14dPXRyoqf3b7Drt6bPXIEkcKbIzLlE
         EPfS3eM8R750ywesnTYn/kpURe7PGsno8+igTU9d9LSiafQFNKLWHroZB4KcFfPtVTA9
         Grwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732112248; x=1732717048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ccxSot4avXFbxADK2ckghODPjyViSvYvN2WCFkbOZs=;
        b=btUJbXgrSjeTRjVnV3Vh8krdJlfHV6ELm4rONtT7P/CXHOyHAU805FDnOTchDnLIGp
         yTuAvhfhaVFXtUiMhTE2SYbTf2NnAx0BKzL2V/amR9HmiS18QUuyEgL5/r46QS9p1K7f
         CDzLVOREXkEnwBvo4hPYZX9GX0IHNsgEIPgaS6dMwLgxGjLQihxIipsTToWOWpI+GQ1U
         K5Ks+Q2EIdw8sdujO/JD7AEZz6wp81L2X3OA6HmheJBSUJkaAEp0RPhbhc1bh/4KRhA7
         6WSKZYyoikKHXHOe6tXSvP7jmJwMVla2HU1gIWTD3+7tSQnL5vhyW3GZWlaLNOMgwy4y
         1eaw==
X-Forwarded-Encrypted: i=1; AJvYcCUvT2yiNoLUFk5If6noYBd8rol9yKlneyBrZpDxQhdzCYLxbdekfDXL1RdokrpUAVsUqebsJ7Mc18bbwrrKvhf4n3uZ1g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyHJYkkJwYPZ09zKZwJleUcrML2KsYN1NRiNVkctFwr9QAOzYuP
	qTGYRPiiibfQtSih6n3/RFq06kYd0kpbcIe/XJLj8McTvg38b/Nx
X-Google-Smtp-Source: AGHT+IG2fbF9JPwAVnL8nmjAvhR+0CJ3T/VO5RNO7UqN1gUoGlhS73H4DQR0txfc26cb3YoxEIeBYQ==
X-Received: by 2002:a05:690c:4b81:b0:6ee:7797:672 with SMTP id 00721157ae682-6eebd0d6e1emr32242637b3.7.1732112248013;
        Wed, 20 Nov 2024 06:17:28 -0800 (PST)
Received: from x13 ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee71341f80sm22515297b3.85.2024.11.20.06.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:17:27 -0800 (PST)
Date: Wed, 20 Nov 2024 09:17:26 -0500
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"rbm@suse.com" <rbm@suse.com>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel-mentees@lists.linuxfoundation.org" <linux-kernel-mentees@lists.linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: remove unused sg struct member
Message-ID: <Zz3vdkEzSobJ54bI@x13>
References: <20241119212452.269255-1-luis.hernandez093@gmail.com>
 <20241119221907.tyt4luboduaymukl@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119221907.tyt4luboduaymukl@synopsys.com>

Thanks, Thinh and Greg, for the feedback!

On Tue, Nov 19, 2024 at 10:19:09PM +0000, Thinh Nguyen wrote:
> > Previously, this patch addressed a documentation warning caused by the
> 
> Remove this paragraph. This context only makes sense in this thread
> where the previous patch version is visible.
> 

I’ll update the commit message and remove the unnecessary paragraph as suggested.

> > Reported-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> 
> I'm not the one who should be attributed to by the Reported-by tag.
> 
> I think Greg was alluding to this report by Stephen Rothwell:
> https://lore.kernel.org/all/20241118194006.77c7b126@canb.auug.org.au/
> 
> It wasn't Cc to the linux-usb list, so I'm not sure if you've seen it.
> If your change was base on the report above, then you can update the
> Reported-by tag accordingly.
> 

Regarding the report by Stephen Rothwell, I wasn’t aware of it before. I found the warning independently while trying to compile the Documentation subsystem, looking for bugs to address.

That said, now that I’m aware of Stephen’s thread, I wouldn’t mind updating the commit message to include a reference to it if you think it would help link the two discussions. Let me know your thoughts on this.

Thanks again for the clarification and the reviews!

Best,

Felipe
