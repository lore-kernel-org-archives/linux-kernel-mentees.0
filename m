Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A45187D4
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  1 Oct 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863694; cv=none; b=cEM0hpu1onjf7glzWx1SdJc/bNkqaUHR2mSAZq1fvjZxwwOOREdY7Dfn4fBPe/h1YOuMZQtlGrNOeKMt3nLtLtq/IgJCE63nXkBPJAYOiw+Y7yjItGBRcv93PXclZOWmOknM6eVo9ymnNqA6BfGla8UgXMRMPEuY1yWrgIe8SEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863694; c=relaxed/simple;
	bh=zECpyUBkuoTFGnpwSyLJZls4RBh3ZrxrUUu2x8F+Hms=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IwJ3gT/mUrbfR2C/Ow00yPXs4zRaZYwRNUNLszXPAdcuugVP5X2e9dtu8KZJog8EmIkbvaqN02AAUd79rUyFlWEd4rPFtrBNScGkpEA8Iu7+tqGKLwhTvu8+44pqqjTf8O2jr0Nl1UJxQFapgAVFr34lFGSx1JNXoyXCBZbJ09w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn3SX5N+; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn3SX5N+"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac768bda6aso7809138a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 01 Oct 2026 07:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863691; x=1791468491; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zECpyUBkuoTFGnpwSyLJZls4RBh3ZrxrUUu2x8F+Hms=;
        b=Mn3SX5N+/lra5tNmSxE4bQKLQu60VE69tnlJbbNvWhnkvFO0IaF7zlnOHN/7BgIyWu
         m0Q7aV89ZdkWIPA9iijNbzTTZIGb0zbq9fbLdV9+HBzdW52cSE2r4eO316gN6DbTlnay
         NnhQb8YbFuN8kgdVN9P8m+DtzlovaMbuvm8p8CO7YGAlBBKwgEdr0anOCgYvw5/PJlJw
         qS7MJunC+/rpgqLkchrPAXZ4SsyRTyy8boJZ952JnM5o1uuE+qfClz2ezL3F9OfJVwb2
         4OCMr+jrs4w+RZ6DWchaULd1Iqi1G1y+j1zPMR2S8nhZCgiAexJmoP8Dcey9y1puSFdE
         o6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863691; x=1791468491;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zECpyUBkuoTFGnpwSyLJZls4RBh3ZrxrUUu2x8F+Hms=;
        b=E8ttmFcor2agLfDrHtNwDx9ZkLoNwZPzMG1y5FgY0q335yF/RQz+G8H3Pje+8ZsWh6
         3y77Y2T7L2nHFbWVJ2LCzYA9lAopNp/96zpBX3ohoK3hQu5YBnLgFvFC/FB3HeiTc7Fk
         3WB7KcoJPY71VNWQsOFIBBADqiiE28jcnWsUsBDoJRDWc2QinRB6AlWccE4bZRKvXl3T
         UwxCoqL0gcPAg+FpuXumZ3kOSI+/qBVslo1ROurK8dokmFIPx919x0r7FX2J3cs4ePtS
         Lu2QBXowhPa4QAeV2BdRbrHZz1nfEt4n9xqy2HPZ50lnz4iG2HDHlGDX0weBDeKXcvBg
         3ITg==
X-Forwarded-Encrypted: i=1; AKwUvBy4Y6LvhCNgtNjNq0ZVPJAduZEB4kvjfd+DdgUDpHLqbqdgnq5sKRoY8zEV9YrXhbspuE3aSzNBaqT2/QzRdBKLBqnyRA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJNYJpJIINjTrgvyaPKC30cBK4S3N5kE8Cg69Ere70Q9FmfaafD
	tqMXvwZXLE4UKc867siMWh/HUYFWZoAOgXDlnR+hxLE4hC8zDrvG7FCgmSId
X-Gm-Gg: AYBFou3CfbQFxv75XOMN8NFtHRvnDe/0ZiuLX8wNaXP017iTvcn3XpZkDwjBxSM/qH2
	VNnAqjMxVwEP4iAhWViFDI3QZrqb7pkozipaKHZwPsiBMKgoSXW9SrbRYnMfEYPvB0nNhxkr4rH
	vPHoBrS5uhEGF1J8oJEAFz4oONHJl/whvcUFVoKy/8l9ON7VARWaOvNdMEgb6PPbUAOMXLnCP8N
	8LUwerlIWdpK0DN6+dgKcG6w3s7MdJuVT67l2XDe8CFSmbKULFJkrYb4ZhcYdG3LXHlJN6PatDq
	oGTpWzNnkxJtlxaXNC/TkxotCQpfR1lq6NSSqAdiU4vruLT86ErgivcoNuIJIddkC65RvzEhMrV
	TcBd1dZPDNjx7q2ktt7TeEPB/5deg74WFc8Bu2aUsKaJAwqyZ+e99mTNm6t86dZYj6oITvTC5uF
	vFmgrWZ7JOTsi3qIrKyWnY5BLBMqCgkVOPge4+3sw5dWjwiUEOZ5388AoukbzSnzE1TXILy15oN
	uPt26jBUCcWBydiNYel+uaKHr4wndwMLuZs/le8sBCR
X-Received: by 2002:a05:6402:52cf:b0:6ac:c4fd:c726 with SMTP id 4fb4d7f45d1cf-6ae1995216dmr3927218a12.42.1790863690562;
        Thu, 01 Oct 2026 07:08:10 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca76374sm1111911a12.30.2026.10.01.07.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 07:08:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 11:08:00 -0300
Message-Id: <DLTK6X5RFK4Q.1OW6JA242CMRJ@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Jori Koolstra" <jkoolstra@xs4all.nl>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Rae Moar"
 <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Yury
 Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Burak Emir" <burak.emir@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>, "Miguel
 Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
 <DLSQJS2QT4JW.3BPUMU5M6N171@garyguo.net>
In-Reply-To: <DLSQJS2QT4JW.3BPUMU5M6N171@garyguo.net>

On Wed Sep 30, 2026 at 11:54 AM -03, Gary Guo wrote:
> On Wed Sep 30, 2026 at 2:23 PM BST, Nicol=C3=A1s Antinori via B4 Relay wr=
ote:
>> This patch series intends to implement two features for KUnit tests
>> written in Rust. The work is based on a TODO comment made in the
>> `bitmap.rs` module [1].
>>
>> Changelog:
>> - RFC patch: [3]
>>
>> 1. Supporting `#[should_panic]` [2]:
>>
>> KUnit tests in Rust follow the user-space syntax, but at the moment
>> `#[should_panic]` is not supported. The first patch of this series adds
>> support for the attribute (only in its basic form, `#[should_panic =3D
>> "message"]` is not supported yet).
>>
>> The way it is supported is by adding a new boolean property called
>> `rust_should_panic` to `kunit_attributes` struct in kunit/test.h and
>
> This is now more general than Rust panics? Perhaps this should just be
> "should_bug"?

I used the name suggested by David Gow in the RFC Patch [1]. I believe
"should_panic" is better because it directly matches the attribute name
and will stay consistent in case the panic handler changes the way it
trigger kernel panics (although this is very unlikely I think).

That said, I'd be happy to change it to should_bug if that is preferred,
please let me know what you think!

Best regards,
Nicol=C3=A1s=20

[1] https://lore.kernel.org/rust-for-linux/d20cc2b2-afeb-432c-924b-55ad00d9=
80fe@davidgow.net/


