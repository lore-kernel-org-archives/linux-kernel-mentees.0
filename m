Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255B32288CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720513; cv=none; b=dNwl9GosHJGhUaqYFNBnKOVjuLZRcK19F9Fpd0EFlOkgTNjRG23uDo7iAMQ2UWdkTi9D2T3Cj71FnTIsGehRzgiWSQhACzTwYBWGWa+7scBhCZhZatZLkXKTvLrW65nsoHZiwpFzo4gkaqhxA/uJVgnl7mB2lbXjEWn2hEfnxnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720513; c=relaxed/simple;
	bh=IFgb4F5Iu+UKrhX7of1UyD0GJ8X+vqX7HiKG8JEk82Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mJ02W599E2WZMEDNDneF96ysuCoSd6zK9yxuhncULypFyY6JaTUv7Hrnh1HUZ5iRupDzFs1RLhkTCKA8jfuNuYmXs35n4aIV7NBGpSTIHN9S+n0eNOqr7XDomhIluCoqMdT3dVqDfHQ+WtxSN23lhiBg4/OacXNRg367GKbljMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TtQYr7Ps; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TtQYr7Ps"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5F0B60C1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -9.601
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z47O0cxvDSna for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Jun 2025 09:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3vj1kaakkagsjurlnahqupxxpun.lxv@flex--aliceryhl.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9482860C09
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9482860C09
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TtQYr7Ps
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9482860C09
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 09:28:30 +0000 (UTC)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-450787c8626so4336495e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Jun 2025 02:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749720508; x=1750325308; darn=lists.linuxfoundation.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qGXjO0gZf7c+kFxei3MxTslMSXhk7nEUqCSL8/HYDPk=;
        b=TtQYr7PsnJVYVMjTYkwwNkBLAHpYIVbwTatIHMeqL/8LKbowTAxmAYtPkgfkg+QUEZ
         CDXfwE6OyiogtGG3U5MYoAuGPuTi+t+XoDgh6fIsNeJxexf0++PQXBQ/GcwgAHNBdojH
         f0cfVLsoYi7BIdyNYlAX8N0xu3kaovW9/pq0p9JYgX0QMB3DvEsPKFI4mQn1ZHcMaP01
         WKEFilo8ZbluFGH23lmS9bgrO9PtYHP7IEtjQQc52+nSKCUGwVCbofOhcCL1lR45y49x
         y0PzQyOpyQkOH8lRTu1FC7yxcr1FApWV4VmRGc4xAuXc72YpSVBArldzHXWm2vCFyRpx
         K97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749720508; x=1750325308;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGXjO0gZf7c+kFxei3MxTslMSXhk7nEUqCSL8/HYDPk=;
        b=o+Y3bJOBxnLqKqpt75wWPZJLNUd5fOGKYpqtqjTlOq18O40VLkNaR8/LIV1ysj/hNf
         GwT6zbn2xa23olOtgOiXqya4NcF1Ikulw9n/Ikk25WggXnM0ac3kk0D509W2sPDKNkR/
         nVWkPbd1rVIWghbwsL/Ex+zzNdqc/3MfCfmAh/Ujs36SssFfCFpZ/NZ6ZEGG0kY5WO6I
         W+0XbI6zB8bAF1+cJbk0nnSfwAl74hTwkRkHg20eGNXciQOEeAH4Zl45ARbQcYVdfQ3o
         20hBwHTMj/u9Yy6ai3rq3A5GcKisntinTPmEhvnhDIACbORoT01bctdqeRb4qZn9u5kD
         uG1g==
X-Forwarded-Encrypted: i=1; AJvYcCUFbJXoS21SLa+ZsdmHWWimPJ676Pu0YTJdDVezMywsNVfP/mFUPGRs4ujTxmfUXT9ajqKPhprhxM/U9qsouK1H9QPFvw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxj5b5vZCd5GHh68+a+RuZuS5od5AW5mm4EEMy7opaKVntqn3pC
	cwrAr5B6Q2oWds/ZaXBwjPXWbxlz/ObhivcVL+W5MdqSxvpyATfeuplNNgmSAO9KZEO+MhlZzRr
	Z3g38ZnAbbkszfG3B7A==
X-Google-Smtp-Source: AGHT+IELdFB35Ra3YOSzs2LbO39EM3Mp7jmY8Bt+ho64HVbiiHP3AgFPjdClR2DXKvVsMjH2Ml3en5KIyqK6lMo=
X-Received: from wmrn17.prod.google.com ([2002:a05:600c:5011:b0:450:d5b8:85b2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6098:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-4532d2b6f74mr23413365e9.15.1749720508511;
 Thu, 12 Jun 2025 02:28:28 -0700 (PDT)
Date: Thu, 12 Jun 2025 09:28:26 +0000
In-Reply-To: <20250602232842.144304-3-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com> <20250602232842.144304-3-marcelomoreira1905@gmail.com>
Message-ID: <aEqdur4JTFa1V20U@google.com>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
From: Alice Ryhl <aliceryhl@google.com>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: lossin@kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="utf-8"

On Mon, Jun 02, 2025 at 08:26:23PM -0300, Marcelo Moreira wrote:
> This commit refactors `RevocableGuard` to hold a direct reference
> (`&'a T`) instead of a raw pointer (`*const T`). This makes the guard
> internally safe, reducing the need for `unsafe` blocks in its usage
> and simplifying its implementation.
> 
> The `try_access` function is updated to leverage `try_access_with_guard`
> and `map` to construct the `RevocableGuard` in a more idiomatic and safe
> Rust way, avoiding manual pointer operations. The associated invariants
> and `SAFETY` comments for `RevocableGuard` itself are removed as its
> safety is now guaranteed by its type definition.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  rust/kernel/revocable.rs | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index d14f9052f1ac..43cc9bdc94f4 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -105,13 +105,7 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
>      /// because another CPU may be waiting to complete the revocation of this object.
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard = rcu::read_lock();
> -        if self.is_available.load(Ordering::Relaxed) {
> -            // Since `self.is_available` is true, data is initialised and has to remain valid
> -            // because the RCU read side lock prevents it from being dropped.
> -            Some(RevocableGuard::new(self.data.get(), guard))
> -        } else {
> -            None
> -        }
> +        self.try_access_with_guard(&guard).map(|data| RevocableGuard::new(data, guard))
>      }
>  
>      /// Tries to access the revocable wrapped object.
> @@ -198,22 +192,16 @@ fn drop(self: Pin<&mut Self>) {
>  ///
>  /// CPUs may not sleep while holding on to [`RevocableGuard`] because it's in atomic context
>  /// holding the RCU read-side lock.
> -///
> -/// # Invariants
> -///
> -/// The RCU read-side lock is held while the guard is alive.
>  pub struct RevocableGuard<'a, T> {
> -    data_ref: *const T,
> +    data: &'a T,
>      _rcu_guard: rcu::Guard,
> -    _p: PhantomData<&'a ()>,
>  }

I don't think this change is valid. Consider this code:

fn takes_guard(arg: RevocableGuard<'_, i32>) {
    drop(arg);
    // rcu guard is dropped, so `arg.data` may become dangling now
}

This violates the requirement that references that appear in function
arguments are valid for the entire function call, see:
https://perso.crans.org/vanille/treebor/protectors.html

Or the LLVM perspective: When Rust sees a reference in a function
argument, it adds the LLVM attribute dereferencable to it, which implies
that the pointer must be valid for *the entire function call*. If the
memory becomes dangling after the rcu guard is dropped, then this is
violated and the compiler could perform optimizations that are not
correct.

Alice
