Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472742EFDAA
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 19:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794140; cv=none; b=C0diCwKRhE+h9kxP2Jr5ckBrcmm7yqV/yg2MQtyvm3blVLldTtanbtD1S8P/3mLmIy2DQkeMelJtSPsluly7G+plzPIydfaESN70Qm1AIEDQNjLMTEo0t2aGyIFu4CYHbZ4IF6AHU0wejNNKDnVaL/H3m5z1ys3/GSce2Fy1Aj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794140; c=relaxed/simple;
	bh=7WnHnjZ2Inj8vNFPOPMWn5vUT1QywHWs7gt7IcDZPtY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hpI7ZsM7p6Q7SsiPboXQYQU2zzGrG8G35LGZ29JwhtWscrDWhb/LjQdkbMlMXheRRG2UqgTJuMx7VUYhV3YH2uyW7KOEDgIVMIFeVb6MwnFuVR3+O/ZcW6VRU/VaY0d7TkxqL5ynwIW1zK/nK9aRZ54rj5d+smnu1vhJgLvchPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UeKKzx4T; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UeKKzx4T"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-313ff01d2a6so758777a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794138; x=1751398938; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eiZv+Ux8bnoIxxwKrwVqiL0FOPFJvedVqWOdvOf0LcA=;
        b=UeKKzx4Trakd5sJarRmIYz3IGPHDJa8sOp1OzTbRQkgdjbiiBMfAfO/XkqPMRzzvFN
         WZPQtrU7Qkx2BoDz69CnsKtI6kD7Xj4UjOBT4F9cdfmiCfjbY7qT446MJgReqzDh4tVi
         XCaQfr91e0P2qSwptJDVO9A1afeE8bWKm3hZhL19xncGB52czC+kbSaX2zVf2IPmhob4
         3KHPD454IEy1tcpceBBqm0VSTmHANtfNTQMIfeA1ngGU4tlsD+9VeGOWHWCe/3oqtp+P
         76lJBNwKcY+UaTpW38gHYNKa+ikvBLncDO47aRj2rzjZcgUS74ltQygjvSAj2Yy5ztzp
         AWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794138; x=1751398938;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiZv+Ux8bnoIxxwKrwVqiL0FOPFJvedVqWOdvOf0LcA=;
        b=I8tTtj+oOjHQJqnsPnv/kifm9RI9K9S7fc6W2YYa8TdAIAievTzJwuPjAi9wSVkrLS
         01hwtCVqEDW54PzKge0j/jt+d+cBkGjJo5u0zsFcembYxCuf2AnsYz9RrIJkhL9p21zv
         aL+kSAfEx7HX9XEYVTHvEt19jBN00IfnRioWcXEUIurGcJR5qMBWseF1P56p1pA1qmK5
         4CZYFWGkrtzyhCkTf4YVvA7gLe768FumBWPrMi4PbTXR7QyknI0TUDDRrllGBTzvEPXh
         JcbYEhl+lGxWjPO7F+Z09IDZcGq3i11U88Tjgp99Ev/p13dKflb+OLf9XZgHiKa9M9uA
         0JAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUETN3NMCgwjFHHWeNG7F+msn/PN7s6bHOgcaXBtqUMDxZx9ETHwKuRNrmntcV8wRy497IskzTEAZBQhYSOUi7pEXtEqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVR0YgJ/IclQmofksyUQTufnEstlUffl4N1dd96fj19f/++g+b
	QCQIDZYNfaKNWDJJhl227EKXx96Ycm/zVcjbiONE7y1Xh0/eq+fU8Ibp7JTJ347mcsO8RBGlfUD
	ViqT+6Q==
X-Google-Smtp-Source: AGHT+IECMFlbef6lDHwuSpgtWmzJM6Kenqel0iDDnhehUo2TFEdmq9e7oOv+NFpDNFQ4sz1U43MsG6xhPwc=
X-Received: from pjboe18.prod.google.com ([2002:a17:90b:3952:b0:312:f88d:25f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5626:b0:312:1dc9:9f67
 with SMTP id 98e67ed59e1d1-315f26132bcmr173645a91.2.1750794137714; Tue, 24
 Jun 2025 12:42:17 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:41 -0700
In-Reply-To: <20250523181606.568320-1-rk0006818@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250523181606.568320-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079223746.515152.1077822979652127877.b4-ty@google.com>
Subject: Re: [PATCH] selftests: kvm: Fix spelling of 'occurrences' in
 sparsebit.c comments
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, skhan@linuxfoundation.org, 
	Rahul Kumar <rk0006818@gmail.com>
Cc: pbonzini@redhat.com, linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Fri, 23 May 2025 23:43:52 +0530, Rahul Kumar wrote:
> Corrected two instances of the misspelled word 'occurences' to
> 'occurrences' in comments explaining node invariants in sparsebit.c.
> These comments describe core behavior of the data structure and
> should be clear.
 

Applied to kvm-x86 selftests, thanks!

[1/1] selftests: kvm: Fix spelling of 'occurrences' in sparsebit.c comments
      https://github.com/kvm-x86/linux/commit/30142a93b164

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
