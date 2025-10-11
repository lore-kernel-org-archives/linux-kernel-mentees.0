Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3172222A9
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 11 Oct 2025 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760179968; cv=none; b=iEblEGGk9zW16Mi2v+E/6ZQTK6MYGEr82dJQziH8Elo25VhFLUN3PvVAuO/3n0TlA2w2s4d0X6W4mXfnsY7Ua+wNcnF3YZBlBECXl2eJ3yviLPdGGlpSJmjk6htjYglVRTBCv+ede6AZwfI22k4KjXbpWqPiDy+2ETxLdp1K1GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760179968; c=relaxed/simple;
	bh=8OWEI2Ve7zxoRahlmtY7dTeIvWnJ28oqpstjc7JIgvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQGyd9vgLk7oLl7cl76ekstCa8lHdV7v3LREPGRWWt81542VHk8S4iQ59CO/W073u0MtZWry15+PIt6VkzxVArkspDUFWDCagdxL8D3ml7aVYK5oJyOJD8fZSHlR4qz7jvIwoAKClGOLY3f8JPUhC2DDnSOmtOevi8LKWjTgU3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSCPR/h6; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSCPR/h6"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-639fe77bb29so4255369a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 11 Oct 2025 03:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760179961; x=1760784761; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8OWEI2Ve7zxoRahlmtY7dTeIvWnJ28oqpstjc7JIgvI=;
        b=ZSCPR/h6I/F0DsHKaXO0KZjRQg7hMFQAbAnV4VM4Y4xElc58gjYrVKXAPb2GjzeHUa
         oPqgIuMAUuSsBKb+JVydmC882PheKkXD2k0ievRxqCeUgj9W8lUe5JYiOSpfDkcX+f8J
         4x66pTeGrVZ6j17TVSBlzyPyF+BJs8NjMtfBBIzx2N4j41/fZIEwZar2MirV48bFTXQm
         hh0sPdEN/6GfeLxDflfFCw7kAx69Zsv5vJvQ1fl/ndVw+g6XCDFk2Ob8Pb3XOWBwfk1L
         ptKd6mLGbySZxYF1aJFRdvndQPy6lc5Hnx7ChXs8QUHGxWZBoLTYW9V6m72Qy0BcZrmE
         KTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760179961; x=1760784761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OWEI2Ve7zxoRahlmtY7dTeIvWnJ28oqpstjc7JIgvI=;
        b=iTNMXwEDc50ABg/IaVg0HpNmfBm9vFyomrTX/3kWJ5pzSoo2LxN8rLN6JgzBp8s2GC
         vM0rvNmb2AYSUvQQKv8P4LkCNRl9XOkqzvmtCJ5niwbXACUn/zeXUKH9k8eXCJAAbUP6
         L3DpsTMnRYI9OX9B8hnQATV4fRzgi/duHeTyKqnWTo+4H092k6kFJcp37/C3H7o8MKp4
         mEBKbsfFP8n1tcN6CVkFf3mKPzpRx5TjBQjHNM6FPyYBPHHTev48fP5aom4Demt3BNol
         h883TgWDQf4DAqlDEIFRNc6mziIZKjMen6ZrbGLIJaq+l7kxzLRS5nAjEgZb0abYwDYW
         hJbA==
X-Forwarded-Encrypted: i=1; AJvYcCXN95LE8C7RYrukEmwLYONQviMs8Ac224S5sN8moovXvxtO17g0DaWtA7w/1yYXGq0uBfPV7bSqEH+xahywwf5iM5Z3WQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaCGR0Iyr7N6CCrvxsyK0KkrCtVRtHahJ7zcqilKBr/bCYS2tT
	+kj8xcQ2zRFTny7aZoK/XPXQSdEFYBOcTF4N7joAlsP0wd35+u8xg/crJbOcK3QSROBOI7yHWIa
	cUzcI1/ylgV8H2HlplS3NR+8lctzcgAc=
X-Gm-Gg: ASbGnct3mytK57FG62wMR/hG6n3J/jFc9BnDU6c0PLvyT8srVe6EKktTIZlSz/swjwx
	Y0SbHcT24IPmfIujlbThm0beTgvcmvj03Y4rcihuPEYdBruLGiH7De7ThNAq9GycxbxnO/nHaMY
	zq0Lfy3uYB6RqyN8wXMPNeqWdnHVuWnhxW8VCrlfq8VjL0gq+L9CwlHEQWE7gninHoxVI7b5CSw
	22k19G9Xtn/vEWOloDP8omz9HxEOwMeUus8ykSfmrwHPdc=
X-Google-Smtp-Source: AGHT+IF6QH0ZvGGeu7syJtGwnYam98YA7aQ4YBC4SL91FthZsg1FL7JABmIcldVJaVFWBD3dXjjVorqgK2JB9+CSoXA=
X-Received: by 2002:a17:906:6a1f:b0:b41:660:13b8 with SMTP id
 a640c23a62f3a-b50aba9ebf7mr1660189466b.31.1760179960946; Sat, 11 Oct 2025
 03:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008031737.7321-1-raskar.shree97@gmail.com>
 <20251008031737.7321-2-raskar.shree97@gmail.com> <9970e8f6-8b8c-4d9d-97ce-f89b948d6c97@kernel.org>
In-Reply-To: <9970e8f6-8b8c-4d9d-97ce-f89b948d6c97@kernel.org>
From: Shrikant <raskar.shree97@gmail.com>
Date: Sat, 11 Oct 2025 16:22:29 +0530
X-Gm-Features: AS18NWCeqmbWUT9hRBS5hR7tp38w-hhCaezVQ74ixvOjKVU1p9A72eXYN3wOTVU
Message-ID: <CAHc1_P7PDOMqrBxvXx-fO3GkncapOsqkxVs9HyZdwReCQFn9jw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: max30100: Add pulse-width property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, matt@ranostay.sg, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
> >
> > Changes since v1:
> > Add unit suffix.
> > Drop redundant description.
> >
> > Link to v1:
> > https://lore.kernel.org/all/20251004015623.7019-2-raskar.shree97@gmail.com/
>
> This does not belong to commit msg but to changelog under ---.
>
> See submitting patches.
>
> You need to also start testing your patches BEFORE you send them.
>
Hello Krzysztof ,
Thanks for reviewing the patch and sharing your feedback.
I have removed the changelog from the commit message and added under ---.
I will test and will share the updated version of the patch shortly.

Thanks for your guidance.
Regards,
Shrikant
