Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17F434EEFD
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Jun 2026 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834213; cv=none; b=OS3nBhevlH8RHNLfeVU2ErkaHZy0l3REwBAnqSBImWY5fIqpQbK/RwLsCvcWeb91MW3LiHDVtdfGMQY2f+VrtMceupG717Z4cRnTDXNWSkl6KMXMi7qen4Idl3fF9p6hI/MUQqLXGshLT/QrF9WpVfAiX6uuKB0pRppaTq51Zsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834213; c=relaxed/simple;
	bh=aqUwzODJXitno7dT5jgjJUU9tcfO6dAji0U1J60gUM0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lxKwhLbE3QhKZwRYjVfwif9hLH6cQRF6nsVm4M5Uq8rGpxRv/jR762Ktj6Cx3KnxNTnEdkjwXJtK2+Yjb41xyM5gh+3oTupic3dZ7yppMUmKj6sieHGEODYi03DSAXzboop1mtsHNQjGMtU+tg1Hg/Z+w4hzpz0bPmCY16XPp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egvjTt6D; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egvjTt6D"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so954654eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Jun 2026 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782834211; x=1783439011; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX8g/k8yrBFhKJutLCj94XGUjlLYYTnZwSVrPSJLJUA=;
        b=egvjTt6DcbNyraweJmplwimaSMxkByw1ETqNfruMe63NosH4PKESuYDgQzR3xNKSW1
         REEhd+h6d2+d3t056MnUu0x1bCg37FmKXPlUznNCNqE1aa3cKgvzObJgM4y2pydyb5hR
         oMOZtNsgSpTVi8Iqhr0nW3HoU8ItTjMnSog1X1UnZ+UlXDLBxa55+PJpsrTC+3Eki0kq
         fwvPVsoaHvuCEzW06dSpYqg+oTBGM80ttyU2UAAC2uWqzJBJQgD3WWSqWum/x252xnq1
         HrNYLNAAI1l9WRX0LMXWz226l96qrmm7yfqaZOKOTxQ/+2EWZMQJnOgjgfO5WhyON2vA
         owHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834211; x=1783439011;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YX8g/k8yrBFhKJutLCj94XGUjlLYYTnZwSVrPSJLJUA=;
        b=rUOcK5V71iZ1hHwoKkt/0ZQpyli+NACJjnLOchsdJlf3VlJBaxyLNFlSwcoy1YMz5o
         gZoyDVKco8swmLf1WIv2C80834BeNgCiDJpDtCSDu/zcwn+1BJ3F0xSKS4fD/eZufPwf
         PoSl92RI0t14Zb5QjuqXmld0/dAxkAXp6JMYaEE497QMs+QXgbiPBhcKSuuMIhJxoLAn
         MHLhASaGvSfyGuBNxZwoQQcOFEWM1mcFB5etxr5oXqjAaZxDWFjvKoNjsL4vjsJugnbQ
         9cmLohCgbJ2Zdeh65Co8ZFKDtwm+/uFzS5+DsVzXiKUNGUM3n44Lt3bp2t17xJfZoDns
         oTVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpycWuvjF+fwR/84oBxGa9vdePvMCXb0xCK3dgnPU2E72vN4lCfU+dl1ZxJiC1VmIi65IKDyjbP7puJhKQjwPa2re7Ytw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw29GojbimKtQBLN8QWY2+Xgib0TV1DMPhHwe2fSxIn3HY454Cz
	hciosduXUV0FrLttobRMRMCKdY+ohV6wCuS6JMVqlxfCwc2gwX+6+FQ=
X-Gm-Gg: AfdE7cnkjhApuJW3HxpUu7TMRxm5ZpqsPPoesKoky58GTVfDycfSYkVVvSeFo2tfjMI
	WScpTFwrIqMQ9HogxMrjR70LnWzQgB8sqnnXgAlN9Hz6wVBdiCElhPlWPOeR8YIeLCPnxWffJ2G
	bkNxjVZuu7zIL9oPAoQ3AJWqcr7ynh4qnX640o8rjsUoV3ZZGX5wRr55mCh+4WrldImNtxLGH1B
	9Wo3aEz1LsbOw59Z95Wc48j2DIIETvsi4AvOeD1d0fIvfYEJ91h5Dm2G6ZiLlJzN7Hp+qKDLosq
	skk8eDHlYY+XyE4XKlebriZWe69WwxqbFUn6mngBDuNjJfdKE6T2oL88X+jxwhHUnud8hwbG2ED
	PT/j9Zkfri6BPQX+wvxObJwSlasQu7/pKlEQZJZmvyrMqwMoRToWQJD2jD9k3SnvJaPmwaR3dFU
	KMmIW/hBuf9IoongEupaA6ntprpIp7VKIOIBg34c2hooBXZzev
X-Received: by 2002:a05:7300:2325:b0:30e:d236:57b5 with SMTP id 5a478bee46e88-30ee128cd0fmr3421948eec.16.1782834211044;
        Tue, 30 Jun 2026 08:43:31 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5c4c3sm9520156eec.2.2026.06.30.08.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 12:43:25 -0300
Message-Id: <DJMHZB23PNGV.2SM0ER4JFQYI@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Tamir Duberstein" <tamird@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] rust_binder: use pin_init::zeroed for file_operations
 initialization
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260626214404.852685-1-nico.antinori.7@gmail.com>
 <CANiq72k8KOmVLrHGOa9SidU=vYqGUqi5dmyW9J1auVMnqaQAeg@mail.gmail.com>
In-Reply-To: <CANiq72k8KOmVLrHGOa9SidU=vYqGUqi5dmyW9J1auVMnqaQAeg@mail.gmail.com>

On Sun Jun 28, 2026 at 7:16 AM -03, Miguel Ojeda wrote:
> On Fri, Jun 26, 2026 at 11:44=E2=80=AFPM Nicol=C3=A1s Antinori
> <nico.antinori.7@gmail.com> wrote:
>>
>> -    // SAFETY: All zeroes is safe for the `file_operations` type.
>> -    let zeroed_ops =3D unsafe { core::mem::MaybeUninit::zeroed().assume=
_init() };
>> +    let zeroed_ops =3D pin_init::zeroed();
>
> I would just remove the variable and put `zeroed()` directly in the
> fops initializer like we do in other cases, but it is fine of course.

I thought of that as well but I tried to touch as little as possible (I
assumed that was in a variable for a reason). I can send a v2 if that is=20
preferred!

Thank you,
Nicol=C3=A1s
