Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AD38C421
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Jun 2026 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288469; cv=none; b=ZKvOSmS3u2nxCB/7srgfpfeLmrEbmHTg3PZPmHi/VVHI3xLrMmax8WJKUUG67SNyc+DnvCMmDqOwQl6g1aT6F/ff4bFFeHFznyDehlE+g6xyPDJSB0nLtFzkAcB0tazP8XBO8ptcR2R3p2gYZyTmSjKzS/DM8HbUqF9lFuE7O/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288469; c=relaxed/simple;
	bh=H/uiRK4DFgVrmzx9/oy4BmqlpiOITf+qW/INtAGh284=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p62Xn40lXb2JitZ/mjPvPj/rSzVniS6EzOx4lebhDVuayisVA6ySXCvpFd5MwhyNiGx39vfzLxN5A+MUBmpFqgUnozK+1BUjoWL4uqTIEnlKEVHu8dQZd0csqw04n6aKJtkXiaR4jp3wfWls9r3b+PLdUE6YK2Ly/ndzzpYfGaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCqBocr7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCqBocr7"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so1180717a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Jun 2026 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782288467; x=1782893267; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WTmHFwXKHWJsH9a/uyEYwOmNv8DNfdZVtbBq17LT/RE=;
        b=OCqBocr7hpgmPqn3zsouC8VpRg3c4QaouZgirG+TSkbupvZ1930R1sVnIBBArrSDkQ
         HeqsiOnCnR9t+3MdeIme1fvS1nhfpBZEtpCGp6E1QRZKzwoRLDmJc5tmER/mB+3ZkENz
         zAbViHOWgCZCG0OHBKwJnTLy6BDr7yjDJ/yf9rBggOF9epNG4al0mEJRbHbtyDTwSe35
         3B3ywjWXf+IR/HLYZZ4hiHqAGCWMZqDGfwTW3Sehek/3RoTigLBy3dnBGtUcazOFAQFt
         bFmZQnbFhi6h53nD9oKINv/Mjp5uXrOjd2W8F9TEgJ6owaqIc5RBuSkmRdOoUKqgAPjg
         0rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288467; x=1782893267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTmHFwXKHWJsH9a/uyEYwOmNv8DNfdZVtbBq17LT/RE=;
        b=AWTRW4Xp7uC8EfWSDwowF4CsDoGj5wZQHdYgcSCQS275/BpEQWONR72vu1siGnU2vQ
         FxOn9qODo3nuQIJMEGfeIPKJrPRa0c4RLDr+exdSNwzfPisoRPpqJ1NLdo5KmilDwgz0
         geuTFW2XCww/0Z26GQIDjL8q3dM8Wb9Fx7KEKFATMF1sbwcAUx/LwGsksUMZ7XW9aGdG
         0UDyDDw01mvzdHuDUiVxf8758Jv124WcwrUm4SbG/QVeTPRafQOOk1nFtMXUmwt4oFGL
         +u8zhffdZNh+9gkobwqacMj6+oPf6bDy1hyBYdw7DjpWATDzl7fxwBkQXNpAt2sjQTt1
         iNXw==
X-Forwarded-Encrypted: i=1; AHgh+RoU7nUpfCNTCuWKMhNwQCx5oR2GIzlpKn7oWaTtec0xuf2M4/InZBaMft9JLbSpB0zADM2Siklf6CHguPNxx+RDbMShvw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywie3C0JKddOWfYI7+04YpjtzvW1SwZMOQOUW++JpI40gO0S2O+
	fO5RVs83pzHgTNoKgqnSLqyC2g49itOtLsI0ZPmFi0MGxCynaobfgTcw
X-Gm-Gg: AfdE7cmZUT3TyXtntqcclHaXjYh9KwSgTRycs9r0onR0Rzo1KWkbocXiMZNyFZeckjW
	mtuRb6fhn4k5bDNm0hQ+A8bzAP7ettS3XN/Kbn773WaRc+pH0s4iB0TZ6qPKf4yWNMSY6GQqbBI
	qh8qEUeBJj2YkuWcLi50GUCkTXHLd9Whuj4zUdvK7I8jrVu6Kr2KzuvWW1ugXq9WjS/6/tK/cL/
	FLnKdBqY9YBuIees+3TFxPXdHv7SD940+eL9lcqQFXDi6N8xHJGNiHqsI9B3yR2mw1LUlSoBkjg
	moq0mn35Ppy7lLOe7gBkYe3gqEAEp9kFOdpr6llL3s3dJKt3NsViAg449542mKT2i9FbAPFk4XT
	hUoilTPMzbo4we0wn+38Aerr6lLSFgzqcxvdY+jQ0AuZoDA/LPrDiRMoCgcH4dRe+HJ58XfBn9N
	yPU/R4Q147
X-Received: by 2002:a05:6402:1e8e:b0:697:f686:80c7 with SMTP id 4fb4d7f45d1cf-697f68683cbmr783796a12.26.1782288466773;
        Wed, 24 Jun 2026 01:07:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f49d73fdsm652987a12.22.2026.06.24.01.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:07:46 -0700 (PDT)
Date: Wed, 24 Jun 2026 11:07:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Sajal Gupta <sajal2005gupta@gmail.com>, linux-raid@vger.kernel.org,
	song@kernel.org, yukuai3@huawei.com, tomasz.majchrzak@intel.com,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] md/raid5-ppl: fix use-after-free in ppl_do_flush()
Message-ID: <ajuQTrWQpQzgI_OV@stanley.mountain>
References: <20260622142146.56637-1-sajal2005gupta@gmail.com>
 <DJH0687PNY2P.1WOW0ATJ2KZA9@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJH0687PNY2P.1WOW0ATJ2KZA9@brighamcampbell.com>

On Tue, Jun 23, 2026 at 10:42:47PM -0600, Brigham Campbell wrote:
> On Mon Jun 22, 2026 at 8:06 AM MDT, Sajal Gupta wrote:
> > Compile tested only.
> 
> It looks like you're on the right track, but this could use some
> testing. My analysis here may be incorrect, but it looks like it should
> be pretty easy to test this patch by compiling and running on a system
> with a RAID5 array, PPL enabled, and no RAID journal. I expect the call
> stack would look something like the following (feel free to correct me,
> anyone...):

Heh...  That doesn't sound easy at all.  (0_0)

I just left this one because it's not really a big deal.  It probably
isn't even a real bug.  We call increment the refcount in a loop and
then decrement it in another loop.  It's not the right way.  Sajal's
first approach is the right direction this should go but *that* patch
would require testing.

Adding a break here doesn't require testing because it can't possibly
break anything which is not already broken.

regards,
dan carpenter
