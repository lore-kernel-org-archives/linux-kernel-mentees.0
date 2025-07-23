Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E94B20E011
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Jul 2025 04:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753245027; cv=none; b=XqGi6BkZ3INbYnt1FGjYhIaYCKl9lR6Ul20GNslMjcBZCaCqt/ytuspDiaXUtvGjdyANTKIzV8dGtPAw7jDa88paFPdzYjW6dmg5aRV1R5IirjrdhCDX2YZdDzfAYQ+VklU3nvYtZPBYEfEdN2wJQHqbTfO0hmPTq8FkplEUeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753245027; c=relaxed/simple;
	bh=quI/5wpXYhqn7ByVh2CJr1oQJ6LrSdYEfbFpjuMd1SQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0smvW8/bU2FqC4tiaIh5eA2GTijmafbOuy/OA5zrIRAxTeSmK3Z+51jqIs5LBpVFoeDtn+EQLC7CwX9yXAHsX07TyWBUqXolKs/fF9bx1bflq1BhISjMNOgXCkJhaI04XwkGnfsOBhil4vVIiJxzo6YHEe8dQg2zl1su1mbk3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpEVA4Vg; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpEVA4Vg"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so362024fac.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 21:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753245025; x=1753849825; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UjIrj9dvcwAg12tvrhZ3N3eT+o5fkgyTGQdmK0bjDss=;
        b=gpEVA4VgQdXKjmObrUbt4yeLL/KeKDWhD2w/ww4AfP17J7oTmeN4KwsM6qYPrieanA
         y1eP9ImkahmeMVMhF1U/sAWiCS/P+p2fA1wTPSvRJZa92Nms92FJJAt98Jo9/TcBTKA2
         cL325C66cC3rDzklIjdFDc0hetIzA1ybE9XCbT/tZZDMJdHFX4xv2AG3D9H6/OnaLR+G
         +ElygXlVefnhd/xV0QTzHhCAloVrWwpr7JmjEU0X1tODglKAxvI0XjUtvBBYBFH8mIHF
         esGb5blD9tP6Q+0YEAtowTeJRdE6p3HNnLyknhhKw826WNVxrxHRny1ZKMRDSIsTn0se
         bMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753245025; x=1753849825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjIrj9dvcwAg12tvrhZ3N3eT+o5fkgyTGQdmK0bjDss=;
        b=g1Zo2TbmOf46vRIeBS5a/QSyifQrGf9Ym64bbSfNlfyluhsDT0k3aVeAbJIcNBHQAA
         nGtjzkUu5UkzKfMOAm+ODz/sbRvl1PI8ZSu4HZcPVkNxLuuApp/unAhnntIZDAidDLW6
         ZqPnGbcJzwoOoLsDyeRrIdnJhOyz+6XLSCB+06wnLnxczXeO/dtT+Xv2pkfC3owGZs/3
         2OXmThc7wIxATxVjVm7cDA1KQ8oWQqODszet/PPYNUuFHQwFb1XjgrTDBmojCX5cCEKh
         wzD/5niOHnLMzTUxj5DguQJgtj+dEtSvfgoPblKvUEfctBxBILXzJuncSo2aW9QOhNII
         or6g==
X-Forwarded-Encrypted: i=1; AJvYcCX/hBa8TXLFvPOJCijVj5n2U3q+K5IZQKdOPNQVgW2DLjGumKOFltCCK+7otT4kh2CTFB8ygezBKNfpLdFdFy2h64hXMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXPvuJ0dNWvvh6eMwo2Osc/1C8gigJ8RMOWTXTlD2EA6qBtSaz
	eEs0MCYcWv/oNcpzGwiV5pxvGjl7TB0rzfMhVE52adQ+lqmYh5vvD5R0YyRtkEjXSIyxGXLOEYP
	xeBAM+SUZBOBYFnTKN7uYdEtKg/X0oGA=
X-Gm-Gg: ASbGncsn6XjrFtPJ2W2mwrf5EIzQikkkqXSig9x+fA1/k0LfhdtYZctpNvy9TZwumUR
	U9aIxA8Q8YpbMr0sjCXboLjqXgBdjMqVUtR1fOXmXdDk/XFT04WJ/hMhwtBFwvohqx0jQYNWj7/
	dKANhSgLedyNpVNHNLYGI1aEGcTzL0KiRy1q2htSeAoDXcP1oDEQtNJfyXKn9/zVuMFNOQvehSp
	lTivGK9itJ7WLz8f9M=
X-Google-Smtp-Source: AGHT+IHffH+4XXnNTdbK9V3u9aXUfCukWocuYXmvOdWhcBnstZYMkc+dPvZEjLcDwnyfl6ApmQU6vR0T9FNwZ9TPslA=
X-Received: by 2002:a05:687c:260a:b0:2d8:957a:5166 with SMTP id
 586e51a60fabf-306a79e40e7mr3742528fac.4.1753245025066; Tue, 22 Jul 2025
 21:30:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250720085905.192652-1-suchitkarunakaran@gmail.com>
 <aH20-KEurjw5qJq0@google.com> <CAO9wTFhdgHEFQDVt2715qP6-6bsE9+AeAAPYe4C8N1mqpy7g=Q@mail.gmail.com>
 <aIA3JQWNs-0Jsla4@google.com>
In-Reply-To: <aIA3JQWNs-0Jsla4@google.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Wed, 23 Jul 2025 10:00:13 +0530
X-Gm-Features: Ac12FXw6tjcCmuWShRS-j5n_GRl69zyL-KVPRXRf0ijlFBoiw1pK2k8FHeLmGHU
Message-ID: <CAO9wTFiH-wrvAgwUhPH3=a-K5HDODzuqe1+4D+aigxe5J_dq6Q@mail.gmail.com>
Subject: Re: [PATCH] perf tests: Fix lib path detection for non-x86 architectures
To: Namhyung Kim <namhyung@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, sesse@google.com, charlie@rivosinc.com, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

>
> I'd be intrusive if we create a new symlink.  Probably we need to check
> if there's lib64 directory first and use it for 64 bit build.  But I
> feel like this needs more testing.
>
> Can you share what's the problem exactly?
>
> Thanks,
> Namhyung
>

Yeah I agree it needs more testing. And yes we can check if the lib64
folder exists and then create a symlink. If there's no lib64 folder,
we can create a symlink named lib64 to the lib folder. I assume this
will cover most of the architectures since the lib folder existed in
almost all the architectures that I tested.
