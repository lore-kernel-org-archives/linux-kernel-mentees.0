Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34EF2FD891
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 17:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752773635; cv=none; b=eKFER5kQkUQaG6ja7ibQqt3n6GTVSCzHqVJoJW6Z0OGK6i9WLWh2mfQ1XCj//kTFnUkZ65HEcozIcLpZqgiuCl7vFM5D+4ysVI/qnXlFiQ7gwxU8ZKpwse3kCNkhJ4BXbogGZ7ps8I2eBGvnD96mUtB3+LnUpJ26A1pY9UAh3WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752773635; c=relaxed/simple;
	bh=Ir4ckRUA5c4ZdEYRHXih9x14eSjGxmby1TED5CRBisU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJAiS3Nrhdf9YvyZrksk/iGrtUgIIqsm11Uk2sE6MxQu3SsEwD5EAeKhvelQSlD7pKexsdj7I+2RXrHFG3yM6eS/tTmABlTtNPNtCyMfoNbbce0CWOX8er759phocBx60GQonm5nc3VbEz1OzO4fa6YwGnj/0200CiNuRj/tRTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH0X8HRI; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH0X8HRI"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-73e55e829fcso712019a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752773633; x=1753378433; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ir4ckRUA5c4ZdEYRHXih9x14eSjGxmby1TED5CRBisU=;
        b=HH0X8HRIAR8sSKRzpjGBmkOfINHLDeZCRrUOlJfDL1heRQWOJZpLQ9mA5v6yYOVEN+
         /oSnjo0tHB+jA64OdOFxTAOQvbIQDzdKPj0n6kvtlDCRcD6E6zWmxm+fKBHLOYp37szE
         LoYSoy24cu6J97TBqZS4tXW9EkOU2XgcqAosiuOJ7u3ouhLphyRZ+Ny40VuU1qWGU+Ml
         BNwy2Dna8TSD/hsOJkdNJZKLisyE4TOf1zMErxDAjbkLI4B9JQbLNfe/mwLfvFQuQ2yn
         7pB9tD8Ep4NPbFvbtZaBCpsoEiOAeFqWpFPy516FAl+O9jwM2rsxOZ1XfLYxRTD2IBBJ
         3oOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752773633; x=1753378433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ir4ckRUA5c4ZdEYRHXih9x14eSjGxmby1TED5CRBisU=;
        b=WgT68SEg71GBaCQhJAfevkZSoHiq7NBZDZAUdh9okhXgbXrHFW00oS39EtxmssoeZz
         B6zd+Uvg4JPPrZVYzJ4dGBxmKFVfeE130VtD5dZQtsv7dF+/uvqePX5DmPeiE3KXT/To
         n2QXEPfAQjZPtr+iK+fgfOZlNu+43+bq8zfMCg76qVVj8o0xmVQ0ovRbq/JmGbX/3wG1
         yXmNCxrOmRGDkn/gwNxFNOKMYhat6R2E1K4qhNHkLIz/jDXr51wdEaJBfauWJn94Fxbl
         61x74VDzsZ6aD9Yue6ekO65zMh3ThAUYJyfpaPGe6eXJzTPVMNQHcfzcEfnXywsMawQ5
         /6ag==
X-Forwarded-Encrypted: i=1; AJvYcCXfTF64/sMvf/rdDQZxrLsOsruOW/IZ5aDrJus6fU8RxVG0cgaskYLDS+XtOaz7zuuZHb0cCrqUjwC81JAoeT/14vOj9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSHQl929spLc18leWK5v9O2QToJTswTR1UVFd1OI74tLbx6msI
	8sfdp94EbDq3x6P1yG2/lVszRBuwecoqZJ6yywBhi4v7NR4IHjFQAKfbDynSatmGYqCjLIMr3vT
	5tKbUGeN46xYTcu3ervAqxd/6Rr3TGgM=
X-Gm-Gg: ASbGncuQnfYKBU7TCgzGBY6Zs5MQBgIcriceX7gyZHh+r5Pftp1RY96Sa+KvtrVh8Oy
	VcgLHJQttmzadePU/anHm305gH2XrkMk9mNW8twKNJatPdPK3Vdh4yy6NZO24i2gofVuRcWBJxu
	XGxZK4ks8QM2/rxpsTjt8/gDnK7qSTdLS4LcQAFs/1fFXk0XIf4YBV1XmQDVClj5n0zfbnDRokW
	aMED2PM
X-Google-Smtp-Source: AGHT+IE3OqHuOP71bWOI0K5lvnOBfAxmV67CujVwlsH27p7aT3RJwVULSnI3/51i4mRGaUvRwtqIC4U9KT9rvFqML9U=
X-Received: by 2002:a05:6870:3b0a:b0:2d5:23a3:faa7 with SMTP id
 586e51a60fabf-2ffaf255917mr6851745fac.6.1752773632901; Thu, 17 Jul 2025
 10:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717115936.7025-1-suchitkarunakaran@gmail.com> <CAEf4BzZ+OTkaXmtWPbOGB0OWz5xmj-d06UWchooO+iUyDHar4g@mail.gmail.com>
In-Reply-To: <CAEf4BzZ+OTkaXmtWPbOGB0OWz5xmj-d06UWchooO+iUyDHar4g@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Thu, 17 Jul 2025 23:03:41 +0530
X-Gm-Features: Ac12FXwK07iRYjwoYqN42-IryjF5d0QqJxt83znwv8mcgyEmn1cG39hmlBlE-m4
Message-ID: <CAO9wTFgLOymS+VDcUTCHZ7niu_gEgN-N-F1uX-Kpm+uqvaMrQg@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Replace strcpy() with memcpy() in bpf_object__new()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bpf@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This is user-space libbpf code, where the API contract mandates that
> the path argument is a well-formed zero-terminated C string. Plus, if
> you look at the few lines above, we allocate just enough space to fit
> the entire contents of the string without truncation.
>
> In other words, there is nothing to fix or improve here.
>

Even though it=E2=80=99s safe in this context, would it still be a good ide=
a
to replace strcpy() with something like memcpy() since it's
deprecated? I=E2=80=99m still a beginner in kernel development and trying t=
o
find my way around, so I=E2=80=99d appreciate any guidance.
