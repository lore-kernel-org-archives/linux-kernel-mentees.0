Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5FC33C199
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839588; cv=none; b=H5VAt0NaN1vHlnVIH7flWvF4OG0BsHUCl7AJymyHhiiUOfZbDP8uklYFG1poAHCWtBIN6AP9/fUFBZ9FxJ010tjzzPIXRa7xjXLcjEP7ag63DySeRcxbGIlAqWh1YTrcILtwe1Zp4W/CMxJ6M/aYemlx1cCZJG1cMluYCkW0qyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839588; c=relaxed/simple;
	bh=E/Us579nTVgurFAyuKqneDAK/MMCEioOOwy1LAuVIGU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ct1Q+COmdI0LV2tyQZMf7mqAA3W6Un82VlmtQrfpzrPXce+Mhrw9tVe+JzGsfkEB7YXe10yjuyh/B+8MG8S5MA3WOH3/tWFj/UjpFNs2t+xe7Tc7DnRXf1M/yA9Rd9zG81tI9/zE3Psxj+En4/MleiNGR9QJtHzj+fSWQQOjAzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DXgtKd0p; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DXgtKd0p"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E018D4077A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 09:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -9.601
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iC1uCLyct0Fi for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Dec 2025 09:13:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::54a; helo=mail-ed1-x54a.google.com; envelope-from=3n1axaqkkafyy9602fm594cc492.0ca@flex--aliceryhl.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A4BF40652
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A4BF40652
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DXgtKd0p
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8A4BF40652
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Dec 2025 09:13:05 +0000 (UTC)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6411c626af4so806971a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 04 Dec 2025 01:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764839583; x=1765444383; darn=lists.linuxfoundation.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DRDZhJnUIfvx3/Hg/oNl3IHpJs7xKfq6AQy62QyhG00=;
        b=DXgtKd0pteLQedEGR4QHFbXtE9HJkTvAUKVOmQ8SUQukDlz7LhijnI0iys5YaGQc5M
         kqUus/t3QAfCkQITp8E3M5vCXhTqdFC2xHFzcqqvg2KhgEXQjxaWmfH+Jh/AYEyIBaVR
         pnawqBnBCXzA5ZNsZyvt/GoUFeO0A5j+HMwudDn/i9RFqt38RaxKD1TePBLcQdK6p3u+
         mRWOyqptmJ4RisB0Y1noaDi0FVn5OxhHjgoM3tlog67uIY6I49gk7WoxfhUJlice5jzp
         pUtzdvYFFY4e5UuK/GA7qSVHMmiy6b6fv0qsyz5pn6KHiHY4IgcgHbDR/fcMwRcfSWyE
         8/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839583; x=1765444383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRDZhJnUIfvx3/Hg/oNl3IHpJs7xKfq6AQy62QyhG00=;
        b=HsLRdE5/FQ6rGRP9GdIAVmWDmJKWmScSjmpXqciFv0AUn7thZemeTSi9ljXBjv5VXO
         e/w3bSDNhCC1hj4MBYPihgVC3LtPcPnkana/o7Z4CLViQppUEXljoFDofEp/0AJqjnao
         aFLWsE+s9bf+Ikb3vnN/KEqrGtNuMPrz5kKzqz/fSgVcyn2oAjDPuQ2kfYHX6WMmkLVT
         fTgk4APlk4LrSt0CAspJ/dOQ2IlX7YFSSQdxS1+GQUk8CqqAxp0/i8tZ1o0+ma/oEjLc
         R0hA/CRi4Xryzap+H3D6B8dG322PT56LAvIcbu03nYrUF+EJ0zpOfFQVRVsma6rII2iJ
         x1wg==
X-Gm-Message-State: AOJu0Yxtr+uR5Qj/A1FPWj59Dh5QAbdUkJ+HI//i2H2u37K8OL5HaUOg
	3FVlon3PwSmggTv+R3RUauO3101HrrRHSweqNmZyXVJzCBIeY+vA/Bh5nu1Ahno+BaHO7x3ZHD+
	jUCcIkkYKJeRSxwfNYA==
X-Google-Smtp-Source: AGHT+IEhdPWvEmB4vfFoDOsOLUUthSnQqFGCrg+waysgL3RexQWT0QwI0B7dGIxK2uf85VyQcWDZE8BMbpilqHw=
X-Received: from edc5.prod.google.com ([2002:a05:6402:4605:b0:643:3a03:788d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1469:b0:647:a2b2:3db9 with SMTP id 4fb4d7f45d1cf-647abd80d9dmr1973340a12.7.1764839583215;
 Thu, 04 Dec 2025 01:13:03 -0800 (PST)
Date: Thu, 4 Dec 2025 09:13:02 +0000
In-Reply-To: <20251203203222.70415-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251203203222.70415-1-sohammetha01@gmail.com>
Message-ID: <aTFQnsTFuVO5DrYv@google.com>
Subject: Re: [PATCH] rust: sync: ordering: Fix dead link to LKMM explanation
From: Alice Ryhl <aliceryhl@google.com>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Dec 04, 2025 at 02:02:22AM +0530, Soham Metha wrote:
> Fix the reference to the LKMM 'explanation' document, using the `srctree/`
> prefix triggers an htmldocs warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508301445.KuPDLTET-lkp@intel.com/
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> No functional changes.
> 
>  rust/kernel/sync/atomic/ordering.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
> index 3f103aa8db99..d71c4f582f75 100644
> --- a/rust/kernel/sync/atomic/ordering.rs
> +++ b/rust/kernel/sync/atomic/ordering.rs
> @@ -20,7 +20,7 @@
>  //!   described in "DEPENDENCY RELATIONS" in [`LKMM`]'s [`explanation`].
>  //!
>  //! [`LKMM`]: srctree/tools/memory-model/
> -//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
> +//! [`explanation`]: tools/memory-model/Documentation/explanation.txt

Currently, when I view this on:

https://rust.docs.kernel.org/kernel/sync/atomic/ordering/index.html

the link goes to:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/explanation.txt?h=v6.18

which is the source code of the relevant piece of documentation. Of
course, a better link would be:
https://docs.kernel.org/dev-tools/lkmm/docs/explanation.html

However, I think this patch would case the link to go to

https://rust.docs.kernel.org/kernel/sync/atomic/ordering/tools/memory-model/Documentation/explanation.txt

instead, which seems wrong.

Alice
