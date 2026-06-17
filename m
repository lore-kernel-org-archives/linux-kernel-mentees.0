Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FCF394788
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Jun 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707186; cv=pass; b=pKPZUBehLWkYOU88elcCkQQN06Ognh9O3+upkDVHzD7BGmItGoJnqXTY9QTk7aWyKXlj6WrOTfni+q8XHuQOeqcWHlM9sC0WlsnvhVvKZxWKqDOG+ttTfu9wL1mX5qYirw/GlV6KrqZUwz884mOoL+SBb3Inx2xvK03kCeMU+6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707186; c=relaxed/simple;
	bh=VxS0HmLW8+GSRQzFXTi1M7Yh8UWRw8/Egxhz3hzeuMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOVHGdTr4y8dYWsbqJwyywHqP+LNZmL7SOOZuU5/gSboGg1Vqc2EeLnSH7b0w5dNu1A5iNYj4dzyDnAiP5kVlSG04z3XnQYswqE0j3Hqt5otIVt4HXFXVELnfIWSgnslK53J2K5YshvQaVgXYUj9RoWTMbNI+Jq6DN4KRlO2QaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHGIERDT; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHGIERDT"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137dd3b29d5so297786c88.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Jun 2026 07:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781707183; cv=none;
        d=google.com; s=arc-20240605;
        b=XAiBIVEcUw6kp/M/GUlJY5/iu8noMvgR1LXOXYQDVOCwfVrnM0FJT0JbCHjhP+Dm/E
         CgXhEeZ3jPhA5mT/woiuF7p/WICJsG/14b4LY/llKQqx27b9YMnMIj4X5W0RShRiuJ/t
         jwxr8s6BHVQlTL3DRm6p/HfcMgYtulhaeuWc6AUx2Xsex6DFo9DGLSVhicsE1kM6g/aM
         RfFLAdb+rWEukWQGDiqD2wAhfNKB1xHFI1ZJvQZymxA7tTicUaULwUou0fsn9+iG2+Lj
         El5oqipYMM7mnSJfHoHS8oz5dI+Wi2Cy/yKXPXUqxgCjT9YrCqHAqlp45Gvn05rMi9Df
         1feQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VxS0HmLW8+GSRQzFXTi1M7Yh8UWRw8/Egxhz3hzeuMY=;
        fh=dK4tSjZRGPyo48Rq5xY+/3jlLVIBTMrsh7Y/xoALx3E=;
        b=ZqEdBip9cDSoOFFHvu8bFniPuvwancv9+vvmb9dXmSYopIgmK2jEaL+ybhs0OI4YAW
         alWky2/TJpx4xJ36Iv22pwDkzWsym+ZgdRxSIhJ29WnXUqd5OxLdUakmJiaKNxlwUb0w
         lyqBnjWloltmaiPninMDlWz6Cr3Gi/YFrkXqYZesxl7sW2IYNi0fkDzodUf0H3HU8UDZ
         HKjQoWgZjw+ToK8VTP03minTJeKm2SF4XwmB0heI4k4gxAtmJiSl3fs8r+5kA3Pwm6cx
         C2RnihYOSLdtmn2oS79W+5pIc3HDx2KIZTgDUTKZCEU5l0C72c6BbUAkTCCVZmLXl/ZP
         VCPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781707183; x=1782311983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxS0HmLW8+GSRQzFXTi1M7Yh8UWRw8/Egxhz3hzeuMY=;
        b=rHGIERDT7ZCbTvQUYiPspdXEnFbO7zFlNTxWKzvsYPXpKsNrtpuhpviRQUEo59J+1C
         YonPU9NZ7jxEarQOFHje5Ev6t9e5HltIzscQx2Ynu7R6qmS6oRfwdqdTe4S21rFOfENn
         NBH26vahLrJFt0JKMFZOuQnZUnJ+Bpdx2L1uSu0oBDem6da7mQzDb+mAagsbmSmfXZ5i
         c64nn83Xd8MvmGDFCzDgrDVuK6cT5cYhQjDU51Ck6qUMlIhyj5Naix9t+QsxtF+DARGs
         Kewxi/XbBSu/AfQ8lgox/HSEBrBwUEOAKiGteLI0eQBOiu49iMtSwyixdlk4OuGg3XHZ
         DM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707183; x=1782311983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VxS0HmLW8+GSRQzFXTi1M7Yh8UWRw8/Egxhz3hzeuMY=;
        b=nzVMk5dhpL4jBEZnEprpLiGLNvDqUO//cyIF5UyrixC5PKnoJW7EMBN7f8fck6+CQW
         7vCmrTwrsICw/Z2Q/R3cOOngcfp5IKtT2vNYEOaa/wvLiP55PKRvStkXzkEwvQCC/wOA
         YJqYO4WyroK1kpccBP3TrfuRXk6pxEgldqO9i5XTvx37Emyau0OYbySC2KdOXIvYtMHm
         Gsw3q+UTkY8sr5a9S8CyWXsHivhFMgPa1TgsKbM+AOREZ0/mnj+fZCovCAj5TpdY/NiD
         PJZxSH95rPHeVO64K5d0LdlrB0BYTS2IK9Hmllr3zKS9YRS8+wSkictmCL6ZuHSmymQO
         KeNg==
X-Forwarded-Encrypted: i=1; AFNElJ8Lgcpo0KloBw4CcWKguSzj6mfLTg1NcV8U1dou+CCVSk950n1kYriDynUttXagUcO2IR9VJrltg21LHcrTl5cEXviUGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhzyCga6SOHTcIQ3LP45HAYoYnMnvww8AOl+5IJQrhq4jsnYS0
	eM4pq59ICQX6ST4tM29dtAM0a/ccl4Ny+XumZk0IOryg0o/y6i+tgXrwUksvkps8tQb++qD4NH4
	A8cHpjlczfpGk6KLFOdpwE9cl23KOLAY=
X-Gm-Gg: AfdE7cnp05nDGjhJsPp65xP6+slJBhBJxuoXd9AqAoEB7suGf09r5aeCKtceWxP0E0e
	RuaADRAag/dqh5rkS4+f+X/5ya2vBLo8RRkFIzf6aoUws4TLVD/Dgtxv4TDTTa6NDMl1jaGoXwf
	5AuzqNVV1FjlXmvihSYsTH1144AT0H0W8vOeZtBqkF3B/GwiueutAM4NybjggzTRZwXjeaPjQ5A
	MQm/QhwP8/6xqNfIoKJrSLxYU0S6jLFoJXE6dREXN154io+Rvk1DhScowiJ0Kyh/6sq03YYKSbn
	uRTKFpwLikaJ9thmGujbAgNEw1p7+K5fqDyhuYKkx4Lo/LpAnziqhsvQ93BOBmfxXQdiUtUeWkg
	6O9l7Qij53dyv
X-Received: by 2002:a05:7300:818c:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30bca0cee9emr950331eec.3.1781707183050; Wed, 17 Jun 2026
 07:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616223614.16444-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260616223614.16444-1-nico.antinori.7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 16:39:30 +0200
X-Gm-Features: AVVi8CdE78qrDEpmaA2sbZX9ps1hTfrNEgWajsz71kJ1maFNG--DIeKGXZ7BaMc
Message-ID: <CANiq72=Hmor3xnwQKbqoLe28yMei6hz9KdAUHeje4UapyF_w_w@mail.gmail.com>
Subject: Re: [PATCH] usb: rust: mark Device and Interface methods as inline
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 12:36=E2=80=AFAM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> When building the kernel using llvm-19.1.7-rust-1.85.1-x86_64, the
> following symbols are generated:
>
> $ nm vmlinux | grep ' _R'.*usb.*Device | rustfilt
> ...
> ffffffff823f2490 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::dec_ref
> ffffffff823f2470 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::inc_ref
> ...
>
> $ nm vmlinux | grep ' _R'.*usb.*Interface | rustfilt
> ffffffff823f2450 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::dec_ref
> ffffffff823f2430 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::inc_ref
> ...
>
> However, these Rust symbols are trivial wrappers around the
> `usb_get_dev`, `usb_put_dev`, `usb_get_intf` and `usb_put_intf`
> functions. It doesn't make sense to go through a trivial wrapper
> for these functions.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Looks good, thanks -- I can pick this up, unless USB wants to route it
differently.

Cheers,
Miguel
