Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D32D226CF4
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 09:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741599886; cv=none; b=c/k7snQraXjK1Tu2WwCaeYdUkT+5o438m8fiHaHL9UBE+tOAgga8XOyClDmR0w5M9La5iJmh4yxWhkvvfIWr91DxTAg0gRgpo+vqtpyDU3zQFhUmLL638mmWqhDc2h1mNMVAhnijzoWiOEyEEuuE+rTYflFJ88KSxtwwa4n7Ejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741599886; c=relaxed/simple;
	bh=gBsxJraH2VccxGdfoYatDUg8xaTF55kYrM6BAJWMFNw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VNfKzfZ5PsDFTqnpysATiyXZn1eGIrZp6HgzVqLD8u8ZjBfYwTwnC5NSv8ClCOYZxsS25cRh8K1rmfzcAfXW0nwubmDYtncX5u/XPSmF+jk7msBln+QiRRIy1Y8on5WlPv1JaQFbhrd6Ht2OmpkZHml+NjtllsMKzKvhNoqHjlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=erNrGsgQ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="erNrGsgQ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-391459c0395so360077f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Mar 2025 02:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741599883; x=1742204683; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K4uT7Aj9nf7d2IT7mRwWlJl8JB3gxTUY+mQiV67L5Z8=;
        b=erNrGsgQsimhp7juyHTFJlAt30HiGGusOXsLC7HdrGEDpa9Bd+05fMdahW4i4Wii2v
         LYmWTxF3/aKysGMmxFkQKxNHGdfBgETTfRWHLzGHoFkryVRRUSp3qTHaX9ZYEMyWn0sb
         rCpdJbiOQrkbH1ut//TqgCiRgXI2skSXPW5JiJxnQ9pF3qIlH7a4h59Sh+XCiigMU4xJ
         5XAqq+kRzo2ZG2733k+TY60p5EVX58PBAHpzqvsgecIk72l64Uom3+SU4xNyDR1/prOU
         mfuRZFy3eeKHuaNLXdb7+y6D5soMY1/VvZQZ1Im0/8wyiG/8NZw5ZtA2nxFyjv5TeTy+
         +lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599883; x=1742204683;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4uT7Aj9nf7d2IT7mRwWlJl8JB3gxTUY+mQiV67L5Z8=;
        b=Ws1UhGXi/1S+BGLfIGuZpw6v8pXDF7vwEqsi4w48mgqffwg86h9LQurIHN4L2fsiEQ
         q2vcjgeUzlasouLTOZM2UX6GqbrDGv7nl9uN5XcV4CKL7UN3UdR8m50kSothlmhh2EX6
         JjgbYNDslGMhv44O5IVd9sOIn55hsxPHBcCUjZaSAaDyZEZiirrJCwtvsDBfIZAd8Rxv
         o7yXBE/+b2AFWflMHoZUuz4h1PgfZ1xdkHLTGGITq42N5E47Wvx+oMa9opIJPkrJ687y
         IS/6DkUr/vv5dVZypr5DGIL6+UffAyQdV5JZxEcMy2dw7+Rh2J4qccV4jZWQMgPramTm
         xt0A==
X-Forwarded-Encrypted: i=1; AJvYcCUq+HuV0YH6csCbdOGngf1prU3qarGWT2KwQN/2QJVFNP8vuwyP9TUUodGl4ufwSxY4rM6SmyrHBBt5yoh+omwQPXCXXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNluDTNyuN1jjZpn1cHdDkRptsmM7gE3g3rt/SOIKYjiRIIpXF
	rU5HQwEgNfCyaO+Cz5ZgbV2agkFHUGzeeGstOaFGYdLdLWyimXAm6Op6tA2yU/wD9fEiIMwDdQR
	vjsL3/HK3CpISBw==
X-Google-Smtp-Source: AGHT+IGVyxro7AL58g4XR8fKVbaaI1TWX7wPwMNwsGLr+PpgDItcCn2Z27WVF1wmJWCgCt0fQ+bi8w9hZQvKDuI=
X-Received: from wmbay19.prod.google.com ([2002:a05:600c:1e13:b0:43c:f27f:e9f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:598c:0:b0:391:3bdb:af5d with SMTP id ffacd0b85a97d-3913bdbb534mr4193539f8f.28.1741599882976;
 Mon, 10 Mar 2025 02:44:42 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:44:41 +0000
In-Reply-To: <20250310073040.423383-2-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250310073040.423383-1-richard120310@gmail.com> <20250310073040.423383-2-richard120310@gmail.com>
Message-ID: <Z860iWGtaEFMD2hj@google.com>
Subject: Re: [RFC PATCH 1/2] rust: list: Implement normal initializer for ListLinks
From: Alice Ryhl <aliceryhl@google.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 10, 2025 at 03:30:39PM +0800, I Hsin Cheng wrote:
> Currently ListLinks only supports to create an initializer through
> "new()", which will need further initialization because the return type
> of "new()" is "impl Pininit<Self>". Not even "ListLinksSlefPtr" use the
> method to create a new instance of "ListLinks".
> 
> Implement a normal method to create a new instance of type "ListLinks".
> This may be redundant as long as there exist a convenient and proper way
> to deal with "ListLinks::new()".
> 
> For now it's introduce for the simplicity of examples in the following
> patches.
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

This change is not good. The ListLinks type has an invariant about when
the pointers are null. The existing constructor argues that the
invariant is satisfied because pin-init initializers can't be used in an
existing Arc. Why is that satisfied here?

Alice
