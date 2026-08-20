Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39C94779BE
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Aug 2026 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240280; cv=none; b=qA8KJNZ9j/nvtrGyEdJtYXEoCU3Iobt32lZMCoSJirWDgZ/7SsGH79hQxq7rDJYUxbLShTQNqkRwwK9zT2/XrmZf5xqv24zPasxoITskIvYXWSmfj9WwhyzTPFrEzcRvAkW/vvt43yIdjmJ3y3y+4ZaNMbjkMvwglpJtj+wX9mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240280; c=relaxed/simple;
	bh=SoQxoLdbmjdyviQosiQTbT5uXwu+6hvszwAP4fgXAj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8rnkEofJRE2nVO/7CAYGgtVy+qANAH9GXJEZbPeRZZIzN7HAAeLfqUMb84911xdhXqCfIThzyeX7fmCAn9Z1suJn4QivhO1FdgRyKcrRFM2Fdm+fDpRrGEUhhKBkQYGVbaT8qfleFkxCkyiqBuk3pnpOvNxHsZnf5qadct/0rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4v403CX; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4v403CX"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-934944f2d22so165454685a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Aug 2026 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787240277; x=1787845077; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9BUJ4+/b8Y4cDYHV4mYzIjIyZ/egReanH9w2ttMKuRw=;
        b=I4v403CXtDd7GVZEJwneSiT9x/qU7mo4nB3GM6w97r9PpAJGMcohnfjHRGbAWsAzMb
         R2lO6DowXmvQS3UGTbI4DCI8q/g4FzBFtQsJJv/xMldXyxHC2xZusGa8345DafE3Kz6X
         QXRnA+1eTR/O1C56tJ8BftJmVyPa4HXZDF1BBWTWlmCMk4FYtuq65yF2tl54UHSez2uG
         T9hF3EUfAPuq12kIWuWU6uM49Ce09Syw3CfzMnDPXtr1ZMnuhdIwDSoDCkoCpnM/5PnG
         JZPtTOFyJlH1uZc81GZPao7y5Va5HeGiHoVDEi5hLnMblHFOHz/daZJ5xMk/18uENnVA
         zLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787240277; x=1787845077;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BUJ4+/b8Y4cDYHV4mYzIjIyZ/egReanH9w2ttMKuRw=;
        b=lIxoKflFXNu+5qDGqNfHIfJbvOP+4ZmtGlYRsg5aqR2ipSuLsOZEZsQAYBJ5T1d+gz
         mYtZDKzklhCXS5pJ7ydWgYeDjTYvd8d1yrI7gyzXZYdu8b5/lc+QEPdJ0mtftuDhp028
         7MWXWPGj7CY1ILLpiHmLDjG5yTHl38sh5T1+xfgVTS226hjwNAOZKcXP1xOHgId+zoe2
         QNQ7wTa+Oz3IoMAsVlzNXpTO9hrca5fj8BtoF5E+CZRZFoTfsvuysJCkppbm+lV9ISUv
         96O0dISaI2s7tpnZkdtc1b2WAql9bdEHSMGCdtkIGV6e3Rcxd6lAm4DlOG0f5R3dVPZM
         ptLw==
X-Forwarded-Encrypted: i=1; AHgh+RoKRxSjnpon+OE/8mkUF17uBjUkaDBT1XHWiEK/RM+RcsYVSZMTW9YkNRHbkAB3kXd/nRlwzeUI+pLr9tjohfW9T3TZ0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGdjLw95fQK2xRaMyBFec2McTXV9MxWnamQQbpM8LQKxN61EmO
	MPgUWEXv3Iz/Bv/AWRWgDVoxSFaTbZtc/3dDIfIKZYJKy6IYwk7gP8Bg
X-Gm-Gg: AR+sD10aTS3nrN4s1SQnI5ta3Khp008Fb1l+Pfj1gm/x388jg822qYzArYete8HxLE3
	mhvIQrAVKzOHlcOfJGEzqnka6b/MT8FwEaLBx5o+JeByXmTePfaYKOVbSg6AFqFdsP8slxrFv1O
	OLjpLKN2DB4vVb92zPXWJkbBYlPbh1tYVg27lW+4HMxpEGBb+iJVyml3p+AGKLl4D2TKdmmbZ9f
	WenXh9/0Jivnn6ke363hXeZAECHgPucAREIpukX7DAOMGfFuA/W/SwDDphJ0km1qQetAGCAmsbb
	XQgWCh/keHruE9ff6defOiHye63RYSDlnoYPVWBxBC9Rf+sWeZVSR4rKHjSS5bYpbn9EUe7DWOM
	Twrn8QIGbELepQPvzfEM69A5ZUDOHZz5cXnvVWAG/9dQZpGerpqD9iHcAX/2AHUExyF5mQnr7p5
	d7bzbrvMCCMNvKyBmlMd6S8tGZNf9pMDQK3BLylHh37uDu5Bf8Plqeu2MP3vac3YwNIFQ=
X-Received: by 2002:a05:620a:268a:b0:933:9e3:b95d with SMTP id af79cd13be357-9371e678ffamr1367982685a.43.1787240277177;
        Thu, 20 Aug 2026 08:37:57 -0700 (PDT)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720493f40sm393716785a.1.2026.08.20.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:37:56 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:37:49 -0400
From: Marco Chen <marcochen.dev@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: dan@dlrobertson.com, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, jagathjog1996@gmail.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v1] iio: accel: bma400: remove completed tasks from TODO
 list
Message-ID: <aocb9uU4vz4FBo4P@xiaolong>
References: <20260813150103.56350-1-marcochen.dev@gmail.com>
 <20260817161523.00001feb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817161523.00001feb@gmail.com>

On Mon, Aug 17, 2026 at 04:15:23PM +0200, Joshua Crofts wrote:

> Strange that these weren't removed in the commits that introduce said
> changes... Anyhow, not sure if this patch on its own is too much churn,
> Jonathan and the other usually prefer these to go in a series of more
> changes (i.e. if you do the power management TODO, you send this patch
> in the series). This is up to Jonathan however.

That makes sense. I will resend this patch as part of a power management
series instead of an individual patch like I did here. I have ordered
a bma400 and I am reading the kernel docs on runtime PM and other IIO
drivers on how they implement it. 

To Jonathan, do you have a preference on how the power management
series should be structured?


