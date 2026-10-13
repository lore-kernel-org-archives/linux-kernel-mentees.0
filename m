Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2537D51991A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 Oct 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897305; cv=none; b=rtJ00qXun/yz8BwdDmhQkB42p3kz8JMk3a5o0IQ+dUkb4IX+uJz/eZwpVBbiXvL6n0uQUjFU3Ux6tyH/c7P/pFWkhgUnwv0Xh+SfNzl91q8XPlW4ihRwlmLErMi10AfFMesx4pjk76zzhd7eV3q9eAmrmxjQp4hYVWRIIHKBiJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897305; c=relaxed/simple;
	bh=ID7ITH/ey5fDaXQS2sirspBvibpDl8OQIA3uc+tsOM4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Sn1JujMzQlGQU1LJIL6ChHmVw0uRBRXRab+wAtboODVqAwDNb/tbyuy8b25Q/b6JYTA3BE7CL3WWvq+uFtBLlCm9JKvied7aalw0k4sAIbtD5TxNL3xEhtifj+3+rXg5aV6DWId5bB9juQYKjBXusDFOLHIbmHRiDhHfxvtC758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1indhb6; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1indhb6"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-74ab6c88052so798525137.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 Oct 2026 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897303; x=1792502103; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ID7ITH/ey5fDaXQS2sirspBvibpDl8OQIA3uc+tsOM4=;
        b=S1indhb6pyI6/vvL13UZhpaRxF8CCV40kWClDAZcvEBDpvZ4DRd4rE3G8560u0jED/
         zLhLzWLIqdKq71SJN/DS1ZpPRuMfXaE1VbNKxEc4l579xbWw8Jo/aAPWPoTSgNIwrTbn
         GyWtAzkfBnXNZ3SkqDc7s+GjfJ1Dnnxx3cvxPheH3hBhbY5WKcm1nNJNYmzvRXz9EWdA
         p4ll6ib32NmFLnC20UDsWEY1eC43vT8y/UjPOJxs9YyR48ikPAbV9S+eJ820yCqHfvA/
         jH9gPkXKTS+EKhz8uVcuUiBk5OQYEftXg/viTS5n71K+GVLnMlrftYOJJsy3B3czPFnn
         44Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897303; x=1792502103;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ID7ITH/ey5fDaXQS2sirspBvibpDl8OQIA3uc+tsOM4=;
        b=wIE9fRJof2mbvs+5JOPFGBOx/u0gSzA7ebDA1pwXjzgVxmyKDGLUBqcKxn+g4hrSew
         xTfVrQHTLPCwBrzEOiy0RgGnq4vjjO6/m4nCbwksmWL6hFmJlDriR5XQ4vy2MQ+5zgTR
         CEEiiUD842y9ZVzzKPAU4ccJ1WP52cxhbw5/FcEpvod0GuU6WJ3/28+kZJ3Y086KWCBz
         mJZQkvphKffqY+Y1+R7lOA51B62OomW4xjELkJ68es4CvbGPAhwyoo0fe6Te5MvdMJGx
         a7AHsP3mHNiBO2Z5Xoif4CDu3CUcTIS77amHaOzcBnlCCKgTlKKxHLb1x9ToaS/JWBjQ
         SfVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGW+TqCvXmmZCcyBvVwT/7zDty9wMPZ9CUtigkk8sPW4MyZQsam9cHSq6EkNMjGHTIRU7prdvRcwc3ODTkZP31we+YWA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKN0TvgiDk+A+VGIOw/7J17WQU5hsHsRBw1d8HjqOWsx3r4Mncu
	87M/ZhD9XF64ZI2ylnf00JIXnIapCl9TVyANO0rGeE1UBhgdM9VLkZw=
X-Gm-Gg: AYBFou0xZdTi/kDkmEyhOX+mSVAr9/Y2Lcj8AnnDiGNMLioExPmf4KNq/YYGpgv0lJC
	KVK5EnkJ/2FRFriupxh2Xt5xAJs94hfvRM8m3Errq0sXGHjdnZjwkKIXBeFStK0ZesNNjl86CHW
	SKqgCl4U3SfA8hRbxgigcfdF2fWuBVDLPlpeOzfZMwr/jgNSGF/fXbRxQMCViRKt76VuaXORqsE
	qfpNnZWJby6GK8FxEHPTomfDaZjkX6igiXp6bqFwXxnpOfgjuIiuXmgLy0ryw/SI0qhDu2FeXx/
	0l7X/ByByNOyG2AGhRoAXjfGe6c1YjtdEVeNiUmNxIBQO4H4QVoF/S4jDT3zVO1l6DFNkdYQ42x
	uXpl+ZwTKSrDdQh7+VndJ8ooN3W+qIIpHOrfXdpo6Hm1vfzNx65QqBjLWMlzITA05A7jAOGXZNs
	nooj0EAeVuQW8rU3wKYuQdp991OZRzBgZ0PWxhKC9bFTe3pTGYitmxptTq9aYSjotSdXDkSoml+
	msypUIkw5typFE3bJLCJuDWOamV4vHJ8g==
X-Received: by 2002:a05:6102:441f:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7cb37a04f94mr2579211137.33.1791897302771;
        Tue, 13 Oct 2026 06:15:02 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb3539092esm8734108137.3.2026.10.13.06.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 10:14:55 -0300
Message-Id: <DM3QKTJYPA8I.13TW7H9HIV3YB@gmail.com>
Subject: Re: [PATCH v2] i2c: rust: avoid locking when performing
 I2cAdapter::inc_ref
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Igor Korotin" <igor.korotin@linux.dev>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Brigham
 Campbell" <me@brighamcampbell.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Jori Koolstra" <jkoolstra@xs4all.nl>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 "Sashiko" <sashiko-bot@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260904134600.340991-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260904134600.340991-1-nico.antinori.7@gmail.com>

Hello,

On Fri Sep 4, 2026 at 10:44 AM -03, Nicol=C3=A1s Antinori wrote:
> The current implementation of `<I2cAdapter as
> AlwaysRefCounted>::inc_ref` relies on the C function `i2c_get_adapter`
> to increment module and device counters. This function acquires a lock,
> looks for the adapter in the IDR table, and, if found, increments the
> named counters before returning the adapter.
>
> In the Rust API, the `I2cAdapter::get` method returns an
> `ARef<I2cAdapter>` upon success. Incrementing this reference count in an
> atomic context (for example, via `ARef::clone`, which relies on
> `AlwaysRefCounted::inc_ref`) could trigger a sleep-in-atomic bug due to
> the mutex locking inside `i2c_get_adapter`.
>
> Since cloning an `ARef` implies we already hold a valid reference to the
> adapter, the IDR table lookup and its associated lock are unnecessary.
>
> The fix consists of bypassing `i2c_get_adapter` and instead calling
> `__i2c_adapter_get` directly to increment the counters.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260524181151.24988-1-nico.antino=
ri.7@gmail.com
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Following up on this patch. Please let me know if you have any feedback
or if any changes are needed!

Regards,
Nicol=C3=A1s=20
