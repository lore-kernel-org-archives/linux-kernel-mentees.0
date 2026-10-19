Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438091;
	b=0OLHHtLI1sg8469sFOfT9vNp2ft3sxJyxNz36ob6xuGfm8qAGQKOzupizoUFMdDxcfWP
	 Zr6IMgBOez0ljZiyIkbG1CkpzPJL03YUeFzxjCpZwFQMEbmCTstO0/CRCq2NyoA80+3b0
	 k4qTk3UvLVx80SokQ4z3p8gnaApWvpneGjIhcz9VT2TlrMLPI4X4SvxhM1GiJX9WFysEN
	 LWzEC5GzqKNgxw77sRmc33V2mGJCOb0kvy1vjigQC7yWTO/3lCaee6I4alz8/0oQeMsgr
	 Agcbfu58/FbwMVcvam3gybR9xMZPVvFu7XuHHI6ueUN+KJAzUsxkzPa51Kj8NtspQIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438091;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=STt62GhrjtlAglE8Fpdd7yc+6Z9UwSuWNn6eYMG1ouk=;
	b=UfgahgTbw6IPptbUXeE1S4ZAQaGefaZx2vPqSpa7BYhH5TrRPBvxloApwlTBa2Al5eyP
	 tq5Bl+08B6zyc8SOw+yA6h6mh8wDhTPsEInDElDig1xsVelDFNRg6GHWNYCp2Sc5PuTkd
	 NfwreAydgkDqQSg0MAqAUbAQkAAHWdffreIXEhVh6jJyRb3j4Q2HEe407P9iJ3tZyY2J9
	 k1JXjAL98pmDK1Vc7/sA1+uPK2NUBONbfo6pM9asATM58Ng34jwdfGdC5qMw29e8/DmKR
	 wEFful7uURUacO6sol9UYh66dGagGkPJa+wwqNzSM6rt5QbOYt05jvQIzbpm5rkx8+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DY6uQ414;
	arc=none smtp.remote-ip=95.215.58.130
Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EC4606A32D
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 19:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41EC4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DY6uQ414
X-Envelope-To: linux-kernel-mentees@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=STt62GhrjtlAglE8Fpdd7yc+6Z9UwSuWNn6eYMG1ouk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792438088; v=1; x=1793042888;
 b=DY6uQ4149wsRfN40RY/7MsLXHlyisdPMDY4QXEU95aA6wQGE+Z386EdAJXqP566PAeShjigL
 KARPFKUnIGx4XE7bGBUeKtSiX3Hsu6J7MNftR8WoKkEREWhN0wxwp0H2GrlJ6c/y/ycSB5L4ygM
 Z4ADP3BCS70Q5UrZUAvqgZ4s=
X-Envelope-To: linux-kernel-mentees@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 5e3ea1f02a9fd8ff;
	Mon, 19 Oct 2026 19:28:06 +0000
X-Mizu-Trace-ID: 5e3ea1f02a9fd8ff
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject:
 Re: [PATCH v2] i2c: rust: avoid locking when performing I2cAdapter::inc_ref
Date: Mon, 19 Oct 2026 20:28:02 +0100
Message-ID: <179243808241.1915.11587324230389063446@linux.dev>
In-Reply-To: <DM3QKTJYPA8I.13TW7H9HIV3YB@gmail.com>
References: <20260904134600.340991-1-nico.antinori.7@gmail.com>
 <DM3QKTJYPA8I.13TW7H9HIV3YB@gmail.com>
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

Hi Nicolás,

Sorry for the silence, this fell through the cracks on my end.

rust/kernel/i2c.rs side looks correct -- this is exactly what I had in
mind in the v1 thread. No change needed there.

Reviewed-by: Igor Korotin <igor.korotin@linux.dev>

Andi -- the i2c-core-base.c/i2c.h hunks are yours, not mine. Could you
take a look and Ack if they're fine? I'd like to merge this once you have.

Cheers
Igor
