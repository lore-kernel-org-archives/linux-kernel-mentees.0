Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579093;
	b=DO10Ro2XThrYBRtWaIPr8+mS0MEkZjgXGog7bXnXoZzFJCaOiRhalVFCbqbk4ni83iDK
	 i65+97WarSuTzUT9Lepnga82a6tD6vQl/GTlyT3UUFlzE3Am3/bZlWobo7qqX2cvqwjzt
	 xORP25PGGTTeCwA5Aw/ZqCDTWkNB6HXoGQ8vHEV8SPSTVqqD+bwhqAWQsWqHPATg/TPZ2
	 hszVytLVor8Lc5YarXErOELeYUB242vi/cSt5/vX+hde68m+ElhTLhNffApXPjs5hSrL9
	 IENiMSs6jr079I+kkPItolReozEMla2qUekpNnP1Yi85AJ5dNFsm7VqssXX8so1DTbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579093;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=YwmUvHkGTa//vS4IwVUPfkvfm6qtdCHeRkio5ziEENg=;
	b=zfAtJT+T2NgfhfH3cMb9yBKmI60nZb2oOR17/9wbCG9NEo54KgDArwH83ZRVNzRcql5q
	 lIXYkp1gsV8WYRc1eg6SNAWtOGFZE6cuqxQcHPVIujIjrP9tJRekAz8F8TmvBNubM3j8t
	 kuOqZAOT7DiIxgL5DHG5H+vJECYkxKxIBl9h5vPbpO3ogkE0ThJVgeP5tx1PvCmVQwGHo
	 xQ3kuXomxDN1kSOy9TLDnLl1mnBO8vZtb3Irxw+iy1PRnicQDhzZV0PX/i9g40Q+VSdOl
	 ishTm2hHkaxRjlBZCknqbA9v37UXAOxJml7rnRHid6ePoDT+AkG/hhUkG3Yh2HoFFLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qxKhbAYE;
	arc=none smtp.remote-ip=95.215.58.36
Received: from mta1.migadu.com (out-36.mta1.migadu.com [95.215.58.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54C7606A31D
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Oct 2026 10:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qxKhbAYE
X-Envelope-To: linux-kernel-mentees@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=YwmUvHkGTa//vS4IwVUPfkvfm6qtdCHeRkio5ziEENg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792579090; v=1; x=1793183890;
 b=qxKhbAYExvvO/VDn0+h10+AgjZklvfrMFIrLy2113+ersaIn6pOVqXbG/o8ntBEKfnKy/4Il
 w6ghk+UBWzPwGSG6rMKxW1qgR0+HPpNOmb1VHmOVtESus4Cown6RetuxACVT6n3BPGdpv9UfN+3
 lBuzoPv8SdSTTdqqeRwfI/PY=
X-Envelope-To: linux-kernel-mentees@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c9ca0b03b8d94fa6;
	Wed, 21 Oct 2026 10:38:09 +0000
X-Mizu-Trace-ID: c9ca0b03b8d94fa6
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: =?utf-8?q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
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
Date: Wed, 21 Oct 2026 11:38:07 +0100
Message-ID: <179257908750.11105.893364071829221111@linux.dev>
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

Hi Nicolás,

Checked -- confirmed no other users in the tree, and the Fixes tag is
correct. Agreed removal is the right call here over a lifetime fix,
given the new driver model has no use for this upcast anyway.

Acked-by: Igor Korotin <igor.korotin@linux.dev>

I'll take this through rust-i2c-next.

Cheers
Igor
