Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0682D8DA8
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Aug 2026 00:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786494700; cv=pass; b=gjbNQfqh8ETvSkkpKmMOVcDaFYur+JY2u2VshX+WiJFXnzdwTq4bhxnGlTju2tY1Om8n9nDNTxRa5j8kqTWJLrnn4hHmJkZ4wm0biOxE60T04V/ujoe+QWum2n3Ty/2/A+Rrzjkahi66s5q7iuMl6D2SQyoXKggdsKoeweercAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786494700; c=relaxed/simple;
	bh=Y9w9QrFkE1SM2n2FFX5oMk0sGJkeCcgXEawMzw1JDzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/dhcv7AwWZ/CwyvGG7dxPhv5MmFdga05ZvpowlE+/peuLtyNm3Uzxrfcoha8gqfPKsfcl2sPLqhxEfgzL4xZ8bqLBNedlcuNoK1Fn4gW9eDbaiYaEK34uAbZEjVN9umqeJIuHTpPh3rpuxWIUMLyf8Y37k4ybVvMmOX9CxyKhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1huLNCu; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1huLNCu"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-448b89f700fso431609fac.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 17:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786494698; cv=none;
        d=google.com; s=arc-20260327;
        b=rlYMzP3FdE5wJBYoLShJ5Wn4QXo5EEumSS/epLg6uPIOtFeTrAcyUYjIWPG7MvtPHU
         3Hy6vnwFzPqd0KXT0e0XITUhz/xom0MCI24HRai1PRSjzF4qZ3juO+OpLU4v3RFJH5iZ
         GRwRXDDaoMfJHR+hWvRfj3XX52KlMp+/ziAriBrdeKfa46KoclKQRKrBSOWAZzYOf1+R
         OIXeqqYw/uAOO3cgWuHOd+00P8toscoWOVwzmlo15cH8B9K7kpiaYphJIqAIpysKb0Hs
         sarA/0krFNMhyErLFC+vwJjc+tXxrZikUOcujPZL1fIeC503bef6G2jzQ3Qo7wHeQb4B
         20xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y9w9QrFkE1SM2n2FFX5oMk0sGJkeCcgXEawMzw1JDzY=;
        fh=UlG/lZB8/gmVq+M/cJSIk2oobaSRJ91714PSaiOipUQ=;
        b=lnumag5pLvJ1xnuSTYAB5geAuNeOPY8oP/D5CzWxpBsv07BcTkJLvzbDBf6wWG+cah
         A/GA5r4/aO+00JLJMFVaQd96w/71rY7CcsRH4GbNF86KrAG796taFRxWWv+5uS0z/133
         CAWXPBNro1hXBMQavHwOydHe6qVygxj0de1Sl/rizNcBRT2SSD5wKdhtIr6wxFmSkIoF
         TB0hA3RXcahKj4Zy56fH0Df92vNFyzXiIEQDE5nmNgpdfq7QO5swe8yXnW6nhMFFgu4D
         dPpAeq+fRfrLGWkrAmjkrRrTCNgktPVErDiZLBWdAnCNpAulEJ58ansS2KkpJtsf/Kz1
         dUEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786494698; x=1787099498; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9w9QrFkE1SM2n2FFX5oMk0sGJkeCcgXEawMzw1JDzY=;
        b=b1huLNCuYaAkP4RSWiiYXZ/fVC6Q6le/Txc5sm/JzOXLqV6mGKEiU4lqCuW6zHdi4+
         jw77HDn/qeTapFdMO7yFSoDz2OIDXdRv1giqH6y0Vjtr4MlyklTMT0kSzeoDD6k9HA99
         X6iMiTO/HWj50XmfRSaNvsIFT420Ek+ToCznEUEnoWcyOEvoubtppCbhP1Kn+KZqq5DP
         cUIqptfbBNj3Blv/i7bESOooG3dWEtJmYxPPmMNcerkjgMEEPcw/H3KVwEArnBTJ5md6
         XLbEHd+vDBK9CkbAPCnq603q6bnGy57SaAGnFuohL5BMyD4/vnrTJK+qKXn5zoXS/UYg
         ml3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786494698; x=1787099498;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y9w9QrFkE1SM2n2FFX5oMk0sGJkeCcgXEawMzw1JDzY=;
        b=fIvE+3lTixY+q7aE7QLaNCwh739O36atgbidgLjzftdHbNB7PUjCKscV6T1NmOGH7O
         kxYUvkdcv1g2mVRZnKylbckWgjTsx7XFVGvEgXt0pI5sjyFACiRZP2p2HSQzXydaFVJV
         zmJrtSKtV6vzMwsKQzQj63+07+uWqAZ6roJAOsqpqoI2gIUFj3Z2F1q0fbLsIaltw4Xb
         AXygcuYKxJ0q7LK6NnrbLsHUPVlZz8/B9KqxsKalv8DLIZL91bwp4Tio/8aYVLIK6B9+
         wJ7VWJR8WcOX8wO/n3W/0tLaO1GaUoj/3gLHZg/+YfZDrVz0/+uvjOWdziFrB5RmY489
         Z3lw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/ZH0D9eL7akRgVIrn79zbJZxjuARrlb49NYORQRdibAezRCzIe5uP+Jjo4uXBOE+J9HxE1tsV+wLBeAGoKscdAu0K5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd8tSR7DVsqen9hoEr8kOn69/4NfXHQ6ways8LlAjE5eDlRi0j
	y3YMRyPnWj3qtiiFyYbTZM3PTS4evvaJY/P6p9gUq3ZmcWvaAEB8uQtDHNvzxBkIi/8Quh1brfY
	AouwNpB8TmHq3QpgvmFq3ndibspLgNlU=
X-Gm-Gg: AR+sD13u1kQx09aSfLe/nQUZGwl61CJXR4qegml/aFA9AlbKKS1BLAoA4iabV9FNrIc
	9+W3vGDCQ3hH6k/XQNeFjM15qay4e4HILaxg0qpoX/jeKYp+D7VZ3MlL2Kp2Gv93kBoQOj99USl
	onJ1Ebe+uh0ZLJ0qvv2WDMmxtUvR7+AnPdvhMZshvB2Zctcy5Hml9ht5trdDowYbkQ+S9Fe6o4T
	wsNCzXIts/EKoatvUoPWejzQpduaKnUt9PULjmVEov8FJkPgA0gJ4NeH9nFdHn851YwNLJ/5eI2
	jAZ7pv1w1B79x0zjo29ooMRX1nJW0vVney0aOez/ND8=
X-Received: by 2002:a05:6870:21e5:b0:456:b32f:70c7 with SMTP id
 586e51a60fabf-45e3e83bd3dmr794920fac.4.1786494697916; Tue, 11 Aug 2026
 17:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
 <20260808090026.34187-5-adinata.softwareengineer@gmail.com> <anmPrjxK3ydCtuDS@ashevche-desk.local>
In-Reply-To: <anmPrjxK3ydCtuDS@ashevche-desk.local>
From: Adi <adinata.softwareengineer@gmail.com>
Date: Wed, 12 Aug 2026 08:31:24 +0800
X-Gm-Features: AUfX_mzFPpAgYkDnWVsiq_yU1XXeSLYuqN-rPxHMKzalX3KATUMvbTbI2paCKPU
Message-ID: <CABZ6vuA9eZfyW5ZX19c24_=e6QK8errrbAF6qQUoQS33rxdd2Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] iio: humidity: hts221: use dev_err_probe() in probe paths
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lorenzo@kernel.org, Jonathan Cameron <jic23@kernel.org>, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thank you for your feedback. That is suitable. I will update
accordingly on the next version patch.

Regards,
Adi Nata

> Why hw->dev and not simply dev?!
> Also in all cases.
