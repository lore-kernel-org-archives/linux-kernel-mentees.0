Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D42B317173
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  3 Aug 2026 04:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785730423; cv=none; b=DoxHi+agPtdsAMq2CZWVNdfZAxQM4Ha2r6hOoCy62HFDTrTg9iaZRlIN6y49feK3UIcxgjTAhoK8K5fISEhMQf3NJdkD6QAFK+xKUWyl7gI0HL9/QTXBkfo8yzga6emNJiSxjjuKOY04abo7dWcudbdQyUJsa2xYY2J+cRoaef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785730423; c=relaxed/simple;
	bh=OXLpzJ/H2u+nL8XvKhNKq1KQkvmcRXmXu4aXTGY55VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBvt+ExhkCOUjOPCCQVtR4owc++ewujVP0TP4nGJaGlbbW521Yiktu1VWeI6F7FzmBSAtrIlnImUIKMvkhn2vEtlFwj89dcHhhouy5ParLRq3vR37ITSrU5DH6YXn0JvondoC/B+wyJXFT5oFq5yKCvE6cW/lYOQZ6bTxKM1wxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/OB48qk; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/OB48qk"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c2149571dso26466791cf.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 02 Aug 2026 21:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785730421; x=1786335221; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pl04dpRgnSLOgJC5HtXDz9EzCs1SLg5wxfFNPj5wzoY=;
        b=E/OB48qkzwYPgAyMuYyFBRK97H6yxiQmnft4BnDv/Iw65Xk/tLHbujZRS3fVwlcivf
         9FhG7em5QT9FXwnh4yxx69vQ+OjX4egNUwpTFAfjCpX41U6V1cqTjphXRyT9KkPp8P0O
         Sb2uUdYX6XfQ6g7MW/1tLAQM+7LK3UxPjhmm1tWb/C+4lCfOsNrhMDzo/yPwp0nRhEnU
         XX0rqxSaTfXbmt+1VAE08BzsRDPHaEu3lrYlzHOIRKC4IuHlZm3pVuO3LEF8G5iWX7I6
         MlebmLb7rRbw4KkfkDJLrhMBC0+VvLWzWAAg/kC8sk5x1rXmq1wBFRdooqFjvgY48rzR
         ficw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730421; x=1786335221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pl04dpRgnSLOgJC5HtXDz9EzCs1SLg5wxfFNPj5wzoY=;
        b=k+QISbiN+Ymhl4RS9B41mqFLsAJxqqFUPKMG5kTOwf1/Tk/+NBYoKq9opO/u5of2pB
         A4frCCyu1ZtG444OCelRrz0pqlyrXJhlMbM6yQjbnqi7GkF+8zwb+Ex3VOh/kmz5TGt/
         PchGD49tUhBfmskmjw1JdUWbO9eoQQZMYNFWRuHOa/tphLyTE2YYdzm8s6Y0ceHck8H3
         fQtIDeXTbck8AgPT8pK8VLkZRHiklEcWT4oOmfuj4noB98D9Ct6HsBX9yNNWde4r4fIY
         1gP30y4Kfqx2CEoZrq3YUF1kJeK12e8/hyl1NDWFt1iQ9mXnBn4I/ylgNUxAtRJj8Oet
         OC7A==
X-Forwarded-Encrypted: i=1; AHgh+RrvUcfrTU1SsKJVtB+xNl+cyBPQQ7+j0N78GKLF08l8tMQTtsbI0003pq/2awPyRqWlYUfsYJOwLZAGPf5jdHukDW0hMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1ZKd7NBWWj1ZLuKiyxSmw+Gq+XWc1AkkZq5sxc/bn6zC9YnkK
	aIrJOj2zwbbOgbeXvhd+MpI1Nz9LAdocnnxwEWuhp5q2Wnj9nJUSWpTk
X-Gm-Gg: AR+sD132ZmyC6S5VX+aqTIIulixDytv+VVwuBBsBJrL1oRScT/mzExn8YUdsu7BKVoc
	gW0MYWRcj2TrkmE/3UAQ8mvGeZ47vnbY25DWDjClwxNnUDVt+EbZJcMh6LhKmrb//S7B6ZOkKBy
	aMS/L/twbqWTvU1Lk7lTRFZM7zZ0hFJDr1URA3zpOQSGTvZmobexdRaRRnyEEOGm5sPlT/lc6Yw
	EBa2f2qmkd601Msk1Ok4U4E+aP2sDwN928q2LkJ5pEHFoY2ah1p9iKgm8MT5uorAnz2R7Klj8v8
	ode1LDq3GBCrbDYS/5wskSNO6FUk+qfObsJZG8zo+v1No5yvVjAuVobeV37l8YZqzMANoccaQio
	LN/pFDC7DI2vahsSJ8D9RVWWoAM30dUWcszkLSZV1VgAvPtpnG9ycu5meZ0OM55mP83EosE3kkT
	2odDF/2p3GB0jiV1NtfGpMp9A+xw1vRbfzfBlJ03gRlpdSvL4W8BINyryMfIe/IK0+b18=
X-Received: by 2002:a05:622a:44b:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-52b567915e7mr145099021cf.36.1785730420860;
        Sun, 02 Aug 2026 21:13:40 -0700 (PDT)
Received: from localhost ([2600:4808:5693:8201:bb19:d9f0:6e53:91ed])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4eb6a857sm52935101cf.17.2026.08.02.21.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 21:13:39 -0700 (PDT)
Date: Mon, 3 Aug 2026 00:13:33 -0400
From: Marco Chen <marcochen.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	pmeerw@pmeerw.net, matt@ranostay.sg, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v1] iio: health: max30102: fix NULL dereference in
 interrupt handler
Message-ID: <anADiCtmoVbT0o2F@xiaolong>
References: <20260731184124.112124-1-marcochen.dev@gmail.com>
 <20260802032609.27900bb9@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802032609.27900bb9@jic23-huawei>

On Sun, Aug 02, 2026 at 03:26:09AM +0100, Jonathan Cameron wrote:
> > +	if (!indio_dev->active_scan_mask) {
> 
> That is racy as this could be going on in parallel with the buffer being disabled
> so we check here but it's gone before it is accessed.

I understand what you mean. I will remove this active_scan_mask check.

> Which leads me to suggest alternative fix - check INT_STATUS and if nothing
> set it isn't our interrupt.  That doesn't get into the potential buffer
> enabled / disabled races but should close your condition I think
> - looks like it is read in the fifo part below. You may need to refactor a
> little to not read it twice.

This makes a lot of sense. For the v2 patch, I will plan to read
INT_STATUS once at the top of the handler and pass that value into
max30102_fifo_count() so it is not read twice. Consequently I will
remove the INT_STATUS read from max30102_fifo_count(), too.

For checking INT_STATUS to see if it isn't our interrupt, instead of
checking if nothing is set, I was thinking to check the
MAX30102_REG_INT_STATUS_FIFO_RDY bit specifically because that is the 
only interrupt enabled in max30102_chip_init().

This will close the reproducer I was hitting earlier as you said. Since
we only ever reach bitmap_weight() when FIFO_RDY is set, the NULL dereference
is avoided. I think there is a theoretical window if the buffer is disabled
between the FIFO_RDY check and bitmap_weight() call, but as you said,
closing this would need the buffered mode claim. I plan to leave that
out of this fix.


On Sat, Aug 01, 2026 at 16:18:00 +0100, David Lechner wrote:

> This is one of the reasons why you are supposed to turn off power
> before moving wires. ;-)

Fair point, I was pretty careless.

> IRQ_NONE would cause the handler to just run again as soon as it
> exits, so it is almost never the right value to return. IRQ_HANDLED
> is correct.

Got it. I will keep IRQ_HANDLED for the v2.

> There isn't anything we could do other than log the error.

Understood. Since the INT_STATUS read at the top of the interrupt handler now
determines if it is our interrupt, I will check the return value of
regmap_read() and log the error on failure.
