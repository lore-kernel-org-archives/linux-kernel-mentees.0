Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BA728641D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 01:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754960606; cv=none; b=UgQEoWQrlvBQeuDmwqoCTCLLY7+oODUeO3RyHVJoVsiXhwWcOFRmQzy8P0wc6CRQeF0lJvENbyT7+OCRsu0mjN2GssXrDbuweI41REhmYs2DBSDWer2XVEBvZ0saF9Wjy2akalR2PZRzBzbW0zaiBdoKm1s+SQtqUPWFhv0ggTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754960606; c=relaxed/simple;
	bh=TkzV1QKaLX5KO/cgQ1/PYPcvVk41hW8Wc7iucPax0uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=lf/PuXUu0O7fWA/2XX64n06mmmU8JyqHf+ANZNhe4kwxFI3J3NZrXpkgFiiUrE3429bAFiH/dy8AQUCvlgWA2u0Mnr/1PdtkP56TPT117MAzVd9OH78MvBdmfe4m4TAgPOQwB5Yr9JY4ucAwjKmXvWXeRGm+0oVQvrzMsHcLXmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KozF0I/A; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KozF0I/A"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C007461AB8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 01:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hF9KWITeU1J6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 01:03:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F278261AB4
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F278261AB4
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KozF0I/A
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F278261AB4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 01:03:23 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-742f96d9120so2783501a34.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Aug 2025 18:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754960603; x=1755565403; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu7Cld25qTDhA1/DaYRistKjD1SkNhH9N8NVThhyaY4=;
        b=KozF0I/ACgqn+f1vPsJsNzEJSvQpGKoK/hbxkRgNE1TMOY61pEBFqcUd4zmwb9TdlJ
         lfFKG86dsJYggIE0Yk3VBoLJwBnIcQ8Vt5peMB7trR1jZYelLAfm6uCvuybhUhgR93x0
         T9XyXIuqKfSl1ZzKY9mTzuu8g4A6MVBHO7/HK9/gYbw10nIDAgKM6AWeqYMTmgevvbEJ
         4uyJ9lOkxtdXPcEBp7wfNE41YIBYBT7zHHFPzmXoKWWBTk/KMoDVIDYbQLC1HCG2BtR3
         tZrYAP7kMXuwYIGyHNkfim88agPNfhFjZABdeuzlhQxZAQRHYGrzhj7pjKGKPFUREG0g
         bURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754960603; x=1755565403;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xu7Cld25qTDhA1/DaYRistKjD1SkNhH9N8NVThhyaY4=;
        b=eY5hIPgm5b3Kc04j2FhauUGfQtYfQWwX6xvgF3WS1AGz6v62oOG7bNe+ym66kM+qAk
         z4T8o1turOv8k/owe0bdVipY9VZvPrNUMD/yUE3aB83Kvv4cE3XM99G0nvVmjqzEgQXu
         UQaECLu+2upkg3imIGM6yXeZH2K0ZQhget9Y1QU3Sg+1e6/6+cS7skvH6WkR0QmLvPkB
         3l0gZSy2BQjhLv5QLDwGAcjWokxW84/EYwwf/9ZsP0bdomLm9V1qgIL/IVuAiVH4EucR
         sG9/eYcfeXHs97pLpKN3rfSMbviEU6LEosavxCnq8y6zjOOAjpJABMYkHCf4jJlzsYrS
         UELQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpHs5H/JjC/L6r5Epbp37TPs4TkNwk0+l3t2JC+U4SEs1DB+df9lEJbcgY9M5rky2pilmrXBZf8LqXI4AncNzrykronQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwsfrMxwU9cczlyD0e19nR/g3iTqyWVK/50nxqPkOfuvG7ZBGrY
	fpO8MtLk2WUAsPPST4haOusE7bQFyJnt0kxYD1lV+MFKupyIBrV+/puF2xuqIByu5ZCSYRoAPMq
	U62wV1vZHc1z+KywVojCJDD3XyodABHQ=
X-Gm-Gg: ASbGncuqC1T1Qkt4UGGjTbbWxmz2dyFV7K5PyLRmqfpm2Mb4kSmH+3q49tXMkB8ESPy
	CU3JvYf9Jb0L49vMFYw8B6KA7hAwlyS+OlFFBnhaADVlPnF79bHG8HI+b4h3+eSxuDY85q5l+2j
	9m4OgbG9zRTlfir5WZR7EPANVWL1oMACmdMywHoKU8ezbPBiEfN4Ti9RgA6ctoetbCiE6OkuUNL
	VPxW3VbX09+m6qNa6g=
X-Google-Smtp-Source: AGHT+IGgs1wEZ5LXnkyua15UsD3eqUuRVXc9ZG/3ZEzyLND/fFEAqELjZCI+9FVcQXJOVyrSqBVEZ2fSMeuDbONnRtg=
X-Received: by 2002:a05:6808:1308:b0:435:77d7:e89d with SMTP id
 5614622812f47-435c91e4582mr1069368b6e.31.1754960602643; Mon, 11 Aug 2025
 18:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250726183552.23098-1-marcelomoreira1905@gmail.com> <20250726183552.23098-4-marcelomoreira1905@gmail.com>
In-Reply-To: <20250726183552.23098-4-marcelomoreira1905@gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 11 Aug 2025 22:03:11 -0300
X-Gm-Features: Ac12FXw3Whf008cjcOdn4h5QXF4P-17ot7Z2RaCRFG7XZG0ffy_apKfVt4rczbk
Message-ID: <CAPZ3m_h1HPPx4hjS9w42b4UyHccXjNiUJyq71TtucFhERtJfNw@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] rust: revocable: Documents RevocableGuard
 invariants/safety and refine Deref safety
To: aliceryhl@google.com, lossin@kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 26 de jul. de 2025 =C3=A0s 15:36, Marcelo Moreira
<marcelomoreira1905@gmail.com> escreveu:
>
> Refinements include:
> - `RevocableGuard`'s invariants are updated to precisely state that
>   `data_ref` is valid as long as the RCU read-side lock is held.
> - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
>   requiring callers to guarantee the validity of the raw pointer and
>   RCU read-side lock lifetime.
> - The `SAFETY` comment in `Revocable::try_access` is refined for
>   clarity, now explicitly stating how `Self`'s type invariants
>   and the RCU read-side lock together ensure data validity for reads.
> - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
>   is refined.
>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  rust/kernel/revocable.rs | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index 6d8e9237dbdf..a2aa7989231a 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -106,9 +106,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Sel=
f> {
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard =3D rcu::read_lock();
>          if self.is_available.load(Ordering::Relaxed) {
> -            // Since `self.is_available` is true, data is initialised an=
d has to remain valid
> -            // because the RCU read side lock prevents it from being dro=
pped.
> -            Some(RevocableGuard::new(self.data.get(), guard))
> +            // SAFETY: `self.data` is valid for reads because of `Self`'=
s type invariants:
> +            // `self.is_available` is true and the RCU read-side lock is=
 held by `guard`.
> +            Some(unsafe { RevocableGuard::new(self.data.get(), guard) })
>          } else {
>              None
>          }
> @@ -233,7 +233,7 @@ fn drop(self: Pin<&mut Self>) {
>  ///
>  /// # Invariants
>  ///
> -/// The RCU read-side lock is held while the guard is alive.
> +/// - `data_ref` is a valid pointer for as long as the RCU read-side loc=
k is held.
>  pub struct RevocableGuard<'a, T> {
>      // This can't use the `&'a T` type because references that appear in=
 function arguments must
>      // not become dangling during the execution of the function, which c=
an happen if the
> @@ -245,7 +245,13 @@ pub struct RevocableGuard<'a, T> {
>  }
>
>  impl<T> RevocableGuard<'_, T> {
> -    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
> +    /// Creates a new `RevocableGuard`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `data_ref` is a valid pointer to a `T` =
object,
> +    /// and that it remains valid for as long as the returned `Revocable=
Guard` is alive.
> +    unsafe fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
>          Self {
>              data_ref,
>              _rcu_guard: rcu_guard,
> @@ -258,8 +264,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
>      type Target =3D T;
>
>      fn deref(&self) -> &Self::Target {
> -        // SAFETY: By the type invariants, we hold the rcu read-side loc=
k, so the object is
> -        // guaranteed to remain valid.
> +        // SAFETY: `self.data_ref` is valid because of `Self`'s type inv=
ariants,
> +        // and the active RCU read-side lock held via `_rcu_guard`, ensu=
ring the data's accessibility.
>          unsafe { &*self.data_ref }
>      }
>  }
> --
> 2.50.1
>

Hello guys, how are you? :)
Are you still reviewing the patch?

If you need any more changes, let me know :D
Thanks!

--=20
Cheers,
Marcelo Moreira
