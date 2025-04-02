Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8772E3366
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Apr 2025 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611618; cv=none; b=SA3T3xDuwlDv6PouWfcCGwo6YNAryEqIWAJOkrtY9zCS2YimgE41sbfYjsEhbE9hkChRHyTjp7zP3srkNoU2ZiueK/ZxXZoOw4BrYwC9jfrTF1tzORmfy6Bkglll7pLCbdcRWJlQj4ELrhejwYA9KL5ps+hGD1Ai8pSI+iFzeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611618; c=relaxed/simple;
	bh=a2xPLKRXNFM1k6b4pzJo6ujsadqfL0g/PuJfjy8Q/Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYcpkeTKGLyjKfvfnMpgQlnlOtVAqY/9chTVn4UpQ05uGriqqpY13DBtbKDmnn9r66VfT0K+9W4qJezW8ph0Q2jLYuUVv5uLLrXKqI5Cf+a04bRQ6LOdZUh6CWJ2gdbO1Sr7D28GCEHU3IdwI+ZtcjRjiZ2QIrZ0mrEZnhu2MKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbQbM35f; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbQbM35f"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3015001f862so8976329a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 02 Apr 2025 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743611616; x=1744216416; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2xPLKRXNFM1k6b4pzJo6ujsadqfL0g/PuJfjy8Q/Ns=;
        b=RbQbM35feKVSVnHYoqD/BwsF1ZyPzY3vNOZjbdkQeltGe4ENtLvqio108vaROJ3utQ
         WhTg8tWIejgN5ACXc+3qtxqj25pN+zJnDWqR8jfjAyPUsdunfMceBNgyOYGGKTQuwL0h
         u58AL60xROVFZbkuBHhzQzrsE96ivfIYP1VdE0//KHqYGQGx907AWU5BoGza997s0q/O
         7RJi71eGN2Wreeg9SWa901zg8/yRVwAdxHO6QB7QuCchphtGSNit5lYD/u21SKoo8HJn
         +OQqriaU5ufqDxdd88aL6UcW9dDnb3wgsFCJtJ3Z2HhuuwYMmVpi/t98kNZva+Ti7svP
         fiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743611616; x=1744216416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2xPLKRXNFM1k6b4pzJo6ujsadqfL0g/PuJfjy8Q/Ns=;
        b=JHYXr6/rrbjhk3OTHKznyUeetroQ8tz1Hybt41un/5AaIed+HsKNjn+HIXN+qew3Jm
         L8YO2XNN2NeCOS7rRVnB4sa/W55vcBwA/qlwnPq5exjFU8xDAJz3NjSIMt4stmrL3wfe
         uH80fy5BdP/5G0iL0XOJ97IaiDPx3BR1nVJF0A68sgmjTdWqcLvB/yKjECL5snyFuHwL
         em8zgE2GeQ2lg0vzwCJFo+ZQcIKLd4N2zdhaYRkXVy0IGC6l1EsgL/DCypFENMigl+/m
         oqm7GYzfQ/n33bVhCO8nYHBNO9XsjNwNKLdoI6IeadLp3t2Mq2QrcrHIaVLqL0CFcoMh
         aPrA==
X-Forwarded-Encrypted: i=1; AJvYcCVHvfUUMmFmpYXQQ26fNsKArsK2fYwLmzp/H9emvuHpyZhKCiI9S57xa+BUzp2gtyEEEk+KH/X8whry5ZLf6jhz1Gf+ng==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHNlu/7XOMJkmb7ledGjkXS026RdvXYDFKWwPdkYuAigRqSX7O
	MIUnGYWvRObs0qLubrcMNC+pZjxcYBrLQV3c+PESngUkFHm+vi4aE/m34h6XbsatTTUyveYlhLJ
	8AizCJgYJcHtG/czLSKFgrlmK/oo=
X-Gm-Gg: ASbGnctdQ4ajXDAwUmUscZhlk2PymCzO+ZoaPgEDouTV9n5d67IWKeBMTjLpWBBYHcx
	yClQiW/wO0eCjSeCaLTv1WHqeyMsSL0IiwSDYFzAEUKrN6HX8xVI0KJt3CeQ3EEZS2oQEOsx6DE
	RMFYrWoswsoMGmDjp/4c/bd6Hl
X-Google-Smtp-Source: AGHT+IFePRuJ3j2s9IyQ0pR+vmX6gbN8OK9GvtH9S9o+IgM6Uwle22DNhWyjI1Qrq10lQblFq+VLC4SGdcaEN45RSJ4=
X-Received: by 2002:a17:90b:5750:b0:2ff:6bd0:ff26 with SMTP id
 98e67ed59e1d1-3056ef3aademr3578364a91.34.1743611616286; Wed, 02 Apr 2025
 09:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402161043.161795-1-bharadwaj.raju777@gmail.com> <zjqewsg6ijvol3x3rdjfyjeji3wy24nw45yb6mkqj7vwsk7mrn@yxnvgpj4i24k>
In-Reply-To: <zjqewsg6ijvol3x3rdjfyjeji3wy24nw45yb6mkqj7vwsk7mrn@yxnvgpj4i24k>
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Wed, 2 Apr 2025 22:03:10 +0530
X-Gm-Features: AQ5f1JrBfyiPX15BceMt-IhDu2Xzz3EAQvGQEH515dfZf7zboOs61nV58pIlShw
Message-ID: <CAPZ5DTEGi8RXBMui823bwnt96PcqZSavH8AQ+LPhRs=sJ-Br1Q@mail.gmail.com>
Subject: Re: [PATCH] bcachefs: don't call sleeping funcs when handling
 inconsistency errors
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+c82cd2906e2f192410bb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 9:47=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Apr 02, 2025 at 09:40:40PM +0530, Bharadwaj Raju wrote:
> > In bch2_bkey_pick_read_device, we're in an RCU lock. So, we can't call
> > any potentially-sleeping functions. However, we call bch2_dev_rcu,
> > which calls bch2_fs_inconsistent in its error case. That then calls
> > bch2_prt_print on a non-atomic printbuf, as well as uses the blocking
> > variant of bch2_print_string_as_lines, both of which lead to calls to
> > potentially-sleeping functions, namely krealloc with GFP_KERNEL
> > and console_lock respectively.
> >
> > Give a nonzero atomic to the printbuf, and use the nonblocking variant
> > of bch2_print_string_as_lines.
>
> Sorry, beat you to it :)
>
> You also missed the one the syzbot report actually hit -
> bch2_inconsistent_error().

Oops, thank you.

If I'm not wrong, though, the bch2_print_string_as_lines
still needs to be changed to bch2_print_string_as_lines_nonblocking?

In my testing that also produces the same BUG warning.

Should I make a patch for that?
