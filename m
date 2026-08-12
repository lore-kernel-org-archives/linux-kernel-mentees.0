Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46F473C8C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Aug 2026 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559237; cv=none; b=VQNeefkvOb96xgNRzqDDkvzrPprrCAayms8Q+5vpGjr6QUga4QzKhvfcb4KXcB59oXI/nIp45TBtNyWjXFauD0/UjsG2HkJHil3kgO9qkFzdmLlvuONZF1651z06ING7SuZSmQ3RqOLJTIGiX81RsZJpkti7zoPzFJ/jA8vpOeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559237; c=relaxed/simple;
	bh=Nu8Ru3iuSZZX9SpYcbORNiVzGWTxhVBNzQvuJQZ4cFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X3On1y/mdOVUY3Pr5AWNaMgHYq4K1VrgT2i5lInqRcjEIRRCo4rn6eJlErv9R6Ii3BxRdHiKxyGrxYrf5JjlMgbm/2UnAlx6S4BMdcnabaHZJiuI/k9PSzg4bdeeP3gySb2m99H/tjtzGp3fcWYHAXNcNCcVuwahx2xowsqpie8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAh4keEu; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAh4keEu"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52d590ce5cdso9427941cf.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Aug 2026 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559235; x=1787164035; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7j7z3tqC+AIDzOQzM95h2HCshoUvxiPDxpv6LnHwMNs=;
        b=JAh4keEu9fsntbepnNlZvfvuC+6iEAQiHlOgvRfUCf08hk6IJBYHCu4AmfVsMPb6bT
         2ZrcEZ9rFF00Z1tZQmaKg5tlD6Gv2Mx13foPQUFqShcg7QXkE0X8NhHx34x73Nn6pS2f
         4WNr5Dzdccc7pFYJ+gxoorv2GerH5oOutAZlBeNsgmRslDWC1KTrYNAyQS30mB7s3UFh
         WJe3DUKrZHbM8ENlXkNr4ryNA7KqAVL9Ig5p5DRXFpZhO4qRRgr1QKrE9/0PxBxDw3Tv
         hRM4aptOCjIjeiEQ6Yf32UIbi/h0RSxEvefhDPe0MF/+GkdqkrmpiEE2cM14GcRJ0a5y
         D8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559235; x=1787164035;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j7z3tqC+AIDzOQzM95h2HCshoUvxiPDxpv6LnHwMNs=;
        b=m14uBi9+6Wpaelv6pvHxomSDTF8G/XqgOoiuzygBCr0Mmz4Y5Y0pqwHluwjJ3pqSDS
         Io4xDcsEsIrqWQ891FYIrcIMYda4HU6qZqPfDOi59s1upMKk/MbpyBeanhZ+QVrnXSeL
         8JvXQ0Ij0yirVGFyy52dDDfxyhoWQIbtdVrr5UWVmIAK5zq2vHb3C/Jj7mP2Men0mLeP
         Wv9GtzacPrGj+eHNZ5mrYo3lx82LYJUAmcfQKp0BdKHamcDGqPyOj1jw+RzZdaT9AXPY
         uhkXKMhjzstDEZX3ZECMsDJlhYcIw6cRuvgZqAuVeEOprDozcjnfrxF83O+ox503i4J5
         eB9w==
X-Forwarded-Encrypted: i=1; AHgh+RqxdhOPZ69TnTD8z0BOvi/yNpvl4bn88sWeP/Q1cWqDxI9sbdW00wYzSXobTNKEdUf66H2qqcSRG2zOBsOCIw4zCRQArw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi/j8E/HLm8vtangwKFjJSH2RYl1JCiELhOfvRTDgcnLK5PilI
	vRhmGCrqomuW4meLgBZB4wMMYNeGpyJLo6iA/oOBA44kDfRBtVYBoIzj
X-Gm-Gg: AR+sD10TcdJfB5et77XayLnxY0GRYtj1R/sI+zWJfXGCrD3vfsGzR/PYajt1t/OpQNW
	mBTZtW/rzM2DBMV3L2mIcPqviFJEaJ/7pJX2SsL1doCzxKLj6+IeCSDKkOt1pydD02xv84mSw9O
	5Sm1RWs3lNnvDe97C6cWYr0OfVjKdzkUkUCo9EoAE9WSV7R+ZLyWuEQQhWWA3MlJNAlDxJ22Ezl
	sG43Ano9Gbzm+CBDvF/dXRmrPgc3nuONa3ynRXSpKRcZNEA8HxzYH7mUqLC6XmyujQY6sF0nqQ4
	LYvdLedYPoaDT6WvKhbUoGOTEkfB7AsH/1gF28R1AWBhx4+EbUL9+2j/Ubr6d2irUYNaJ5DjbCj
	TYjec1UdjWJEuPh04THQmYhcWiKQjckPdyB4r22MnZnjRkTgwbv6LayQgzbKOmwIYQdzgMq39ol
	jdzs1QT41K4oMP8qWUD1cw5y1F5Ey7SEwLX15KtXOdxakC/QzOpNTy+AGEOD4TS3Jhx+s=
X-Received: by 2002:a05:622a:1106:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52d73be0ed5mr2122511cf.4.1786559235087;
        Wed, 12 Aug 2026 11:27:15 -0700 (PDT)
Received: from localhost ([2600:4808:5693:8201:bb19:d9f0:6e53:91ed])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d73fde61csm74641cf.21.2026.08.12.11.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:27:14 -0700 (PDT)
Date: Wed, 12 Aug 2026 14:27:02 -0400
From: Marco Chen <marcochen.dev@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	matt@ranostay.sg, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, pmeerw@pmeerw.net
Subject: [RFC] iio: health: max30102: proximity power saving TODO and
 datasheet history
Message-ID: <any69uXah07eA8lR@xiaolong>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The proximity power saving TODO in max30102.c was added in the original
driver commit b3c590ce14b1 ("iio: health: add MAX30102 oximeter driver
support") in Feb 2017. At that time, the MAX30102 datasheet documented a
Proximity Function and Proximity Mode Interrupt Threshold register. Both
were removed in revision 1 of that datasheet on October 2018. The MAX30101
datasheet did the same in its revision 1 on June 2018.

That also explains the PROX_INT defines in max30102.c, as they were
correct in revision 0 of the datasheet when the commit was made.

Since there is no current documentation for the proximity function on
the MAX30102 or MAX30101, I don't think this TODO should be implemented
for those parts. Does this seem like the right decision?

However, the feature is still well-documented on the MAX30105. Is
proximity power saving worth implementing there? I don't have a MAX30105
but I am more than willing to purchase one and develop and test on it,
and I have access to a logic analyzer to verify the I2C transactions.

For the implementation, I would add MAX30105-gated defines for the
PILOT_PA (0x10) and PROX_INT_THRESH (0x30) registers and handle PROX_INT 
in the interrupt handler. The MAX30105 transitions out of proximity mode 
automatically once the ADC count exceeds the threshold, so PROX_INT is a 
notification to start getting data, rather than a mode switch.

For the ABI, I was thinking of using an IIO_PROXIMITY channel with an
iio_event_spec for the threshold and enable, similar to what was done in
cm36651.c. Is this the right approach?

This feature would then be enabled through the event enable, so with the
event disabled, the driver would behave the same as it does today. This
is important because with proximity active, enabling the buffer would
not produce data until an object is detected.

One interaction with a patch that was applied recently [1]: enabling 
PROX_INT falsifies the assumption that FIFO_RDY is the only enabled 
interrupt source. So the handler would need to distinguish between 
causes, likely meaning that max30102_fifo_count() will need to be 
refactored a little. 

Thank you.

[1] https://lore.kernel.org/linux-iio/20260808195450.25420-1-marcochen.dev@gmail.com/


