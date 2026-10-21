Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585981;
	b=nIRI+qqwnG3vDha0TfF6aL1U3R4nK5r9j/+f0OTtUcVmn1ARzjndXeJi0Yff2ar3YwBF
	 uKGbZD/kpMoaq7KD25aVTjnlIAXo4gw9ZSEcDEbtIwZF6ASVDTuWYF/V68DKhFaeu2p0X
	 2EY0m3H0olFcWFICNp4clgVFRt9HqsTUAOPJKKBmQ1zu74ho68lSBtiyiFWVZEQS2xOOk
	 BZHdcJ3KjoeddLkBGgtPHHODKqY7AYiLw+jcdfovZxuIJ9VbFn87lvN4CaTv9k6A6juAl
	 nhqBbSKpETYagPnf382z3KSyx5MEJaXZRvcwSRVxEt+tl+WcJpphawnS8PL8ctoQPsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585981;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=8UbbgrphgYT4+jqnZZPIAvYrMvoD+fbwUIQvN0A6Pdw=;
	b=BSTQ4Gy9PEIoBrN4SAxhZ1LSdOfLKqVk9h1rofwLxKldffc44tey5qfZEO4E0PJtw1GE
	 wIvs93IthFJue1W+p5pnlrg1IOpe7XpAWWkBJTn3fWb/qv6VsU9bayKhoo6+Top6qEywW
	 Ak3P8S5reC2bRUjKPzf2XNDeUx6c+yWUtgzZt6btdNfnX566KuGmu8x9UZDUax7B2jRz2
	 waXwlaW2mdXm3MACCT7NdR79UzcrH/pgUs+KuVGRqzaUrH7Mh17mfATNmsbDldGHQo8zD
	 NRJcfFrmmOAqVmf3Lt5rEh9wta7FWWH8gvEMI5qnyoO8WC/t5ZXaMxCtpSXxj2G6RGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gDWkEoCD;
	arc=none smtp.remote-ip=95.215.58.105
Received: from mta1.migadu.com (out-105.mta1.migadu.com [95.215.58.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77483606A31D
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Oct 2026 12:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77483606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gDWkEoCD
X-Envelope-To: linux-kernel-mentees@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=8UbbgrphgYT4+jqnZZPIAvYrMvoD+fbwUIQvN0A6Pdw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792585978; v=1; x=1793190778;
 b=gDWkEoCDZ1nVzIf6CKWHdBb5vDQUQ40lHEdp3XFe3s86dnlM4qsV1ZfaZ63JbFKrCuMdawyS
 Dek7lUMq9jbrsJZNx3UJUs9LRHjgY7gW0Xu2wvLPd7Mv7g1zTc+TA5GIBzudJ4V5OPGNCm2FNqa
 h0Sp6WwEuCPjvu/gPceiziyY=
X-Envelope-To: linux-kernel-mentees@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0207a1f2d1931a27;
	Wed, 21 Oct 2026 12:32:58 +0000
X-Mizu-Trace-ID: 0207a1f2d1931a27
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>,
 =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Benno Lossin <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject:
 Re: [PATCH] rust: i2c: remove TryFrom<&Device> implementation for &I2cClient
Date: Wed, 21 Oct 2026 13:32:55 +0100
Message-ID: <179258597583.20422.10358976352101642829@linux.dev>
In-Reply-To: <20261019152329.620610-1-nico.antinori.7@gmail.com>
References: <20261019152329.620610-1-nico.antinori.7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi all,

Want to flag something before this lands -- I gave this an Acked-by
already, but while reviewing Muchamad's concurrent AS5600/IIO series
(Cc'd) I hit a real conflict with it.

His IioDriver::read_raw is called by the generic IIO core, which only
ever hands the driver a generic &Device<Bound> -- it has no way to know
the device is I2C specifically. To do SMBus I/O there, the driver needs
to recover &I2cClient<Bound> from that generic reference, which is
exactly what this TryFrom did.

I checked whether storing a handle from probe() instead avoids the need
-- it doesn't. AlwaysRefCounted is only implemented for I2cClient
(Normal context), not I2cClient<Bound>, so there's nothing you can hold
onto from probe() that still proves "currently bound" later. And there's
no way to get back from Normal to Bound (Deref only goes the other
way). As_raw() on both Device and I2cClient is private to kernel::i2c,
so a driver can't reimplement the conversion itself either.

So removing this outright leaves no path for any bus-agnostic subsystem
callback (IIO being the concrete case, but this'll recur for SPI, HID,
etc.) to ever recover a bus-specific handle after probe. Danilo, you
mentioned a fix tying the lifetimes together properly
(impl<'a, Ctx> TryFrom<&'a Device<Ctx>> for &'a I2cClient<Ctx>) as an
alternative to removal -- given this, I think that's the right call
instead of deleting it. It closes the actual soundness hole (output
lifetime no longer independent of input) without removing the only way
generic callbacks can get back to a specific bus type.

I haven't pushed Nicolás's patch to rust-i2c-next yet -- holding off
until this is settled.

Cheers
Igor
