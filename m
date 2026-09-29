Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB5E2D592D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698972; cv=pass; b=gDm1oPmrZYbCkzjQWOLmxVetXR4JDHMe193g/VYq+wf+8zHtjX3lxEomJWVdwg1MV/WGWxBdlm6mpnE8tYNexiMNEg28J8ilmQKVDmcAJSQ7xVI2uu+opx7CmoZSE1sdzcKYZ5KM4KGmdEGiQHusGi0Tvhhpk5OR4KUx2IBzdnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698972; c=relaxed/simple;
	bh=EUIv/v9If5sMrJ7ZxRvlVjCML+V2/1G7/EZAFvUebhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoxrlD+MVypIBM85ZNhWxPb25Um/ghs9oya2PVdhJYjNxTLVjFaDkAQnCr3D9DvNhLtuCaS/1cYRgCwuDLGoubbkFJQgJojFKd+hsa4mEmBqJCOtUVr3wiZLSbBmK2O8XmvbYdjc/QF59vmRIXNVKoFFSb67ldex7LeDiU/aqo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+qBYZ3W; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+qBYZ3W"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343697ad877so295376eec.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 09:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790698971; cv=none;
        d=google.com; s=arc-20260327;
        b=NgazjvIgKgxJzHipHP/rMtsTRtrjdc5zdY67LXdEfBIpWUkPP/xyyUcBWlLNfXAVeN
         fX5t3yL5PF+XkGwSJF8h67/iME5gx7lTDLM5pHQFO8UrG6Jjv62T40MhbKTWRLB4fCH+
         PAMSWJYG56LFeVG4NBB3J2C71xpdf2BcaUamHm0338KAipCgg5EzlZ30lnVV48E9sguC
         lLJJl3zR9n461QYsS5jD+LW4qGC3VVuS+w4PPObJKcKgtf7x9ihwsME2uq5UgfmDpiau
         cr+XceS2AIHZp1UebRQcoDEBq6YwhXoK7Osd1VO/jljugQ0PwijN0KMT4bWr8oxx3Aru
         GHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aeqA9IgsbpJKecOhElEeP5QFRXfeP7pkj4jRPnaVoXE=;
        fh=S4QYoIi23MyvymXf3uunt5kERF3jwvOwf23t43NWr/g=;
        b=iE8FXFRGGUcm3Kyu9Z5AEuH1DiSkF1ydmeiMZhK9RPUrYdIHfr63YQ7d3NtUrt8HHM
         UcdWMGR7OPtXDiErToFOb0mwvOuXc6nLLUvLQkTTPzGwPb74JT/rZ3sEwG0hiN6U7w2j
         KexDetUKin7tqeecBjr9KBcptF2OvM9DrB7+faerdKzGUURUnnhQToIvkdSBkXBrPp4m
         gqt1NYw5zE+f4YowWkStvnXRkQkjIVLNutUQPK8oZF4P1a0bkYxdJSkOu380yKBdlDBI
         YaDkaG/ftz70MQMwoTdAomK1y7X7bq/J0svWncfEqbX6zwbbkmCXWqQnpJOvqx8bGLV5
         t2AA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790698971; x=1791303771; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aeqA9IgsbpJKecOhElEeP5QFRXfeP7pkj4jRPnaVoXE=;
        b=e+qBYZ3WLT33JFlnmuVzq5jBEvbZCZ/HAlgVax9SrGJAF1Y9nP1/VOXdL/0ECHGc4K
         YbuKLvuv/VROsREAmBOPSi4GG7wUkrS2wnomEYhirPxnysT8rFwlui2jFXxmj/aAk+1C
         sKIPhomfZLWaqNyvuugoayRBTq4aFCXxCm3pSfk+Fx3SMNEz/UCLPIJka9CdGpqwhWz4
         P5wL3TbOi97XGrYq++IE1cyjeenPyt+CBptctDyWYp95JExpV/0GUz0Z4PlbffDgFlxG
         2YlUckCEEDjZM4W12/EfZCTd8Dt0hSN5hSjKJaT7uJfF3aS6K9H7RZDhvXVx7kCOc6eb
         HsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790698971; x=1791303771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeqA9IgsbpJKecOhElEeP5QFRXfeP7pkj4jRPnaVoXE=;
        b=BZS1aaHA+h6YbT0ymFFA5vk2I2l+VrJq4FMmk2KPErYFnsJKlJZXfTrBPoM0Fo/2oK
         oQYB2AIBXJhMU/+7BxVeYX/5aDPfQQ3M1OJ6PF8uo/3w46PjYAVTElFt3dRtnGEVeXwx
         lBprFBn+TSCdnOoa+S0Yx5TCkmV0Tcp7VCwJ8YzmkO8j3GoKmAyTPN21fGQm1a3AN5kd
         7OTJnY96l/gE/FqtNom/u1qvZU7wizBSTZwh+zjZRiDXdsMc+mgvhlaO2x65lbaG1hBd
         mtRX/va7+eiTBOrKxGOyJE8BahVlaACacxgb9IIe1YDst4hIPQylYeQNXFjPoFgKpMBB
         BtsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWov2mvwzLYzUBLp2WhEPYsaTrPh9EAfEbbuTLEdvdyapOjgEw05mkX/M6ptdKWp40OOf5nciJaJaDdU/jCY0UGU6I4Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYLxYHZFuTVQ2dJDCFXjA2U5jlSb6Y7cXK475SehQW96aHtv9pOT
	z5LCij7Zq5FwjJbdG5E5bQaqO61vi+ymKdgn8baTCJ9i01HCQhpk0yocEtO5ML+nyx895NR4odS
	Q4Xyuk4xh6HrDLGZym6iek9tCxvkfFck=
X-Gm-Gg: AYBFou1C7troJlKbBX1yL5SWQaHbsbzvfNL9wpgjdhBTikNloN/msAWi5hXFI2rAnQF
	Upfurpasf2w1Au8zqjTev2PZuiVZ3857xWoBHbqiQz6jYLAljd4wie1fz4MYTw6/UljPX4Aem2D
	zIZoaBcFgaSFz5iW4/ltS+4ey/UeAB7Us/ZPcl5S7pYx0q4PZmDXY3+fF6P8y8nPP415AkDBaWx
	111olviiJ+RAkxHeP1BU5espXrM5NlJ0TALemefvDWWLtLP3I5QrXoy+mi7BS91t0BIWL8eNfgO
	/al6DUh++h4y2NaJ1LC3wyYaD9lg5PgL2B/uyUB1fAn8Y7MniykVS93vx0K995PpUUTmhtY1MOc
	6j84aHdFu+tJv3X6tKOMSHkFx6Z61sYODGtn9hPOKgWuw6DIBs651Xo4vsgUL6PXDXcKZ6yJqDX
	Ko+ZkzdgDVUtOz4G/P2YbVYN7RGPZOjxCCrrE8fUEPAZfq6vM4mlI=
X-Received: by 2002:a05:693c:4092:b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34b7c9c9c19mr3727503eec.0.1790698970688; Tue, 29 Sep 2026
 09:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790599486.git.nico.antinori.7@gmail.com> <DLRXDBH5LB8G.24QDEEJWMGJG7@gmail.com>
In-Reply-To: <DLRXDBH5LB8G.24QDEEJWMGJG7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 18:22:37 +0200
X-Gm-Features: AclHuK_Wo_2TR6t3qQINXg6vuhw5smx_hDmbOB227r8MxbF1Jg4nL8yAzsAQFa0
Message-ID: <CANiq72mzKkiDM7iBuDfO2u26roEaGGfYXQx4W0+33JHwE2p+jg@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 6:02=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> For some reason, GMail is not letting me send the first patch of the
> series as it marks it as spam. I'll check what happens and send a PATCH
> RESEND of the series or reply this series with thah patch (I already
> tried that and failed).
>
> Apologies for the inconvenience.

I would suggest trying the `b4` web submission endpoint in that case:

  https://b4.docs.kernel.org/en/latest/contributor/send.html

I hope that helps.

Cheers,
Miguel
