Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D8F1D6DB5
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Jun 2026 19:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762362; cv=none; b=DB9BnhI2Tiq9Ifam4CW+es2CvtaIg42v1U6x7zePdt8kR4KKF8RFvX1w3Ru41ZyCLf3GseIfpwkHf4wPqJxBH6wO2G4e9YigLwZ8rVSxkfFIRYIGpV5rbVMUwW9Xod7+lnCpA45Y+chEZGjngolFagLFo1MKyD5HcLSG+ts7R8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762362; c=relaxed/simple;
	bh=hY4JgavGrEWhCJWnwiRyUiQPfJQ1CdLm+cvupsbV5M4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Eb1E9Sw+ASbxZvfPL4EViSJFQR//QN2zz7k344e+PsgssuQcZKSmM9ENXf054tOB2i4PXDpyM6x3u0m5hoZmMKs3Ede5GhbNP/082h6vuFAd380pukya2WUnctiRwTRUQ15+IqmOvQnI2Z2M8dAFuVwWOE4bHNGUxHeCig1V/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YU/O5H3/; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YU/O5H3/"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-139aff562e1so5413510c88.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Jun 2026 12:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782762360; x=1783367160; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY4JgavGrEWhCJWnwiRyUiQPfJQ1CdLm+cvupsbV5M4=;
        b=YU/O5H3/FZWiCtQJIPoBjPF98Yf770fcZudk133B1o39MOqg+olBwDAhDaXZtnkH4L
         N+O1Wvb2zubZBaQE6ZLt+AOMyRZpAznQq+8/xyMINrQzFyUZH4S1PBQ0xw8ieA61KWW3
         /5XaNXzNXtjKljz76h2vHm/vYpuFB1qd8RkZGCAaHFPI8GLafhBcgxA0Zc62YdGUpKDS
         3xZ2MhY/wL0mUAUeUaFuSbkwbaY8BVg/85l5kh4mpwIwclNiOtEwjvk/h+fmLL1JXTZe
         Sqf6Eou7s/ru91DrmpudTPgeAuC0RLjoxIuDUiWjAzgbnVUeNvnG2OahSVnFz+yHsNuq
         sLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762360; x=1783367160;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hY4JgavGrEWhCJWnwiRyUiQPfJQ1CdLm+cvupsbV5M4=;
        b=cTk4mZXRJB4pLltfI48ESJL3Kw4xb20mI1tWAhvJG+UxDuxyD9kdMerY3Y8rcmKaIU
         /z6WYAVLqRW96BxBv4d9Gf3w+n8zTuWOMAeyA7NJRZEOqu7JPIlkRxirY9Gb7WQhp+7J
         Dr52DBBQcaWC7fZGve97jPPrmLh5AJpdfKn9gW6O1+awPt/aqoY80h05IK2I+ce00N6k
         ApY2g+vTkofOMj9xpXsuh/ymAQu74/LbzXbG/wuu/nVjq5YccySeVQxaNVNPp9DQxhQc
         iYPjj74s886mvS8nLVlBXK0LIqmOo9daK8XId3no2s6jY2iVwqdlr0AT4mwmgUwaBHGN
         WwRw==
X-Forwarded-Encrypted: i=1; AFNElJ/S5Euyf1kbAKwFzY1CnUxGMKhbAZFYHdsOx5fRRcfSY+vVc/40EXDG1ZxSR99XoEDIc2pUHCG64tddqSCsMVL7kIgFcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YygvJDwJGsdthyGhxZTgM9Zt5rxDTIQCxoIGXDeftGwWSrmL1gI
	XCkIV7Hq1CWRkjIsMRzFzoldplkfL5++8kjvVlzNtq3daBWn3AOJXyE=
X-Gm-Gg: AfdE7ckdHKiXEcz4YtHElFHyRFeyZdUCvzE7h6CGycHEZ7mOV5U0vRtqrikd47XITww
	CQ7WuEOuAUnqSBHfiJSNu7In0IfpueFKOmZRmbdRUF5aqIu+P8CtEdRMOah8Sg5DdM5/eKhM8iH
	c8OajICsrBAwd+8g04Av44zr85Wu58BL/F6Ijs1nNjCF7x0mAvh2nICq1mTUYoeFlKFsCeeg6vk
	59GhL6QKMn/M/4baAnk09Qqb/WAZxXvHjlhIUCtoCzYLT4gC1b2C4bIwuF9yS08AcVN745m/aKj
	lZz31OzLaYISH2eaPV2iMMp9Mnsx2ZHlJqDcuNnr3BvO0glbWYtJTNBwmpqcNNlv4+7ZyBLWKiH
	CG5rYkMeNxhZgMQOgnqBCaUWKUTxGkZ3UrXdDLy7d+14lAcQQL7efr+4Qbb6gCmw/K1V8bZxmoW
	Kilkr/yv/OXRkVtS/d6tL+/cIubebLh/BuXWVzTvja0SBwwZRt
X-Received: by 2002:a05:7022:41a6:b0:136:e639:9c05 with SMTP id a92af1059eb24-13b2a1af5cemr407270c88.31.1782762360212;
        Mon, 29 Jun 2026 12:46:00 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab30047sm571436c88.8.2026.06.29.12.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 12:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 16:45:53 -0300
Message-Id: <DJLSIEZ5OBYX.APFOKYYKPU5C@gmail.com>
Cc: "Joerg Roedel" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Robin Murphy" <robin.murphy@arm.com>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] rust: iommu: replace core::mem::zeroed with
 pin_init::zeroed
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260626203122.713317-1-nico.antinori.7@gmail.com>
 <DJJOZNFW51LZ.IKTXQ8ZIVO55@nvidia.com>
 <CANiq72kdCAyRUmXFcqQfkHpk1miG8Gagsn0_5U8p4WpKxv9d_g@mail.gmail.com>
In-Reply-To: <CANiq72kdCAyRUmXFcqQfkHpk1miG8Gagsn0_5U8p4WpKxv9d_g@mail.gmail.com>

On Sun Jun 28, 2026 at 7:31 AM -03, Miguel Ojeda wrote:
> On Sat, Jun 27, 2026 at 10:35=E2=80=AFAM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>>
>> Note that you can also use `..Zeroable::zeroed()` here since we are not
>> in const context. Not sure which one we prefer in this case, but I'd
>> personally err on the side of not referring to `pin_init` unless we are
>> dealing with a pinned object or need to because of a const requirement.
>
> That sounds reasonable -- Benno/Gary, any comments?
>
> By the way, speaking of that: the docs of `zeroed()` (both of them)
> could mention the existence of the other (and the `const fn`
> difference).

If it is ok, I can send a patch modifying the doc comments to link both=20
functions, noting that the const version should be used in const=20
contexts/pinned objects and that `Zeroable::zeroed()` should be=20
preferred when possible (as Gary commented in [1]).

I'll send a v2 with `..Zeroable::zeroed()` shortly.

Thank you all for the comments!

[1] https://lore.kernel.org/rust-for-linux/DJKV3IQ0SXA1.30T5Y71AL6KV7@garyg=
uo.net/
