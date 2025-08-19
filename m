Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ABE21A420
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 23:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755645475; cv=none; b=inYsdYBapNvyy/vOw5BonNnaLLXAwczlni3lh8kL7LiE7hMcZK/TZ9QMbzXclWGU2S+0kbl3nwqn2/szirhSolb9TYR5nSbOHRcKxJwhL1yI14cK9wIHyFydp1H9yBUHpiw/NnPgCbrJ8NwReU+nnYZGYGDmXiDA9rcAyd1+maY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755645475; c=relaxed/simple;
	bh=BEFMMJJ0rmVvqMlOtSG/+gcSpKk66CfUpwXM3s1F0+Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=rU6fPrWTHLfylXqFBQXh4OkVL/gNPKEvUiCeKz91f3SkUCz/L+/Tfkw3xl+NAdC9KqDnp1arVjVkx71QqzXjzK8scGO6Eg4z98MQRK1mJwIOvzoZgruwIyr9s7Kh7KBIlcA4eGYjWj/n1zpCP+SLBKWpFrCvK1IEEeq7lmNwHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xh8sPoyV; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xh8sPoyV"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b471737c5efso4347957a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 16:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755645473; x=1756250273; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+ifjF8mD9xzXePhpXhqLi79YRMtBg4Kg4g+cEUygkk=;
        b=xh8sPoyVosCJA5JW9/XoPh63rX+1KUU+rdlNHcbykH8+6OT/xHNzb3Vqf95rLQG6ZU
         5zfUYPn8TC9rtyU91PIOiORuR2yXxLJqc/F+a8w/6ehT1Yj8rHKDGorT4bt/gyd2YXFU
         NvJwSet0tMwQQee1t9l8sC810E26XYcwLDDRvt9jnbLcmROxMBLxa/TTkob80u0TEr3v
         ykT2fP5TzGDZDd0m+3/iDgLWx4u1iSTYp2nw/Gvjllt+aYpwPGDftPMk0F6ghFJgzNQh
         4SP8fq7N7vOntGo5U3WVRgzBlie2Egk4b9A3dfZxvslvLZVB5W6EYKtZvAripwT00CAK
         QYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755645473; x=1756250273;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+ifjF8mD9xzXePhpXhqLi79YRMtBg4Kg4g+cEUygkk=;
        b=ExzpOViXu0neVvm/XI8i+Z4LD3VbvB2KX9aKaH8DnxyjapuY9kkQ3q6IRjGoD3s+Sq
         syxGpdUkmp25l0uCgSRG74YTd8uWj3XyLVmq84KWhJKhs/5UA5jPsGQ00nzPZTTw/Hp3
         YtOEDp7GC7A/Tj4Ta8MXh3fNW8dIAQXLRIcTfHWEt1NhtOBjl8aS2Az9Ay1hGuQKPpJ4
         o3Z/dMLcmS+jZ8ILQ0gs2QBg7gBojygCD4WHFF3Vr0Y1o4uyA6LQyXX7GSZzBnOF1QrZ
         1W8oTyTSam1CXB+ao3dwo5c5H98gLAJfMOen1Bn8vXTQ+1DNfawnrcRSSVyJ2tZ1P6sj
         7z7A==
X-Forwarded-Encrypted: i=1; AJvYcCXs1DC171G8h3tKQIVoieHEqaOmVBrnffUfVaYK/LMY+/SLnuWf2qcceyVajMuj3DrFOPZurmTVXGHQNd1VdkJTwzAPSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXPvmP0/WKcNOVz8pOyNopuTRE5g3nKusJzLxX9rFyDMykoF4A
	Y4xWNl0NNJC0maseL8iNdF3qL44yC5bTV2Ng1AuoIKe2031W88Kb06NFN9Hog+xjodu5wIky2K8
	6zM5fEw==
X-Google-Smtp-Source: AGHT+IFvMlBEr4QcftEvOq0CESzrjU92tZFHouboZCOFaS7KnVtT99WqBzABoD8gdtrTIG0Prg4TAswQhKg=
X-Received: from plgi6.prod.google.com ([2002:a17:902:cf06:b0:242:86ec:7de6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f64d:b0:243:e3:a4e5
 with SMTP id d9443c01a7336-245ef2854a0mr9040215ad.48.1755645473564; Tue, 19
 Aug 2025 16:17:53 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:12:15 -0700
In-Reply-To: <20250813154751.5725-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250813153838.5470-1-krishnagopi487@gmail.com> <20250813154751.5725-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <175564447415.3064536.3688180000329336085.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: fix minor typo in cpumodel_subfuncs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, linux-kernel-mentees@lists.linux.dev, 
	borntraeger@linux.ibm.com, Gopi Krishna Menon <krishnagopi487@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 13 Aug 2025 21:17:51 +0530, Gopi Krishna Menon wrote:
> Specifically, fix spelling of "available" in main function.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: fix minor typo in cpumodel_subfuncs
      https://github.com/kvm-x86/linux/commit/05f297c3e39f

--
https://github.com/kvm-x86/linux/tree/next
