Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDE1272E4C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369254; cv=none; b=ACzxSl5od8aAQwp4g204hawAEz+Kz5iYVEzzr4ZGwkAG96LTSzcVJsc6igix0DV0JSdG+AiawmPSQ+ExU5cjSxYgdplrZzQ8TrFumu6ZxUfyx3FyaeD0EBF2pPXXXS+brc5XDRHYfOqlXqYJXbSxRJREOyQPIKrkiZ8HWPO5vVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369254; c=relaxed/simple;
	bh=wu+y9HC23Oq5erl9wHBy05FaR0sOsDonLjOD+CU56j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5cEsm3J6ob85o0coLg+OfA18GO8Zz+97ECltvT7wZXEW9IGjOOz/OzPBNzgPRraeVRBEP4RNX0U/1TdLNqOZWatFXl/Ezj5kQwZlj85gCecotNrPv8v6C3vDZyb3tzi5ZzIiKO8uR3f/ktCxFTREnmR7HrS1nEpMVH4TQ+GMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O7oWg4KD; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O7oWg4KD"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8661384A47
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 11:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICdp5CXidAxi for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jul 2025 11:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=aliceryhl@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA67884A43
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA67884A43
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=O7oWg4KD
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AA67884A43
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Jul 2025 11:27:31 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so3196726f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 01 Jul 2025 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751369249; x=1751974049; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFGdzEcgnBAN7UgiVSiQMptJ/+tcJNlwx5ELLDUDPxQ=;
        b=O7oWg4KDD63PPhafVHdbJ8+fAKQk6IbDJzYMttM1EAs76KWKerQ1F9+YaXx9AT6oT7
         hd/PMaWidn6tIk2eauLDA8ljQl2TJtojicUQPtbOJQCF23Q46B9iXliI416pv/PNE4B/
         WuF2qmXbS3/0NJPxNlr/8jo6+BfIqdH3nD1i+LRH3UxN2ECGBMetuq7xV8DRGKqoWEJN
         TanChijfEpWWrruAcitsCSWU28vg6WTnwWP6vt6zvPW4tct5vQp4nDqbPXIolRbjZwUd
         BFISdH8ZthBSEnDl05YQqmejkYw15BHdy8Tk0jmQP2VtJyLQkLp1xYU2LYmveg1dvm6Q
         8crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369249; x=1751974049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFGdzEcgnBAN7UgiVSiQMptJ/+tcJNlwx5ELLDUDPxQ=;
        b=K4qP2KIBZYLGf7TWjM/VaVkMTSm+hQl93dkUxrV/2ccNek+KGSi+lQXhniPgFMb96F
         cbquGNBME53RP8rAiGBfPCeYVezmDYT3RkqRnU3wUBra/W8tvQF+nPxKJ3tznrjufFvW
         OfRgCE7BLQMJkB5nJqDdLoUeZAn0YJWtocpCs5PPKP7rhfVRJ2XyvKec3FgRFSJpwrSf
         5q5Cs29CXB2AEBOoHz1TFIDQFn0CMwHBgOUba2MtGtMspJpxvW9lCxj4TkpZsWwhabn2
         JIIYPtDjsBo0huDVnpCwesC78/aeovuaK9sv0FIHGayk5Mr1Tt8THhkVGftklafEwGr1
         l4cA==
X-Forwarded-Encrypted: i=1; AJvYcCXfRyOXV0L/Q/iVC4JZcYGFX1kpaq8MYkvgOlI1fwJ7xeR/J+nvhw0gaGrUN2zc2KogblwrnJIh0nt/hwlLgrXN2n9EHg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyCk5hcQNVNzFhb/Af1HZKeFCjBC46IJjxws17xm1J/VHzlK8EW
	d0MgO5Ko4a2wX7dKg86kg2HH2FEzPVyBUx72f2vsQ4o5BjsyhW0+k3377L+YTz4ylfW/qf32Q4T
	dVeNLwRjUTNTXxhvdsyk4PJjMlczKuMgfRTF9i5WS
X-Gm-Gg: ASbGncsyiGdUNBliYhG4KNCZ5wt/RrU5RYYlPfooCqoNy7t+bP6HbHGcsVmzICby/K5
	+qUlHtvu01ZVvGdHVstPHW6KF4LIr+tABDI/ByPI3QWFDpTlkHVftBW4+nE4cVartoJvEuBPKot
	43QeGD8S4M9hsCP0QgtC+jFBS7PtDderfBORd7n2SgUwUE
X-Google-Smtp-Source: AGHT+IGY9ENogPbhR++5el8tc93qpB0P4cd4ToGuQXmPQg+51bkpHu1khytiuDSIfh/j1REFHWqcZg8MkszIy6JF1co=
X-Received: by 2002:a05:6000:2a88:b0:3a4:e5ea:1ac0 with SMTP id
 ffacd0b85a97d-3a8fdb2aec3mr13842998f8f.5.1751369249359; Tue, 01 Jul 2025
 04:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
In-Reply-To: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Jul 2025 13:27:17 +0200
X-Gm-Features: Ac12FXy9fSEb8YmCVSxOV6H3NmjeEov779-xfZBPocnuU9wnTBoDi6kNs7ISpKc
Message-ID: <CAH5fLgiTTXVMs3tzrHAU1rwQDCs_VPuPgEVcEkjbu+rNT=35vA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
To: Marcelo Moreira <marcelomoreira1905@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, ojeda@kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 6:59=E2=80=AFPM Marcelo Moreira
<marcelomoreira1905@gmail.com> wrote:
>
> This patch series brings documentation and refactorings to the `Revocable=
` type.
>
> Changes include:
> - Clarifying the write invariant and updating associated safety comments =
for `Revocable<T>`.
> - Splitting the internal `revoke_internal` function into two distinct, ex=
plicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_nos=
ync()` (unsafe, without RCU synchronization), now returning `bool` to indic=
ate revocation status.
>
> Marcelo Moreira (2):
>   rust: revocable: Refactor revocation mechanism to remove generic
>     revoke_internal
>   rust: revocable: Clarify write invariant and update safety comments

Danilo, did you have Revocable / Devres changes that conflict with this?

Alice
