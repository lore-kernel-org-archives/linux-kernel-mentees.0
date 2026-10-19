Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434271;
	b=GFW0KtAb1Ikfuk9JFZhoCRMfU+61kxjqY16QMuJGL1hkqSRX4etzEhq3md2bZyCVL3bU
	 tH9B2w0cfKpriwB5qtGxxBWfyEgk3BPdvU7PvTgUioRzoD32g5A2NLsYUB4TqgJWifsdr
	 sOr6mQTyWo8VCfEht2XXCGzsSaMqDQ6BE+2VBIUgaYMH4Wof9D/jEJZQtDe84S1KRlZcA
	 8i6slyrhmMMNOQ/c7ZNnRPCQr3sjR+JMpgEOcebrzjDb2dyhlFxvcswJ3+1cOcbu+SCY7
	 5cZMcW4QhMnQxq9sY9QicTaNv6wJvK/mcffj6y8F0SvSmVvWkbcwIepsKf5VSXdETsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=kVQzCHWMhDAXGaFSs/w45J/x4L4pGUMMFJgDsU1GON8=;
	b=Megsx631mnsBlLW/FGPsQDjNB8Nd6QH7ApmNR7lUkFS55QH2k6krEFYYIu9/5jLxHvrg
	 7EpdBVgbxQ8sCud2CErF2TUt6hrwV3ngBTnWOTpn/D7xzhM3bimRwbteSrMnTr8sFgB5a
	 NrCdR72+gCmaTtjepM6KbaKXeSPjvgoV5gFt8d7aW8Smh1AxJ5AvHlwkz7YjQvmCXVtbd
	 qOagglsxA8RBi8Wr+VNnsQBls3OrMyuGebS6oW56scLyRThcgAhRjTZ3m2r1kBbo0iYGz
	 kFVLBM3pHaM245UjPbaIc85CaXbebs3G3h7e2NXff/kyIjopIv1RM7KBQdXU3BxR2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gd3+DFvd;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057D0606A319
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 18:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 057D0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gd3+DFvd
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1690962241.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 19 Oct 2026 11:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434270; x=1793039070; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kVQzCHWMhDAXGaFSs/w45J/x4L4pGUMMFJgDsU1GON8=;
        b=Gd3+DFvd6F2XbWFYnDtxx56NoU1MbA1eqcZv/Wp004BpdB86VnNgfdVOgEsQ8oEdK/
         2cv5UCMVmIas0kvMsbuL56sOqXaC0brGDfx25Rc1LJDLb/ed9G7dXc5iHorXL+GQRRHf
         BazLhcYAVFUhSyhpMkbXSiITaHvPXyJRGpFj42c9cOrEcjiZW8w+mYjXpAOEuejWndgV
         wuyyXYJdTG1Gg3LaDGrQM2pPmLfp29rTgqyfCCMFU72cSsRr3cKGnTkX7FM1TVcAZVOO
         Ch3NyI8LV5i2Vfb9Vkmkp3hOa9OfsDnM+HNI81VmewXKbWcu5+k1YAx52xUJM+ujYNn6
         5VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434270; x=1793039070;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVQzCHWMhDAXGaFSs/w45J/x4L4pGUMMFJgDsU1GON8=;
        b=ZmHhtGchKCSsBn59uI/G6+6Bb8u/DxNFeHVcucSnqZFpgGP0GsuunZEubE2q1MQGcJ
         JPn/NeegBQzMQ5vmEVpBNgFIgFiGkL46wJbofG8tLdZhImxGD7bBT0URuhVFxcE9AP+j
         LO4pbI7Slb6eQgZoURoX71Ehc5N1ouWyBNq/tyCuCD4CDO/GIu80loJvsMSXnmOesvbk
         1KUyLSbpxoYHVuPoQLbiX/zRt3kq0jaBR2xWra+B6zdzeZ8vVzZFy6Jo7ERTYyGYTet7
         HH6GpAzhhQE2iJLCsSL7HaDQTDRvnOlisRPzACsxRbF7OkwcCzjm/D9PDjOlC7qHyYMZ
         uq7A==
X-Forwarded-Encrypted: i=1; AKwUvByBXeQP8U89AhvF3Tw9veeGYk+EinjAUYcLoFUDS5/NJpxeCC7+qzjNMyYCwL0/6XnFOf5sLk6dZPFWfEmVSwarbRM19A==@lists.linux.dev
X-Gm-Message-State: AFq9FYKV1K6mo3geXjOain/TUlEvUDoK4beiRT1OQqvD74MkNzaoWFSd
	0N042fBKla9JHbZBq/S/vmTbTOYuuM27dsWncQd6lg8gnEAFl0qX1k8=
X-Gm-Gg: AYBFou2qJ/3s69BrxvoJ2R0hfTBGxNBupSCSkStkaVwGBB12nnRy9erI0H/WgKAFwln
	mOxvwg5/z4qvfUapLO1eX8DxUah7tNdVVNiihnYIzwyrWhX8Tl9DsptrYcpwmm8LGG0rMteYrVY
	2RKf+MRxglGGDuLEefzKSCgS8evEVSGp5NVwP7CS/EP4REl8hZtoKqEzxamZOp476UlgxYJAqJ7
	6V/NpExF3VBP2T0FLH4WE2owedXK8Ze4s0y8q6ayf1Kuqy5zyh7GX7xP1bLr9khEVP0ssgIvOPV
	jaRWX6lIRVC8jKpI1AnyyS3GSn6t+ebMGKMYGEsj7MnuY4JFmQs8PZ0wkk4HtzhKUvuRl6FgrZP
	0OaDag6qDcthVs8p1dH8W5b35QMQR4Er6D/araderELTAZ5WQevQbSYn7LW18UAfHgqUPAvKtZw
	tUJfKVFYCXm3wg6ZOV4JzdZItMNi4deqkqVNxyPN2WGqugDFItPlh9mAZcGDsADqkFZ/MvRqHeL
	hq9IAvfwIZcfLBCVabvB07PB2J812Junw==
X-Received: by 2002:a05:6102:26d0:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7cc36905d1emr2860017137.12.1792434269987;
        Mon, 19 Oct 2026 11:24:29 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb3642b1sm853242241.8.2026.10.19.11.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 11:24:29 -0700 (PDT)
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 15:24:22 -0300
Message-Id: <DM90X0PTA682.3UJMZH614WU9V@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Brigham
 Campbell" <me@brighamcampbell.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Gary Guo" <gary@garyguo.net>, "Jori
 Koolstra" <jkoolstra@xs4all.nl>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: pci: remove TryFrom<&Device> implementation
 for &pci::Device
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Georgios Androutsopoulos"
 <georgeandrout13@gmail.com>
X-Mailer: aerc 0.20.0
References: <cover.1792417858.git.nico.antinori.7@gmail.com>
 <d128d86b751a51fff46a1702b636de74a4807097.1792417858.git.nico.antinori.7@gmail.com>
In-Reply-To: <d128d86b751a51fff46a1702b636de74a4807097.1792417858.git.nico.antinori.7@gmail.com>

Hello,

On Mon Oct 19, 2026 at 1:13 PM -03, Nicol=C3=A1s Antinori wrote:
> Remove the `TryFrom<&device::Device<Ctx>>` implementation for
> `&Device<Ctx>` since it has no remaining users.
>
> Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE para=
meter")
> Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1264
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

I got two reviews from Sashiko [1]

> [Severity: Low]
> Does removing this TryFrom implementation break the build when
> CONFIG_DRM_NOVA is enabled?
>
> The commit message references commit 7edc491f6fca ("drm: nova: Use
> nova-core to read VRAM_BAR_SIZE parameter"), which is not present in
> this baseline branch. Without that commit applied first, File::get_param(=
)
> in drivers/gpu/drm/nova/file.rs still relies on this conversion:

This is true for the rust-next branch in the R4L tree, but the named
commit is present in linux-next [2] and drm-rust-next [3], and the patch
application and compilation were tested in those too.

I am pretty sure the patches were created based on the master branch of
linux-next tree (because of the discussion in [4]).

> [Severity: Low]
> Since TryFrom::try_from() was the only caller of bindings::dev_is_pci(),
> should rust_helper_dev_is_pci() in rust/helpers/pci.c also be removed
> along with it?

I didn't see this. I apologize for the oversight. I can send a separate
patch or a v2 of this patch alone, since the patches of the series are
related but can be applied independently.

Best regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/cover.1792417858.git.nico.antinori.7@gma=
il.com?part=3D1
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3D7edc491f6fca8e22f51e37a16d74914cd959274d
[3] https://gitlab.freedesktop.org/drm/rust/kernel/-/commit/7edc491f6fca8e2=
2f51e37a16d74914cd959274d
[4] https://github.com/Rust-for-Linux/linux/issues/1264#issuecomment-619469=
5910
