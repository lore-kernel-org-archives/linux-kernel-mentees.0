Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D529E4501F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 Aug 2024 18:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722624055; cv=none; b=FCDodRRepm+uyRVxOSASjH1JF9mcCTCr/DFMylIxmaxvouv/SohJcRmOyHnHkus3ZMByXbhYJ39QJq02rkcw/MhzE4hbhEO+3fjAsDd6CHKlGv/UT7fm06Y2NtFa9zbWva/eVEX6pmXqE+bHZEQhosRvIekM7GQ6pPrGK4SUDHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722624055; c=relaxed/simple;
	bh=soaWkkvxMuF/KL4j9NvlZDNMnUsdIhZ7s8k20vjq8Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAnBzzUbGlGOJs8xhCSQ0Is2bFCz6+nyR0AHiyqsRAnwua/fslOk0JergAJ6Sp8xkhaeHQR4Qrh1XvDH6VJJmn/fpMYOa3zS/4pJaFe7o4ZmPDA3W0TwZRHoZKiVG2LrwC3dQVBT5fzwTPqUnQoKFrdMAz4bXkiBIYW/U8fNzTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mN3d5aDi; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mN3d5aDi"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 759DC811B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 Aug 2024 18:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c1KaS2BNerow for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Aug 2024 18:40:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=dan.carpenter@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69FE580F71
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69FE580F71
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mN3d5aDi
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 69FE580F71
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 Aug 2024 18:40:52 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3db23a608eeso5566779b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 02 Aug 2024 11:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722624051; x=1723228851; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e2MgDSbbqQmpy8ctPauIiw6bFDpeTQHQdACe1c0ZfrU=;
        b=mN3d5aDiCchsdKPHzIt0s4YyFtBj4HFVMDooVw9xPMlS9f+vJ//EM1dslDi2WVjLCG
         yEK3ifsLSn3/vWAkLzR8jwHbgUMQztnaXKdudK1WdvYUGoW+oXhpsBSsPZNO1dflsBIy
         JC2b1DAYfZoI3YzTkuin44j/1TY5855QLl3f2Fe0hJJxxbOWa50Yh70U7E2vJ6T2b5fM
         iBLX4Jk/h4t6hwwyRAbbtys1KfImGm0o1rEa4d8okl8VjsDYSsahDCBJK+yWUDoQmq0Q
         4bijyJgr1YnQFUjVva/MAjLNqfJ4n1tfbMlMHDuEZcdRgtPHfbVbSwCVSJIE/GRluwbu
         DWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722624051; x=1723228851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2MgDSbbqQmpy8ctPauIiw6bFDpeTQHQdACe1c0ZfrU=;
        b=Ub40ihUYp85ac4xEza8v94bfNBAWYpkMOoNihtFdpsskG0cYFbvNIZFHwirWcPf1Oi
         Tk7kUQb8ONQiSpoyXz3Seiahnp923d+0us519uYMzvMbZGR6dSPQAssSE6lnZ5lOWTXH
         z3wrm8Xywtd/tlFy1aSqpnrFJmHgSLTu+heoiKRf5ihAiv5XLgGhepck/f2FiOgW1rnG
         RWOYkPh5Px729cpIjjevtgBxCuFvv8piImlb8x/4puJn4U6fVSq4b0RX6moaasjHvVfu
         mt0pI/rpnAtNoYqstmUXk8UHRLtW7BOjQXIYiVVrkJ/wZUxiM5ZOl7isTRd7+zmr7xw2
         kGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwutKu5lWMNODiBtlBqjeS05ZCsm2UmkdQKO1k0+etYBDwq8wK/IQpJjO+zo9JONlnmpE9BZgeA2z7LYj1tXfsVUJMaU7ibejyR0v6AQIx4Jwq6OmGD4u6EKO8Qlaf
X-Gm-Message-State: AOJu0YyBFUAAwe46HUeH9d5wU8jdJ6AkMRK9EJratX/Zexc0X6VN8Rt9
	NVi2yNLZrKIYFxtu3uetdC+ZNijp24ZEepALsUHhYo67d/EoHWJvqzH6MMp/YQQ=
X-Google-Smtp-Source: AGHT+IEbOLxLULZE+aqsPWXdEEIDOBEB5UNl3N8Whqj1J3sEeVgdjd/tswCl5f1XStLJ5RnuoLGyCA==
X-Received: by 2002:a05:6808:158c:b0:3d9:2348:6d94 with SMTP id 5614622812f47-3db558486e7mr4949302b6e.46.1722624051319;
        Fri, 02 Aug 2024 11:40:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db5637af3fsm572507b6e.28.2024.08.02.11.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 11:40:50 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:40:48 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
	gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Message-ID: <a779ee26-fe93-47ac-a25c-b842534e0317@suswa.mountain>
References: <20240802180247.519273-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802180247.519273-1-abhishektamboli9@gmail.com>

On Fri, Aug 02, 2024 at 11:32:47PM +0530, Abhishek Tamboli wrote:
> Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> and uvc_v4l2_enum_format().
> 
> Fix the following smatch errors:
> 
> drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> error: 'fmtdesc' dereferencing possible ERR_PTR()
> drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> error: 'fmtdesc' dereferencing possible ERR_PTR()
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>

When I reviewed these warnings in 2022, I assumed that the error
checking was left out deliberately because it couldn't fail so I didn't
report these warnings.

Almost all old Smatch warnings are false positives.  That doesn't mean
Smatch is bad, it's just how it's going to be when you fix all the real
bugs.  In this case, I just decided it was a false positive.  It's
possible I was wrong.  Other times, I report the bug and the maintainers
say that it's a false positive.

There are some old bugs which are real.  Sometimes I report a bug but
the maintainer doesn't see the email because they go on vacation or
something.  Or someone sends a patch but it doesn't get merged.  Another
thing is that if a bug is over five years old and minor then I might not
bother reporting it.  These days kernel developers are very good at
fixing static checker bugs and these kinds of things are pretty rare.

I don't review old warnings in a systematic way.  If I fix a bug in a
file, then I'll re-review all the old warnings.

If we decide to merge this code, it needs a Fixes tag.

regards,
dan carpenter


