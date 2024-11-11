Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BD242A87
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Nov 2024 03:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731296407; cv=none; b=Ph3UIzLAi9wcCU6cH0oXxn3yR8JAOVGeOaSENyUle1k/yRW2KmOjMo/+fKFbzRrq9m6bCQ2kB/JLR8FWnpd1HeDIS6jjhHW7xFbwekh3cizV917uQODwO2phTtIUPF+06jMwB3mxbvn9M2OhcnaLykuDclj4+AlOegU6H/odBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731296407; c=relaxed/simple;
	bh=fSRFxOIHYXaSA7eOwGE5mLfQuEaze4Ccuwl/tYlUH3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikNXf6PlW4ctty8Z4FAvE6y4Kyn4FoS0UMWvalITSvloh1LN63VyoQ47n5cTW3KQG7HUBcSUMKZIM3OHjwLrXMBTgMcdum2YoSAc/fgqq5hK5mfBXpiRdrEaGntr1C0TKgI8B9pwRhEkR4QSQxPwzXSV3qujx2jxI3/LOJnUgZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7pWMmzW; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7pWMmzW"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE26160591
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Nov 2024 03:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9TiqWixJ4pm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Nov 2024 03:40:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 623AE605FC
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 623AE605FC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m7pWMmzW
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 623AE605FC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Nov 2024 03:40:04 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-513de4267d8so1572234e0c.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Nov 2024 19:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731296403; x=1731901203; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g70jWIyUug07mNUn0baReqb5XDvEch87p3FhpcHNA+U=;
        b=m7pWMmzWO2iaPNDpmME8xOe7rWiMu2rnwHfIG8UCM3wowftLzw+9W0KG8l0SDn88vZ
         nsONYpQ27PTkAL0HDVK2R4nQzp024DxKJjcFXvmFuyvPdinUndtE3ywIvuoiYtdR8w/V
         lw14b8An+wLj3PdGLyGQ98rDhB5cMS10DSnynoveqrTpu8ZzaThS330ZWB+mE4PYzE+R
         pYj8A8mOIUCiNTxBAhoFdW5YCUEO48RH/qLxbqrKkf1mdny75Ynf9Ew4d/kDjj1GI33m
         efubkEcB7z5Il4HVtmbdsw1Wb+LrozaybDuzs7qL9/VrNvD1TRB/DTCZUjXExWXT+dKb
         k6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731296403; x=1731901203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g70jWIyUug07mNUn0baReqb5XDvEch87p3FhpcHNA+U=;
        b=kGkz/SNol04kdkTJ8xQAmlKDrDYJv45edCiWqJSTP86izjvw1PiwhVNqdUxXonGbXB
         A43lrtc+6VRvzuEKfgFTnkx5AUpXvWmNcOACid3TVHoHwFbUmdSVtt/pOCR1CM/KI8lu
         0YDlQw7KvOWfO93EJcv74+0lYIEOUE3hcYEvSzhG/gM/iGf4iYGzztupYYCO1JAV23HI
         dHOUFxrq9YhL5ce0cZsXz3U9oGLZM43XCbY006ejuVxwHhpgv00SISEm3tw+jsfDaM48
         WRJcgF4vwg/z3sSoDm+K/QQ+6XhO/Ct/A9RGgMpnTomZ71yrkwNMXcHtO25Bk4ltZYDO
         ovrA==
X-Forwarded-Encrypted: i=1; AJvYcCUVAdBh6H6wxBuI3oDwwGdneLGAdieH+9E9jJPM0OOoQf9RWF0icAI17ijxRo1kX8k5BNOTuJhg7UYseDlvr3WHfAPo1w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz9RHCCubGrCqlCd1Y2aDLFouf1dVDgvM3MB8WRpbVA5wY94tSl
	Kd1DWXqhLjDPk0Kt71HbHEQFuOLYmq04ISzpW2E96nTnacIFktrM
X-Google-Smtp-Source: AGHT+IFftJfOjT0wVZJxQ21rwXIxbHKtSdb7dxj4cM+94QK1IpVGvOAf4xk7j57nsIKzXOtN8JZTzg==
X-Received: by 2002:a05:6122:168e:b0:50a:caec:70a2 with SMTP id 71dfb90a1353d-51401bc7d7cmr9989178e0c.4.1731296402828;
        Sun, 10 Nov 2024 19:40:02 -0800 (PST)
Received: from granite.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-513f3190b6fsm1601168e0c.23.2024.11.10.19.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 19:40:01 -0800 (PST)
Date: Sun, 10 Nov 2024 22:39:59 -0500
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: davidgow@google.com
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org, ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v3] lib/math: Add int_sqrt test suite
Message-ID: <ZzF8j6KT87aj5G0Z@granite.localdomain>
References: <20241030134355.14294-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030134355.14294-1-luis.hernandez093@gmail.com>

Hi David,

I wanted to follow up on this patch to check if any additional fixes 
are needed. Additionally, I would like to address Andy Shevchenko's
<andriy.shevchenko@linux.intel.com> feedback in v2 regarding moving the
lib/math/test/* Kunit test Kconfig entries from lib/Kconfig.debug
to lib/tests/Kconfig?

> > > > --- a/lib/Kconfig.debug
> > > > +++ b/lib/Kconfig.debug
>
> > > Shouldn't the thing to be in lib/tests/Kconfig?
> 
> > The Kconfig entries for lib/math are located in lib/Kconfig.debug as per
> > David Gow in https://lore.kernel.org/all/CABVgOS=-vh5TqHFCq_jo=ffq8v_nGgr6JsPnOZag3e6+19ysxQ@mail.gmail.com/
>
> He put it as "Somehow confusingly, ..." meaning to me as a signal that he will
> agree with me that moving that to lib/tests/Kconfig seems like a right move.

I am happy to make this change if it would be beneficial.

Best,

Felipe
