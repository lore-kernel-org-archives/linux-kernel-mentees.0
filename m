Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0250154281B
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 Oct 2026 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928705; cv=none; b=Z9E0ZTKreJCpebl/M8/IoYwi6KBqig2vIH5HXvumFGDX5ielQ9WEXoIYu+ZBXWWPD7sKXs11cJAJd/AYaI5eqWCIqa0MJFDNJRMrTr+BXDkf8FsJ3p9GdiSSls3Ql6udNluVae8fdn9jy0E+z7XDEYQdrFM/zQb8o71FztPHyZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928705; c=relaxed/simple;
	bh=ZVzarpf8WNOwq2Ti/pRme3ZP570l4a1ExNIDsoiGNYY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=BEqH9cOdcoOCiBorDk3sYdERJWRp9VJhxnwQNG1o8SG2t6Xf1SwR4TMHXvc2OdX3nTiI0hd41eFWVIEcqMS/wP4L87FLA/yGyJNwLv00Q23uXCYKzRvfLcv5wCFQQQoZrI3FmEMNkqZFGuLlKkHBDfY0zuaApfO5qRDRFzP73to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyJr6lsU; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyJr6lsU"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so1884839241.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 Oct 2026 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791928703; x=1792533503; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p1do2oSuujusCaRjwJuehcZTG9i2h5W9hCTlUTrulZ0=;
        b=XyJr6lsUmSzpkf/dbPdOtgaXkTvRWyieF/nPU3xIBOXPLzc0K3N8iRkNXYZiOYpEzb
         FmRzL+JzPek8CKAejm2rCN5vXUbtmR4prKpx04RMQo5ic+tXrUZLbUV0ZEMC5OH++0zO
         aP5g6u9HBbwbxQSeMmawgR6F2egr2wg7o1mes9il46hSQmX4X9hSdlEf9imCSmjY8HrC
         0c7C/2q9zRADh6mwgnK1zSch7wUuRvhSBxTrNXMZoaUBHlSkgijMFootc8RmmXTl1dyd
         xfryHvliDlWM1AQCBGlx/ZaTelXHyYC5PPAd/gZkwWFe63rumUH1vcjnKx1Z5YAMUXp4
         /gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791928703; x=1792533503;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1do2oSuujusCaRjwJuehcZTG9i2h5W9hCTlUTrulZ0=;
        b=mYs4CGu7JYP0b9VpZ18G43YeGe+Pxo/HvVqp2nDQT4aONKegSQk5oDWv6shPR0OzSN
         zjQZjsxEw6LHwgehgT11E3hNSq17DvMqR+GASffYWRjAn6wUYmKe+PAB/vC6XedZnHRE
         ZojdZcppi/+Dh+XLIE6aGqpCGVA3PwRoH7iHZP7z5/Bd9dVZrSZpS7ts2eaGfs6TeqfY
         fzmBBh28ppFenrDh2FVhI2zWTfTwq+RVloaw5/Lcg6pRHeEDa/C8Jx4m1rxX+0hPCA26
         enITqccxFa2AwrhqDTHQbbQS5ePdy5dZBWR/A/Q7CEIrZPQ9V6/Ur3ZR3QLy8MgLFflz
         9HNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQjkFGSU7RC/0ePfMY40buYiCMlgOFxJVvFrRdRAaFbYPpc5Pm6zKe8edul+14ZCTgRhP8LdgLS9kjS1ukW+2Szp3F2A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJhxZks6fh9md0S3/huVuy5SS2qQRULgspfzsB98muIRzghMxy+
	vnWcwo0BH1xhJ787amRTUGMKzfN+OEHCSGQOo0q1ts41pml18pF0uRY=
X-Gm-Gg: AYBFou1Od/p3DpCn9tu+leWNBvq1qQrd72QBqi6VeEJNf28K5YWr3nkkEhXLXnWY2wP
	NW8Pe/X9fmEnYOUGaDE/avm0xYDC1Tn6gCFD3jTlxNhVguM1atDvZRECDvKiw7+YO1Of4HV1rwp
	8/DlfvGuY5vAD3nkvGGPIGB/w/mxeeWJumkSG9fmyUigovCUd/S+bFivOfVYk1TTvcUcOhSYBhL
	hYxt46Yc567QW6Zn4KCcE9Q1EBqweeqsKrBO9O7NKhBP0CFEDrjVjFafZmCGYTBEddcxIctJAuY
	8g8/5tNxDjA0cjIusIH49XRsr7tYxFY+OWqQ4t9vcQletuNOhpmtDuoyxwK7yVUUrgayWsvARCP
	Xp5WNlXd3dLCYTlgKSSDZsj3I50k8NYYKkfjY3G2sRVJ6GLorI3IekoWHmV2fWSPbOTTwBCkdbh
	D01xoSjZJ2zlIYuzunmUCUy3iN95vm0FjJGXcufWMijXCq4lndAUhvXK/KXkhhyz2ngon3SRbp2
	0z2WmfylmFRZEOUFj0hUo0XwoJyOzZ9TQ==
X-Received: by 2002:a05:6122:30e7:b0:5e5:35a5:8b09 with SMTP id 71dfb90a1353d-5e91f4c2a8amr4731717e0c.17.1791928702687;
        Tue, 13 Oct 2026 14:58:22 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e9646bad8fsm1758237e0c.17.2026.10.13.14.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 14:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 18:58:14 -0300
Message-Id: <DM41PHVITKOG.3I6P2X8048BEP@gmail.com>
Subject: Re: [PATCH 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: <nico.antinori.7@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Burak
 Emir" <burak.emir@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>, "Miguel
 Ojeda" <ojeda@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
X-Mailer: aerc 0.20.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
 <20260930-rust_kunit_v4-v1-1-e3b0d45311dd@gmail.com>
In-Reply-To: <20260930-rust_kunit_v4-v1-1-e3b0d45311dd@gmail.com>

Hello,

There are two observations by Sashiko in this patch [1]:

> [Severity: Low]
> Does this interception occur too late to prevent spurious error logs?
>
> When a Rust test panics as expected, it triggers a kernel fault caught by
> KUnit with an exit code of -EINTR. However, kunit_try_catch_run()
> unconditionally logs an error message for -EINTR before returning to this
> function
>
> lib/kunit/try-catch.c:kunit_try_catch_run() {
>     ...
>     else if (exit_code =3D=3D -EINTR) {
>         if (test->last_seen.file)
>             kunit_err(test, "try faulted: last line seen %s:%d\n", ...);
>         else
>             kunit_err(test, "try faulted\n");
>     }
>     ...
> }

Even though the tests marked as `#[should_panic]` are reported as
successful by KUnit, when run with `--raw_output=3Dall` those log errors
appear. Is this a problem? Along with those the Oops message and stack
trace message show up as well. The report summary is clean if no special
logging options are used.

> [Severity: Medium]
> Will this condition correctly handle KUnit assertions inside a
> #[should_panic] test?
>
> The kunit_tests macro overrides assert! with kunit_assert!. If an
> assert! fails, kunit_assert! reports a KUnit assertion failure and
> aborts the thread via __kunit_abort, which results in -EFAULT rather
> than -EINTR.
>
> Since -EFAULT is cleared to 0 in kunit_try_catch_run(), this condition
> checking strictly for -EINTR will fail to intercept the abort. Will this
> cause valid #[should_panic] tests containing an assert! failure to be
> incorrectly marked as KUNIT_FAILURE instead of passing?

This is something I missed when working on the series and is accurate.
The following test:

#[test]
#[should_panic]
fn rust_test_assert_false() {
    assert!(false)
}

Is reported as failed:

[18:31:00] # rust_test_assert_false: ASSERTION FAILED at rust/kernel/kunit.=
rs:383
[18:31:00] Expected false to be true, but is false
[18:31:00] # rust_test_assert_false.speed: normal
[18:31:00] [FAILED] rust_test_assert_false

But the user-space behavior is to pass the test [2].=20

Does it make sense to leave this behavior as it is for the kernel? If I
am not mistaken tests like those can easily be expressed without the
`#[should_panic]` attribute and negating the condition inside `assert!`.
`assert!` that are not in the test body behave as expected.


To solve those I'd need to check the `rust_should_panic` flag inside in
`kunit_try_catch_run` function. That would require changing its
signature (since the `kunit_try_catch` struct does not contain the
`test_case` struct and the context argument is void*, so I can't safely
cast it to what I need). Other alternative is to create a new function
for cases where `rust_should_panic` is true.

My approach to this was to modify as little as possible in the C side.
I think the current behavior is ok but I want to know your opinion.

Best regards,
Nicol=C3=A1s

[1] https://sashiko.dev/#/patchset/20260930-rust_kunit_v4-v1-0-e3b0d45311dd=
@gmail.com?part=3D1
[2] https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D202=
4&gist=3D2b4b29a266271497ea9932068ecdb8ff
